unit dfe.dao.infoNfe;

interface

Uses
  windows,
  sysutils,
  REST.JSON.Types,
  System.NetEncoding,
  System.Generics.Collections,
  math,
  REST.JSON,
  System.JSON,
  dfe.dao.base,
  dfe.model.infoNfe,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,

  FireDAC.Comp.UI,
  Data.DB,
  dfe.model.nfe,
  dfe.lib.util,
  FireDAC.Comp.Client,

  System.JSON.Types,
  System.JSON.BSON,
  System.JSON.Builders,
  System.Rtti,
  System.JSON.Readers,
  System.Diagnostics,
  FireDAC.Stan.util,
  classes;

type
  TRetornoInfo = class
  private
    F_id: TDateTime;
    Fcount: integer;
  public
    property _id: TDateTime read F_id write F_id;
    property count: integer read Fcount write Fcount;

  end;

type
  TDaoInfoNfe = class(TDaoBase)
  private

  public
    function getInfoNfe(pjson: TJSONObject): TinfoNfe;
    procedure setInfoNfe(value: TinfoNfe);
    function getLogs(pjson: TJSONObject): string;
  end;

implementation

uses
  dfe.schedule.MDE;

{ TDaoInfoNfe }
{ ---------------------------------------------------------------------------- }
function TDaoInfoNfe.getInfoNfe(pjson: TJSONObject): TinfoNfe;
var
  oanalisse: Tanalissemensal;
  qry: tfdquery;
  vtotalCancel: integer;
  vtotalValidada: integer;
  vtotalDenegada: integer;
  vtotalPendendte: integer;
  vtotalContigencia: integer;

  sresult: string;
  lresult: TJSONArray;
  oinfoEmresa: Tinfoempresa;
  oempresas: Tinfoempresas;
  procedure setAnalise(tipo: string);
  begin
    oanalisse := Tanalissemensal.create;
    oanalisse.tipo := tipo;
    oanalisse.valor := qry.FieldByName('qtNotas').AsInteger;
    oanalisse.Data := qry.FieldByName('demi').AsDateTime;
    result.analissemensal.Add(oanalisse);
  end;
  procedure setAnalisses();
  begin
    with qry.SQL do
    begin
      Add(' select  ');
      Add('   situacao ,             ');
      Add('   CAST (dEmi AS DATE) as dEmi,              ');
      Add('   count(nnf) as qtNotas   ');

      Add('from                        ');
      Add('  nfe                       ');
      Add('where                       ');
      Add('  nfe.dEmi  > GETDATE() -30 ');
      Add('group by  situacao, CAST (dEmi AS DATE) ');
      Add('order by  CAST (dEmi AS DATE) desc');
    end;
    qry.Open();
    qry.First;
    while not qry.eof do
    begin
      if Length(soNumeros(qry.FieldByName('situacao').AsString)) = 3 then
      begin
        case qry.FieldByName('situacao').AsInteger of
          100, 150:
            begin
              setAnalise('VALIDADAS');
            end;
          300, 302, 110:
            begin

              setAnalise('DENEGADAS');

            end;

          101, 151, 135:
            begin
              vtotalCancel := vtotalCancel + 1;
              setAnalise('CANCELADAS');
            end;
          124:
            Begin

              setAnalise('CONTIGENCIA');
            end;

        end;
      end
      else
      begin
        if (qry.FieldByName('situacao').AsString = 'CONT') or
          (qry.FieldByName('situacao').AsString = 'FSDA') or
          (qry.FieldByName('situacao').AsString = 'EPEC') or
          (qry.FieldByName('situacao').AsString = 'OFFL') then
        begin

          setAnalise('CONTIGENCIA');

        end
        else
        begin

          setAnalise('PENDENCIA');

        end;
      end;
      qry.Next;
    end;
  end;
  procedure setTotaisBySituacao();
  begin
    with qry.SQL do
    begin
      clear;
      Add(' select  ');
      Add('   situacao                ');
      Add('from                        ');
      Add('  nfe                       ');
      Add('where                       ');
      Add('  nfe.dEmi  > GETDATE() -30 ');

    end;
    qry.Open();
    qry.First;
    vtotalValidada := 0;
    vtotalCancel := 0;
    vtotalDenegada := 0;
    vtotalPendendte := 0;
    vtotalContigencia := 0;
    while not qry.eof do
    begin
      if Length(soNumeros(qry.FieldByName('situacao').AsString)) = 3 then
      begin

        case qry.FieldByName('situacao').AsInteger of

          100, 150:
            begin
              vtotalValidada := vtotalValidada + 1;

            end;
          300, 302, 110:
            begin

              vtotalDenegada := vtotalDenegada + 1;

            end;

          101, 151, 135:
            begin
              vtotalCancel := vtotalCancel + 1;

            end;
          124:
            Begin
              vtotalContigencia := vtotalContigencia + 1;

            end;

        end;
      end
      else
      begin
        if (qry.FieldByName('situacao').AsString = 'CONT') or
          (qry.FieldByName('situacao').AsString = 'FSDA') or
          (qry.FieldByName('situacao').AsString = 'EPEC') or
          (qry.FieldByName('situacao').AsString = 'OFFL') then
        begin
          vtotalContigencia := vtotalContigencia + 1;

        end
        else
        begin
          vtotalPendendte := vtotalPendendte + 1;

        end;
      end;
      qry.Next;
    end;
  end;
  procedure setConsultasNsu();
  var
    idx: integer;
  begin
    qry.Close;
    qry.SQL.clear;
    qry.SQL.Add('SELECT');
    qry.SQL.Add('    codigo_loja');
    qry.SQL.Add('   ,razao_social');
    qry.SQL.Add('   ,nsu_data_consulta ');
    qry.SQL.Add('   ,nsu_sequencia ');
    qry.SQL.Add('FROM');
    qry.SQL.Add(' emitente');
    lresult := OpenQuery(qry);
    oempresas := Tinfoempresas.create();
    for idx := 0 to lresult.count - 1 do
    begin
      sresult := lresult.Items[idx].ToJSON;
      oinfoEmresa := Tinfoempresa.create();
      oinfoEmresa.codigo_loja := lresult.Items[idx]
        .FindValue('codigo_loja').value;
      oinfoEmresa.razao_social := lresult.Items[idx]
        .FindValue('razao_social').value;
      oinfoEmresa.nsu_data_consulta := lresult.Items[idx]
        .FindValue('nsu_data_consulta').value;
      oinfoEmresa.nsu_sequencia := lresult.Items[idx]
        .FindValue('nsu_sequencia').value;
      oempresas.Add(oinfoEmresa);

    end;
  end;

begin

  result := TinfoNfe.create();
  //wilson aqui
  result.notasEmitidas :=10;
  result.notasCanceladas := 20;
  result.notasInutilizadas := 30;
  result.errosEmissao := 40;
  qry := tfdquery.create(Nil);
  qry.FetchOptions.Unidirectional := true;
  qry.UpdateOptions.ReadOnly := true;
  qry.Connection := FDConNFe;
  try
    try
      setAnalisses();
      setTotaisBySituacao();
      result.notasDenegadas := vtotalDenegada;
      result.notasCanceladas := vtotalCancel;
      result.notasContigencia := vtotalContigencia;
      result.notasPendentes := vtotalPendendte;
      result.notasEmitidas := vtotalValidada;
      qry.SQL.clear;
      qry.SQL.Add(' SELECT ');
      qry.SQL.Add('    COUNT(desEvento) as qt, ');
      qry.SQL.Add('    desEvento from nfe_MDFe (NOLOCK) ');
      qry.SQL.Add(' WHERE  ');
      qry.SQL.Add('  desEvento is not null ');
      qry.SQL.Add('group by desevento  ');
      qry.Open();
      qry.First;
      while not qry.eof do
      begin
        if pos(uppercase('Ciencia da Operacao'),
          uppercase(qry.FieldByName('desEvento').AsString)) > 0 then
          result.cienciaOperacao := result.cienciaOperacao +
            qry.FieldByName('qt').AsInteger
        else if pos(uppercase('Confirmacao da Operacao'),
          uppercase(qry.FieldByName('desEvento').AsString)) > 0 then
          result.confirmacaoOperacao := result.confirmacaoOperacao +
            qry.FieldByName('qt').AsInteger
        else if pos(uppercase('Desconhecimento da Operacao'),
          uppercase(qry.FieldByName('desEvento').AsString)) > 0 then
          result.desconhecimentoOperacao := result.desconhecimentoOperacao +
            qry.FieldByName('qt').AsInteger
        else if pos(uppercase('Operacao nao Realizada'),
          uppercase(qry.FieldByName('desEvento').AsString)) > 0 then
          result.operacaoNaoRealizada := result.operacaoNaoRealizada +
            qry.FieldByName('qt').AsInteger;
        qry.Next;
      end;
      if assigned(scheduleManifestos) then
      begin
        try
          if trunc(scheduleManifestos.ultimaExecucao) = date then
            result.ultimaExecucao := 'Hoje as ' + FormatDateTime('hh:nn',
              scheduleManifestos.ultimaExecucao)
          else
            result.ultimaExecucao := FormatDateTime('dd/mm/yyyy hh:nn',
              scheduleManifestos.ultimaExecucao);
          result.NSUSequencia := scheduleManifestos.NSUSequencia;
          result.NSUdata := scheduleManifestos.NSUdata;
        except
        end;
      end;
      setConsultasNsu();
      result.empresas := oempresas;
    except
    end;
  finally
    qry.Close;
    FreeAndNil(qry);
    if assigned(lresult) then
      FreeAndNil(lresult);
  end;

end;

{ ---------------------------------------------------------------------------- }
function TDaoInfoNfe.getLogs(pjson: TJSONObject): string;
var
  slogFile: string;
  lstLog: TstringList;
  lstLogI: TstringList;
  i: integer;
  cnpj: string;
  Data: string;

begin
  try
    cnpj := '';
    Data := '';
    pjson.TryGetValue('cnpj', cnpj);
    pjson.TryGetValue('data', Data);
    if (cnpj <> '') and (cnpj <> '0') then
      slogFile := ExtractFilePath(ParamStr(0)) + 'log\' + cnpj + '\'
    else

      slogFile := ExtractFilePath(ParamStr(0)) + 'log\Global\';

    ForceDirectories(slogFile);
    if Data = '' then
      Data := datetostr(date);

    slogFile := slogFile + FormatDateTime('yyyymmdd', Tutil.parseDateTime(Data))
      + '_' + ChangeFileExt(ExtractFileName(ParamStr(0)), '') + '.log';

    if FileExists(slogFile) then
    begin
      lstLog := TstringList.create;
      lstLogI := TstringList.create;
      try
        lstLog.LoadFromFile(slogFile);

        i := lstLog.count - 1;
        while i > -1 do
        begin
          lstLogI.Add(lstLog[i]);
          dec(i);
        end;
        result := '{"log": "' + TNetEncoding.Base64.Encode(lstLogI.text) + '"}';
        result := StringReplace(result, #13#10, '',
          [rfReplaceAll, rfIgnoreCase]);
        result := StringReplace(result, #13, '', [rfReplaceAll, rfIgnoreCase]);
        lstLog.text := '';
      finally
        FreeAndNil(lstLog);
        FreeAndNil(lstLogI);
        slogFile := '';
      end;
    end
    else
      result := '{"log": "' + TNetEncoding.Base64.Encode('') + '"}';
  except

  end;

end;

procedure TDaoInfoNfe.setInfoNfe(value: TinfoNfe);
begin
  { TODO }
end;

end.

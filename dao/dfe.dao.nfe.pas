unit dfe.dao.nfe;

interface

Uses
  windows,
  sysutils,
  REST.JSON.Types,
  REST.JSON,
  system.JSON,
  dfe.dao.base,
  dfe.model.nfe,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.MongoDBDef,
  FireDAC.Phys.MongoDB,
  FireDAC.Comp.UI,
  FireDAC.Stan.param,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Phys.MongoDBWrapper,
  system.JSON.Types,
  system.JSON.BSON,
  system.JSON.Builders,
  system.Rtti,
  system.JSON.Readers,
  system.Diagnostics,
  dfe.lib.util,
  FireDAC.Stan.util,
  classes;

type
  TDaoNfe = class(TDaoBase)
  private

    function getBasicSelect: string;
    function getBasicList: String;
    procedure setFilter(qry: TFDQuery; param: TJSONObject);
    procedure setOrderBy(qry: TFDQuery);

  public
    function gravarNota(pnota: TNota): Boolean;
    function atualizarStatus(pnota: TNota): Boolean;
    procedure setDanfe(pnota: TNota);

    function getNota(param: TJSONObject): TNota;
    function listNotas(param: TJSONObject): TNotas;
    property basicSelect: string read getBasicSelect;
    property basicList: string read getBasicList;
  end;

implementation

{ TDaoNfe }
{ ---------------------------------------------------------------------------- }
function setFiltroType(filterType: string): string;
var
  sqlTemp: TStringList;
begin
  if filterType = '' then
    exit;

  sqlTemp := TStringList.Create;
  try
    with sqlTemp do
    begin
      if (filterType <> '') and (uppercase(filterType) = uppercase('pendente'))
      then
      begin
        Add('  and  ( ( (n.situacao <> ' + QuotedStr('100') + ')');
        Add('  and (n.situacao <> ' + QuotedStr('150') + ')  ');
        Add('  and (n.situacao <> ' + QuotedStr('101') + ')  ');
        Add('  and (n.situacao <> ' + QuotedStr('135') + ')  ');
        Add('  and  (n.situacao <> ' + QuotedStr('136') + ') ');
        Add('  and (n.situacao <>' + QuotedStr('151') + ') ');
        Add('  and (n.situacao <> ' + QuotedStr('155') + ') ');
        Add('  and (n.situacao <> ' + QuotedStr('CONT') + ') ');
        Add('  and  (n.situacao <> ' + QuotedStr('FSDA') + ') ');
        Add('  and (n.situacao <> ' + QuotedStr('124') + ') ');
        Add('  and (n.situacao <> ' + QuotedStr('301') + ') ');
        Add('  and (n.situacao <> ' + QuotedStr('302') + ') ');
        Add('  and  (n.situacao <> ' + QuotedStr('110') + ') ');
        Add('  and (n.situacao <> ' + QuotedStr('EPEC') + ') ');
        Add('  and (n.situacao <> ' + QuotedStr('OFL') + ')) ');
        Add(' or (n.situacao is null) )');
      end;
      if uppercase(filterType) = uppercase('Contigencia') then
      begin
        Add(' and ( (IsNull(n.situacao, '''') = ''124'')   ');
        Add('    or (IsNull(n.situacao, '''') = ''CONT'')  ');
        Add('    or (IsNull(n.situacao, '''') = ''FSDA'')  ');
        Add('    or (IsNull(n.situacao, '''') = ''EPEC'')  ');
        Add('    or (IsNull(n.situacao, '''') = ''OFFL'') )');
        Add('  ');
      end;
      if uppercase(filterType) = uppercase('inutilizada') then
      begin

      end;
      if uppercase(filterType) = uppercase('transmitida') then
      begin
        Add(' and ( (IsNull(n.situacao, '''') = ''100'') ');
        Add('    or (IsNull(n.situacao, '''') = ''150'') ');
        Add(' )');
      end;
      if uppercase(filterType) = uppercase('denegada') then
      begin
        Add(' and ( (IsNull(n.situacao, '''') = ''301'') ');
        Add('   or (IsNull(n.situacao, '''') = ''302'') ');
        Add(' or (IsNull(n.situacao, '''') = ''110'')  ');
        Add(' )');
      end;
      if uppercase(filterType) = uppercase('cancelada') then
      begin
        Add('  and ( (IsNull(n.situacao, '''') = ''101'')');
        Add('  or (IsNull(n.situacao, '''') = ''151'')');
        Add('  or (IsNull(n.situacao, '''') = ''135'')');
        Add('   ) ');
      end;
    end;
    result := sqlTemp.Text;
  finally
    FreeAndNil(sqlTemp);
  end;

end;

function TDaoNfe.getBasicList: String;
var
  osql: TStringList;
begin
  osql := TStringList.Create;
  try

    osql.Add('select                    ');
    osql.Add('  top 5000                ');
    osql.Add('  n.codigo_loja,          ');
    osql.Add('  e.cnpj,                 ');
    osql.Add('  n.nnf as  numero,       ');
    osql.Add('  n.serie,                ');
    osql.Add('  n.chave_nfe chave,      ');
    osql.Add('   n.dEmi as dataEmissao, ');
    osql.Add('  n.situacao as status,   ');
    osql.Add('  n. motivo,               ');
    osql.Add('  n.data_hora_recebimento  as dataProcessamento,');

    osql.Add('  n.protocolo,                                ');
    osql.Add('  n.digitoval,                                ');
    osql.Add('  n.modelo                                    ');
    osql.Add('from                                          ');
    osql.Add('  NFe n                                       ');
    osql.Add('inner join emitente  e  on                    ');
    osql.Add('  e.codigo_loja  =n.codigo_loja               ');
    osql.Add('where                                         ');
    osql.Add(' n.codigo_loja is not null                    ');
  finally
    result := osql.Text;
    FreeAndNil(osql);
  end;

end;

function TDaoNfe.getBasicSelect: string;
var
  osql: TStringList;
begin
  osql := TStringList.Create;
  try

    osql.Add('select                    ');
    osql.Add('  top 1000                 ');
    osql.Add('  e.cnpj,                 ');
    osql.Add('  n.codigo_loja,          ');
    osql.Add('  n.nnf as  numero,       ');
    osql.Add('  n.serie,                ');
    osql.Add('  n.chave_nfe chave,      ');
    osql.Add('  n.dEmi as dataEmissao, ');
    osql.Add('  d.danfe_xml as xml,     ');
    osql.Add('  d.xmlRetorno,           ');
    osql.Add('  n.situacao as status,   ');
    osql.Add('  n. motivo,               ');
    osql.Add('  n.data_hora_recebimento as dataProcessamento,  ');
    osql.Add('  n.protocolo,                                ');
    osql.Add('  n.digitoval,                                ');
    osql.Add('  n.modelo,                                   ');
    osql.Add('  d.danfe_pdf as danfe                        ');
    osql.Add('from                                          ');
    osql.Add('  NFe n                                       ');
    osql.Add('inner join  NFe_xml d on                      ');
    osql.Add('  d.codigo_loja  =n.codigo_loja               ');
    osql.Add('  and d.nnf    =n.nnf                         ');
    osql.Add('  and d.modelo =n.modelo                      ');
    osql.Add('  and cast(d.serie as integer) =cast(n.serie as integer)  ');

    osql.Add('inner join emitente  e  on                    ');
    osql.Add('  e.codigo_loja  =n.codigo_loja               ');
    osql.Add('where                                         ');
    osql.Add(' n.nnf is not null                            ');
  finally
    result := osql.Text;
    FreeAndNil(osql);
  end;

end;

function TDaoNfe.getNota(param: TJSONObject): TNota;
var
  lresult: TJSONArray;
  qry: TFDQuery;
  notaFilter: TfiltroNota;
begin
  qry := TFDQuery.Create(Nil);
  qry.Connection := FDConNFe;
  qry.FetchOptions.Unidirectional := true;
  qry.UpdateOptions.ReadOnly := true;
  result := TNota.Create;
  try
    qry.sql.Add(basicSelect);
    setFilter(qry, param);
    setOrderBy(qry);

    lresult := OpenQuery(qry);
    if lresult.Count > 0 then
    begin
      result := Tjson.JsonToObject<TNota>(TJSONObject(lresult.Items[0]));

    end;
  finally
    qry.Close;
    FreeAndNil(qry);
    if assigned(lresult) then
      FreeAndNil(lresult);
  end;
end;

procedure TDaoNfe.setDanfe(pnota: TNota);
var
  qry: TFDQuery;
  astream: TStringStream;
begin
  try
    qry := TFDQuery.Create(Nil);
    qry.Connection := FDConNFe;
    qry.sql.clear;
    qry.sql.Add('SELECT nnf FROM nfe_xml                         ');
    qry.sql.Add('WHERE                                            ');
    qry.sql.Add('  codigo_loja = ' + pnota.codigo_loja);
    qry.sql.Add('  and nnf = ' + QuotedStr(inttostr(pnota.numero)));
    qry.sql.Add('  and modelo = ' + QuotedStr(pnota.modelo));
    qry.sql.Add('  and cast(serie as integer)  = ' + inttostr(pnota.serie));

    gravalog('    >>' + '[DAONFE] Buscando danfe nota Numero: ' +
      inttostr(pnota.numero) + ' Serie: ' + inttostr(pnota.serie) + ' Cnpj: ' +
      pnota.cnpj, pnota.cnpj);
    qry.Open();
    if qry.RecordCount > 0 then
    begin
      qry.Close;
      qry.sql.clear;
      qry.sql.Add('UPDATE nfe_xml SET ');
      qry.sql.Add('  danfe_xml   =:danfe_xml,');
      qry.sql.Add('  xmlRetorno   =:xmlRetorno');
      // qry.sql.Add('  danfe_pdf    =:danfe_pdf');
      qry.sql.Add('WHERE                                            ');
      qry.sql.Add('  nnf = ' + QuotedStr(inttostr(pnota.numero)));
      qry.sql.Add('  and cast(serie as integer)  = ' + inttostr(pnota.serie));
      qry.sql.Add('  and modelo = ' + QuotedStr(pnota.modelo));
      qry.sql.Add('  and codigo_loja = ' + pnota.codigo_loja);
    end
    else
    begin
      qry.Close;
      gravalog('    >>' + '[DAONFE]inserindo danfe nota Numero: ' +
        inttostr(pnota.numero) + ' Serie: ' + inttostr(pnota.serie) + ' Cnpj: '
        + pnota.cnpj, pnota.cnpj);
      qry.sql.clear;
      qry.sql.Add('INSERT INTO nfe_xml ');
      qry.sql.Add('(');
      qry.sql.Add('  nnf ,');
      qry.sql.Add('  serie,');
      qry.sql.Add('  dEmi,');
      qry.sql.Add('  modelo,');
      qry.sql.Add('  codigo_loja,');
      qry.sql.Add('  danfe_xml,');
      qry.sql.Add('  xmlRetorno');
      // qry.sql.Add('  danfe_pdf');
      qry.sql.Add(')');
      qry.sql.Add('VALUES');
      qry.sql.Add('(');
      qry.sql.Add('  :nnf ,');
      qry.sql.Add('  :serie,');
      qry.sql.Add('  :dEmi,');
      qry.sql.Add('  :modelo,');
      qry.sql.Add('  :codigo_loja,');
      qry.sql.Add('  :danfe_xml,');
      qry.sql.Add('  :xmlRetorno');
      // qry.sql.Add('  :danfe_pdf');
      qry.sql.Add(')');
      qry.ParamByName('nnf').AsInteger := pnota.numero;
      qry.ParamByName('dEmi').AsDateTime := pnota.dataEmissao;
      qry.ParamByName('serie').AsInteger := pnota.serie;
      qry.ParamByName('modelo').AsString := pnota.modelo;
      qry.ParamByName('codigo_loja').AsString := pnota.codigo_loja;

    end;

    astream := TStringStream.Create('');
    try
      astream.WriteString(pnota.xml);
      qry.Params.ParamByName('danfe_xml').LoadFromStream(astream, ftBlob);

    finally
      astream.free;
    end;

    qry.ParamByName('xmlRetorno').AsString := pnota.xmlRetorno;
    try
      qry.ExecSQL;
    except
      on e: exception do
      begin
        gravalog('    >>' + '[DAONFE] Erro ao gravar tabela danfe nota Numero: '
          + inttostr(pnota.numero) + ' Serie: ' + inttostr(pnota.serie) +
          ' Cnpj: ' + pnota.cnpj + ' Erro :' + e.Message, pnota.cnpj);

      end;

    end;
  finally
    FreeAndNil(qry);
  end;
end;
function TDaoNfe.atualizarStatus(pnota: TNota): Boolean;
var
  qry: TFDQuery;
begin
  try
    try
      qry := TFDQuery.Create(Nil);
      qry.Connection := FDConNFe;

      qry.sql.Add('SELECT nnf FROM nfe  ');
      qry.sql.Add('WHERE      ');
      qry.sql.Add('  chave_nfe = ' + QuotedStr(pnota.chave));
      qry.Open();
      if qry.RecordCount > 0 then
      begin
        gravalog('    >>' + '[DAONFE]3357 Atualizando tabela NFE nota Numero: '
          + inttostr(pnota.numero) + ' Serie: ' + inttostr(pnota.serie) +
          ' Cnpj: ' + pnota.cnpj, pnota.cnpj);
        qry.Close;
        qry.sql.clear;
        qry.sql.Add('UPDATE nfe SET                                   ');
        qry.sql.Add('  xMotivo_CCe           =:motivo,                ');
        qry.sql.Add('  nProt_CCe             =:nProt_CCe,             ');
        qry.sql.Add('  cStat_CCe             =:cStat_CCe ,            ');
        qry.sql.Add('  situacao              =:situacao               ');
        qry.sql.Add('WHERE                                            ');
        qry.sql.Add('  chave_nfe = ' + QuotedStr(pnota.chave));

        qry.ParamByName('cStat_CCe').Asstring := ( pnota.situacao);
         qry.ParamByName('nProt_CCe').AsString := ( pnota.protocolo);
        qry.ParamByName('motivo').AsString := pnota.motivo;
        qry.ParamByName('situacao').AsString := pnota.situacao;
        qry.ExecSQL;
        gravalog('    >>' + '[DAONFE]380- Gravado tabela NFE nota Numero: ' +
          inttostr(pnota.numero) + ' Serie: ' + inttostr(pnota.serie) +
          ' Cnpj: ' + pnota.cnpj + ' Situacao :' + pnota.situacao, pnota.cnpj);
      end
      else
        gravalog('    >>' +
          '[DAONFE] Erro ao atualizar tabela NFE nota Numero: ' +
          inttostr(pnota.numero) + ' Serie: ' + inttostr(pnota.serie) +
          ' Cnpj: ' + pnota.cnpj +
          ' Erro :Nota não localizada para atualizacao', pnota.cnpj);
    except
      on e: exception do
      begin
        gravalog('    >>' +
          '[DAONFE] Erro ao atualizar tabela NFE nota Numero: ' +
          inttostr(pnota.numero) + ' Serie: ' + inttostr(pnota.serie) +
          ' Cnpj: ' + pnota.cnpj + ' Erro :' + e.Message, pnota.cnpj);
        raise e.Create(e.Message);
      end;
    end;
  finally
    qry.Close;
    FreeAndNil(qry);
  end;
end;
{ ---------------------------------------------------------------------------- }
function TDaoNfe.gravarNota(pnota: TNota): Boolean;
var
  qry: TFDQuery;
begin
  try
    try
      qry := TFDQuery.Create(Nil);
      qry.Connection := FDConNFe;

      qry.sql.Add('SELECT nnf FROM nfe  ');
      qry.sql.Add('WHERE      ');
      qry.sql.Add('  nnf = ' + QuotedStr(inttostr(pnota.numero)));
      qry.sql.Add('  and cast(serie as integer)  = ' + inttostr(pnota.serie));
      qry.sql.Add('  and modelo = ' + QuotedStr(pnota.modelo));
      qry.sql.Add('  and codigo_loja  = ' + pnota.codigo_loja);
      gravalog('    >>' + '[DAONFE] Buscando nota no banco NFE nota Numero: ' +
        inttostr(pnota.numero) + ' Serie: ' + inttostr(pnota.serie) + ' Cnpj: '
        + pnota.cnpj, pnota.cnpj);
      qry.Open();
      if qry.RecordCount > 0 then
      begin
        gravalog('    >>' + '[DAONFE]363 Atualizando tabela NFE nota Numero: ' +
          inttostr(pnota.numero) + ' Serie: ' + inttostr(pnota.serie) +
          ' Cnpj: ' + pnota.cnpj, pnota.cnpj);
        qry.Close;
        qry.sql.clear;
        qry.sql.Add('UPDATE nfe SET                                   ');
        qry.sql.Add('  motivo                =:motivo,                ');
        qry.sql.Add('  data_hora_recebimento =:data_hora_recebimento ,');
        qry.sql.Add('  protocolo             =:protocolo,             ');
        qry.sql.Add('  digitoval             =:digitoval ,            ');
        qry.sql.Add('  chave_nfe             =:chave_nfe,             ');
        qry.sql.Add('  recibo                =:recibo ,               ');
        qry.sql.Add('  cStat_CCe             =:cStat_CCe ,           ');
        qry.sql.Add('  situacao              =:situacao               ');

        qry.sql.Add('WHERE                                             ');
        qry.sql.Add('  nnf                         = :nnf');
        qry.sql.Add('  and cast(serie as integer)  = :serie');
        qry.sql.Add('  and modelo                  = :modelo ');
        qry.sql.Add('  and codigo_loja             = :codigo_loja');

      end
      else
      begin
        gravalog('    >>' + '[DAONFE] inserindo na tabela NFE nota Numero: ' +
          inttostr(pnota.numero) + ' Serie: ' + inttostr(pnota.serie) +
          ' Situacao :' + pnota.situacao + ' Cnpj: ' + pnota.cnpj, pnota.cnpj);
        qry.sql.clear;
        qry.sql.Add('INSERT INTO nfe    ');
        qry.sql.Add('(                  ');
        qry.sql.Add('  nnf ,            ');
        qry.sql.Add('  serie ,          ');
        qry.sql.Add('  modelo,          ');
        qry.sql.Add('  demi ,           ');
        qry.sql.Add('  codigo_loja ,    ');
        qry.sql.Add('  protocolo  ,     ');
        qry.sql.Add('  situacao ,       ');
        qry.sql.Add('  motivo ,         ');
        qry.sql.Add('  digitoval ,      ');
        qry.sql.Add('  chave_nfe ,      ');
        qry.sql.Add('  recibo  ,        ');
        qry.sql.Add('  cStat_CCe,       ');
        qry.sql.Add('  data_hora_recebimento');

        qry.sql.Add(')');
        qry.sql.Add('VALUES');
        qry.sql.Add('(');

        qry.sql.Add('  :nnf ,            ');
        qry.sql.Add('  :serie ,          ');
        qry.sql.Add('  :modelo,          ');
        qry.sql.Add('  :demi ,           ');
        qry.sql.Add('  :codigo_loja ,    ');
        qry.sql.Add('  :protocolo  ,     ');
        qry.sql.Add('  :situacao ,       ');
        qry.sql.Add('  :motivo ,         ');
        qry.sql.Add('  :digitoval ,      ');
        qry.sql.Add('  :chave_nfe ,      ');
        qry.sql.Add('  :recibo  ,        ');
        qry.sql.Add(' :cStat_CCe,        ');
        qry.sql.Add('  :data_hora_recebimento');
        qry.sql.Add(')');
        qry.ParamByName('nnf').AsString := inttostr(pnota.numero);
        qry.ParamByName('serie').AsInteger := pnota.serie;
        qry.ParamByName('modelo').AsString := pnota.modelo;
        qry.ParamByName('digitoval').AsString := pnota.digitoval;
        qry.ParamByName('situacao').AsString := pnota.situacao;
        qry.ParamByName('demi').AsDateTime := pnota.dataEmissao;
      end;

      qry.ParamByName('codigo_loja').AsString := pnota.codigo_loja;
      qry.ParamByName('recibo').AsString := '';
      qry.ParamByName('chave_nfe').AsString := pnota.chave;
      qry.ParamByName('serie').AsInteger := pnota.serie;
      qry.ParamByName('modelo').AsString := pnota.modelo;
      qry.ParamByName('nnf').AsInteger := pnota.numero;
      qry.ParamByName('cStat_CCe').AsInteger := (pnota.status);

      qry.ParamByName('motivo').AsString := pnota.motivo;
      qry.ParamByName('data_hora_recebimento').AsDateTime := now;

      qry.ParamByName('protocolo').AsString := pnota.protocolo;
      qry.ParamByName('digitoval').AsString := pnota.digitoval;
      qry.ParamByName('situacao').AsString := pnota.situacao;
      qry.ExecSQL;

      gravalog('    >>' + '[DAONFE]449 - Gravado tabela NFE nota Numero: ' +
        inttostr(pnota.numero) + ' Serie: ' + inttostr(pnota.serie) + ' Cnpj: '
        + pnota.cnpj + ' Situacao :' + pnota.situacao, pnota.cnpj);

      setDanfe(pnota);
    except
      on e: exception do
      begin
        gravalog('    >>' + '[DAONFE] Erro ao gravar tabela NFE nota Numero: ' +
          inttostr(pnota.numero) + ' Serie: ' + inttostr(pnota.serie) +
          ' Cnpj: ' + pnota.cnpj + ' Erro :' + e.Message, pnota.cnpj);
        raise e.Create(e.Message);
      end;
    end;
  finally
    qry.Close;
    FreeAndNil(qry);
  end;
end;
{ ---------------------------------------------------------------------------- }
function TDaoNfe.listNotas(param: TJSONObject): TNotas;
var
  qry: TFDQuery;
  lresult: TJSONArray;
  onota: TNota;
  i: integer;
  sresult: String;
begin
  try
    qry := TFDQuery.Create(Nil);
    qry.Connection := FDConNFe;
    qry.FetchOptions.Unidirectional := true;
    qry.UpdateOptions.ReadOnly := true;
    qry.FetchOptions.Unidirectional := true;
    qry.sql.Add(basicList);
    setFilter(qry, param);

    setOrderBy(qry);
    try
      qry.Open();
    except
      on e: exception do
      begin
        raise exception.Create('Erro n do banco de dados ' + e.Message);
      end;
    end;
    lresult := OpenQuery(qry);
    result := TNotas.Create;
    for i := 0 to lresult.Count - 1 do
    begin
      sresult := lresult.Items[i].ToJSON;
      onota := TNota.Create();
      try
        onota := Tjson.JsonToObject<TNota>(sresult, [joDateFormatISO8601]);

      except
        on e: exception do
        begin
          gravalog('[DAONFE] ERRO AO LISTAR NOTAS ' + e.Message, '');
          raise exception.Create('Erro interno ao gerar json ' + e.Message);
        end;
      end;
      result.Add(onota);
    end;
  finally
    qry.Close;
    FreeAndNil(qry);
  end;
end;

procedure TDaoNfe.setFilter(qry: TFDQuery; param: TJSONObject);
var
  notaFilter: TfiltroNota;

begin
  if pos('"dataInicial":""', param.ToString) > 0 then
    param.RemovePair('dataInicial');
  if pos('"dataFinal":""', param.ToString) > 0 then
    param.RemovePair('dataFinal');
  notaFilter := Tjson.JsonToObject<TfiltroNota>(param);
  if assigned(notaFilter) then
  begin
    if notaFilter.cnpj <> '' then
      qry.sql.Add(' and e.cnpj = ' + QuotedStr(notaFilter.cnpj));
    if notaFilter.numero > 0 then
      qry.sql.Add(' and n.nnf = ' + inttostr(notaFilter.numero));
    if notaFilter.serie <> '' then
      qry.sql.Add(' and cast( n.serie as integer)= ' + notaFilter.serie);
    if notaFilter.modelo <> '' then
      qry.sql.Add(' and n.modelo = ' + QuotedStr(notaFilter.modelo));
    if notaFilter.dataInicial > 0 then
      qry.sql.Add(' and format(n.dEmi, ''yyyy-MM-dd'') >= ' +
        QuotedStr(formatdatetime('yyyy-MM-dd', notaFilter.dataInicial)));
    if notaFilter.dataFinal > 0 then
      qry.sql.Add(' and format(n.dEmi, ''yyyy-MM-dd'')  <= ' +
        QuotedStr(formatdatetime('yyyy-MM-dd', notaFilter.dataFinal)));

    if notaFilter.listType <> '' then
      qry.sql.Add(setFiltroType(notaFilter.listType));
    FreeAndNil(notaFilter);
  end;
end;

procedure TDaoNfe.setOrderBy(qry: TFDQuery);
begin
  qry.sql.Add('ORDER BY n.data_hora_recebimento desc')
end;

{ ---------------------------------------------------------------------------- }
end.

unit dfe.dao.manifesto;

interface

Uses
  windows,
  sysutils,
  REST.JSON.Types,
  System.DateUtils,
  REST.JSON,
  System.JSON,
  dfe.dao.base,
  dfe.model.manifesto,
  dfe.model.empresa,
  dfe.dao.empresa,
  Data.DB,

  System.JSON.Types,
  System.JSON.BSON,
  System.Generics.collections,
  System.JSON.Builders,
  System.Rtti,
  System.JSON.Readers,
  dfe.lib.util,
  System.Diagnostics,
  FireDAC.Stan.util,
  FireDAC.Stan.param,
  classes, FireDAC.Comp.Client;

type
  TDaoManifesto = class(TDaoBase)
  private
    lfield: string;
    procedure setFilter(qry: TFDQuery; param: TJSONObject);

  public
    function gravarManifesto(pManifesto: Tmanifesto): Boolean;
    function getManifesto(param: TJSONObject): Tmanifesto;
    function listManifestos(param: TJSONObject): Tmanifestos;

  end;

implementation

{ TDaoNfe }
{ ---------------------------------------------------------------------------- }

function TDaoManifesto.getManifesto(param: TJSONObject): Tmanifesto;
begin
end;

{ ---------------------------------------------------------------------------- }
function TDaoManifesto.gravarManifesto(pManifesto: Tmanifesto): Boolean;
var
  oText: string;

  qry: TFDQuery;
  empresa: Tempresa;
  dao: TDaoEmpresa;
  tpevento: string;
  descEvento: string;
  tpeventoConvert: string;
begin
  result := false;
  try
    try
      qry := TFDQuery.create(Nil);
      qry.Connection := FDConNFe;
      dao := TDaoEmpresa.create;
      empresa := dao.getEmpresaCnpj(pManifesto.cnpj);
      with qry.SQL do
      begin
        add('SELECT  * FROM nfe_MDFe ');
        add('WHERE                ');
        add('  Codigo_loja =' + (empresa.codigo_loja));
        add('  and  Chave_nfe =' + QuotedStr(pManifesto.chave));
        case pManifesto.tipo of
          0:
            begin
              descEvento := 'Confirmacao da Operacao';
              tpeventoConvert := '3';

            end;
          1:
            begin
              descEvento := 'Desconhecimento da Operacao';
              tpeventoConvert := '5';
            end;

          2:
            begin
              descEvento := 'Operacao nao Realizada';
              tpeventoConvert := '6';
            end;
          3:
            begin
              descEvento := 'Ciencia da Operacao';
              tpeventoConvert := '4';
            end;

        end;
        try
          qry.Open();
        except
          on e: exception do
          begin
            gravalog('[DAOMde]302 - ERRO AO GRAVAR Mde ' + e.Message,
              pManifesto.cnpj);
          end;
        end;
        if descEvento = '' then
          descEvento := 'Evento nfe ';
        if pManifesto.justificativa = '' then
          pManifesto.justificativa := '--';
        if pManifesto.xmotivo = '' then
          pManifesto.xmotivo := '--';
        if pManifesto.protocolo = '' then
          pManifesto.protocolo := '0';
        if qry.RecordCount > 0 then
        begin
          gravalog('[DAOMde]Registro encontrado na tabela nfe_MDFe ',
            pManifesto.cnpj);
          tpevento := qry.FieldByName('tpevento').AsString;
          if tpevento <> tpeventoConvert then
          begin
            qry.Close;
            qry.SQL.Clear;
            add('INSERT INTO                                                   ');
            add('  dbo.nfe_MDFe                                                ');
            add('(                                                             ');
            add('  Codigo_loja,                                                ');
            add('  Chave_nfe,                                                  ');
            add('  Evento,                                                     ');
            add('  Ver_leiaute,                                                ');
            add('  id,                                                         ');
            add('  cOrgao,                                                     ');
            add('  tpEvento,                                                   ');
            add('  nSeqEvento,                                                 ');
            add('  verEvento,                                                  ');
            add('  desEvento,                                                  ');
            add('  xJust,                                                      ');
            add('  cStat,                                                      ');
            add('  xMotivo,                                                    ');
            add('  nProt,                                                      ');
            add('  NSU,                                                        ');
            add('  xNome,                                                      ');
            add('  cnpj_cpf,                                                   ');
            add('  IE,                                                         ');
            add('  dEmi,                                                       ');
            add('  tpNF,                                                       ');
            add('  vNF,                                                        ');
            add('  digVal,                                                     ');
            add('  cSitNFe,                                                    ');
            add('  cSitConf,                                                   ');
            add('  dhEvento,                                                   ');
            add('  dhRecbto,                                                   ');
            add('  dhRegEvento                                                 ');
            add(')                                                             ');
            add('SELECT                                                        ');
            add('  TOP  1                                                      ');
            add('  Codigo_loja,                                                 ');
            add('  Chave_nfe,                                                  ');
            add(' ' + (tpeventoConvert) + ',');
            add('  Ver_leiaute,                                                ');
            add('  id,                                                         ');
            add('  cOrgao,                                                     ');
            add(' ' + (tpeventoConvert) + ',');
            add(' ' + IntToStr(pManifesto.sequencia) + ',');
            add('  verEvento,                                                  ');
            add(' ' + QuotedStr(descEvento) + ',');
            add(' ' + QuotedStr(pManifesto.justificativa) + ',');
            add(' ' + IntToStr(pManifesto.cstat) + ',');
            add(' ' + QuotedStr(pManifesto.xmotivo) + ',');
            add(' ' + QuotedStr(pManifesto.protocolo) + ',');
            add('  NSU,                                                        ');
            add('  xNome,                                                      ');
            add('  cnpj_cpf,                                                   ');
            add('  IE,                                                         ');
            add('  dEmi,                                                       ');
            add('  tpNF,                                                       ');
            add('  vNF,                                                        ');
            add('  digVal,                                                     ');
            add('  cSitNFe,                                                    ');
            add('  cSitConf,                                                   ');
            add('  dhEvento,                                                   ');
            add('  dhRecbto,                                                   ');
            add('  dhRegEvento                                                 ');
            add('  FROM                                                        ');
            add('    dbo.nfe_MDFe                                              ');
            add(' WHERE                                                        ');
            add('  Codigo_loja =' + (empresa.codigo_loja));
            add('  and  Chave_nfe =' + QuotedStr(pManifesto.chave));
            try
              qry.ExecSQL;
              gravalog('[DAOMde]Registros inseridos : ' +
                IntToStr(qry.RowsAffected), pManifesto.cnpj);
            except
              on e: exception do
              begin

              end;
            end;
          end
          else
            gravalog('[DAOMde]Registro encontrado na tabela nfe_MDFe com mesmo tipo não sera inserido : '
              + tpevento + ' convertido: ' + tpeventoConvert, pManifesto.cnpj);

        end
        else
        begin
          gravalog('[DAOMde]não encontrado dados da chave na tabela mde novo gravando dados do manifesto',
            pManifesto.cnpj);
          qry.Close;
          qry.SQL.Clear;
          add('Insert into nfe_MDFe ( ');
          add('     Codigo_loja ');
          add('   ,  Chave_nfe   ');
          add('   ,  Evento      ');
          add('   ,  tpEvento ');
          add('   ,  nSeqEvento ');
          add('   ,  desEvento ');
          add('   ,  xJust ');
          add('   ,  dhRecbto    ');
          add('   ,  cStat       ');
          add('   ,  xMotivo     ');

          add('    )             ');
          add('  Values   (      ');
          add('    :Codigo_loja ');
          add('   , :Chave_nfe   ');
          add('   , :Evento      ');
          add('   , :tpEvento ');
          add('   , :nSeqEvento ');
          add('   , :desEvento ');
          add('   , :xJust ');
          add('   , :dhRecbto    ');
          add('   , :cStat       ');
          add('   , :xMotivo     ');
          add('    )             ');

          qry.ParamByName('Codigo_loja').AsString := empresa.codigo_loja;
          qry.ParamByName('Chave_nfe').AsString := pManifesto.chave;
          qry.ParamByName('Evento').AsInteger := 1;
          qry.ParamByName('tpEvento').AsString := tpeventoConvert;
          qry.ParamByName('nSeqEvento').AsInteger := pManifesto.sequencia;
          qry.ParamByName('desEvento').AsString := descEvento;
          qry.ParamByName('xjust').AsString := pManifesto.justificativa;

          qry.ParamByName('dhRecbto').AsDateTime := pManifesto.dataHora;
          qry.ParamByName('cStat').AsInteger := pManifesto.cstat;
          qry.ParamByName('xMotivo').AsString := pManifesto.xmotivo;
          try
            qry.ExecSQL;
          except
            on e: exception do
            begin

            end;
          end;
          gravalog('[DAOMde]Dados do manifesto gravados', pManifesto.cnpj);
        end;
      end;

    except
      on e: exception do
      begin
        gravalog('[DAOMde]302 - ERRO AO GRAVAR Mde ' + e.Message,
          pManifesto.cnpj);

      end;
    end;
  finally
    FreeAndNil(empresa);
    FreeAndNil(dao);
    FreeAndNil(qry);
  end;

end;

{ ---------------------------------------------------------------------------- }
function TDaoManifesto.listManifestos(param: TJSONObject): Tmanifestos;
var
  qry: TFDQuery;
  lresult: TJSONArray;
  oManifesto: Tmanifesto;
  i: integer;
  sresult: String;
  filtro: TfiltroManifesto;
begin
  result := Nil;
  try
    try
      qry := TFDQuery.create(Nil);
      filtro := Tjson.JsonToObject<TfiltroManifesto>(param);
      qry.Connection := FDConNFe;
      With qry.SQL do
      begin
        add('SELECT top 1000 ');
        add('  Codigo_loja,                                                ');
        add('  Chave_nfe,                                                  ');
        add('  Evento,                                                     ');
        add('  tpEvento,                                                   ');
        add('  nSeqEvento,                                                 ');
        add('  desEvento,                                                  ');
        add('  xJust,                                                      ');
        add('  cStat,                                                      ');
        add('  xMotivo,                                                    ');
        add('  nProt,                                                      ');
        add('  NSU,                                                        ');
        add('  xNome,                                                      ');
        add('  cnpj_cpf,                                                   ');
        add('  IE,                                                         ');
        add('  dEmi as dEmi,                  ');
        add('  tpNF,                                                       ');
        add('  vNF,                                                        ');
        add('  digVal,                                                     ');
        add('  cSitNFe,                                                    ');
        add('  cSitConf,                                                   ');
        add('  dhEvento as dhEvento,         ');
        add('  dhRecbto as dhRecbto,         ');
        add('  dhRegEvento   as hRegEvento  ');
        add('FROM ');
        add('  nfe_MDFe ');
        add('WHERE ');
      end;
      qry.SQL.add('  codigo_loja is not null ');
      setFilter(qry, param);
      qry.SQL.add('  order by dhevento desc ');
      lresult := OpenQuery(qry);
      result := Tmanifestos.create;
      for i := 0 to lresult.Count - 1 do
      begin
        sresult := lresult.Items[i].ToJSON;
        oManifesto := Tmanifesto.create();
        if Assigned(lresult.Items[i].FindValue('cnpj_cpf')) then

          oManifesto.cnpj := lresult.Items[i].FindValue('cnpj_cpf').Value;
        if Assigned(lresult.Items[i].FindValue('chave_nfe')) then
          oManifesto.chave := lresult.Items[i].FindValue('chave_nfe').Value;

        if Assigned(lresult.Items[i].FindValue('dhevento')) then
          oManifesto.dataHora :=
            ISO8601ToDate(lresult.Items[i].FindValue('dhevento').Value);

        if (Assigned(lresult.Items[i].FindValue('nseqevento'))) and
          (lresult.Items[i].FindValue('nseqevento').Value <> '') then
          oManifesto.sequencia :=
            strtoint(lresult.Items[i].FindValue('nseqevento').Value);

        if Assigned(lresult.Items[i].FindValue('xjust')) then
          oManifesto.justificativa := lresult.Items[i].FindValue('xjust').Value;

        if (Assigned(lresult.Items[i].FindValue('cstat'))) and
          (lresult.Items[i].FindValue('cstat').Value <> '') then
          oManifesto.cstat :=
            strtoint(lresult.Items[i].FindValue('cstat').Value);

        if Assigned(lresult.Items[i].FindValue('xmotivo')) then
          oManifesto.xmotivo := lresult.Items[i].FindValue('xmotivo').Value;

        if Assigned(lresult.Items[i].FindValue('nprot')) then
          oManifesto.protocolo := lresult.Items[i].FindValue('nprot').Value;

        if (Assigned(lresult.Items[i].FindValue('tpevento'))) and
          (lresult.Items[i].FindValue('tpevento').Value <> '0') then
          oManifesto.tipo :=
            strtoint(lresult.Items[i].FindValue('tpevento').Value);

        if Assigned(lresult.Items[i].FindValue('desevento')) then
          oManifesto.descEvento := lresult.Items[i]
            .FindValue('desevento').Value;
        result.add(oManifesto);
      end;
    except
      on e: exception do
        gravalog('[DAOMANIFESTOS]ERRO AO LISTAR MANIFESTOS ' + e.Message, '');

    end;
  finally
    qry.Close;
    if Assigned(filtro) then
      FreeAndNil(filtro);
    FreeAndNil(qry);
    if Assigned(lresult) then
      FreeAndNil(lresult);
  end;
end;

procedure TDaoManifesto.setFilter(qry: TFDQuery; param: TJSONObject);

var
  filtro: TfiltroManifesto;
  empresa: Tempresa;
  dao: TDaoEmpresa;
  codLoja: string;

begin
  codLoja := '';
  filtro := Tjson.JsonToObject<TfiltroManifesto>(param);
  if Assigned(filtro) then
  begin
    if filtro.cnpj <> '' then
    begin
      dao := TDaoEmpresa.create;
      empresa := dao.getEmpresaCnpj(filtro.cnpj);
      try

        codLoja := empresa.codigo_loja;
      finally
        FreeAndNil(dao);
        FreeAndNil(empresa);
      end;

    end;
    if filtro.desEvento <> '' then
    begin

      if LowerCase(filtro.desEvento) = LowerCase('Ciencia da Operacao') then
        qry.SQL.add(' and cSitConf =4 ')
      else

        if LowerCase(filtro.desEvento) = LowerCase('Confirmacao da Operacao')
      then
        qry.SQL.add(' and cSitConf = 1')
      else

        if LowerCase(filtro.desEvento) = LowerCase('Desconhecimento da Operacao')
      then
        qry.SQL.add(' and cSitConf = 2')
      else

        if LowerCase(filtro.desEvento) = LowerCase('Operacao nao Realizada')
      then
        qry.SQL.add(' and cSitConf = 3')
      else

        if LowerCase(filtro.desEvento) = LowerCase('Cancelamento') then
        qry.SQL.add(' and cSitConf = 6')
      else

        if LowerCase(filtro.desEvento) = LowerCase('Terceiros') then
        qry.SQL.add(' and cSitConf = 7')
      else

        if LowerCase(filtro.desEvento) = LowerCase('Denegadas') then
        qry.SQL.add(' and cSitConf = 5');

    end;

    if (codLoja <> '') then
      qry.SQL.add(' and codigo_loja = ' + (codLoja));

    if filtro.TipoData = 'documento' then
      lfield := 'dEmi'
    else
      lfield := 'dhEvento';

    if filtro.dataInicial > 0 then
      qry.SQL.add(' and format(' + lfield + ', ''yyyy-MM-dd'') >= ' +
        QuotedStr(formatdatetime('yyyy-MM-dd', filtro.dataInicial)));
    if filtro.dataFinal > 0 then
      qry.SQL.add(' and format(' + lfield + ', ''yyyy-MM-dd'')  <= ' +
        QuotedStr(formatdatetime('yyyy-MM-dd', filtro.dataFinal)));

    FreeAndNil(filtro);
  end;
end;

{ ---------------------------------------------------------------------------- }
end.

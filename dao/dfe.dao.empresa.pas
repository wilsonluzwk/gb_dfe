unit dfe.dao.empresa;

interface

Uses
  windows,
  REST.JSON,
  sysutils,
  REST.JSON.Types,
  dfe.lib.acbr.config,
  system.JSON,
  dfe.dao.base,
  dfe.model.empresa,
  system.generics.collections,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.dapt,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Comp.UI,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Stan.param,

  system.JSON.Types,
  system.JSON.BSON,
  system.JSON.Builders,
  system.Rtti,
  system.JSON.Readers,
  system.Diagnostics,
  FireDAC.Stan.Util,
  dfe.lib.Util,
  ACBrNFe,
  classes;

type
  TDaoEmpresa = class(TDaoBase)
  private
    procedure setCertificado(empresa: TEmpresa);
  public
    function gravarEmpresa(pEmpresa: TEmpresa): Boolean;
    function apagarEmpresa(pEmpresa: TEmpresa): Boolean;
    procedure SetNsuCte(ultNSU, CodigoLoja: string);
    function getEmpresa(param: TJSONObject): TEmpresa; overload;
    function getEmpresa(pcnpj: string): TEmpresa; overload;
    function getEmpresaCod(cod_loja: string): TEmpresa;
    function getEmpresaCnpj(cnpj: string): TEmpresa;
    function listEmpresas(param: TJSONObject): Tempresas;
    function GetLastConsultaCte(CodigoLoja: string): TDateTime;

  end;

implementation

{ TDaoEmpresa }
{ ---------------------------------------------------------------------------- }
function TDaoEmpresa.apagarEmpresa(pEmpresa: TEmpresa): Boolean;
begin
  result := false;

end;

function TDaoEmpresa.getEmpresa(param: TJSONObject): TEmpresa;
var
  qry: TFDQuery;
  lresult: TJSONArray;
begin
  try
    result := TEmpresa.create('');
    qry := TFDQuery.create(Nil);
    qry.Connection := FDConNFe;
    qry.SQL.Add('select  top 500 * from emitente ');
    lresult := OpenQuery(qry);

    result := Tjson.JsonToObject<TEmpresa>(lresult.ToJSON);
  finally
    qry.Free;
    FreeAndNil(qry);
  end;

end;

{ ---------------------------------------------------------------------------- }
function TDaoEmpresa.getEmpresa(pcnpj: string): TEmpresa;
var
  qry: TFDQuery;
  lresult: TJSONArray;

begin
  qry := TFDQuery.create(Nil);
  try
    result := TEmpresa.create('');
    qry.Connection := FDConNFe;
    qry.SQL.Add('select * from emitente  where codigo_loja = :codigo_loja ');
    qry.ParamByName('codigo_loja').AsString := pcnpj;

    lresult := OpenQuery(qry);

    result := Tjson.JsonToObject<TEmpresa>(TJSONObject(lresult.Items[0]));
    if lresult.Count > 0 then
    begin
      result := Tjson.JsonToObject<TEmpresa>(TJSONObject(lresult.Items[0]));
      setCertificado(result);
    end;
  finally
    qry.close;
    FreeAndNil(qry);
  end;
end;

{ ---------------------------------------------------------------------------- }
function TDaoEmpresa.getEmpresaCnpj(cnpj: string): TEmpresa;

var
  qry: TFDQuery;
  lresult: TJSONArray;
begin
  try
    result := TEmpresa.create('');
    qry := TFDQuery.create(Nil);
    qry.Connection := FDConNFe;
    qry.SQL.Add('select * from emitente  where cnpj = ' + QuotedStr(cnpj));

    lresult := OpenQuery(qry);
    if lresult.Count > 0 then
    begin
      result := Tjson.JsonToObject<TEmpresa>(TJSONObject(lresult.Items[0]));
      setCertificado(result);
    end;

  finally
    qry.close;
    FreeAndNil(qry);
    if assigned(lresult) then
      FreeAndNil(lresult);
  end;
end;

function TDaoEmpresa.getEmpresaCod(cod_loja: string): TEmpresa;
var
  qry: TFDQuery;
  lresult: TJSONArray;

begin
  try
    result := TEmpresa.create('');
    qry := TFDQuery.create(Nil);
    qry.Connection := FDConNFe;
    qry.SQL.Add('select * from emitente  where codigo_loja = :codigo_loja ');
    qry.ParamByName('codigo_loja').AsString := cod_loja;

    lresult := OpenQuery(qry);
    if lresult.Count > 0 then
    begin

      result := Tjson.JsonToObject<TEmpresa>(TJSONObject(lresult.Items[0]));

      setCertificado(result);
    end;
  finally
    qry.close;
    FreeAndNil(qry);
    if assigned(lresult) then
      FreeAndNil(lresult);
  end;
end;

function TDaoEmpresa.GetLastConsultaCte(CodigoLoja: string): TDateTime;
begin
  Query.SQL.Clear;
  try
    Query.SQL.Add('SELECT NSU_DATA_CONSULTA_CTE FROM  EMITENTE ');

    Query.SQL.Add('WHERE ');
    Query.SQL.Add('   CODIGO_LOJA = ' + CodigoLoja);
    Query.Open;
    result := Query.FieldByName('NSU_DATA_CONSULTA_CTE').AsDateTime;
  finally
    Query.close
  end;

end;

function TDaoEmpresa.gravarEmpresa(pEmpresa: TEmpresa): Boolean;
var
  qry: TFDQuery;
  ss: TStringStream;

begin
  try
    qry := TFDQuery.create(Nil);
    qry.Connection := FDConNFe;

    qry.close;
    qry.SQL.Clear;
    qry.SQL.Add('SET DATEFORMAT dmy                                ');
    qry.SQL.Add('update emitente set                               ');
    qry.SQL.Add('  senhaPfx   = :senhaPfx, ');
    qry.SQL.Add('  certificadoPfx  = :certificadoPfx,');
    qry.SQL.Add('  CSC                    = :CSC,                  ');
    qry.SQL.Add('  IdCSC                  = :IdCSC,                ');
    qry.SQL.Add('  DANFE_QtdCopias        = :DANFE_QtdCopias,      ');
    qry.SQL.Add('  DANFE_QtdCopNFCe       = :DANFE_QtdCopNFCe,     ');
    qry.SQL.Add('  DANFE_Visualiza        = :DANFE_Visualiza,      ');

    qry.SQL.Add('  DANFE_ImportaTxt       = :DANFE_ImportaTxt,     ');
    qry.SQL.Add('  DANFE_LogoMarca        = :DANFE_LogoMarca,      ');
    qry.SQL.Add('  DANFE_ExpandiLogo      = :DANFE_ExpandiLogo,      ');

    qry.SQL.Add('  DANFE_ImpNFe           = :DANFE_ImpNFe,         ');
    qry.SQL.Add('  DANFE_ImpNFCe          = :DANFE_ImpNFCe,        ');
    qry.SQL.Add('  DANFE_ExibeFatura      = :DANFE_ExibeFatura,    ');

    qry.SQL.Add('  DANFE_TipoDANF         = :DANFE_TipoDANF   ,    ');
    qry.SQL.Add('  DANFE_TipoDANFCE       = :DANFE_TipoDANFCE,     ');

    qry.SQL.Add('  Web_Ambiente           = :Web_Ambiente,         ');

    qry.SQL.Add('  Email_NEeMAIL          = :Email_NEeMAIL,        ');
    qry.SQL.Add('  Email_Host             = :Email_Host,           ');
    qry.SQL.Add('  Email_Port             = :Email_Port,           ');
    qry.SQL.Add('  Email_User             = :Email_User,           ');
    qry.SQL.Add('  Email_Pass             = :Email_Pass,           ');
    qry.SQL.Add('  Email_SSL              = :Email_SSL,            ');
    qry.SQL.Add('  Email_TLS              = :Email_TLS,            ');
    qry.SQL.Add('  Email_Assunto          = :Email_Assunto,        ');
    qry.SQL.Add('  Email_Assunto_Canc     = :Email_Assunto_Canc,   ');
    qry.SQL.Add('  Email_Assunto_CCe      = :Email_Assunto_CCe,    ');
    qry.SQL.Add('  Email_CC               = :Email_CC,             ');
    qry.SQL.Add('  Email_Mensagem         = :Email_Mensagem,       ');
    qry.SQL.Add('  danfe_HorariodeVerao   = :danfe_HorariodeVerao,  ');
    qry.SQL.Add('  danfe_FusoHorario      = :danfe_FusoHorario,     ');
    qry.SQL.Add('  OUTROS_DtIni           = :OUTROS_DtIni,         ');
    qry.SQL.Add('  Proxy_Host             = :Proxy_Host,           ');
    qry.SQL.Add('  Proxy_Porta            = :Proxy_Porta,          ');
    qry.SQL.Add('  Proxy_User             = :Proxy_User,           ');
    qry.SQL.Add('  Proxy_Pass             = :Proxy_Pass,           ');
    qry.SQL.Add('  danfe_UsaHorarioDF     = :danfe_UsaHorarioDF ,   ');
    qry.SQL.Add('  RT_UFExige             = :RT_UFExige,           ');
    qry.SQL.Add('  RT_idCSRT              = :RT_idCSRT,            ');
    qry.SQL.Add('  RT_CSRT                = :RT_CSRT,              ');
    qry.SQL.Add('  RT_CNPJ                = :RT_CNPJ,              ');
    qry.SQL.Add('  RT_xContato            = :RT_xContato,          ');
    qry.SQL.Add('  RT_email               = :RT_email,             ');
    qry.SQL.Add('  RT_fone                = :RT_fone,              ');
    qry.SQL.Add('  DANFE_MdeAutomatico    = :DANFE_MdeAutomatico ,  ');
    qry.SQL.Add('  UsaFSDA                = :UsaFSDA               ');
    qry.SQL.Add(' where codigo_loja = :codigo_loja                 ');

    qry.ParamByName('senhaPfx').AsString := pEmpresa.senhaPfx;
    qry.ParamByName('DANFE_ExpandiLogo').DataType := ftString;

    qry.ParamByName('DANFE_TipoDANF').AsInteger := pEmpresa.contigencia;

    ss := TStringStream.create(pEmpresa.certificadoPfx);

    qry.ParamByName('certificadoPfx').LoadFromStream(ss, ftMemo);

    qry.ParamByName('CSC').AsString := pEmpresa.csc;
    qry.ParamByName('IdCSC').AsString := pEmpresa.idcsc;

    qry.ParamByName('DANFE_QtdCopias').AsInteger := pEmpresa.danfe_QtdCopias;
    qry.ParamByName('DANFE_QtdCopNFCe').AsInteger := pEmpresa.danfe_QtdCopNFCe;

    if pEmpresa.danfe_Visualiza = 'S' then
      qry.ParamByName('DANFE_Visualiza').AsString := 'S'
    else
      qry.ParamByName('DANFE_Visualiza').AsString := 'N';

    if pEmpresa.DANFE_ImportaTxt = 'S' then
      qry.ParamByName('DANFE_ImportaTxt').AsString := 'S'
    else
      qry.ParamByName('DANFE_ImportaTxt').AsString := 'N';

    qry.ParamByName('DANFE_LogoMarca').AsString := pEmpresa.danfe_logomarca;

    if pEmpresa.danfe_expandiLogo <> '' then
      qry.ParamByName('DANFE_ExpandiLogo').AsString :=
        pEmpresa.danfe_expandiLogo;

    if (pEmpresa.usaFSDA = 'S') or (pEmpresa.usaFSDA = '1') then
      qry.ParamByName('UsaFSDA').AsString := 'S'
    else
      qry.ParamByName('UsaFSDA').AsString := 'N';

    qry.ParamByName('DANFE_ImpNFe').AsString := pEmpresa.danfe_ImpNFe;
    qry.ParamByName('DANFE_ImpNFCe').AsString := pEmpresa.danfe_ImpNFCe;

    if pEmpresa.DANFE_ExibeFatura = 'S' then
      qry.ParamByName('DANFE_ExibeFatura').AsString := 'S'
    else
      qry.ParamByName('DANFE_ExibeFatura').AsString := 'N';

    qry.ParamByName('DANFE_TipoDANF').AsInteger := pEmpresa.danfe_TipoDANF;
    qry.ParamByName('DANFE_TipoDANFCE').AsInteger := pEmpresa.danfe_TipoDANFCE;

    if pEmpresa.DANFE_ExibeFatura = 'S' then
      qry.ParamByName('DANFE_ExibeFatura').AsString := 'S'
    else
      qry.ParamByName('DANFE_ExibeFatura').AsString := 'N';

    if pEmpresa.Web_Ambiente = 'P' then
      qry.ParamByName('Web_Ambiente').AsString := 'P'
    else
      qry.ParamByName('Web_Ambiente').AsString := 'H';

    qry.ParamByName('Email_NEeMAIL').AsString := pEmpresa.Email_NEeMAIL;
    qry.ParamByName('Email_Host').AsString := pEmpresa.Email_Host;
    qry.ParamByName('Email_Port').AsInteger := pEmpresa.Email_Port;
    qry.ParamByName('Email_User').AsString := pEmpresa.Email_User;
    qry.ParamByName('Email_Pass').AsString := pEmpresa.Email_Pass;

    qry.ParamByName('Proxy_Host').AsString := pEmpresa.Proxy_Host;
    qry.ParamByName('Proxy_Porta').AsString := pEmpresa.Proxy_Porta;
    qry.ParamByName('Proxy_User').AsString := pEmpresa.Proxy_User;
    qry.ParamByName('Proxy_Pass').AsString := pEmpresa.Proxy_Pass;

    if pEmpresa.email_SSL = 'S' then
      qry.ParamByName('Email_SSL').AsString := 'S'
    else
      qry.ParamByName('Email_SSL').AsString := 'N';

    if pEmpresa.email_TLS = 'S' then
      qry.ParamByName('Email_TLS').AsString := 'S'
    else
      qry.ParamByName('Email_TLS').AsString := 'N';

    qry.ParamByName('Email_Assunto').AsString := pEmpresa.email_Assunto;
    qry.ParamByName('Email_Assunto_Canc').AsString :=
      pEmpresa.email_Assunto_Canc;

    qry.ParamByName('Email_Assunto_CCe').AsString := pEmpresa.email_Assunto_CCe;
    qry.ParamByName('Email_CC').AsString := pEmpresa.email_cc;
    qry.ParamByName('Email_Mensagem').AsMemo := pEmpresa.email_Mensagem;

    qry.ParamByName('RT_idCSRT').AsString := pEmpresa.RT_idCSRT;
    qry.ParamByName('RT_CSRT').AsString := pEmpresa.RT_CSRT;
    qry.ParamByName('RT_CNPJ').AsString := pEmpresa.RT_CNPJ;
    qry.ParamByName('RT_xContato').AsString := pEmpresa.RT_xContato;
    qry.ParamByName('RT_email').AsString := pEmpresa.RT_email;
    qry.ParamByName('RT_fone').AsString := pEmpresa.RT_fone;

    qry.ParamByName('codigo_loja').AsString := pEmpresa.codigo_loja;
    qry.ParamByName('OUTROS_DtIni').Value :=
      StrToDateTime(FormatDateTime('dd/mm/yyyy', now));

    if pEmpresa.danfe_HorariodeVerao = 'S' then
      qry.ParamByName('danfe_HorariodeVerao').AsString := 'S'
    else
      qry.ParamByName('danfe_HorariodeVerao').AsString := 'N';

    if pEmpresa.danfe_FusoHorario = 'S' then
      qry.ParamByName('danfe_FusoHorario').AsString := 'S'
    else
      qry.ParamByName('danfe_FusoHorario').AsString := 'N';

    if pEmpresa.danfe_UsaHorarioDF = 'S' then
      qry.ParamByName('danfe_UsaHorarioDF').AsString := 'S'
    else
      qry.ParamByName('danfe_UsaHorarioDF').AsString := 'N';

    if pEmpresa.rt_UFExige = 'S' then
      qry.ParamByName('rt_UFExige').AsString := 'S'
    else
      qry.ParamByName('rt_UFExige').AsString := 'N';
    if pEmpresa.DANFE_MdeAutomatico = 'S' then
      qry.ParamByName('DANFE_MdeAutomatico').AsString := 'S'
    Else
      qry.ParamByName('DANFE_MdeAutomatico').AsString := 'N';
    qry.ExecSQL;
  finally
    FreeAndNil(qry);
  end;
end;

{ ---------------------------------------------------------------------------- }
function TDaoEmpresa.listEmpresas(param: TJSONObject): Tempresas;
var
  qry: TFDQuery;
  lresult: TJSONArray;
  oEmpresa: TEmpresa;
  i: integer;
  sresult: String;
  filtro: TEmpresa;
begin
  try
    try

      qry := TFDQuery.create(Nil);
      filtro := Tjson.JsonToObject<TEmpresa>(param);
      qry.Connection := FDConNFe;
      qry.SQL.Add('select  top 500 * from emitente ');
      if assigned(filtro) and (filtro.cnpj <> '') then
        qry.SQL.Add(' where cnpj = ' + QuotedStr(filtro.cnpj));
      lresult := OpenQuery(qry);
      result := Tempresas.create;
      for i := 0 to lresult.Count - 1 do
      begin
        sresult := lresult.Items[i].ToJSON;
        oEmpresa := TEmpresa.create('');
        oEmpresa := Tjson.JsonToObject<TEmpresa>(sresult);
        setCertificado(oEmpresa);
        result.Add(oEmpresa);
      end;
    except
      on e: exception do
        sresult := e.Message;
    end;
  finally
    sresult := '';
    qry.close;
    if assigned(filtro) then
      FreeAndNil(filtro);
    FreeAndNil(qry);
    if assigned(lresult) then
      FreeAndNil(lresult);
  end;
end;

procedure TDaoEmpresa.setCertificado(empresa: TEmpresa);
var
  obj: TACBrNFe;
begin
  if (empresa.certificadoPfx <> '') and (empresa.senhaPfx <> '') then
    try
      obj := TACBrNFe.create(Nil);
      try
        TAcbrConfig.setAcbrObj(obj, empresa);
        empresa.nomecertificadoPfx := obj.SSL.CertRazaoSocial;
        empresa.validade := obj.SSL.CertDataVenc;
      finally
        FreeAndNil(obj);
      end;
    except
    end;
end;

procedure TDaoEmpresa.SetNsuCte(ultNSU, CodigoLoja: string);
begin

  Query.SQL.Add('UPDATE EMITENTE ');
  Query.SQL.Add('   SET NSUCTE_SEQUENCIA =' + ultNSU);
  Query.SQL.Add('   ,NSU_DATA_CONSULTA_CTE  =:Ldate');
  Query.SQL.Add('WHERE ');
  Query.SQL.Add('   CODIGO_LOJA = ' + CodigoLoja);
  Query.ParamByName('ldate').AsDateTime:=now;
  Query.ExecSQL;
end;

{ ---------------------------------------------------------------------------- }
end.

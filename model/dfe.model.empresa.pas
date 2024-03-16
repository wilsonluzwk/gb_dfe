unit dfe.model.empresa;

interface

uses
  System.SysUtils,
  System.Generics.Collections,

  System.classes;

Type
  TEmpresa = class
  private
    Fcodigo_loja: string;
    Fcnpj: string;
    Frazao_social: string;
    Fendereco: string;
    Fbairro: string;
    Fmunicipio: string;
    Fcodigo_municipio: string;
    Fcomplemento: string;
    Fuf: string;
    Fnumero: string;
    Ffone: string;
    FinscricaoMunicipal: string;
    Finsc_estadual: string;
    FnomecertificadoPfx: string;
    FcertificadoPfx: string;
    FsenhaPfx: string;
    Fvalidade: TDateTime;
    FWeb_Ambiente: string;
    Fcontigencia: integer;
    Fcsc: string;
    Fidcsc: string;
    Fdanfe_qtdcopias: integer;
    Fdanfe_qtdcopnfce: integer;
    Fdanfe_visualiza: string;

    Fdanfe_importatxt: string;
    Fdanfe_logomarca: string;

    Fdanfe_impnfe: string;
    Fdanfe_impnfce: string;
    Fdanfe_exibefatura: string;
    Fdanfe_expandilogo: string;
    Fdanfe_tipodanf: integer;
    Fdanfe_tipodanfce: integer;
    Fdanfe_edemail: string;

    Fdanfe_logomarcaarquivo: string;
    Femail_neemail: string;
    Femail_host: string;
    Femail_port: integer;
    Femail_user: string;
    Femail_pass: string;
    Femail_ssl: string;
    Femail_tls: string;
    Femail_assunto: string;
    Femail_assunto_canc: string;
    Femail_assunto_cce: string;
    Femail_cc: string;
    Femail_mensagem: string;
    Fdanfe_forsai: string;
    Foutros_DtIni: string;
    Frt_idcsrt: string;
    Frt_csrt: string;
    Frt_cnpj: string;
    Frt_xcontato: string;
    Frt_email: string;
    Frt_fone: string;
    FusaFsda: string;
    Fdanfe_horariodeverao: string;
    Fdanfe_fusohorario: string;
    Fdanfe_usahorariodf: string;
    Fproxy_host: string;
    Fproxy_porta: string;
    Fproxy_user: string;
    Fproxy_pass: string;
    Frt_ufexige: string;
    Fdanfe_mdeautomatico:String;
    FNSU_DATA_CONSULTA_CTE:TDateTime;

    // Fnsu_data_consulta:Tdatetime;
    Fnsu_sequencia: Double;
    FnsuCte_sequencia: Double;
    procedure cloneEmpresa(source: TEmpresa);
  public
    constructor create(cnpj: string; cod_loja: string = '');

  published
    property cnpj: string read Fcnpj write Fcnpj;
    property razao_social: string read Frazao_social write Frazao_social;
    property endereco: string read Fendereco write Fendereco;
    property bairro: string read Fbairro write Fbairro;
    property municipio: string read Fmunicipio write Fmunicipio;
    property codigo_municipio: string read Fcodigo_municipio
      write Fcodigo_municipio;
    property complemento: string read Fcomplemento write Fcomplemento;
    property numero: string read Fnumero write Fnumero;
    property uf: string read Fuf write Fuf;
    property fone: string read Ffone write Ffone;
    property inscricaoMunicipal: string read FinscricaoMunicipal
      write FinscricaoMunicipal;
    property insc_estadual: string read Finsc_estadual write Finsc_estadual;
    property nomecertificadoPfx: string read FnomecertificadoPfx
      write FnomecertificadoPfx;
    property certificadoPfx: string read FcertificadoPfx write FcertificadoPfx;
    property senhaPfx: string read FsenhaPfx write FsenhaPfx;
    property validade: TDateTime read Fvalidade write Fvalidade;
    property Web_Ambiente: string read FWeb_Ambiente write FWeb_Ambiente;
    property contigencia: integer read Fcontigencia write Fcontigencia;

    property csc: string read Fcsc write Fcsc;
    property idcsc: string read Fidcsc write Fidcsc;
    property danfe_qtdcopias: integer read Fdanfe_qtdcopias
      write Fdanfe_qtdcopias;
    property danfe_qtdcopnfce: integer read Fdanfe_qtdcopnfce
      write Fdanfe_qtdcopnfce;
    property danfe_visualiza: string read Fdanfe_visualiza
      write Fdanfe_visualiza;

    property danfe_importatxt: string read Fdanfe_importatxt
      write Fdanfe_importatxt;
    property danfe_logomarca: string read Fdanfe_logomarca
      write Fdanfe_logomarca;

    property danfe_impnfe: string read Fdanfe_impnfe write Fdanfe_impnfe;
    property danfe_impnfce: string read Fdanfe_impnfce write Fdanfe_impnfce;
    property danfe_exibefatura: string read Fdanfe_exibefatura
      write Fdanfe_exibefatura;
    property danfe_expandiLogo: string read Fdanfe_expandilogo
      write Fdanfe_expandilogo;
    property danfe_tipodanf: integer read Fdanfe_tipodanf write Fdanfe_tipodanf;
    property danfe_tipodanfce: integer read Fdanfe_tipodanfce
      write Fdanfe_tipodanfce;
    property danfe_Edemail: string read Fdanfe_edemail write Fdanfe_edemail;

    property danfe_forsai: string read Fdanfe_forsai write Fdanfe_forsai;

    property email_neemail: string read Femail_neemail write Femail_neemail;
    property email_host: string read Femail_host write Femail_host;
    property email_port: integer read Femail_port write Femail_port;
    property email_user: string read Femail_user write Femail_user;
    property email_pass: string read Femail_pass write Femail_pass;
    property email_ssl: string read Femail_ssl write Femail_ssl;
    property email_tls: string read Femail_tls write Femail_tls;
    property email_assunto: string read Femail_assunto write Femail_assunto;
    property email_assunto_canc: string read Femail_assunto_canc
      write Femail_assunto_canc;
    property email_assunto_cce: string read Femail_assunto_cce
      write Femail_assunto_cce;
    property email_cc: string read Femail_cc write Femail_cc;
    property email_Mensagem: string read Femail_mensagem write Femail_mensagem;

    property outros_DtIni: string read Foutros_DtIni write Foutros_DtIni;

    property rt_idcsrt: string read Frt_idcsrt write Frt_idcsrt;
    property rt_csrt: string read Frt_csrt write Frt_csrt;
    property rt_cnpj: string read Frt_cnpj write Frt_cnpj;
    property rt_xcontato: string read Frt_xcontato write Frt_xcontato;
    property rt_email: string read Frt_email write Frt_email;
    property rt_fone: string read Frt_fone write Frt_fone;
    property usafsda: string read FusaFsda write FusaFsda;
    property codigo_loja: string read Fcodigo_loja write Fcodigo_loja;
    property danfe_logomarcaarquivo: string read Fdanfe_logomarcaarquivo
      write Fdanfe_logomarcaarquivo;

    property danfe_horariodeverao: string read Fdanfe_HorariodeVerao
      write Fdanfe_horariodeverao;
    property danfe_fusohorario: string read Fdanfe_fusohorario
      write Fdanfe_fusohorario;
    property danfe_usahorariodf: string read Fdanfe_usahorariodf
      write Fdanfe_usahorariodf;
    property proxy_host: string read Fproxy_Host write Fproxy_host;
    property proxy_porta: string read Fproxy_Porta write Fproxy_porta;
    property proxy_user: string read Fproxy_user write Fproxy_user;
    property proxy_pass: string read Fproxy_Pass write Fproxy_pass;
    property rt_ufexige: string read Frt_ufexige write Frt_ufexige;
    property danfe_mdeautomatico:String read Fdanfe_mdeautomatico write Fdanfe_mdeautomatico;

    // property nsu_data_consulta: TdateTime read Fnsu_data_consulta
    // write Fnsu_data_consulta;

    property nsu_sequencia: Double read Fnsu_sequencia write Fnsu_sequencia;
    property nsuCte_sequencia: Double read FnsuCte_sequencia write FnsuCte_sequencia;
    propertY NSU_DATA_CONSULTA_CTE :TDateTime read FNSU_DATA_CONSULTA_CTE write FNSU_DATA_CONSULTA_CTE;
  end;

type
  Tempresas = TObjectList<TEmpresa>;

implementation

uses
  dfe.dao.empresa;

{ TEmpresa }

procedure TEmpresa.cloneEmpresa(source: TEmpresa);
begin
  Fcodigo_loja := source.codigo_loja;
  Fcnpj := source.cnpj;
  Frazao_social := source.razao_social;
  Fendereco := source.endereco;
  Fbairro := source.bairro;
  Fmunicipio := source.municipio;
  Fcodigo_municipio := source.codigo_municipio;
  Fcomplemento := source.complemento;
  Fnumero := source.numero;
  Fuf := source.uf;
  Ffone := source.fone;
  FinscricaoMunicipal := source.inscricaoMunicipal;
  Finsc_estadual := source.insc_estadual;
  FnomecertificadoPfx := source.nomecertificadoPfx;
  FcertificadoPfx := source.certificadoPfx;
  FsenhaPfx := source.senhaPfx;
  Fvalidade := source.validade;
  FWeb_Ambiente := source.Web_Ambiente;

  Fcsc := source.csc;
  Fidcsc := source.idcsc;
  Fdanfe_qtdcopias := source.danfe_qtdcopias;
  Fdanfe_qtdcopnfce := danfe_qtdcopnfce;
  Fdanfe_visualiza := source.danfe_visualiza;

  Fdanfe_importatxt := source.danfe_importatxt;
  Fdanfe_logomarca := source.danfe_logomarca;

  Fdanfe_impnfe := source.danfe_impnfe;
  Fdanfe_impnfce := source.danfe_impnfce;
  Fdanfe_exibefatura := source.danfe_exibefatura;
  Fdanfe_expandilogo := source.danfe_expandiLogo;
  Fdanfe_tipodanf := source.danfe_tipodanf;
  Fdanfe_tipodanfce := source.danfe_tipodanfce;
  Fdanfe_edemail := source.danfe_Edemail;
  Fdanfe_forsai := source.danfe_forsai;

  Femail_neemail := source.email_neemail;
  Femail_host := source.email_host;
  Femail_port := source.email_port;
  Femail_user := source.email_user;
  Femail_pass := source.email_pass;
  Femail_ssl := source.email_ssl;
  Femail_tls := source.email_tls;
  Femail_assunto := source.email_assunto;
  Femail_assunto_canc := source.email_assunto_canc;
  Femail_assunto_cce := source.email_assunto_cce;
  Femail_cc := source.email_cc;
  Femail_mensagem := source.email_Mensagem;
  Foutros_DtIni := source.outros_DtIni;

  Frt_idcsrt := source.rt_idcsrt;
  Frt_csrt := source.rt_csrt;
  Frt_cnpj := source.rt_cnpj;
  Frt_xcontato := source.rt_xcontato;
  Frt_email := source.rt_email;
  Frt_fone := source.rt_fone;
  FusaFsda := source.usafsda;
  // Fnsu_data_consulta:=source.nsu_data_consulta;
  Fnsu_sequencia := source.nsu_sequencia;
  Fdanfe_HorariodeVerao := source.danfe_HorariodeVerao;
  Fdanfe_FusoHorario := source.danfe_FusoHorario;
  Fdanfe_UsaHorarioDF := source.danfe_UsaHorarioDF;
  Fproxy_Host := source.proxy_Host;
  Fproxy_Porta := source.proxy_Porta;
  Fproxy_User := source.proxy_User;
  Fproxy_Pass := source.proxy_Pass;
  Fdanfe_mdeautomatico:=Source.Fdanfe_mdeautomatico;

end;

{ ------------------------------------------------------------------------------ }
constructor TEmpresa.create(cnpj: string; cod_loja: string = '');
var
  dao: TDaoEmpresa;
  tmpEmpresa: TEmpresa;
begin
  contigencia := 0;
  Web_Ambiente := 'H';
  if cnpj <> '' then
  begin
    try

      dao := TDaoEmpresa.create;
      tmpEmpresa := dao.getEmpresa(cnpj);
      cloneEmpresa(tmpEmpresa);
    finally
      FreeAndNil(tmpEmpresa);
      FreeAndNil(dao);
    end;
  end;

end;

{ ------------------------------------------------------------------------------ }
end.

unit Resources.empresa;

interface

uses
  System.Classes,
  WK.Server.Attributes,
  System.Generics.Collections,
  WK.Server.ResourceBaseClass;

type

  [Resource('empresa')]
  [Table('empresa')]

  TEmpresa = class(TResourceBaseClass)
  private

  protected
    procedure ValidateBusiness(List: TObjectList<TObject>); override;
  public
    [DBField('ID', True, True, false, PrimaryKey)]
    [AutoInc('empresa_id_seq')]
    Id: Integer;
    [DBField('CNPJ', True, True, True, null)]
    Cnpj: String;
    [DBField('RAZAO_SOCIAL', True, True, True, null)]
    RazaoSocial: String;
    [DBField('ENDERECO', True, True, True, null)]
    Endereco: String;
    [DBField('BAIRRO', True, True, True, null)]
    Bairro: String;
    [DBField('MUNICIPIO', True, True, True, null)]
    Municipio: String;
    [DBField('CODIGO_MUNICIPIO', True, True, True, null)]
    CodigoMunicipio: String;
    [DBField('COMPLEMENTO', True, True, True, null)]
    Complemento: String;
    [DBField('NUMERO', True, True, True, null)]
    Numero: String;
    [DBField('UF', True, True, True, null)]
    Uf: String;
    [DBField('FONE', True, True, True, null)]
    Fone: String;
    [DBField('INSCRICAOMUNICIPAL', True, True, True, null)]
    Inscricaomunicipal: String;
    [DBField('INSC_ESTADUAL', True, True, True, null)]
    InscEstadual: String;
    [DBField('NOMECERTIFICADOPFX', True, True, True, null)]
    Nomecertificadopfx: String;
    [DBField('CERTIFICADOPFX', True, True, True, null)]
    Certificadopfx: String;
    [DBField('SENHAPFX', True, True, True, null)]
    Senhapfx: String;
    [DBField('VALIDADE', True, True, True, null)]
    Validade: TDateTime;
    [DBField('WEB_AMBIENTE', True, True, True, null)]
    WebAmbiente: String;
    [DBField('CONTIGENCIA', True, True, True, null)]
    Contigencia: Integer;
    [DBField('CSC', True, True, True, null)]
    Csc: String;
    [DBField('IDCSC', True, True, True, null)]
    Idcsc: String;
    [DBField('DANFE_QTDCOPIAS', True, True, True, null)]
    DanfeQtdcopias: Integer;
    [DBField('DANFE_QTDCOPNFCE', True, True, True, null)]
    DanfeQtdcopnfce: Integer;
    [DBField('DANFE_VISUALIZA', True, True, True, null)]
    DanfeVisualiza: String;
    [DBField('DANFE_IMPORTATXT', True, True, True, null)]
    DanfeImportatxt: String;
    [DBField('DANFE_LOGOMARCA', True, True, True, null)]
    DanfeLogomarca: String;
    [DBField('DANFE_IMPNFE', True, True, True, null)]
    DanfeImpnfe: String;
    [DBField('DANFE_IMPNFCE', True, True, True, null)]
    DanfeImpnfce: String;
    [DBField('DANFE_EXIBEFATURA', True, True, True, null)]
    DanfeExibefatura: String;
    [DBField('DANFE_EXPANDILOGO', True, True, True, null)]
    DanfeExpandilogo: String;
    [DBField('DANFE_TIPODANF', True, True, True, null)]
    DanfeTipodanf: Integer;
    [DBField('DANFE_TIPODANFCE', True, True, True, null)]
    DanfeTipodanfce: Integer;
    [DBField('DANFE_EDEMAIL', True, True, True, null)]
    DanfeEdemail: String;
    [DBField('DANFE_FORSAI', True, True, True, null)]
    DanfeForsai: String;
    [DBField('EMAIL_NEEMAIL', True, True, True, null)]
    EmailNeemail: String;
    [DBField('EMAIL_HOST', True, True, True, null)]
    EmailHost: String;
    [DBField('EMAIL_PORT', True, True, True, null)]
    EmailPort: Integer;
    [DBField('EMAIL_USER', True, True, True, null)]
    EmailUser: String;
    [DBField('EMAIL_PASS', True, True, True, null)]
    EmailPass: String;
    [DBField('EMAIL_SSL', True, True, True, null)]
    EmailSsl: String;
    [DBField('EMAIL_TLS', True, True, True, null)]
    EmailTls: String;
    [DBField('EMAIL_ASSUNTO', True, True, True, null)]
    EmailAssunto: String;
    [DBField('EMAIL_ASSUNTO_CANC', True, True, True, null)]
    EmailAssuntoCanc: String;
    [DBField('EMAIL_ASSUNTO_CCE', True, True, True, null)]
    EmailAssuntoCce: String;
    [DBField('EMAIL_CC', True, True, True, null)]
    EmailCc: String;
    [DBField('EMAIL_MENSAGEM', True, True, True, null)]
    EmailMensagem: String;
    [DBField('OUTROS_DTINI', True, True, True, null)]
    OutrosDtini: String;
    [DBField('RT_IDCSRT', True, True, True, null)]
    RtIdcsrt: String;
    [DBField('RT_CSRT', True, True, True, null)]
    RtCsrt: String;
    [DBField('RT_CNPJ', True, True, True, null)]
    RtCnpj: String;
    [DBField('RT_XCONTATO', True, True, True, null)]
    RtXcontato: String;
    [DBField('RT_EMAIL', True, True, True, null)]
    RtEmail: String;
    [DBField('RT_FONE', True, True, True, null)]
    RtFone: String;
    [DBField('USAFSDA', True, True, True, null)]
    Usafsda: String;
    [DBField('CODIGO_LOJA', True, True, True, null)]
    CodigoLoja: String;
    [DBField('DANFE_LOGOMARCAARQUIVO', True, True, True, null)]
    DanfeLogomarcaarquivo: String;
    [DBField('DANFE_HORARIODEVERAO', True, True, True, null)]
    DanfeHorariodeverao: String;
    [DBField('DANFE_FUSOHORARIO', True, True, True, null)]
    DanfeFusohorario: String;
    [DBField('DANFE_USAHORARIODF', True, True, True, null)]
    DanfeUsahorariodf: String;
    [DBField('PROXY_HOST', True, True, True, null)]
    ProxyHost: String;
    [DBField('PROXY_PORTA', True, True, True, null)]
    ProxyPorta: String;
    [DBField('PROXY_USER', True, True, True, null)]
    ProxyUser: String;
    [DBField('PROXY_PASS', True, True, True, null)]
    ProxyPass: String;
    [DBField('RT_UFEXIGE', True, True, True, null)]
    RtUfexige: String;
    [DBField('DANFE_MDEAUTOMATICO', True, True, True, null)]
    DanfeMdeautomatico: String;
    [DBField('NSU_SEQUENCIA,NSU_DATA_CONSULTA', True, True, True, null)]
    NsuDataconsulta: TDateTime;
    [DBField('NSU_SEQUENCIA', True, True, True, null)]
    NsuSequencia: double;

  end;

implementation

{ TEmpresa }
procedure TEmpresa.ValidateBusiness(List: TObjectList<TObject>);
begin
end;

initialization

RegisterClass(TEmpresa);

end.

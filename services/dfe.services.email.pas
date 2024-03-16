unit dfe.services.email;

interface

uses
  classes,
  windows,
  pcnEventoNFe,
  REST.Json,
  System.Json,
  dateUtils,
  SysUtils,
  inifiles,
  System.NetEncoding,
  math,
  blcksock,
  ACBrDFeUtil,

  XSBuiltIns,
  Variants,
  activex,
  ACBrNFe,
  pcnConversao,
  pcnConversaoNFe,
  ACBrUtil,
  pcnNFeW,
  pcnNFeRTXT,
  pcnAuxiliar,

  XMLIntf,
  syncobjs,

  XMLDoc,
  ACBrDFeReport,
  ACBrMail,
  ACBrNFeNotasFiscais,
  ACBrDFeDANFeReport,
  ACBrDANFCeFortesFr,
  ACBrNFeDANFEClass,
  ACBrNFeDANFeRLClass,
  dfe.lib.util,

  dfe.model.empresa,
  dfe.dao.empresa,
  dfe.dao.log,
  dfe.dao.nfe,

  dfe.model.nfe;

type
  TenvioEmail = class(TThread)
  private
    copias: Tstrings;
    Fdestinatario: string;
    mensagem: Tstrings;
    FemailCopia: String;
    Fanexos: TstringList;
    Facbr: TACBrNFe;
    FacbrMail: TACBrMail;
    FtmpCopia: string;
    Fcnpj: string;
    Fnota: Tnota;
    FtipoEmail: string;
    Fempresa: Tempresa;
    FemailMensagen: string;
    FemailTransp: string;
    procedure getEmailCC;
    procedure setAcbrMail;

    function getServiceID: string;
    function getDestinatario(): string;
    function getAssunto: string;
    procedure setEmpresa();
  public

    procedure Execute; override;
    destructor destroy; override;
    constructor create(suspend: Boolean);

  published

    property anexos: TstringList read Fanexos write Fanexos;
    property cnpj: string read Fcnpj write Fcnpj;
    property emailTransp: string read FemailTransp write FemailTransp;
    property emailCopia: string read FemailCopia write FemailCopia;
    property tipoEmail: string read FtipoEmail write FtipoEmail;
    property nota: Tnota read Fnota write Fnota;
    property destinatario: String read Fdestinatario write Fdestinatario;
  end;

implementation

{ TenvioEmail }
function TenvioEmail.getServiceID: string;
begin
  result := '[ENVIO-EMAIL PID ' + IntToStr(HInstance) + ' ] ';
end;

{ ----------------------------------------------------------------------------- }
procedure TenvioEmail.setAcbrMail;

begin
  gravalog(getServiceID + ' Configurando componente e-mail nota Numero: ' +
    IntToStr(Fnota.numero) + ' Serie: ' + IntToStr(Fnota.serie) + ' Cnpj ' +
    Fnota.cnpj + ' Host  ' + Fempresa.email_host + ' - port:  ' +
    IntToStr(Fempresa.email_port) + ' user:' + Fempresa.email_user + ' senha:' +
    Fempresa.email_pass + 'SSL: ' + Fempresa.email_ssl + ' TLS:' +
    Fempresa.email_tls, Fnota.cnpj);
  try
    Facbr.SSL.SSLType := LT_SSLv3;
    FacbrMail.IsHTML := True;
    FacbrMail.Host := Fempresa.email_host;

    FacbrMail.Port := IntToStr(Fempresa.email_port);
    FacbrMail.Username := Fempresa.email_user;
    FacbrMail.Password := Fempresa.email_pass;
    FacbrMail.From := Fempresa.email_user;
    FacbrMail.SetTLS := False;
    FacbrMail.SetSSL := False;
    if Fempresa.email_ssl = 'S' then
      FacbrMail.SetSSL := True;
    If Fempresa.email_tls = 'S' then
      FacbrMail.SetTLS := True;
    FacbrMail.ReadingConfirmation := False;
    FacbrMail.UseThread := False;
    FacbrMail.FromName := Fempresa.email_user;
    Facbr.MAIL := FacbrMail;
    TACBrNFe(Facbr.NotasFiscais.ACBrNFe).MAIL := FacbrMail;

  except
    on e: exception do
    begin
      gravalog(getServiceID +
        ' Erro Configurando componente e-mail nota Numero: ' +
        IntToStr(Fnota.numero) + ' Serie: ' + IntToStr(Fnota.serie) + ' Cnpj ' +
        Fnota.cnpj + ' Erro : ' + e.Message, Fnota.cnpj);
    end;

  end;
end;
{ ----------------------------------------------------------------------------- }

function TenvioEmail.getAssunto: string;
begin
  result := Fempresa.email_assunto;
  FemailMensagen := Fempresa.email_Mensagem;
  if uppercase(FtipoEmail) = 'CANCELAMENTO' then
  begin
    result := Fempresa.email_assunto_canc;
    FemailMensagen := 'Cancelamento ref a NFe: ' + Fnota.chave;
  end
  else if uppercase(FtipoEmail) = 'CCE' then
  begin
    result := Fempresa.email_assunto_cce;
    FemailMensagen := 'Carta de Correção ref a NFe: ' + Fnota.chave;
  end;

end;

{ ----------------------------------------------------------------------------- }
function TenvioEmail.getDestinatario: string;
var
  vC: Integer;
  vP: string;
  i: Integer;
begin
  vC := 0;
  vP := '';
  result := '';
  result := Fdestinatario;
  gravalog(getServiceID + ' Enviando e-mail nota Numero: ' +
    IntToStr(Fnota.numero) + ' Serie: ' + IntToStr(Fnota.serie) + ' Cnpj ' +
    Fnota.cnpj, Fnota.cnpj);
  emailCopia := '';
  for i := 1 to (length(result) + 1) do
  begin
    if (result[i] = ',') or (result[i] = ';') or (i = length(result) + 1) then
    begin

      if vC > 0 then
        copias.Add(Trim(emailCopia))
      else
        vP := Trim(emailCopia);

      emailCopia := '';
      inc(vC);

    end
    else
      emailCopia := (emailCopia + result[i]);

  end;
  result := vP;
end;

{ ----------------------------------------------------------------------------- }
procedure TenvioEmail.getEmailCC;
var
  index: Integer;
begin
  if (Trim(Fempresa.email_cc) <> '') then
  begin
    for index := 1 to (length(Fempresa.email_cc) + 1) do
    begin
      if (Fempresa.email_cc[index] = ',') or (Fempresa.email_cc[index] = ';') or
        (index = length(Fempresa.email_cc) + 1) then
      begin
        copias.Add(Trim(emailCopia));
        emailCopia := '';

      end
      else
        emailCopia := (emailCopia + Fempresa.email_cc[index]);

    end;
    if emailCopia <> '' then
      copias.Add(emailCopia);
  end;
end;

{ ----------------------------------------------------------------------------- }
constructor TenvioEmail.create(suspend: Boolean);
begin
  Fnota := Tnota.create;
  Facbr := TACBrNFe.create(nil);
  Fanexos := TstringList.create;
  FacbrMail := TACBrMail.create(Facbr);
  mensagem := TstringList.create;
  copias := TstringList.create;

  inherited;
end;

{ ----------------------------------------------------------------------------- }
destructor TenvioEmail.destroy;
begin
  if Assigned(Facbr) then
    FreeAndNil(Facbr);
  if Assigned(Fempresa) then
    FreeAndNil(Fempresa);
  if Assigned(Fnota) then
    FreeAndNil(Fnota);
  if Assigned(Fanexos) then
    FreeAndNil(Fanexos);
  if Assigned(copias) then
    FreeAndNil(copias);
  if Assigned(mensagem) then
    FreeAndNil(mensagem);
  inherited;
end;

{ ----------------------------------------------------------------------------- }
procedure TenvioEmail.setEmpresa();
var
  daoEmpresa: TDaoEmpresa;
  schave: string;
begin
  schave := OnlyNumber(Fnota.chave);
  Fnota.numero := strtoint(copy(schave, 26, 9));
  Fnota.serie := strtoint(copy(schave, 23, 3));
  Fnota.cnpj := copy(schave, 7, 14);
  if Fcnpj = '' then
    Fcnpj := Fnota.cnpj;
  daoEmpresa := TDaoEmpresa.create;
  try
    Fempresa := daoEmpresa.getEmpresaCnpj(Fcnpj);
  finally
    FreeAndNil(daoEmpresa);
  end;
end;

{ ----------------------------------------------------------------------------- }
procedure TenvioEmail.Execute;

begin
  setEmpresa;
  setAcbrMail();
  copias.Clear;
  try
    getAssunto();
    mensagem.Add(FemailMensagen);
    getEmailCC;
    gravalog(getServiceID + 'Email da transportadora informado' + FemailTransp,
      Fnota.cnpj);

    if FemailTransp <> '' then
      copias.Add(FemailTransp);
    if copias.Count > 0 then
      Facbr.enviarEmail(getDestinatario, getAssunto + ' - Nº ' +
        IntToStr(Fnota.numero) + ' Protocolo: ' + Fnota.protocolo, mensagem,
        copias, anexos, nil, '', nil)
    else
      Facbr.enviarEmail(getDestinatario, getAssunto + ' - Nº ' +
        IntToStr(Fnota.numero), mensagem, nil, anexos, nil, '', nil);

    gravalog(getServiceID + 'Sucesso Envio de e-mail ' + IntToStr(Fnota.numero)
      + ' Serie: ' + IntToStr(Fnota.serie) + ' Cnpj ' + Fnota.cnpj, Fnota.cnpj);

  except
    on e: exception do
      gravalog(getServiceID + 'Erro ao enviar email nota ' +
        IntToStr(Fnota.numero) + #13#10 + e.Message, Fnota.cnpj);
  end;

end;

{ ----------------------------------------------------------------------------- }
end.

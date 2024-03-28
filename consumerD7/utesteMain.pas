unit utesteMain;
{ -----------------------------------------------------------------------------
  _ _                   _             _____  _____  _____  _____
  (_) |                 | |           / __  \|  _  |/ __  \|____ |
  __      ___| |___  ___  _ __   | |_   _ ____ `' / /'| |/' |`' / /'    / /
  \ \ /\ / / | / __|/ _ \| '_ \  | | | | |_  /   / /  |  /| |  / /      \ \
  \ V  V /| | \__ \ (_) | | | | | | |_| |/ /  ./ /___\ |_/ /./ /___.___/ /
  \_/\_/ |_|_|___/\___/|_| |_| |_|\__,_/___| \_____/ \___/ \_____/\____/

  ® wilson santa luz 2003
  ---------------------------------------------------------------------------- }

interface

uses
  Windows,
  Messages,
  SysUtils,
  System.NetEncoding,
  Variants,
  Classes,
  json,
  Graphics,
  Controls,
  ShellApi,
  Forms,
  Dialogs,
  StdCtrls,
  ACBrBase,
  ACBrDFe,
  ACBrNFe,

  ExtCtrls, Buttons;

type
  Tfmain = class(TForm)
    GroupBox2: TGroupBox;
    memoLog: TMemo;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox3: TGroupBox;
    btEnviarNota: TSpeedButton;
    edtNumeroNota: TEdit;
    edtNota: TLabel;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    btInu: TSpeedButton;
    edtINiInut: TEdit;
    edtFinalInut: TEdit;
    Button1: TSpeedButton;
    rdTipoNota: TRadioGroup;
    GroupBox5: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edtNotaCancelemento: TEdit;
    edtSerieCancelamento: TEdit;
    btCancelar: TSpeedButton;
    Label5: TLabel;
    edtModeloCancelamento: TEdit;
    Label6: TLabel;
    edtAnoCancelamento: TEdit;
    edtJustificativaCancelamento: TEdit;
    edtProtocoloCancelamento: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    edtSerieInut: TEdit;
    edtModeloInut: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    edtAnoInut: TEdit;
    Label11: TLabel;
    edtJustInut: TEdit;
    Label12: TLabel;
    edtChave: TEdit;
    Label13: TLabel;
    GroupBox6: TGroupBox;
    Label19: TLabel;
    btnCartaCorrecao: TSpeedButton;
    edtcorecao: TEdit;
    edtChaveCarta: TEdit;
    Label14: TLabel;
    GroupBox7: TGroupBox;
    Label16: TLabel;
    btManifesto: TSpeedButton;
    edtChaveManifesto: TEdit;
    edtJustManifesto: TEdit;
    Label15: TLabel;
    rtTiposManifesto: TRadioGroup;
    edtCnpj: TEdit;
    Label17: TLabel;
    edtSerieNota: TEdit;
    Label18: TLabel;
    procedure btEnviarNotaClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btInuClick(Sender: TObject);
    procedure btManifestoClick(Sender: TObject);
    procedure btnCartaCorrecaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCnpjExit(Sender: TObject);
  private
    FnumeroNota: string;
    Fcnpj: string;
    FSerieNota: string;
    FxmlNfe: string;

    procedure ImprimirDanfeRetornado(danfeBase64, name: string);
    procedure setRespostaEnvioApi(Fjson: TjsonObject);
    procedure gerarCancelamento;
    procedure gerarValidacao;
    procedure gerarInutilizacao;
    procedure gerarCartaCorrecao;
    procedure gerarManifesto;
    function GetJsonValue(value: string; pjson: TjsonObject): string;

  public
    { Public declarations }
  end;

var
  fmain: Tfmain;
  _cnpj: string;

const
  _ie = '153257717';

implementation

uses
  synacode,
  consumerApi;
{$R *.dfm}

{ ------------------------------------------------------------------------------ }
function RemoveSpecialChars(const str: string): string;
const
  InvalidChars: set of char = [',', '.', '/', '!', '@', '#', '$', '%', '^', '&',
    '*', '''', '"', ';', '_', '(', ')', ':', '|', '[', ']'];
var
  i, Count: Integer;
begin
  SetLength(Result, Length(str));
  Count := 0;
  for i := 1 to Length(str) do
    if not(str[i] in InvalidChars) then
    begin
      inc(Count);
      Result[Count] := str[i];
    end;
  SetLength(Result, Count);
end;

function StrippedOfNonAscii(const s: string): string;
var
  i, Count: Integer;
begin
  SetLength(Result, Length(s));
  Count := 0;
  for i := 1 to Length(s) do
  begin
    if ((s[i] >= #32) and (s[i] <= #127)) or (s[i] in [#10, #13]) then
    begin
      inc(Count);
      Result[Count] := s[i];
    end;
  end;
  SetLength(Result, Count);
end;

Procedure DecodeFile(const base64: String; const FileName: string);
var
  stream: TBytesStream;
begin
  stream := TBytesStream.Create(TNetEncoding.base64.DecodeStringToBytes
    (base64));
  try
    stream.SaveToFile(FileName);
  finally
    stream.Free;
  end;
end;

procedure Tfmain.ImprimirDanfeRetornado(danfeBase64, name: string);
var
  stream: TBytesStream;
  FileName: string;
begin
  FileName := ExtractFilePath(GetModuleName(HInstance)) + name;
  if danfeBase64 <> '' then
  begin
    stream := TBytesStream.Create(TNetEncoding.base64.DecodeStringToBytes
      (danfeBase64));
    try
      stream.SaveToFile(FileName);

    finally
      stream.Free;
    end;
    ShellExecute(Handle, nil, PChar(FileName), nil, nil, SW_SHOWNORMAL);
  end;

end;
{ ------------------------------------------------------------------------------ }

procedure Tfmain.btEnviarNotaClick(Sender: TObject);
begin
  gerarValidacao();
end;
{ ------------------------------------------------------------------------------ }

procedure Tfmain.Button1Click(Sender: TObject);
begin
  self.Close;
end;

procedure Tfmain.edtCnpjExit(Sender: TObject);
begin
  _cnpj := edtCnpj.Text;
end;

procedure Tfmain.FormShow(Sender: TObject);
begin
  _cnpj := edtCnpj.Text;
end;

{ ------------------------------------------------------------------------------ }
function Tfmain.GetJsonValue(value: string; pjson: TjsonObject): string;
var
  Lresult: string;
  Ljson: TjsonObject;
begin
  Result := '';
  try
    Ljson := TjsonObject.ParseJSONValue(uppercase(pjson.ToString))
      as TjsonObject;
    if Ljson.TryGetValue(uppercase(value), Lresult) then
      Result := Lresult;
  finally
    FreeAndNil(Ljson);
  end;
end;

procedure Tfmain.setRespostaEnvioApi(Fjson: TjsonObject);
var
  xmlRetorno: string;
  xmlEvento: string;
  ldanfe: string;
  xmlProcessado: string;
  lvalue: string;
  s: string;
begin
  if assigned(Fjson) then
  begin
    memoLog.Lines.clear;
    memoLog.Lines.Add('------- Resposta recebida do servidor API -------');
    Fjson.TryGetValue('cnpj', lvalue);
    memoLog.Lines.Add('Cnpj -----------: ' + lvalue);
    memoLog.Lines.Add('Erro -----------: ' + GetJsonValue('error', Fjson));
    Fjson.TryGetValue('xmotivo', lvalue);

    memoLog.Lines.Add('xmotivo -----------: ' + lvalue);
    try
      Fjson.TryGetValue('cstat', lvalue);
      memoLog.Lines.Add('cstat -------------: ' + lvalue);
      s := Fjson.ToString;
    except
      s := Fjson.ToString;
      s := '';
    end;
    Fjson.TryGetValue('digito', lvalue);
    memoLog.Lines.Add('digito ------------: ' + lvalue);
    Fjson.TryGetValue('protocolo', lvalue);
    memoLog.Lines.Add('protocolo ---------: ' + lvalue);
    edtProtocoloCancelamento.Text := lvalue;
    Fjson.TryGetValue('chave', lvalue);

    edtChave.Text := lvalue;
    memoLog.Lines.Add('chave ---------: ' + lvalue);
    Fjson.TryGetValue('digito', lvalue);
    memoLog.Lines.Add('digito ------------: ' + lvalue);

    Fjson.TryGetValue('xmlRetorno', xmlRetorno);
    xmlRetorno := DecodeBase64(xmlRetorno);
    memoLog.Lines.Add('xmlRetorno ------: ' + xmlRetorno);
    ldanfe := '';
    Fjson.TryGetValue('danfeBase64', ldanfe);
    if ldanfe <> '' then

      ImprimirDanfeRetornado(ldanfe, 'danfeNota' + FnumeroNota + '.pdf');

  end;
end;

procedure Tfmain.btCancelarClick(Sender: TObject);
begin
  gerarCancelamento();
end;
{ ----------------------------------------------------------------------------- }

procedure Tfmain.gerarCancelamento;
var
  api: Tconsumer;
  jresponse: TjsonObject;
begin
  memoLog.Lines.clear;
  memoLog.Lines.Add('Aguarde enviando canelamento....');
  FnumeroNota := edtNumeroNota.Text;
  api := Tconsumer.Create;
  try
    if rdTipoNota.ItemIndex = 1 then
      api.tipoNota := 55
    else
      api.tipoNota := 65;
    api.cnpjEmitente := _cnpj;
    jresponse := api.cancelarNota(edtNotaCancelemento.Text,
      edtSerieCancelamento.Text, edtModeloCancelamento.Text,
      edtAnoCancelamento.Text, edtJustificativaCancelamento.Text,
      edtProtocoloCancelamento.Text, edtChave.Text);
    setRespostaEnvioApi(jresponse);
  finally
    FreeAndNil(api);
  end;

end;
{ ----------------------------------------------------------------------------- }

procedure Tfmain.gerarValidacao;
var
  api: Tconsumer;
  jresponse: TjsonObject;
begin
  // INVOCAR A APICONSUMER QUE FARA A COMUNICAÇÃO COM A API
  memoLog.Lines.clear;
  memoLog.Lines.Add('Aguarde enviando nota para validação....');
  FnumeroNota := edtNumeroNota.Text;
  FSerieNota := edtSerieNota.Text;
  api := Tconsumer.Create;
  try
    if rdTipoNota.ItemIndex = 1 then
      api.tipoNota := 55
    else
      api.tipoNota := 65;
    // FIXO PARA TESTES
    api.cnpjEmitente := _cnpj;

    jresponse := api.enviarNota(FnumeroNota, edtSerieNota.Text);
    setRespostaEnvioApi(jresponse);
  finally
    FreeAndNil(api);
  end;
end;

procedure Tfmain.btInuClick(Sender: TObject);
begin
  gerarInutilizacao();
end;
{ ----------------------------------------------------------------------------- }

procedure Tfmain.gerarCartaCorrecao;
var
  api: Tconsumer;
  jresponse: TjsonObject;
begin
  memoLog.Lines.clear;
  memoLog.Lines.Add('Aguarde enviando carta de correçao....');
  FnumeroNota := edtNumeroNota.Text;
  api := Tconsumer.Create;
  try
    if rdTipoNota.ItemIndex = 1 then
      api.tipoNota := 55
    else
      api.tipoNota := 65;
    api.cnpjEmitente := _cnpj;
    jresponse := api.cartaCorrecao(edtChaveCarta.Text, edtcorecao.Text, '1');
    setRespostaEnvioApi(jresponse);
  finally
    FreeAndNil(api);
  end;

end;
{ ----------------------------------------------------------------------------- }

procedure Tfmain.gerarInutilizacao;
var
  api: Tconsumer;
  jresponse: TjsonObject;
begin
  memoLog.Lines.clear;
  memoLog.Lines.Add('Aguarde enviando inutilizacao....');
  FnumeroNota := edtNumeroNota.Text;
  api := Tconsumer.Create;
  try
    api.cnpjEmitente := _cnpj;
    jresponse := api.inutilizar(edtINiInut.Text, edtFinalInut.Text,
      edtSerieInut.Text, edtJustInut.Text, edtModeloInut.Text, edtAnoInut.Text);
    setRespostaEnvioApi(jresponse);
  finally
    FreeAndNil(api);
  end;
end;
{ ----------------------------------------------------------------------------- }

procedure Tfmain.btManifestoClick(Sender: TObject);
begin
  gerarManifesto;
end;

procedure Tfmain.gerarManifesto;
var
  api: Tconsumer;
  jresponse: TjsonObject;
begin
  memoLog.Lines.clear;
  memoLog.Lines.Add('Aguarde enviando manifesto....');
  FnumeroNota := edtNumeroNota.Text;
  api := Tconsumer.Create;
  try
    if rdTipoNota.ItemIndex = 1 then
      api.tipoNota := 55
    else
      api.tipoNota := 65;
    api.cnpjEmitente := _cnpj;
    jresponse := api.manifesto(edtChaveManifesto.Text, edtJustManifesto.Text,
      rtTiposManifesto.ItemIndex, 1);
    setRespostaEnvioApi(jresponse);
  finally
    FreeAndNil(api);
  end;
end;
{ ----------------------------------------------------------------------------- }

procedure Tfmain.btnCartaCorrecaoClick(Sender: TObject);
begin
  gerarCartaCorrecao;
end;
{ ----------------------------------------------------------------------------- }

end.

unit utesteMain;
{-----------------------------------------------------------------------------
          _ _                   _             _____  _____  _____  _____
         (_) |                 | |           / __  \|  _  |/ __  \|____ |
__      ___| |___  ___  _ __   | |_   _ ____ `' / /'| |/' |`' / /'    / /
\ \ /\ / / | / __|/ _ \| '_ \  | | | | |_  /   / /  |  /| |  / /      \ \
 \ V  V /| | \__ \ (_) | | | | | | |_| |/ /  ./ /___\ |_/ /./ /___.___/ /
  \_/\_/ |_|_|___/\___/|_| |_| |_|\__,_/___| \_____/ \___/ \_____/\____/

  ® wilson santa luz 2003
 ----------------------------------------------------------------------------}

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  ShellApi,
  Forms,
  Dialogs,
  StdCtrls,
  ACBrBase,
  ACBrDFe,
  ACBrNFe,
  uLkJSON,
  ExtCtrls, Buttons
  ;

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
    procedure btEnviarNotaClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btInuClick(Sender: TObject);
    procedure btManifestoClick(Sender: TObject);
    procedure btnCartaCorrecaoClick(Sender: TObject);
  private
    FnumeroNota: string;
    Fcnpj: string;
    FxmlNfe: string;


    procedure ImprimirDanfeRetornado(danfeBase64, name: string);
    procedure setRespostaEnvioApi(json: TlkJSONbase);
    procedure gerarCancelamento;
    procedure gerarValidacao;
    procedure gerarInutilizacao;
    procedure gerarCartaCorrecao;
    procedure gerarManifesto;

  public
    { Public declarations }
  end;

var
  fmain: Tfmain;
 const _cnpj ='13100071000108';
 const _ie ='153257717';
implementation
uses
  synacode,
  consumerApi;
{$R *.dfm}
{------------------------------------------------------------------------------}

procedure Tfmain.ImprimirDanfeRetornado(danfeBase64, name: string);
var
  outfile: TFileStream;
  sfile: string;
  strDecoded: string;
begin
  if danfeBase64 <> '' then
  begin
    sfile := ExtractFilePath(GetModuleName(HInstance)) + name;
    strDecoded := DecodeBase64(danfeBase64);
    outfile := TFileStream.Create(sfile, fmCreate or fmOpenRead);
    try
      outfile.WriteBuffer(Pointer(strDecoded)^, Length(strDecoded));
      FreeAndNil(outfile);
      ShellExecute(Handle, nil, PChar(sfile), nil, nil, SW_SHOWNORMAL);
    finally
      FreeAndNil(outfile);
    end;
  end;
end;
{------------------------------------------------------------------------------}

procedure Tfmain.btEnviarNotaClick(Sender: TObject);
begin
  gerarValidacao();
end;
{------------------------------------------------------------------------------}

procedure Tfmain.Button1Click(Sender: TObject);
begin
  self.Close;
end;
{------------------------------------------------------------------------------}

procedure Tfmain.setRespostaEnvioApi(json: TlkJSONbase);
var
  xmlRetorno: string;
  xmlEvento: string;
begin
  if assigned(json) then
  begin
    memoLog.Lines.clear;
    memoLog.Lines.Add('------- Resposta recebida do servidor API -------');
    if (assigned(json.Field['error']) and (json.Field['error'].value <> '')) then
      memoLog.Lines.add('Erro -----------: ' + json.Field['error'].value);

    if assigned(json.Field['xmotivo']) then
      memoLog.Lines.add('xmotivo -----------: ' + json.Field['xmotivo'].value);

    if assigned(json.Field['cstat']) then
      memoLog.Lines.add('cstat -------------: ' + json.Field['cstat'].value);


    if (assigned(json.Field['digito']) and (json.Field['digito'].value <> '')) then
      memoLog.Lines.add('digito ------------: ' + json.Field['digito'].value);

    if (assigned(json.Field['protocolo']) and (json.Field['protocolo'].value <> '')) then
    begin
      memoLog.Lines.add('protocolo ---------: ' + json.Field['protocolo'].value);
      edtProtocoloCancelamento.Text := json.Field['protocolo'].value;
      if assigned(json.Field['chave']) then
        edtChave.Text := json.Field['chave'].value;

    end;
    if (assigned(json.Field['chave']) and (json.Field['chave'].value <> '')) then
    begin
      memoLog.Lines.add('chave ---------: ' + json.Field['chave'].value);
      edtChave.Text := json.Field['chave'].value;
    end;

    if (assigned(json.Field['digito']) and (json.Field['digito'].value <> '')) then
      memoLog.Lines.add('digito ------------: ' + json.Field['digito'].value);

    if (assigned(json.Field['danfeBase64']) and (json.Field['danfeBase64'].value <> '')) then
    begin
      ImprimirDanfeRetornado(json.Field['danfeBase64'].value, 'danfeNota' + FnumeroNota + '.pdf');
    end;

    if (assigned(json.Field['xmlRetorno']) and (json.Field['xmlRetorno'].value <> '')) then
    begin
      xmlRetorno := DecodeBase64(json.Field['xmlRetorno'].value);
      memoLog.Lines.add('xmlRetorno ------: ' + xmlRetorno);
    end;

    if (assigned(json.Field['xmlEvento']) and (json.Field['xmlEvento'].value <> '')) then
    begin
      xmlEvento := DecodeBase64(json.Field['xmlEvento'].value);
      memoLog.Lines.add('xmlEvento ------: ' + xmlEvento);
    end;

    if (assigned(json.Field['xmlProcesado']) and (json.Field['xmlProcesado'].value <> '')) then
    begin

      memoLog.Lines.add('xmlNota---------: ' + DecodeBase64(json.Field['xmlProcesado'].value))
    end;
  end;
end;
{-----------------------------------------------------------------------------}

procedure Tfmain.btCancelarClick(Sender: TObject);
begin
  gerarCancelamento();
end;
{-----------------------------------------------------------------------------}

procedure Tfmain.gerarCancelamento;
var
  api: Tconsumer;
  jresponse: TlkJSONbase;
begin
  memoLog.Lines.Clear;
  memoLog.Lines.Add('Aguarde enviando canelamento....');
  FnumeroNota := edtNumeroNota.text;
  api := Tconsumer.Create;
  try
    if rdTipoNota.ItemIndex = 1 then
      api.tipoNota := 55
    else
      api.tipoNota := 65;
    api.cnpjEmitente := _cnpj;
    jresponse := api.cancelarNota(edtNotaCancelemento.Text,
      edtSerieCancelamento.text,
      edtModeloCancelamento.text,
      edtAnoCancelamento.text,
      edtJustificativaCancelamento.Text,
      edtProtocoloCancelamento.Text,
      edtChave.Text
      );
    setRespostaEnvioApi(jresponse);
  finally
    FreeAndNil(api);
  end;

end;
{-----------------------------------------------------------------------------}

procedure Tfmain.gerarValidacao;
var
  api: Tconsumer;
  jresponse: TlkJSONbase;
begin
  //INVOCAR A APICONSUMER QUE FARA A COMUNICAÇÃO COM A API
  memoLog.Lines.Clear;
  memoLog.Lines.Add('Aguarde enviando nota para validação....');
  FnumeroNota := edtNumeroNota.text;
  api := Tconsumer.Create;
  try
    if rdTipoNota.ItemIndex = 1 then
      api.tipoNota := 55
    else
      api.tipoNota := 65;
        //FIXO PARA TESTES
    api.cnpjEmitente := _cnpj;

    jresponse := api.enviarNota(FnumeroNota);
    setRespostaEnvioApi(jresponse);
  finally
    FreeAndNil(api);
  end;
end;

procedure Tfmain.btInuClick(Sender: TObject);
begin
  gerarInutilizacao();
end;
{-----------------------------------------------------------------------------}

procedure Tfmain.gerarCartaCorrecao;
var
  api: Tconsumer;
  jresponse: TlkJSONbase;
begin
  memoLog.Lines.Clear;
  memoLog.Lines.Add('Aguarde enviando carta de correçao....');
  FnumeroNota := edtNumeroNota.text;
  api := Tconsumer.Create;
  try
    if rdTipoNota.ItemIndex = 1 then
      api.tipoNota := 55
    else
      api.tipoNota := 65;
    api.cnpjEmitente := _cnpj;
    jresponse := api.cartaCorrecao(edtChaveCarta.Text, edtcorecao.text, '1');
    setRespostaEnvioApi(jresponse);
  finally
    FreeAndNil(api);
  end;

end;
{-----------------------------------------------------------------------------}

procedure Tfmain.gerarInutilizacao;
var
  api: Tconsumer;
  jresponse: TlkJSONbase;
begin
  memoLog.Lines.Clear;
  memoLog.Lines.Add('Aguarde enviando inutilizacao....');
  FnumeroNota := edtNumeroNota.text;
  api := Tconsumer.Create;
  try
    api.cnpjEmitente := _cnpj;
    jresponse := api.inutilizar(edtINiInut.Text,
      edtFinalInut.text,
      edtSerieInut.text,
      edtJustInut.text,
      edtModeloInut.text,
      edtAnoInut.Text
      );
    setRespostaEnvioApi(jresponse);
  finally
    FreeAndNil(api);
  end;
end;
{-----------------------------------------------------------------------------}

procedure Tfmain.btManifestoClick(Sender: TObject);
begin
  gerarManifesto;
end;

procedure Tfmain.gerarManifesto;
var
  api: Tconsumer;
  jresponse: TlkJSONbase;
begin
  memoLog.Lines.Clear;
  memoLog.Lines.Add('Aguarde enviando manifesto....');
  FnumeroNota := edtNumeroNota.text;
  api := Tconsumer.Create;
  try
    if rdTipoNota.ItemIndex = 1 then
      api.tipoNota := 55
    else
      api.tipoNota := 65;
    api.cnpjEmitente := _cnpj;
    jresponse := api.manifesto(edtChaveManifesto.Text, edtJustManifesto.text, rtTiposManifesto.itemIndex, 1);
    setRespostaEnvioApi(jresponse);
  finally
    FreeAndNil(api);
  end;
end;
{-----------------------------------------------------------------------------}

procedure Tfmain.btnCartaCorrecaoClick(Sender: TObject);
begin
  gerarCartaCorrecao;
end;
{-----------------------------------------------------------------------------}

end.


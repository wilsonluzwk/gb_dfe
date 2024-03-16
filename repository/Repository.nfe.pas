unit Repository.nfe;

interface

uses
  System.Classes,
  WK.Server.Attributes,
  Dto.QuestorDocumento,
  Resources.Empresas,
  interfaces.CancelarNfSe,
  Resources.Parametros,
  WK.Server.Constants,
  Dto.NotaServico,
  WK.Util,
  IdGlobalProtocols,
  json,
  System.SysUtils,
  WK.Server.Connection,
  synacode,
  REST.json,
  System.Generics.Collections,
  interfaces.QuestorDocumento,
  WK.Server.MessageList,
  Web.HTTPApp,
  WK.Server.Message,
  System.Rtti,
  IdHTTP, IdSSLOpenSSL,
  StrUtils,
  Resources.documentointegracao,
  WK.BasicRepository,

  WK.Server.ResourceBaseClass;

type

  [Resource('questordocumento')]
  TQuestorDocumento = class(TBasicRepository, iQuestorDocumento)
  private
    function ProcessarDocumento(Documento: TQuestorDocumentoDto): TJSONObject;
    function GetFileType(Value: string): string;
  protected
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;

  public
    [Post]
    procedure Post(Response: TWebResponse; Dados: TJSONObject;
      AMethod: string = '');

  end;

implementation

{ ----------------------------------------------------------------------------- }

{ ----------------------------------------------------------------------------- }
function TQuestorDocumento.GetFileType(Value: string): string;
var
  i: Integer;
begin
  result := '';
  if pos('pdf', LowerCase(Value)) = 2 then
    result := 'pdf'

  else if pos('jfif', LowerCase(Value)) < 20 then
    result := 'jpg'

  else if pos('png', LowerCase(Value)) < 20 then
    result := 'png'

  else if pos('bmp', LowerCase(Value)) < 20 then
    result := 'bmp'

  else if pos('Microsoft Office Word', LowerCase(Value)) > 0 then
    result := 'doc'
  else

end;

procedure TQuestorDocumento.Post(Response: TWebResponse; Dados: TJSONObject;
  AMethod: string);
var
  LMessageType: TMessageType;
  Ldocumento: TQuestorDocumentoDto;
  LdocumentoIntegracao: TDocumentoIntegracao;
  Ljson: TJSONObject;
  LfileStrean: string;
  LfileType: string;
  i: Integer;
begin

  try
    Ldocumento := TJson.JsonToObject<TQuestorDocumentoDto>(Dados);
    ProcessarDocumento(Ldocumento);
    LMessageType := IAutorizado;
    for i := 0 to Pred(Ldocumento.Destinatarios.Count) do
    begin

      Ljson := TJSONObject.ParseJSONValue(Ldocumento.ToString) as TJSONObject;
      Ljson.RemovePair('Id');
      Ljson.RemovePair('id');
      Ljson.AddPair('IdIntegracao', Ldocumento.Id);
      Ljson.AddPair('CnpjDestinatario', Ldocumento.Destinatarios[i]
        .ClienteInscricaoFederal);
      LfileStrean := DecodeBase64(Ldocumento.Arquivo);
      LfileType := GetFileType(LfileStrean);
      Ljson.AddPair('Extensao', LfileType);
      LfileStrean:=Ljson.ToString;
      LdocumentoIntegracao := TDocumentoIntegracao.Create;
      try
        LdocumentoIntegracao.Get(Nil, 1, 50, '', '',
          '{"IdIntegracao":"' + Ldocumento.Id + '","CnpjDestinatario": "' +
          Ldocumento.Destinatarios[i].ClienteInscricaoFederal + '"}',
          '', '', Nil);
        if LdocumentoIntegracao.IdIntegracao = '' then
          LdocumentoIntegracao.Post(Nil, Ljson, Nil);
      finally
        FreeAndNil(LdocumentoIntegracao);
      end;
    end;
    LMessageType.Mensagem := 'Documento recebido:' + Ldocumento.Id + ' - ' +
      Ldocumento.Titulo;
    LMessageType.Content := Dados;
    TMessage.Create(LMessageType).SendMessage(Response);
  except
    on e: exception do
    begin

      LMessageType := EErroGeral;
      LMessageType.Mensagem := 'Erro ao converter documento recebido ' +
        e.Message;
      TMessage.Create(LMessageType).SendMessage(Response);
    end;
  end;
end;

function TQuestorDocumento.ProcessarDocumento(Documento: TQuestorDocumentoDto)
  : TJSONObject;
begin
  // *TOD DO*/

end;

function TQuestorDocumento.QueryInterface(const IID: TGUID; out Obj): HResult;
begin

end;

function TQuestorDocumento._AddRef: Integer;
begin
  Inherited;
end;

{ ----------------------------------------------------------------------------- }
function TQuestorDocumento._Release: Integer;
begin
  Inherited;
end;

{ ----------------------------------------------------------------------------- }
initialization

RegisterClass(TQuestorDocumento);

end.

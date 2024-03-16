unit WK.Server.Message;

interface

uses
  System.JSON, Web.HTTPApp;

type
  TMessageType = record
    StatusCode: Integer;
    Sucesso: Boolean;
    Mensagem: String;
    Content: TJSONObject;
  end;

  TMessage = class
  private
    FMessage: TMessageType;
  public
    function ToJson: TJSONObject;
    procedure SendMessage(Response: TWebResponse);
    constructor Create(Mensagem: TMessageType; pMessage: String = '');
  end;

implementation

uses
  Datasnap.DSHTTPWebBroker, System.SysUtils;

{ TMessage }

procedure TMessage.SendMessage(Response: TWebResponse);
var
  Content: TJSONObject;
begin
  if assigned(Response) then
  begin
    Content := ToJson;
    if FMessage.StatusCode > 9999 then
      FMessage.StatusCode:=500;
    Response.StatusCode := FMessage.StatusCode;
    Response.Content := Content.ToString;
    Response.SendResponse;
    Free;
  end;
end;

constructor TMessage.Create(Mensagem: TMessageType; pMessage: String = '');
begin
  FMessage := Mensagem;
  if pMessage <> EmptyStr then
    FMessage.Mensagem := FMessage.Mensagem + ' - ' + pMessage;
end;

function TMessage.ToJson: TJSONObject;
begin
  Result := TJSONObject.Create;
  Result.AddPair('sucesso', TJSONBool.Create(FMessage.Sucesso));
  Result.AddPair('mensagem', StringReplace(FMessage.Mensagem, '"', '''',
    [rfReplaceAll, rfIgnoreCase]));
  if FMessage.Content <> nil then
    Result.AddPair('content', FMessage.Content);
end;

end.

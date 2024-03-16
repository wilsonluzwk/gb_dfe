unit dfe.httphandler.auth;

interface

uses
  math,
  System.SysUtils,
  IdCoder3to4,
  System.JSON,
  Variants,
  Classes,
  IdCustomHTTPServer,
  IdContext,
  dfe.httpserver.base,
  dfe.lib.util,

{$IFDEF MSWINDOWS}
  Winapi.Windows,
  Winapi.Messages,
  activex,
{$ENDIF MSWINDOWS}
  IdHTTP;

type
  TAuthHttpHandler = class(THttpServerBase)
  private

    FfilterPath: string;
    procedure processRequest; override;
    procedure handlePostRequest;
  public


    procedure Login;
    constructor create; override;

  published
    property FilterPath: string read FfilterPath write FfilterPath;
  end;

implementation

uses
  nfe.controller.auth;
{ ------------------------------------------------------------------------------ }
{ TAuthHttpHandler }

procedure TAuthHttpHandler.Login;
var
  controller: TAuthController;
begin
  controller := TAuthController.create;
  try

    ResponseInfo.ContentText := controller.Login(jValue);

  finally
    FreeAndNil(controller);
  end;

end;

constructor TAuthHttpHandler.create;
begin
  OnProcessRequest := processRequest;
  FfilterPath := '/dfeapi/auth';
end;

{ ------------------------------------------------------------------------------ }


procedure TAuthHttpHandler.handlePostRequest;
begin

end;

procedure TAuthHttpHandler.processRequest;
var
  uri: string;
begin
  if not assigned(RequestInfo) then
    exit;
  try
    uri := RequestInfo.uri;
  except
  end;
  if uri = '' then
  begin
    ResponseInfo.ContentText := '{"erro":"consulta invalida"}';
    exit;
  end;
  try
    if (UpperCase(FfilterPath) = uppercase(UpperCase(uri))) or  (UpperCase(FfilterPath+'/') = uppercase(UpperCase(uri)))
    then
    begin
     gravalog('[Aaut]' + ' - Request from '+ uri,'');
      case Command of
        vrget:
          begin

          end;
        vrPut:
          begin

          end;
        vrPost:
          begin
            login
          end;

      end;
    end;

  except
    on E: Exception do
    begin
      gravalog('[E384]' + ' - ' + E.Message,'');
      raise Exception.create('Nfe - Requisiçao invalida '+e.Message);
    end;

  end;
end;

{ ------------------------------------------------------------------------------ }
end.

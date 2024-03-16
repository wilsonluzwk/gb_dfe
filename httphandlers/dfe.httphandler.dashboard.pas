unit dfe.httphandler.dashboard;

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

  nfe.controller.nfe,

{$IFDEF MSWINDOWS}
  Winapi.Windows,
  Winapi.Messages,
  activex,
{$ENDIF MSWINDOWS}
  IdHTTP;

type
  TDashBoadHttpHandler = class(THttpServerBase)
  private
    FfilterPath: string;
    procedure processrequest; override;
  public
    procedure getInfo;

    constructor create; override;

  published
    property FilterPath: string read FfilterPath write FfilterPath;
  end;

implementation

{ ------------------------------------------------------------------------------ }
{ TDashBoadHttpHandler }
constructor TDashBoadHttpHandler.create;
begin
  OnProcessRequest := processrequest;
  FfilterPath := '/dfeapi/dashboard';
end;

{ ------------------------------------------------------------------------------ }
procedure TDashBoadHttpHandler.getInfo;
var
  controller: TNnfeController;
begin
  if assigned(ResponseInfo) then
  begin
    controller := TNnfeController.create;
    try
{$IFDEF MSWINDOWS}
      CoInitialize(nil);
{$ENDIF MSWINDOWS}
      try
        // ResponseInfo.ResponseText:=  controller.getInfo;
        ResponseInfo.ContentText := controller.getInfo(jValue);
      except
        on E: Exception do
        begin
          setResponse(10, 201, E.Message);
        end;
      end;
    finally
{$IFDEF MSWINDOWS}
      CoUninitialize;
{$ENDIF MSWINDOWS}
    end;
  end;
end;

{ ------------------------------------------------------------------------------ }

procedure TDashBoadHttpHandler.processrequest;
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
    exit;
  try
    if UpperCase(RequestInfo.uri) = UpperCase(FfilterPath) then
    begin
      case Command of
        vrget:
          begin
            getInfo;
          end;
      end;
    end;
  except
    on E: Exception do
    begin

      raise Exception.create('DashBoard - Requisiçao invalida');
    end;
  end;
end;

{ ------------------------------------------------------------------------------ }
end.

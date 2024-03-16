unit dfe.httphandler.cte;

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
  TCteHttpHandler = class(THttpServerBase)
  private

    FfilterPath: string;
    procedure processRequest; override;

  public

    procedure listaCte;

    constructor create; override;

  published
    property FilterPath: string read FfilterPath write FfilterPath;
  end;

implementation

uses
  nfe.controller.nfe, nfe.controller.cte;
{ ------------------------------------------------------------------------------ }
{ TCteHttpHandler}



constructor  TCteHttpHandler.create;
begin
  OnProcessRequest := processrequest;
  FfilterPath := '/dfeapi/cte';
end;
{ ------------------------------------------------------------------------------ }


procedure  TCteHttpHandler.listaCte;
var
  controller: TCteController;
begin
  controller := TCteController.create;
  try
{$IFDEF MSWINDOWS}
    CoInitialize(nil);
{$ENDIF MSWINDOWS}
    try
      ResponseInfo.ContentText := controller.listarCte(jValue);
    except
      on E: Exception do
      begin
        setResponse(10, 201, E.Message);
      end;
    end;
  finally
    FreeAndNil(controller);
{$IFDEF MSWINDOWS}
    CoUninitialize;
{$ENDIF MSWINDOWS}
  end;

end;

{ ------------------------------------------------------------------------------ }

procedure  TCteHttpHandler.processRequest;
begin
  if assigned(RequestInfo) then
  begin
    if   UpperCase(FfilterPath) =  UpperCase(RequestInfo.URI) then
    begin
      case Command of
        vrget:
          begin
            listaCte ();
          end;
        vrPut:
          begin
           {TODO}
          end;
       vrPost:
          begin
             {TODO}
          end;


      end;
    end;
  end;
end;

{ ------------------------------------------------------------------------------ }
end.

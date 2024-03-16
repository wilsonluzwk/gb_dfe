unit dfe.httphandler.manifestos;

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
  TmanifestoHttpHandler = class(THttpServerBase)
  private

    FfilterPath: string;
    procedure processRequest; override;

  public

    procedure listamanifesto;

    constructor create; override;

  published
    property FilterPath: string read FfilterPath write FfilterPath;
  end;

implementation

uses
  nfe.controller.nfe;
{ ------------------------------------------------------------------------------ }
{ TmanifestoHttpHandler}



constructor  TmanifestoHttpHandler.create;
begin
  OnProcessRequest := processrequest;
  FfilterPath := '/dfeapi/manifesto';
end;
{ ------------------------------------------------------------------------------ }


procedure  TmanifestoHttpHandler.listamanifesto;
var
  controller: TNnfeController;
begin
  controller := TNnfeController.create;
  try
{$IFDEF MSWINDOWS}
    CoInitialize(nil);
{$ENDIF MSWINDOWS}
    try
      ResponseInfo.ContentText := controller.listarmanifesto(jValue);
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

procedure  TmanifestoHttpHandler.processRequest;
begin
  if assigned(RequestInfo) then
  begin
    if   UpperCase(FfilterPath) =  UpperCase(RequestInfo.URI) then
    begin
      case Command of
        vrget:
          begin
            listamanifesto();
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

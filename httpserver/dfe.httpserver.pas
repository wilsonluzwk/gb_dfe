unit dfe.httpserver;

interface

uses
  math,
  System.SysUtils,
  IdCoder3to4,
  System.JSON,
  Variants,
  Classes,
  dfe.httphandler.dashboard,
  dfe.httphandler.empresa,
  dfe.httphandler.cancelamentos,
  dfe.httphandler.inutilizacoes,
  dfe.httphandler.cartaCorrecao,
  dfe.httphandler.auth,
  dfe.httphandler.cte,

  dfe.httphandler.manifestos,
  dfe.httphandler.nfe,
  dfe.lib.constants,
  dfe.httpserver.base,

{$IFDEF MSWINDOWS}
  Winapi.Windows,
  Winapi.Messages,
  activex,
{$ENDIF MSWINDOWS}
  dfe.lib.util;

type
  THttpHandlerBase = class(THttpServerBase)
  private
    FDashBoadHttpHandler: TDashBoadHttpHandler;
    FNfeHttpHandler: TNfeHttpHandler;
    FEmpresaHttpHandler: TEmpresaHttpHandler;
    FInutilizacaoHttpHandler: TInutilizacoesHttpHandler;
    FCancelamentosHttpHandler: TCancelamentosHttpHandler;
    FCartaCorrecaoHttpHandler: TCartaCorrecaoHttpHandler;
    FmanifestosHttpHandler: TmanifestoHttpHandler;
    FCteHttpHandler: TCteHttpHandler;
    FauthHttpHandler: TauthHttpHandler;
    procedure updateSubclass(oclass: THttpServerBase);
  public
    procedure processrequest; override;
    constructor create; override;
  published

  end;

implementation

{ THttpHandlerBase }
constructor THttpHandlerBase.create;
begin
  inherited;

  FDashBoadHttpHandler := TDashBoadHttpHandler.create();
  FNfeHttpHandler := TNfeHttpHandler.create();
  FEmpresaHttpHandler := TEmpresaHttpHandler.create();
  FInutilizacaoHttpHandler := TInutilizacoesHttpHandler.create;
  FCancelamentosHttpHandler := TCancelamentosHttpHandler.create;
  FCartaCorrecaoHttpHandler := TCartaCorrecaoHttpHandler.create;
  FmanifestosHttpHandler := TmanifestoHttpHandler.create;
  FauthHttpHandler := TauthHttpHandler.create;
  FCteHttpHandler := TCteHttpHandler.create;

end;

{ ------------------------------------------------------------------------------ }
procedure THttpHandlerBase.processrequest;
var
  uri: string;
  function filterIsalid(pfilter: string): boolean;
  begin
    result := false;
    result := (AnsiUpperCase(uri) = AnsiUpperCase(pfilter)) or
      (AnsiUpperCase(uri) = AnsiUpperCase(pfilter + '/')) or
      (AnsiUpperCase(uri) = AnsiUpperCase(pfilter + '\'));
  end;

begin

  try
    uri := RequestInfo.uri;
  except

  end;

  if (uri <> '') and (pos(_ctApiName, RequestInfo.uri) > 0) then
  begin
    if filterIsalid(FDashBoadHttpHandler.FilterPath) then
      updateSubclass(FDashBoadHttpHandler)
    else if filterIsalid(FNfeHttpHandler.FilterPath) then
      updateSubclass(FNfeHttpHandler)
    else if filterIsalid(FEmpresaHttpHandler.FilterPath) then
      updateSubclass(FEmpresaHttpHandler)
    else if filterIsalid(FInutilizacaoHttpHandler.FilterPath) then
      updateSubclass(FInutilizacaoHttpHandler)
    else if filterIsalid(FCancelamentosHttpHandler.FilterPath) then
      updateSubclass(FCancelamentosHttpHandler)
    else if filterIsalid(FCartaCorrecaoHttpHandler.FilterPath) then
      updateSubclass(FCartaCorrecaoHttpHandler)
    else if filterIsalid(FmanifestosHttpHandler.FilterPath) then
      updateSubclass(FmanifestosHttpHandler)
    else if filterIsalid(FauthHttpHandler.FilterPath) then
      updateSubclass(FauthHttpHandler)
    else if filterIsalid(FCteHttpHandler.FilterPath) then
      updateSubclass(FCteHttpHandler);
  end;

end;

procedure THttpHandlerBase.updateSubclass(oclass: THttpServerBase);

begin

  oclass.jValue := self.jValue;
  oclass.isjason := self.isjason;
  oclass.Context := self.Context;
  oclass.Command := self.Command;
  oclass.RequestInfo := self.RequestInfo;
  oclass.ResponseInfo := self.ResponseInfo;
  oclass.processrequest();
end;

{ ------------------------------------------------------------------------------ }
end.

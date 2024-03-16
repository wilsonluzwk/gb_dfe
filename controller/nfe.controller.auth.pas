unit nfe.controller.auth;

interface

uses
  classes,
  REST.JSON.Types,
  REST.JSON,
  JSON,

  sysutils,
  dfe.dao.usuarios,
  dfe.lib.util;

type
  TAuthController = class
  private

  public
    function Login(JSON: TJSONObject): string;
    function ObterChave: String;
    function Validar(const pToken: String): Boolean;
  end;

implementation

uses
  JOSE.Core.JWT, JOSE.Core.JWA, JOSE.Core.Builder, JOSE.Core.JWK,
  JOSE.Types.Bytes, System.NetEncoding,
  System.DateUtils;
{ TAuthController }
{ ----------------------------------------------------------------------------- }

function TAuthController.ObterChave: String;
const
  _SECRET_KEY: String = 'santaLuz2023';
Var
  lBase: TBase64Encoding;
begin
  lBase := nil;
  Try
    lBase := TBase64Encoding.Create;
    Result := '@' + lBase.Encode(_SECRET_KEY);
  Finally
    lBase.Free;
  End;
end;

function TAuthController.Validar(const pToken: String): Boolean;
Var
  LKey: TJWK;
  LToken: TJWT;
  LCompactToken: TJOSEBytes;
begin
  LToken := nil;
  Try
    Try
      LKey := TJWK.Create(ObterChave);
      LCompactToken := pToken;
      LToken := TJOSE.Verify(LKey, LCompactToken);
      Result := LToken.Verified;
      if LToken.Claims.IssuedAt < Now then
        Result := False;
    Except
      On E: Exception do
      begin
        Result := False;
      end;
    End;
  Finally
    if Assigned(LToken) then
      LToken.Free;
  End;
end;

function TAuthController.Login(JSON: TJSONObject): string;

var
  dao: TDaoUsuarios;
  jsonResult: TJSONObject;
  isValid: Boolean;
  LToken: TJWT;
  usuario: string;
  senha: string;
  token: string;
begin

  try
    try
       dao := TDaoUsuarios.Create;
      jsonResult := TJSONObject.Create;
      usuario := JSON.GetValue('user').Value;
      senha := JSON.GetValue('senha').Value;
      isValid := dao.validarUsuario(usuario, senha);

      if isValid then
      begin
        LToken := Nil;
        Try

          LToken := TJWT.Create;
          LToken.Claims.Issuer := 'Administrador Master';

          LToken.Claims.Subject := usuario;
          LToken.Claims.IssuedAt := date + 1;
          LToken.Claims.SetClaimOfType<String>('customer', '');
          token := TJOSE.SHA256CompactToken(ObterChave, LToken);
        Finally
          if Assigned(LToken) then
            LToken.Free;
        End;
        jsonResult.AddPair('statusCod', '200');
        jsonResult.AddPair('msg', 'usuario autorizado');
        jsonResult.AddPair('token', token);
      end
      else
      begin
        jsonResult.AddPair('statusCod', '400');
        jsonResult.AddPair('msg', 'usuario invalido');
      end;
      Result := jsonResult.ToJSON;
    except
      on E: Exception do
      begin
        gravalog('[Auth E124]' + ' - ' + E.Message,'');
        jsonResult.AddPair('statusCod', '500');
        jsonResult.AddPair('msg', e.Message);
        Result := jsonResult.ToJSON;

      end;

    end;
  finally
    if Assigned(dao) then
      FreeAndNil(dao);

  end;
end;

{ ----------------------------------------------------------------------------- }
end.

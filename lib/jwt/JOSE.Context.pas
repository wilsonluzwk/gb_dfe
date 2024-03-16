unit JOSE.Context;

interface

uses
  System.SysUtils, System.Generics.Collections, JOSE.Types.Bytes, JOSE.Core.Base, JOSE.Core.Parts, JOSE.Core.JWA, JOSE.Core.JWK,
  JOSE.Core.JWT, JOSE.Core.JWS, JOSE.Core.JWE;

type
  TJOSEContext = class
  private
    FCompactToken: TJOSEBytes;
    FClaimsClass: TJWTClaimsClass;
    FJOSEObject: TJOSEParts;
    FJWT: TJWT;
    procedure FromCompactToken;
  public
    constructor Create(const ACompactToken: TJOSEBytes; AClaimsClass: TJWTClaimsClass);
    destructor Destroy; override;
    function GetJOSEObject: TJOSEParts; overload;
    function GetJOSEObject<T: TJOSEParts>: T; overload;
    function GetHeader: TJWTHeader;
    function GetClaims: TJWTClaims; overload;
    function GetClaims<T: TJWTClaims>: T; overload;
  end;

implementation

uses
  System.Types, System.StrUtils;

{ TJOSEContext }

constructor TJOSEContext.Create(const ACompactToken: TJOSEBytes; AClaimsClass: TJWTClaimsClass);
begin
  FCompactToken := ACompactToken;
  FClaimsClass := AClaimsClass;
  FJWT := TJWT.Create(FClaimsClass);
  try
    FromCompactToken;
  except
    FreeAndNil(FJWT);
    raise;
  end;
end;

destructor TJOSEContext.Destroy;
begin
  FJWT.Free;
  FJOSEObject.Free;
  inherited;
end;

procedure TJOSEContext.FromCompactToken;
var
  LRes: TStringDynArray;
begin
  LRes := SplitString(FCompactToken, PART_SEPARATOR);

  case Length(LRes) of
    3:
    begin
      FJOSEObject := TJWS.Create(FJWT);
      try
        FJOSEObject.CompactToken := FCompactToken;
      except
        FreeAndNil(FJOSEObject);
      end;
    end;
    5:
    begin
      raise EJOSEException.Create('Compact Serialization appears to be a JWE Token wich is not (yet) supported');
    end;

  else
    raise EJOSEException.Create('Malformed Compact Serialization');
  end;
end;

function TJOSEContext.GetClaims: TJWTClaims;
begin
  Result := FJWT.Claims;
end;

function TJOSEContext.GetClaims<T>: T;
begin
  Result := FJWT.Claims as T;
end;

function TJOSEContext.GetHeader: TJWTHeader;
begin
  Result := FJWT.Header;
end;

function TJOSEContext.GetJOSEObject: TJOSEParts;
begin
  Result := FJOSEObject;
end;

function TJOSEContext.GetJOSEObject<T>: T;
begin
  Result := FJOSEObject as T;
end;

end.

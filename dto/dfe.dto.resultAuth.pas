unit dfe.dto.resultAuth;

interface

uses
  wk.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TTenantId = class;

  TAuthorities = class
  private
    FAuthority: string;
  published
    property Authority: string read FAuthority write FAuthority;
  end;

  TTenantId = class
  private
    FSchemaFilial: string;
    FTenantCompleta: string;
    FTenantEmpresa: string;
  published
    property SchemaFilial: string read FSchemaFilial write FSchemaFilial;
    property TenantCompleta: string read FTenantCompleta write FTenantCompleta;
    property TenantEmpresa: string read FTenantEmpresa write FTenantEmpresa;
  end;

  TUserAuthentication = class
  private
    FCodigoErp: Integer;
    FConfirmado: Boolean;
    FEnabled: Boolean;
    FLocale: string;
    FNome: string;
    FTenantId: TTenantId;
    FUsername: string;
    FUsuario: Integer;
    FZoneId: string;
  published
    property CodigoErp: Integer read FCodigoErp write FCodigoErp;
    property Confirmado: Boolean read FConfirmado write FConfirmado;
    property Enabled: Boolean read FEnabled write FEnabled;
    property Locale: string read FLocale write FLocale;
    property Nome: string read FNome write FNome;
    property TenantId: TTenantId read FTenantId;
    property Username: string read FUsername write FUsername;
    property Usuario: Integer read FUsuario write FUsuario;
    property ZoneId: string read FZoneId write FZoneId;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TDtoResultAuth = class(TJsonDTO)
  private
    FActive: Boolean;
    [JSONName('authorities'), JSONMarshalled(False)]
    FAuthoritiesArray: TArray<TAuthorities>;
    [GenericListReflect]
    FAuthorities: TObjectList<TAuthorities>;
    [JSONName('client_id')]
    FClientId: string;
    [JSONName('scope')]
    FScopeArray: TArray<string>;
    [JSONMarshalled(False)]
    FScope: TList<string>;
    FUserAuthentication: TUserAuthentication;
    function GetAuthorities: TObjectList<TAuthorities>;
    function GetScope: TList<string>;
  protected
    function GetAsJson: string; override;
  published
    property Active: Boolean read FActive write FActive;
    property Authorities: TObjectList<TAuthorities> read GetAuthorities;
    property ClientId: string read FClientId write FClientId;
    property Scope: TList<string> read GetScope;
    property UserAuthentication: TUserAuthentication read FUserAuthentication;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

implementation

{ TUserAuthentication }

constructor TUserAuthentication.Create;
begin
  inherited;
  FTenantId := TTenantId.Create;
end;

destructor TUserAuthentication.Destroy;
begin
  FTenantId.Free;
  inherited;
end;

{ TDtoResultAuth }

constructor TDtoResultAuth.Create;
begin
  inherited;
  FUserAuthentication := TUserAuthentication.Create;
end;

destructor TDtoResultAuth.Destroy;
begin
  FUserAuthentication.Free;
  GetScope.Free;
  GetAuthorities.Free;
  inherited;
end;

function TDtoResultAuth.GetAuthorities: TObjectList<TAuthorities>;
begin
  Result := ObjectList<TAuthorities>(FAuthorities, FAuthoritiesArray);
end;

function TDtoResultAuth.GetScope: TList<string>;
begin
  Result := List<string>(FScope, FScopeArray);
end;

function TDtoResultAuth.GetAsJson: string;
begin
  RefreshArray<TAuthorities>(FAuthorities, FAuthoritiesArray);
  RefreshArray<string>(FScope, FScopeArray);
  Result := inherited;
end;

end.

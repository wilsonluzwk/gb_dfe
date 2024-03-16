unit WK.Server.Authentication;

interface

uses
  System.SysUtils, Web.HTTPApp, WK.Server.Connection, WK.Utils.Criptografia;

type
  TAuthentication = class
  private
    FParameters: String;
    FUserID: Integer;
    FAdmin: Boolean;
    constructor Create(aNameResource, aNameFieldUser,
      aNameFieldPassword: String);
    procedure OpenQuery(SQL, Fields, TableName, Where: String;
      Connection: TConnection);
    procedure SetUserID(const Value: Integer);
  public
    destructor Destroy; override;
    class function GetInstance(aNameResource, aNameFieldUser, aNameFieldPassword
      : String): TAuthentication;
    class function NewInstance: TObject; override;
    function Authenticate(Request: TWebRequest; Response: TWebResponse)
      : Boolean;
    property UserID: Integer read FUserID write SetUserID;
    property Admin: Boolean read FAdmin write FAdmin;
  end;

var
  Authentication: TAuthentication;

implementation

uses
  System.JSON, System.Rtti;

{ TAuthentication }

function TAuthentication.Authenticate(Request: TWebRequest;
  Response: TWebResponse): Boolean;

var
  LAutParameters: TArray<String>;
  LJSONValue: TJSONValue;
  lFields: String;
  lPrimaryKeyName: String;
  lTableName: String;
  lWhere: String;
  User: String;
  Password: String;
  Connection: TConnection;
const
  SQL = 'SELECT %s FROM %s WHERE %s';
begin
  Result := False;
  Connection := TConnection.Create;
  try
    LAutParameters := FParameters.Split([';']);
    LJSONValue := TJSONObject.ParseJSONValue(Request.Content);
    User := LJSONValue.GetValue<string>('usuario');
    Password := LJSONValue.GetValue<string>('senha');
    lTableName := QuotedStr(LAutParameters[0]);

    lTableName := LAutParameters[0];

    lFields := Format('%s,%s,%s', [LAutParameters[1], lPrimaryKeyName,
      LAutParameters[2]]);
    lWhere := LAutParameters[1] + ' = ' + QuotedStr(User);
    lWhere := lWhere + ' AND ' + LAutParameters[2] + ' = ' +
      QuotedStr(Password);
    OpenQuery(SQL, lFields, lTableName, lWhere, Connection);
    if Connection.Query.RecordCount > 0 then
    begin
      Result := true;
    end;
  finally
    Connection.Free;
  end;
end;

constructor TAuthentication.Create(aNameResource, aNameFieldUser,
  aNameFieldPassword: String);
begin
  FParameters := aNameResource + ';' + aNameFieldUser + ';' +
    aNameFieldPassword;
end;

destructor TAuthentication.Destroy;
begin

  inherited;
end;

class function TAuthentication.GetInstance(aNameResource, aNameFieldUser,
  aNameFieldPassword: String): TAuthentication;
begin
  Result := Self.Create(aNameResource, aNameFieldUser, aNameFieldPassword);
end;

class function TAuthentication.NewInstance: TObject;
begin
  if not Assigned(Authentication) then
    Authentication := TAuthentication(inherited NewInstance);
  Authentication.FParameters := 'TabUsu;login;senha;login;senha';
  Result := Authentication;
end;

procedure TAuthentication.OpenQuery(SQL, Fields, TableName, Where: String;
  Connection: TConnection);
begin
  Connection.Query.SQL.Clear;
  Connection.Query.SQL.Add(Format(SQL, [Fields, TableName, Where]));
  Connection.Query.Open;
end;

procedure TAuthentication.SetUserID(const Value: Integer);
begin
  FUserID := Value;
end;

end.

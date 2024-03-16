unit WK.Server.Config;

interface

uses
  System.IniFiles,
  WK.Server.Constants,
  System.SysUtils,
  FireDAC.Comp.Client,
  System.Types,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Phys,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,

  FireDAC.Phys.MSSQLDef,
  FireDAC.Phys.IBBase,
  FireDAC.Phys.MSSQL,
  FireDAC.Comp.UI,
  FireDAC.Phys.FB,

  Data.DB,
  FireDAC.Comp.DataSet,
  System.Classes,
  System.IOUtils,
  WK.Server.Connection;

type
  TServerConfig = class
  private
    FDManager: TFDManager;

    procedure ConfigDB;
    class var FInstance: TServerConfig;

  public
    class function GetInstance: TServerConfig;
  end;

implementation

{ TServer }

class function TServerConfig.GetInstance: TServerConfig;
begin
  if FInstance = nil then
  begin
    FInstance := TServerConfig.Create;
    FInstance.ConfigDB;
  end;
  Result := FInstance;
end;

procedure TServerConfig.ConfigDB;
var
  IniFile: TIniFile;
  Database: string;
  Server: string;
  UserName: string;
  Password: string;
  Params: TStrings;
  Driver: string;
  Spath: string;
  Port: integer;
  OsAuth: Boolean;

begin
  var
  secao := 'BD_FireDAC-SERVER';
  Spath := ExtractFilePath(GetModuleName(HInstance)) + cConfigFileName;
  if not FileExists(Spath) then
    raise Exception.Create('Arquivo de configuração não encontrado !');
  IniFile := TIniFile.Create(Spath);
  try
    Server := IniFile.ReadString(secao, 'Server_NFe', '');
    Database := IniFile.ReadString(secao, 'Database_NFe', '');
    UserName := IniFile.ReadString(secao, 'UserName_NFe', '');
    Password := IniFile.ReadString(secao, 'Password_NFe', '');
    OsAuth := IniFile.ReadBool(secao, 'OSAuthent_NFe', false);
    if (Server = '') or (Database = '') or (UserName = '')
    then
      raise Exception.Create
        ('Arquivo de configuração invalido ou sem parametros nescessarios !');
    Params := TStringList.Create;
    try
      if OsAuth then
        Params.Values['OSAuthent'] := 'Yes';
      Params.AddPair('Server', Server);
      Params.AddPair('Database', Database);
      Params.AddPair('User_Name', UserName);
      Params.AddPair('Password', Password);
      // Params.AddPair('CharacterSet','iso-8859-1');
      Params.AddPair('Pooled', 'True');
      Params.Values['MARS'] := 'Yes';
      Params.Values['DriverID'] := 'MSSQL';
      FInstance.FDManager.AddConnectionDef(cConnectionDefName, 'MSSQL', Params);
    finally
      FreeAndNil(Params);
    end;
  finally
    FInstance.FDManager.SilentMode := True;
    IniFile.Free;
  end;
end;

end.

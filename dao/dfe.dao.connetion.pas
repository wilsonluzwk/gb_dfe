unit dfe.dao.connetion;

interface

uses
  System.SysUtils,
  System.Classes,
  FireDAC.Comp.Client,
  FireDAC.DApt,
  FireDAC.Stan.Def,
  FireDAC.Phys.FBDef,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  FireDAC.Stan.Async,
  FireDAC.UI.Intf,
  inifiles,

  FireDAC.Comp.UI,
  FireDAC.Stan.Option,
  FireDAC.Stan.Pool,
  FireDAC.Phys.MSSQL;

type
  TConnection = class
  private

    FLoginPrompt_NFe: string;
    FOSAuthent_NFe: string;
    FDriverID_NFe: string;
    FDatabase_NFe: string;
    FServer_NFe: string;
    FUserName_NFe: string;
    FPassword_NFe: string;
    FLoginPrompt_Ger: string;
    FOSAuthent_Ger: string;
    FDriverID_Ger: string;
    FDatabase_Ger: string;
    FServer_Ger: string;
    FUserName_Ger: string;
    FPassword_Ger: string;
    procedure loadIni;
  public
    FDManager: TFDManager;
    constructor Create;
    destructor Destroy; override;

  end;

var
  ConectionManeger: TConnection;

implementation

{ TConnection }

procedure TConnection.loadIni;
var
  iniFile: string;
  ini: Tinifile;
  secao: string;
begin
  iniFile := extractFilePath(GetModuleName(HInstance)) + 'GBNFe.Ini';
  ini := Tinifile.Create(iniFile);
  secao := 'BD_FireDAC-SERVER';
  try
    if (ini.SectionExists(secao)) then
    begin

      FLoginPrompt_NFe := ini.ReadString(secao, 'LoginPrompt_NFe', 'false');
      FOSAuthent_NFe := ini.ReadString(secao, 'OSAuthent_NFe', 'false');
      FDriverID_NFe := ini.ReadString(secao, 'DriverID_NFe', '');
      FDatabase_NFe := ini.ReadString(secao, 'Database_NFe', '');
      FServer_NFe := ini.ReadString(secao, 'Server_NFe', '');
      FUserName_NFe := ini.ReadString(secao, 'UserName_NFe', '');
      FPassword_NFe := ini.ReadString(secao, 'Password_NFe', '');

      FLoginPrompt_Ger := ini.ReadString(secao, 'LoginPrompt_Ger', 'false');
      FOSAuthent_Ger := ini.ReadString(secao, 'OSAuthent_Ger', 'false');
      FDriverID_Ger := ini.ReadString(secao, 'DriverID_Ger', '');
      FDatabase_Ger := ini.ReadString(secao, 'Database_Ger', '');
      FServer_Ger := ini.ReadString(secao, 'Server_Ger', '');
      FUserName_Ger := ini.ReadString(secao, 'UserName_Ger', '');
      FPassword_Ger := ini.ReadString(secao, 'Password_Ger', '');
    end;
  finally
    ini.free;

  end;

end;

constructor TConnection.Create;
var

  Params: TStrings;
begin
  Params := TStringList.Create;
  loadIni();
  Params.AddPair('DriverID', 'MSSQL');
  Params.AddPair('Server', FServer_NFe);
  Params.AddPair('Database', FDatabase_NFe);
  Params.AddPair('User_Name', FUserName_NFe);
  Params.AddPair('Password', FPassword_NFe);
  Params.AddPair('Pooled', 'True');

  FDManager := TFDManager.Create(nil);
  FDManager.AddConnectionDef('GBDFEConnection', 'MSSQL', Params);
  FDManager.Active := True;
end;

destructor TConnection.Destroy;
begin
  if assigned(FDManager) then
  begin
    FDManager.Close;
    FDManager.free;
  end;
  inherited;
end;

end.

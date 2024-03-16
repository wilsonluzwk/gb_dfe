unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.ComCtrls, inifiles;

type
  TFmain = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Image1: TImage;
    btgravar: TButton;
    Button1: TButton;
    grp12: TGroupBox;
    grp14: TGroupBox;
    cbb_DriverID_NFe: TComboBox;
    grp18: TGroupBox;
    edt_Server_NFe: TEdit;
    grp19: TGroupBox;
    edt_UserName_NFe: TEdit;
    grp20: TGroupBox;
    edt_Password_NFe: TEdit;
    grp15: TGroupBox;
    edt_Database_NFe: TEdit;
    GroupBox5: TGroupBox;
    edtIp: TEdit;
    Label2: TLabel;
    grp13: TGroupBox;
    chk_LoginPrompt_NFe: TCheckBox;
    grp28: TGroupBox;
    OSAuthent_NFe: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btgravarClick(Sender: TObject);
  private
    { Private declarations }
    Secao: String;
    Ini: TIniFile;
    Ok: Boolean;
    vLoginPrompt_NFe: String;
    vOSAuthent_NFe: String;
    vDriverID_NFe: String;
    vDatabase_NFe: String;
    vServer_NFe: String;
    vUserName_NFe: String;
    vPassword_NFe: String;
    vConnected_NFe: String;
    vCamBD_NFe: String;

    section: string;
    gNFe: string;
    FconfigFile: string;
    FarquivoServer: string;
    procedure loadIni();
    procedure salvarIni;
  public
    { Public declarations }
  end;

var
  Fmain: TFmain;

implementation

{$R *.dfm}

procedure TFmain.btgravarClick(Sender: TObject);
begin
  salvarIni;
end;

procedure TFmain.Button1Click(Sender: TObject);
begin
  application.terminate;
end;

procedure TFmain.FormCreate(Sender: TObject);
begin
  FconfigFile := ExtractFilePath(GetModuleName(HInstance)) + 'GBNFe.Ini';
  FarquivoServer := ExtractFilePath(GetModuleName(HInstance)) +
    'web\template\assets\js2\nfe_app.js';
  loadIni;
end;

procedure TFmain.loadIni;
var
  lstIp: TStringList;
  sIp: string;
begin

  Ini := TIniFile.Create(FconfigFile);
  Secao := 'BD_FireDAC-SERVER';
  section := 'BD_FireDAC-SERVER';
  try

    try

      if (Ini.SectionExists(Secao)) then
      begin

        // NFe
        vLoginPrompt_NFe := Ini.ReadString(section, 'LoginPrompt_NFe', 'false');
        vOSAuthent_NFe := Ini.ReadString(section, 'OSAuthent_NFe', 'false');
        vDriverID_NFe := Ini.ReadString(section, 'DriverID_NFe', '');
        vDatabase_NFe := Ini.ReadString(section, 'Database_NFe', '');
        vServer_NFe := Ini.ReadString(section, 'Server_NFe', '');
        vUserName_NFe := Ini.ReadString(section, 'UserName_NFe', '');
        vPassword_NFe := Ini.ReadString(section, 'Password_NFe', '');
        vConnected_NFe := Ini.ReadString(section, 'Connected_NFe', 'false');
        vCamBD_NFe := Ini.ReadString(section, 'CamBD_NFe', '');

        if ((vDriverID_NFe <> '') and (vDatabase_NFe <> '') and
          (vServer_NFe <> '') and (vUserName_NFe <> '')) then
        begin

          self.chk_LoginPrompt_NFe.Checked := StrToBool(vLoginPrompt_NFe);
          self.OSAuthent_NFe.Checked := StrToBool(vOSAuthent_NFe);
          if (vDriverID_NFe <> '') then
            self.cbb_DriverID_NFe.Text := vDriverID_NFe;
          if (vDatabase_NFe <> '') then
          begin
            self.edt_Database_NFe.Text := vDatabase_NFe;
            gNFe := Trim(vDatabase_NFe);
          end;
          if (vServer_NFe <> '') then
            self.edt_Server_NFe.Text := vServer_NFe;
          if (vUserName_NFe <> '') then
            self.edt_UserName_NFe.Text := vUserName_NFe;

          self.edt_Password_NFe.Text := vPassword_NFe;

        end;

      end;
    Except
    end;
  finally
    Ini.free;
  end;
  lstIp := TStringList.Create;
  try
    lstIp.LoadFromFile(FarquivoServer);
    sIp := lstIp[0];
    sIp := copy(sIp, pos('=', sIp) + 1, length(sIp));
    sIp := StringReplace(sIp, ';', '', [rfReplaceAll, rfIgnoreCase]);
    sIp := StringReplace(sIp, '''', '', [rfReplaceAll, rfIgnoreCase]);
    edtIp.Text := sIp;
  finally
    FreeAndNil(lstIp);
  end;
end;

procedure TFmain.salvarIni;
var
  lstIp: TStringList;
  sIp: String;
begin
  if edtIp.Text = '' then
    raise Exception.Create('o servidor deve ser configurado "');
  lstIp := TStringList.Create;
  try
    lstIp.LoadFromFile(FarquivoServer);

    sIp := edtIp.Text;
    lstIp[0] := 'var _HOST = ' + QuotedStr(sIp) + ';';
    lstIp[1] := 'var _CT_SERVER_NFSE_WEBSOCK = ' + QuotedStr(sIp) + ';';

    lstIp.SaveToFile(FarquivoServer);

  finally
    FreeAndNil(lstIp);
  end;
  section := 'BD_FireDAC-SERVER';
  Ini := TIniFile.Create(FconfigFile);
  try
    try
      vLoginPrompt_NFe := BoolToStr(self.chk_LoginPrompt_NFe.Checked);
      if self.OSAuthent_NFe.Checked then

        vOSAuthent_NFe := '1'
      else
        vOSAuthent_NFe := '0';
      vDriverID_NFe := self.cbb_DriverID_NFe.Text;
      vDatabase_NFe := self.edt_Database_NFe.Text;
      gNFe := Trim(vDatabase_NFe);
      vServer_NFe := self.edt_Server_NFe.Text;
      vUserName_NFe := self.edt_UserName_NFe.Text;
      vPassword_NFe := Trim(self.edt_Password_NFe.Text);
      Ini.WriteString(section, 'LoginPrompt_NFe', vLoginPrompt_NFe);
      Ini.WriteString(section, 'OSAuthent_NFe', vOSAuthent_NFe);
      Ini.WriteString(section, 'DriverID_NFe', vDriverID_NFe);
      Ini.WriteString(section, 'Database_NFe', vDatabase_NFe);
      Ini.WriteString(section, 'Server_NFe', vServer_NFe);
      Ini.WriteString(section, 'UserName_NFe', vUserName_NFe);
      Ini.WriteString(section, 'Password_NFe', vPassword_NFe);
      Ini.WriteString(section, 'CamBD_NFe', vCamBD_NFe);
      ShowMessage('Gravação realizada com exito');

    except
      on e: Exception do
        ShowMessage
          ('Grvação do ini falhou verifique se o aplicativo tem direito de leitura e escrita na pasta');
    end;
  finally
    Ini.free;
  end;
end;

end.

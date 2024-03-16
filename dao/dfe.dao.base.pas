{
  product id 1112  - generat:10/05/2022
  ------------------------------------------------------------------------------
  ------------------------------------------------------------------------------

  __      __.__.__                        _______________  ____ ________
  /  \    /  \__|  |   __________   ____   \_____  \   _  \/_   /   __   \
  \   \/\/   /  |  |  /  ___/  _ \ /    \   /  ____/  /_\  \|   \____    /
  \        /|  |  |__\___ (  <_> )   |  \ /       \  \_/   \   |  /    /
  \__/\  / |__|____/____  >____/|___|  / \_______ \_____  /___| /____/
  \/               \/           \/          \/     \/
  -----------------------------------------------------------------------------


}
unit dfe.dao.base;

interface

uses
  System.SysUtils,
  System.DateUtils,
  variants,
  System.Classes,
  dfe.lib.util,
  inifiles,
  System.JSON,
  Data.DB,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.MongoDBDef,
  FireDAC.Phys.MSSqlDef,
  FireDAC.Phys.MSSQL,
  FireDAC.Phys.MongoDB,
  FireDAC.Comp.UI,
  FireDAC.Comp.Client,
  FireDAC.Phys.MongoDBWrapper,
  System.JSON.Types,
  System.JSON.BSON,
  System.JSON.Builders,
  System.Rtti,
  System.JSON.Readers,
  System.Diagnostics,
  FireDAC.Stan.util,
  FireDAC.Phys.MongoDBDataSet,
  FireDAC.Comp.DataSet;




type

  TDaoBase = class
  private
    { Private declarations }
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
    { Public declarations }
    Query: TFDQuery;

    FDConNFe: TFDConnection;
    FdriverMssql: TFDPhysMSSQLDriverLink;
    Class procedure SetPoolDb();
    function OpenQuery(qry: TFDQuery): TJSONArray;
    function PrepareFilter(Afilter, FieldData: string;
      Param: TJSONObject): string;
    function valfied(otable, ofield: string; ocon: TFDConnection): Boolean;
    function GetID(Obj: TObject): Integer;
    function GetRttiType(Obj: TObject): TRttiType;
    procedure setQryFilter(qry: TFDQuery; Parameter: TJSONObject);
    procedure setQryParameters(qry: TFDQuery; Parameter: TJSONObject);
    procedure setParameterType(tableName: string; qry: TFDQuery);

    constructor create;
    destructor Destroy; override;

  end;

var
  dfeDaoBase: TDaoBase;

implementation

uses
  dfe.servicewin32.srv;

constructor TDaoBase.create;
begin
  try
    FDConNFe := TFDConnection.create(Nil);
    loadIni();
    with FDConNFe do
    begin
      FetchOptions.AssignedValues := [evMode, evCursorKind];
      FetchOptions.Mode := fmAll;
      FormatOptions.AssignedValues := [fvFmtDisplayDateTime, fvFmtDisplayDate];
      ResourceOptions.AssignedValues := [rvAutoReconnect];
      ResourceOptions.AutoReconnect := True;
      LoginPrompt := false;
      Params.Values['MARS'] := 'Yes';
      Params.Values['DriverID'] := 'MSSQL';
      Params.Values['Database'] := FDatabase_NFe;
      if (FOSAuthent_NFe <> '1') then
      begin

        Params.Values['User_Name'] := FUserName_NFe;
        Params.Values['Password'] := FPassword_NFe;
      end
      else
        Params.Values['OSAuthent'] := 'Yes';
      Params.Values['Server'] := FServer_NFe;
      Try
        FDConNFe.Connected := True;

      except
        on e: Exception do
         gravalog(
            'Não foi posivel conectar ao servidor SQL SERVER : ' + FServer_NFe
            + ' - ' + e.Message,'');

      end;
    end;
  finally

  end;

  Query := TFDQuery.create(Nil);
  Query.Connection := FDConNFe;

end;

function TDaoBase.PrepareFilter(Afilter, FieldData: string;
  Param: TJSONObject): string;
var
  LDataInicial: string;
  LDataFinal: string;
  LDataFilter: TJSONObject;
  LStatusFilter: TJSONObject;
  LSearch: TJSONObject;
  LCnpj: string;
begin

  result := '';
  if Assigned(Param) then
  begin
    Param.TryGetValue('cnpj', LCnpj);
    Param.TryGetValue('dataInicial', LDataInicial);
    Param.TryGetValue('dataFinal', LDataFinal);
    LSearch := TJSONObject.create;
    if LCnpj <> '' then
      LSearch.AddPair('cnpj', LCnpj);
    if LDataInicial <> '' then
    begin
      LDataFilter := TJSONObject.create;
      LDataFilter.AddPair('$gte', copy(LDataInicial, 0, 10) + 'T00:00:00.000Z');
      LDataFilter.AddPair('$lte', copy(LDataFinal, 0, 10) + 'T23:59:00.000Z');
      LSearch.AddPair(FieldData, LDataFilter);
    end;
    LStatusFilter := TJSONObject.ParseJSONValue
      ('{  "$nin": [   "",  null  ]  }') as TJSONObject;

    LSearch.AddPair(Afilter, LStatusFilter);
    result := LSearch.ToString;
  end;
end;

destructor TDaoBase.Destroy;
begin
  inherited;
  try
    FDConNFe.Close;
    FreeAndNil(FDConNFe);
    FreeAndNil(FdriverMssql);
    FreeAndNil(Query);
  except
  end;
end;

function TDaoBase.valfied(otable, ofield: string; ocon: TFDConnection): Boolean;
var
  xqry: TFDQuery;
begin
  result := false;
  xqry := TFDQuery.create(Nil);
  try
    xqry.Connection := ocon;
    xqry.SQL.Add('SELECT                                            ');
    xqry.SQL.Add('*                                                 ');
    xqry.SQL.Add('FROM                                              ');
    xqry.SQL.Add('   SYSCOLUMNS                                     ');
    xqry.SQL.Add('WHERE                                             ');
    xqry.SQL.Add('   NAME = ' + QuotedStr(ofield));
    xqry.SQL.Add('   AND ID IN (                                    ');
    xqry.SQL.Add('                SELECT                            ');
    xqry.SQL.Add('                  ID                              ');
    xqry.SQL.Add('                FROM                              ');
    xqry.SQL.Add('                  SYSOBJECTS                      ');
    xqry.SQL.Add('                WHERE                             ');
    xqry.SQL.Add('                  NAME = ' + QuotedStr(otable));
    xqry.SQL.Add('                   AND XTYPE = ''U''              ');
    xqry.SQL.Add('               )                                  ');
    xqry.open();
    result := xqry.RecordCount > 0;
  finally
    xqry.Close();
    FreeAndNil(xqry);
  end;
end;

procedure TDaoBase.loadIni;
var
  iniFile: string;
  ini: Tinifile;
  secao: string;
begin
  iniFile := extractFilePath(GetModuleName(HInstance)) + 'GBNFe.Ini';
  ini := Tinifile.create(iniFile);
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

{ ----------------------------------------------------------------------------- }
Class procedure TDaoBase.SetPoolDb();

begin

end;

{ ----------------------------------------------------------------------------- }
procedure setBinaryField(var oq: TFDQuery; fieldName, value: string);
var
  auxList: TStringList;
  auxStream: TMemoryStream;
begin
  try
    auxList := TStringList.create;
    auxList.Text := value;

    auxStream := TMemoryStream.create;
    auxList.SaveToStream(auxStream);
    auxStream.Position := 0;
    oq.paramByName(fieldName).DataType := ftBlob;
    oq.paramByName(fieldName).LoadFromStream(auxStream, ftBlob);
  finally
    FreeAndNil(auxList);
    FreeAndNil(auxStream);
  end;
end;
{ ----------------------------------------------------------------------------- }

function TDaoBase.OpenQuery(qry: TFDQuery): TJSONArray;
var
  lItem: TJSONObject;
  Field: TField;

begin
  result := TJSONArray.create;
  try
    qry.open;
    qry.First;
    while not(qry.Eof) do
    begin
      lItem := TJSONObject.create;
      result.AddElement(lItem);
      for Field in qry.Fields do
        if Field.DataType = ftInteger then
          lItem.AddPair(LowerCase(Field.fieldName),
            TJSONNumber.create(Field.AsInteger))
        else if Field.DataType = ftBoolean then
          lItem.AddPair(LowerCase(Field.fieldName),
            TJSONBool.create(Field.value))
        else if Field.DataType in [ftDate, ftDateTime, ftTime, ftTimeStamp] then
          if not varisnull(Field.value) then
            lItem.AddPair(LowerCase(Field.fieldName),
              DateToISO8601(Field.value, false))
          else
            lItem.AddPair(LowerCase(Field.fieldName), DateToISO8601(0, false))
        else
          lItem.AddPair(LowerCase(Field.fieldName), Field.AsString);
      qry.Next;
    end;
  except
    on e: Exception do

  end;

end;

{ ----------------------------------------------------------------------------- }
procedure TDaoBase.setParameterType(tableName: string; qry: TFDQuery);
var
  tbl: TFDTable;
begin
  tbl := TFDTable.create(Nil);
  tbl.tableName := tableName;
  tbl.FetchOptions.AssignedValues := [evUnidirectional, evAutoFetchAll];
end;

{ ----------------------------------------------------------------------------- }
function TDaoBase.GetRttiType(Obj: TObject): TRttiType;
var
  RttiContext: TRttiContext;
begin
  RttiContext := TRttiContext.create;
  result := RttiContext.GetType(Obj.ClassInfo);
end;

{ ----------------------------------------------------------------------------- }
function TDaoBase.GetID(Obj: TObject): Integer;
var
  RttiType: TRttiType;
  RttiField: TRttiField;
  ofield: TField;
begin

end;

{ ----------------------------------------------------------------------------- }
procedure TDaoBase.setQryParameters(qry: TFDQuery; Parameter: TJSONObject);
var
  i: Integer;
  ovalue: string;
  swhere: string;
  soperator: string;
  scondition: string;
begin

  soperator := '';
  // defalt equals
  scondition := ' = ';
  qry.Prepare;
  for i := 0 to qry.Params.Count - 1 do
  begin
    if Assigned(Parameter.Get(qry.Params[i].Name)) then
    begin
      ovalue := Parameter.Get(qry.Params[i].Name).JsonValue.value;
      if ovalue <> '' then
      begin
        swhere := swhere + #13#10 + soperator + qry.Params[i].Name +
          scondition + ovalue;
        soperator := ' AND ';
      end;
    end;
  end;
end;

{ ----------------------------------------------------------------------------- }
procedure TDaoBase.setQryFilter(qry: TFDQuery; Parameter: TJSONObject);
var
  i: Integer;
  ovalue: string;
  oname: string;
  swhere: string;
  soperator: string;
  scondition: string;
begin
  soperator := '';
  // defalt equals
  scondition := ' = ';
  qry.Prepare;
  for i := 0 to Parameter.Count - 1 do

  begin
    ovalue := Parameter.Pairs[i].JsonValue.value;
    oname := Parameter.Pairs[i].JsonString.value;

    if ovalue <> '' then
    begin
      swhere := swhere + #13#10 + soperator + oname + scondition + ovalue;
      soperator := ' AND ';
    end;
  end;

  if swhere <> '' then
  begin
    swhere := 'WHERE ' + swhere;
    qry.SQL.Add(swhere);

  end;
end;

{ ----------------------------------------------------------------------------- }
end.

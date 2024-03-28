unit WK.Server.ResourceBaseClass;

interface

uses
  System.Classes,
  System.Rtti,
  System.JSON, Web.HTTPApp,
  WK.Server.Attributes,
  WK.Server.Message,
  WK.Server.MessageList,
  System.Generics.Collections,
  WK.Server.Connection,
  System.DateUtils,
  WK.Util, Rest.JSON,
  WK.Utils.SectionVariables,
  WK.Server.Records;

type
  TResourceBaseClass = class(TPersistent)
  private
    FFieldsJSON: TStringList;
    FOutpuJson: TJSONObject;
    function GetRttiType: TRttiType; overload;
    function GetRttiType(Instance: TObject): TRttiType; overload;
    function GetValueSequence(SequenceName: String): Integer;
    function GetRttiField(Name: String; Instance: TObject): TRttiField;

    procedure SetValueObject(FieldName: String; Value: String;
      Instance: TObject);
    procedure ValidateInteger(FieldName, Value: String);
    procedure ValidateNotNull(Instance: TObject);

    function SetValueObjectPut(FieldName: String; Value: String;
      Instance: TObject): string;
    procedure ValidateNotNullPut(Instance: TObject; AFields: TArray<string>);

    procedure ValidateID(ID: Integer; Instance: TObject);
    procedure SetPrimaryKey(ID: Integer);
    function GetResourceName(AClass: TClass): String;
    function GetFieldKeys: string;
    function GetFieldValue(FieldName: string): string;
  protected
    FResponse: TWebResponse;
    FResult: Boolean;
    FJsonArrayList: TJsonArray;
    procedure ValidateBusiness(List: TObjectList<TObject>); virtual;
    function GetWherePadrao: String; virtual;
    procedure RemoveFieldsList(AValues: TArray<TValue>); virtual;
    procedure OnBeforeGet; virtual;
    procedure OnAfterGet; virtual;
    procedure OnBeforePost; virtual;
    procedure OnAfterPost; virtual;
    procedure OnBeforePut; virtual;
    procedure OnAfterPut; virtual;
    procedure OnBeforeDelete; virtual;
    procedure OnAfterDelete; virtual;
    procedure SetFiltroCnpj(var ID: string; var Search: string);
    procedure ValidarCnpj();

  public
    procedure SetDados(Dados: TJSONObject);
    procedure SetAutoInc(Instance: TObject);
    [Get]
    procedure Get(Response: TWebResponse; PageNumber: Integer;
      PageSize: Integer; Direction: String; Sort: String; Search: String;
      ID: String; Join: string; JSON: TJSONObject); overload; virtual;

    procedure Get(AValuesRequest: TValuesRequest); overload; virtual;
    [Post]
    procedure Post(Response: TWebResponse; Dados: TJSONObject;
      Conection: TConnection = nil); virtual;
    [Put]
    procedure Put(Response: TWebResponse; ID: Integer; Dados: TJSONObject;
      Conection: TConnection = Nil); virtual;
    [Delete]
    procedure Delete(Response: TWebResponse; ID: Integer; Search: string = '';
      AMethod: string = ''); virtual;

    procedure SetOutput(Dados: TJSONObject);
    property OutpuJson: TJSONObject read FOutpuJson write FOutpuJson;
    property JsonArrayList: TJsonArray read FJsonArrayList write FJsonArrayList;
  end;

implementation

uses
  StrUtils, System.SysUtils, WK.Server.DAO;

{ TResourceBaseClass }


procedure TResourceBaseClass.ValidarCnpj();
var
  RttiType: TRttiType;
  RttiField: TRttiField;
  RttiAttribute: TCustomAttribute;
  LObject: TJSONObject;
begin
  RttiType := GetRttiType;
  for RttiField in RttiType.GetFields do
    for RttiAttribute in RttiField.GetAttributes do
      if RttiAttribute is DBField then
        if (LowerCase((RttiAttribute as DBField).FieldName) = 'cnpj') then
          if (FTSectionVariables.CnpjEmpresa <>
            GetFieldValue((RttiAttribute as DBField).FieldName)) then
            raise Exception.Create
              ('Alteração não permitida Cnpj inconsistente');

end;

procedure  TResourceBaseClass.SetFiltroCnpj(var ID: string; var Search: string);
var
  RttiType: TRttiType;
  RttiField: TRttiField;
  RttiAttribute: TCustomAttribute;
  LObject: TJSONObject;
begin
  RttiType := GetRttiType;
  for RttiField in RttiType.GetFields do
    for RttiAttribute in RttiField.GetAttributes do
      if RttiAttribute is DBField then
        if (LowerCase((RttiAttribute as DBField).FieldName) = 'cnpj') and
          (FTSectionVariables.CnpjEmpresa <> '') then
        begin
          if (Search = '') then
            Search := '{"' + RttiField.Name.ToLower + '":"' +
              FTSectionVariables.CnpjEmpresa + '"}'
          else
          begin
            LObject := (TJSONObject.ParseJSONValue(Search)) AS TJSONObject;
            if assigned(LObject) then
            begin
              LObject.AddPair(RttiField.Name.ToLower,
                FTSectionVariables.CnpjEmpresa);
              Search := LObject.ToString;
            end
            else
              Search := Search + '@@@' + RttiField.Name.ToLower + ':' +
                FTSectionVariables.CnpjEmpresa;

          end;
        end;

end;

procedure TResourceBaseClass.Delete(Response: TWebResponse; ID: Integer;
  Search: string = ''; AMethod: string = '');

begin
  FFieldsJSON := TStringList.Create;
  FResponse := Response;
  Response.ContentType := 'application/json;charset=UTF-8';
  SetPrimaryKey(ID);
  OnBeforeDelete;
  TDAO.Delete(Response, Self);
  OnAfterDelete;
end;

procedure TResourceBaseClass.SetPrimaryKey(ID: Integer);
var
  RttiType: TRttiType;
  RttiField: TRttiField;
  RttiAttribute: TCustomAttribute;
begin
  RttiType := GetRttiType;
  for RttiField in RttiType.GetFields do
    for RttiAttribute in RttiField.GetAttributes do
      if RttiAttribute is DBField then
        if (RttiAttribute as DBField).Constraints = PrimaryKey then
          RttiField.SetValue(Self, ID)
end;

function TResourceBaseClass.SetValueObjectPut(FieldName, Value: String;
  Instance: TObject): string;
var
  RttiField: TRttiField;
  RttiValue: TValue;
begin

  RttiField := GetRttiField(FieldName, Instance);
  if RttiField <> nil then
  begin
    if RttiField.FieldType.TypeKind in [tkInteger] then
    begin
      if Value <> EmptyStr then
      begin
        ValidateInteger(FieldName, Value);
        RttiValue := Value.ToInteger;
      end;
    end
    else if RttiField.FieldType.TypeKind in [tkString, tkUString,
      tkUnicodeString, tkWString, tkWideChar, tkWideString, tkChar] then
      RttiValue := Value
    else if RttiField.FieldType.TypeKind in [tkEnumeration] then
      RttiValue := Value.ToBoolean
    else if RttiField.FieldType.TypeKind in [tkFloat] then
    begin
      if (RttiField.FieldType.Name = 'TDateTime') then
        RttiValue := TWKUtil.parseDateTime(Value)
      else if (RttiField.FieldType.Name = 'TDate') then
        RttiValue := TWKUtil.parseDate(Value)
      else if (RttiField.FieldType.Name = 'TTime') then
        RttiValue := TWKUtil.parseDateTime(Value)
      else
        RttiValue := TWKUtil.parseFloat(Value);
    end
    else if (RttiField.FieldType.Name = 'TMacAddress') then
      RttiValue := TMacAddress.Create(Value)
    else if (RttiField.FieldType.Name = 'TBytea') then
      RttiValue := TBytea.Create(Value);

    RttiField.SetValue(Instance, RttiValue);
    result := result + FieldName + ';';
  end;
  result := RightStr(result, 1);
end;

function TResourceBaseClass.GetResourceName(AClass: TClass): String;
var
  RttiContext: TRttiContext;
  Classe: TRttiType;
  Attribute: TCustomAttribute;
begin
  RttiContext := TRttiContext.Create;
  Classe := RttiContext.GetType(AClass);
  for Attribute in Classe.GetAttributes do
    if Attribute is Resource then
      result := Resource(Attribute).ResourceName;
end;

function TResourceBaseClass.GetRttiField(Name: String; Instance: TObject)
  : TRttiField;
var
  RttiType: TRttiType;
begin
  RttiType := GetRttiType(Instance);
  result := RttiType.GetField(Name);
end;

function TResourceBaseClass.GetRttiType(Instance: TObject): TRttiType;
var
  RttiContext: TRttiContext;
begin
  RttiContext := TRttiContext.Create;
  result := RttiContext.GetType(Instance.ClassInfo);
end;

procedure TResourceBaseClass.ValidateBusiness(List: TObjectList<TObject>);
begin

end;

procedure TResourceBaseClass.ValidateID(ID: Integer; Instance: TObject);
var
  RttiType: TRttiType;
  RttiField: TRttiField;
  RttiAttribute: TCustomAttribute;
begin
  if not assigned(Instance) then
    exit;

  if ID > 0 then
  begin
    RttiType := GetRttiType(Instance);
    for RttiField in RttiType.GetFields do
      for RttiAttribute in RttiField.GetAttributes do
        if RttiAttribute is DBField then
          if (RttiAttribute as DBField).Constraints = PrimaryKey then
            if RttiField.GetValue(Instance).AsInteger <> ID then
            begin
              TMessage.Create(EDadosNaoSalvos, 'ID Incompatível')
                .SendMessage(FResponse);
              abort
            end;
  end;
end;

function TResourceBaseClass.GetRttiType: TRttiType;
var
  RttiContext: TRttiContext;
begin
  RttiContext := TRttiContext.Create;
  result := RttiContext.GetType(Self.ClassInfo);
end;

procedure TResourceBaseClass.Get(Response: TWebResponse; PageNumber: Integer;
  PageSize: Integer; Direction: String; Sort: String; Search: String;
  ID: String; Join: string; JSON: TJSONObject);

begin
  FFieldsJSON := TStringList.Create;
  if assigned(Response) then
  begin
    FResponse := Response;
    Response.ContentType := 'application/json;charset=UTF-8';
  end;
  OnBeforeGet;
  SetFiltroCnpj(ID, Search);
  TDAO.Select(Response, Self, PageNumber, PageSize, Direction, Sort, Search, ID,
    GetWherePadrao, Join, JSON);
  OnAfterGet;
end;

procedure TResourceBaseClass.Get(AValuesRequest: TValuesRequest);
begin
  FResponse := AValuesRequest.Response;
  FFieldsJSON := TStringList.Create;
  try
    OnBeforeGet;
    SetFiltroCnpj(AValuesRequest.ID, AValuesRequest.Search);
    TDAO.Select(Self, AValuesRequest);
    OnAfterGet;
  finally
    FreeAndNil(FFieldsJSON);
  end;
end;

function TResourceBaseClass.GetWherePadrao: String;
begin
  result := EmptyStr;
end;

procedure TResourceBaseClass.OnAfterDelete;
begin

end;

procedure TResourceBaseClass.OnAfterGet;
begin

end;

procedure TResourceBaseClass.OnAfterPost;
begin

end;

procedure TResourceBaseClass.OnAfterPut;
begin

end;

procedure TResourceBaseClass.OnBeforeDelete;
begin

end;

procedure TResourceBaseClass.OnBeforeGet;
begin

end;

procedure TResourceBaseClass.OnBeforePost;
begin

end;

procedure TResourceBaseClass.OnBeforePut;
begin

end;

{ PERMITIR GRAVAÇÃO DE SUBDETALHES }
function TResourceBaseClass.GetFieldKeys: string;
var
  RttiType: TRttiType;
  RttiField: TRttiField;
  RttiAttribute: TCustomAttribute;
begin
  RttiType := GetRttiType;
  for RttiField in RttiType.GetFields do
    for RttiAttribute in RttiField.GetAttributes do
      if RttiAttribute is DBField then
        if (RttiAttribute as DBField).Constraints = PrimaryKey then
          result := (RttiAttribute as DBField).FieldName;

end;

function TResourceBaseClass.GetFieldValue(FieldName: string): string;
var
  RttiType: TRttiType;
  RttiField: TRttiField;
  RttiAttribute: TCustomAttribute;
begin
  RttiType := GetRttiType;
  for RttiField in RttiType.GetFields do
    for RttiAttribute in RttiField.GetAttributes do
      if RttiAttribute is DBField then
        if (RttiAttribute as DBField).FieldName = FieldName then
        begin
          result := RttiField.GetValue(Self).ToString;
          exit;
        end;
end;

procedure TResourceBaseClass.Post(Response: TWebResponse; Dados: TJSONObject;
  Conection: TConnection = nil);
var
  List: TObjectList<TObject>;

begin
  if Dados = nil then
  begin
    TMessage.Create(EErroGeral, 'Json invalido na requisição')
      .SendMessage(Response);
    exit;
  end;
  FResponse := Response;
  List := TObjectList<TObject>.Create;
  FFieldsJSON := TStringList.Create;
  try
    SetDados(Dados);
    List.Add(Self);
    SetAutoInc(Self);
    ValidateNotNull(Self);
    ValidateBusiness(List);
    OnBeforePost;
    TDAO.Insert(Response, List, Dados, Conection);
    OnAfterPost;
  finally

  end;
end;

procedure TResourceBaseClass.Put(Response: TWebResponse; ID: Integer;
  Dados: TJSONObject; Conection: TConnection = Nil);
var
  List: TObjectList<TObject>;

begin
  if Dados = nil then
  begin
    TMessage.Create(EErroGeral, 'Json invalido na requisição')
      .SendMessage(Response);
    exit;
  end;
  FFieldsJSON := TStringList.Create;
  List := TObjectList<TObject>.Create;
  try
    FResponse := Response;
    List.Add(Self);
    SetDados(Dados);
    ValidarCnpj();

    ValidateID(ID, Self);

    OnBeforePut;
    TDAO.Update(Response, List, TJSONObject(Dados), Conection);
    OnAfterPut;
  finally
    FreeAndNil(List);

  end;
end;

procedure TResourceBaseClass.RemoveFieldsList(AValues: TArray<TValue>);
begin

end;

procedure TResourceBaseClass.SetDados(Dados: TJSONObject);
var
  Item: TJSONPair;
  FieldName: String;
  Value: String;

begin
  for Item in Dados do
  begin
    FieldName := Item.JsonString.Value;
    Value := Item.JsonValue.Value;
    SetValueObject(FieldName, Value, Self);
  end;
end;

procedure TResourceBaseClass.SetOutput(Dados: TJSONObject);
begin
  if assigned(Dados) then
  begin
    FOutpuJson := TJSONObject.ParseJSONValue(Dados.ToJSON, true, true)
      as TJSONObject;
  end;

end;

procedure TResourceBaseClass.SetValueObject(FieldName: String; Value: String;
  Instance: TObject);
var
  RttiField: TRttiField;
  RttiValue: TValue;
begin

  try
    RttiField := GetRttiField(FieldName, Instance);

    if RttiField <> nil then
    begin
      if RttiField.FieldType.TypeKind in [tkInteger] then
      begin
        if LowerCase(Value) = 'null' then
          RttiValue := -1
        else if Value <> EmptyStr then
        begin
          ValidateInteger(FieldName, Value);
          RttiValue := Value.ToInteger;
        end;
      end
      else if RttiField.FieldType.TypeKind
        in [tkString, tkUString, tkUnicodeString, tkWString, tkWideChar,
        tkWideString, tkChar] then
        RttiValue := Value

      else if RttiField.FieldType.TypeKind in [tkEnumeration] then
      begin
        if LowerCase(Value) <> 'null' then
          RttiValue := Value.ToBoolean
      end
      else if RttiField.FieldType.TypeKind in [tkFloat] then
      begin
        if (RttiField.FieldType.Name = 'TDateTime') then
          RttiValue := TWKUtil.parseDateTime(Value)
        else if (RttiField.FieldType.Name = 'TDate') then
          RttiValue := TWKUtil.parseDate(Value)
        else if (RttiField.FieldType.Name = 'TTime') then
          RttiValue := TWKUtil.parseDateTime(Value)
        else
          RttiValue := TWKUtil.parseFloat(Value);

      end
      else if (RttiField.FieldType.Name = 'TMacAddress') then
        RttiValue := TMacAddress.Create(Value)
      else if (RttiField.FieldType.Name = 'TBytea') then
        RttiValue := TBytea.Create(Value);
      RttiField.SetValue(Self, RttiValue);
      if not assigned(FFieldsJSON) then
        FFieldsJSON := TStringList.Create;
      FFieldsJSON.Add(FieldName);
    end;
  except
    on E: Exception do
      raise Exception.Create('Erro na conversão do campo: ' + FieldName +
        ' valor : ' + Value + ' - messagem: ' + E.Message);

  end;
end;

procedure TResourceBaseClass.ValidateInteger(FieldName: String; Value: String);
var
  i: Integer;
begin
  if not(TryStrToInt(Value, i)) then
    TMessage.Create(EDadosNaoSalvos, FieldName + ' deve ser um número válido')
      .SendMessage(FResponse);
end;

procedure TResourceBaseClass.ValidateNotNull(Instance: TObject);
var
  RttiType: TRttiType;
  RttiField: TRttiField;
  RttiAttribute: TCustomAttribute;
begin
  RttiType := GetRttiType(Instance);
  for RttiField in RttiType.GetFields do
    for RttiAttribute in RttiField.GetAttributes do
      if RttiAttribute is DBField then
        if (RttiAttribute as DBField).Constraints in [NotNull] then
          if FFieldsJSON.IndexOf(RttiField.Name) < 0 then
          begin
            TMessage.Create(ECampoNotNullNaoPreenchido,
              RttiField.Name + ' é obrigatório').SendMessage(FResponse);
            abort;
          end;
end;

procedure TResourceBaseClass.ValidateNotNullPut(Instance: TObject;
  AFields: TArray<string>);
var
  RttiType: TRttiType;
  RttiField: TRttiField;
  RttiAttribute: TCustomAttribute;
begin
  RttiType := GetRttiType(Instance);
  var
  LResult := false;
  for RttiField in RttiType.GetFields do
  begin
    for var ItemArray in AFields do
    begin

      if ItemArray.Equals(RttiField.Name) then
      begin
        for RttiAttribute in RttiField.GetAttributes do
        begin
          if RttiAttribute is DBField then
          begin
            if (RttiAttribute as DBField).Constraints in [NotNull] then
            begin

              TMessage.Create(ECampoNotNullNaoPreenchido,
                RttiField.Name + ' é obrigatório').SendMessage(FResponse);
              LResult := true;
              abort
            end;
          end;
        end;
      end;
      if LResult then
        Break;
    end;
  end;
end;

procedure TResourceBaseClass.SetAutoInc(Instance: TObject);
var
  RttiType: TRttiType;
  RttiField: TRttiField;
  RttiAttribute: TCustomAttribute;
  SequenceName: String;
  Value: Integer;
begin
  RttiType := GetRttiType(Instance);
  for RttiField in RttiType.GetFields do
    for RttiAttribute in RttiField.GetAttributes do
      if RttiAttribute is AutoInc then
      begin
        SequenceName := (RttiAttribute as AutoInc).SequenceName;
        Value := GetValueSequence(SequenceName);
        RttiField.SetValue(Instance, Value);
      end;
end;

function TResourceBaseClass.GetValueSequence(SequenceName: String): Integer;

var
  Connection: TConnection;
begin
  Connection := TConnection.Create;
  try
    Connection.Query.SQL.Add('SELECT NEXT VALUE FOR '+SequenceName+'  AS seq');
    Connection.Query.Open;
    result := Connection.Query.FieldByName('seq').AsInteger;
  finally
    Connection.Free;
  end;
end;

end.

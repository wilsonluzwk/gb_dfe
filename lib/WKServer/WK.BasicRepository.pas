unit WK.BasicRepository;

interface

uses
  System.Classes, System.Rtti, System.JSON, Web.HTTPApp, WK.Server.Attributes,
  WK.Server.Message, WK.Server.MessageList, System.Generics.Collections,
  WK.Server.Connection, System.DateUtils, WK.Util, Rest.JSON, WK.Server.Records;

type
  TBasicRepository = class(TPersistent)
  private
    FFieldsJSON: TStringList;
    FRequestData: TJSONObject;
    procedure ValidateInteger(FieldName, Value: String);
    function GetRttiType: TRttiType; overload;
    function GetRttiType(Instance: TObject): TRttiType; overload;

    function GetRttiField(Name: String; Instance: TObject): TRttiField;

    procedure SetValueObject(FieldName: String; Value: String;
      Instance: TObject);

    function GetResourceName(AClass: TClass): String;
    function GetFieldKeys: string;
    function GetFieldValue(FieldName: string): string;
    function IsResourceDetail(Obj: TObject): Boolean;
    function setResponse(coderetorno, respno: Integer; msg: string): string;

  protected
    FResponse: TWebResponse;

    procedure ValidateBusiness(List: TObjectList<TObject>); virtual;

  public
    procedure SerializeRequest(Dados: TJSONObject; Response: TWebResponse);
    procedure ValidateNotNull();
    constructor create();
    destructor Destroy; override;
  end;

implementation

uses
  StrUtils, System.SysUtils, WK.Server.DAO;

{ ---------------------------------------------------------------------------- }
function TBasicRepository.setResponse(coderetorno, respno: Integer;
  msg: string): string;
begin

  Result := '{"codretorno":' + inttostr(coderetorno) + ' ,"msg":"' + msg + '"}'

end;

function TBasicRepository.GetResourceName(AClass: TClass): String;
var
  RttiContext: TRttiContext;
  Classe: TRttiType;
  Attribute: TCustomAttribute;
begin
  RttiContext := TRttiContext.create;
  Classe := RttiContext.GetType(AClass);
  for Attribute in Classe.GetAttributes do
    if Attribute is Resource then
      Result := Resource(Attribute).ResourceName;
end;

function TBasicRepository.GetRttiField(Name: String; Instance: TObject)
  : TRttiField;
var
  RttiType: TRttiType;
begin
  RttiType := GetRttiType(Instance);
  Result := RttiType.GetField(Name);
end;

{ ---------------------------------------------------------------------------- }
function TBasicRepository.GetRttiType(Instance: TObject): TRttiType;
var
  RttiContext: TRttiContext;
begin
  RttiContext := TRttiContext.create;
  Result := RttiContext.GetType(Instance.ClassInfo);
end;

function TBasicRepository.IsResourceDetail(Obj: TObject): Boolean;
BEGIN
end;

procedure TBasicRepository.ValidateBusiness(List: TObjectList<TObject>);
begin

end;

procedure TBasicRepository.ValidateInteger(FieldName, Value: String);
var
  i: Integer;
begin
  if not(TryStrToInt(Value, i)) then
    TMessage.create(EDadosNaoSalvos, FieldName + ' deve ser um número válido')
      .SendMessage(FResponse);

end;

{ ---------------------------------------------------------------------------- }
function TBasicRepository.GetRttiType: TRttiType;
var
  RttiContext: TRttiContext;
begin
  RttiContext := TRttiContext.create;
  Result := RttiContext.GetType(Self.ClassInfo);
end;
{ ---------------------------------------------------------------------------- }

constructor TBasicRepository.create();
begin

  FFieldsJSON := TStringList.create();
end;

destructor TBasicRepository.Destroy;
begin
  FFieldsJSON.Free;
  inherited;

end;

function TBasicRepository.GetFieldKeys: string;
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
          Result := (RttiAttribute as DBField).FieldName;

end;

{ ---------------------------------------------------------------------------- }
function TBasicRepository.GetFieldValue(FieldName: string): string;
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
          Result := RttiField.GetValue(Self).ToString;
          exit;
        end;
end;
{ ---------------------------------------------------------------------------- }

procedure TBasicRepository.SerializeRequest(Dados: TJSONObject;
  Response: TWebResponse);
var
  Item: TJSONPair;
  FieldName: String;
  Value: String;

begin
  FResponse := Response;
  for Item in Dados do
  begin
    FieldName := Item.JsonString.Value;
    Value := Item.JsonValue.Value;
    SetValueObject(FieldName, Value, Self);
  end;
end;

{ ---------------------------------------------------------------------------- }
procedure TBasicRepository.SetValueObject(FieldName: String; Value: String;
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
        RttiValue := TMacAddress.create(Value)
      else if (RttiField.FieldType.Name = 'TBytea') then
        RttiValue := TBytea.create(Value);
      RttiField.SetValue(Self, RttiValue);
      if assigned(FFieldsJSON) then
        FFieldsJSON.Add(FieldName);
    end;
  except
    on E: Exception do
      raise Exception.create('Erro na conversão do campo: ' + FieldName +
        ' valor : ' + Value + ' - messagem: ' + E.Message);

  end;
end;

{ --------------------------------------------------------------------------- }

procedure TBasicRepository.ValidateNotNull();
var
  RttiType: TRttiType;
  RttiField: TRttiField;
  RttiAttribute: TCustomAttribute;
begin
  RttiType := GetRttiType(Self);
  for RttiField in RttiType.GetFields do
    for RttiAttribute in RttiField.GetAttributes do
      if RttiAttribute is DBField then
        if (RttiAttribute as DBField).Constraints in [NotNull] then
          if FFieldsJSON.IndexOf(RttiField.Name) < 0 then
          begin
            TMessage.create(ECampoNotNullNaoPreenchido,
              RttiField.Name + ' é obrigatório').SendMessage(FResponse);
            abort;
          end;
end;

end.

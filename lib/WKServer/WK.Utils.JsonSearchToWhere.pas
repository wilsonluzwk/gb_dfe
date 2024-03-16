unit WK.Utils.JsonSearchToWhere;

interface

uses
  rest.json,
  system.json,
  system.Generics.Collections,
  WK.Server.Attributes,
  system.Character,
  system.SysUtils,
  system.StrUtils,

  system.Rtti,
  rest.json.Types;

{$M+}

type
  TFiltroField = class
  private
    FOperador: string;

  published
    property Operador: string read FOperador write FOperador;

  end;

  TSearchFilter = class
  private
    FFiltroField: TFiltroField;
    lastFieldType: string;
    lfiltros: TJSONObject;
    latribs: TJSONObject;
    optArray: TJSONArray;
    JSonValue: TJSonValue;
    Resource: TObject;
    lfield: string;
    lvalue: string;
    loperator: string;
    concact: string;
    FwhereFilter: string;
    FinputJson: string;
    procedure makeFilter;
    function GetTableName(Obj: TObject): String;
    function GetFieldAlias(value: string): string;
    function decodeOperador(value: string): string;
    procedure processInOperator();
    procedure processOrOperator();
    procedure processbetweenOperator();
    function parseValue(value: string): string;
    procedure ProcessJsonObject(Obj: TJSONObject; oindex: Integer);
    procedure SetFieldType(RttiField: TRttiField);

  published
    property FiltroField: TFiltroField read FFiltroField;
    property whereFilter: string read FwhereFilter write FwhereFilter;
  public
    constructor Create(Obj: TObject; filterSearch: string);
    destructor Destroy; override;

  end;

type
  TSearchFilters = TObjectList<TSearchFilter>;

const
  cop_not = ' <> ';
  cop_notin = ' not in ';
  cop_in = ' in ';
  cop_dif = ' <> ';
  cop_or = ' or ';
  cop_and = ' and ';
  cop_gt = ' > ';
  cop_gte = ' >= ';
  cop_lt = ' < ';
  cop_lte = ' <= ';
  cop_bt = ' between ';

implementation

{ TSearchFilter }
function TSearchFilter.decodeOperador(value: string): string;
begin
  if value = '$not' then
    result := cop_not
  else if value = '$in' then
    result := cop_in
  else if value = '$nin' then
    result := cop_notin
  else if value = '$or' then
    result := cop_or
  else if value = '$and' then
    result := cop_and
  else if value = '$gt' then
    result := cop_gt
  else if value = '$gte' then
    result := cop_gte
  else if value = '$lt' then
    result := cop_lt
  else if value = '$lte' then
    result := cop_lte
  else if value = '$bt' then
    result := cop_bt
  else

end;

function TSearchFilter.parseValue(value: string): string;
var
  i: Integer;
begin
  result := value;
  if TryStrToInt(value, i) then
    result := value
  else
    result := QuotedStr(value);
end;

procedure TSearchFilter.processbetweenOperator;
var
  sep: string;
  aindex: Integer;
begin

  sep := '';
  for aindex := 0 to optArray.Count - 1 do
  begin
    lvalue := lvalue + sep + QuotedStr(optArray.Items[aindex].value);
    sep := ' and  ';
  end;

end;

procedure TSearchFilter.processInOperator();
var
  sep: string;
  index: Integer;
begin
  lvalue := '( ';
  sep := '';
  for index := 0 to optArray.Count - 1 do
  begin
    lvalue := lvalue + sep + parseValue(optArray.Items[index].value);

    sep := ',';
  end;
  lvalue := lvalue + ' ) ';
end;

procedure TSearchFilter.processOrOperator();
var
  sep: string;
  index: Integer;
  orFilter: string;
  orOperator: string;
begin
  orFilter := '';
  sep := '';
  for index := 0 to optArray.Count - 1 do
  begin
    lvalue := '';
    lfield := '';
    loperator := '';
    if optArray.Items[index] is TJSONObject then
      ProcessJsonObject(optArray.Items[index] as TJSONObject, 0);
    if orOperator = '' then

      orOperator := '=';
    if lfield <> '' then
    begin
      if lastFieldType = 'string' then
        orFilter := orFilter + sep + 'lower(' + lfield + ') LIKE lower( ' +
          QuotedStr('%' + StringReplace(LowerCase(lvalue), '''', '',
          [rfReplaceAll, rfIgnoreCase]) + '%') + ')'
      else
        orFilter := orFilter + sep + lfield + orOperator + lvalue;
    end;
    sep := ' or ';
  end;
  if orFilter <> '' then
  begin
    lvalue := '';
    lfield := '';
    orFilter := '( ' + orFilter + ' ) ';
    if FwhereFilter <> '' then
      FwhereFilter := FwhereFilter + ' or ' + orFilter
    else
      FwhereFilter := orFilter;
  end;
end;

function GetRttiType(Obj: TObject): TRttiType;
var
  RttiContext: TRttiContext;
begin
  RttiContext := TRttiContext.Create;
  result := RttiContext.GetType(Obj.ClassInfo);
end;

function TSearchFilter.GetTableName(Obj: TObject): String;
var
  RttiType: TRttiType;
  RttiAttribute: TCustomAttribute;
begin
  result := EmptyStr;
  RttiType := GetRttiType(Obj);
  for RttiAttribute in RttiType.GetAttributes do
    if RttiAttribute is Table then
      result := (RttiAttribute as Table).TableName;
end;

procedure TSearchFilter.SetFieldType(RttiField: TRttiField);
begin

  if RttiField.FieldType.TypeKind in [tkInteger] then
  begin
    lastFieldType := 'integer';
  end
  else if RttiField.FieldType.TypeKind in [tkString, tkUString, tkUnicodeString,
    tkWString, tkWideChar, tkWideString, tkChar] then
  begin
    lastFieldType := 'string';
  end
  else if RttiField.FieldType.TypeKind in [tkFloat] then
  begin
    case IndexStr(RttiField.FieldType.Name, ['TDateTime', 'TDate', 'TTime']) of
      0:
        begin
          lastFieldType := 'datetime';
        end;
      1:
        begin
          lastFieldType := 'date';
        end;
      2:
        begin
          lastFieldType := 'time';
        end;
    else
      begin
        lastFieldType := 'float';
      end;
    end;
  end
  else if RttiField.FieldType.TypeKind in [tkEnumeration] then
  begin
    lastFieldType := 'boolean';
  end
  else if RttiField.FieldType.TypeKind in [tkRecord] then
  begin
    case IndexStr(RttiField.FieldType.Name, ['TDateTime']) of
      0:
        begin
          lastFieldType := 'datetime';
        end;
    end;
  end
  else if RttiField.FieldType.Name = 'TMacAddress' then
  begin
    lastFieldType := 'macadress';
  end
  else if RttiField.FieldType.Name = 'TBytea' then
  begin
    lastFieldType := 'blob';
  end
  else
  begin
    lastFieldType := 'string';
  end;
end;

function TSearchFilter.GetFieldAlias(value: string): string;
var
  RttiType: TRttiType;
  RttiField: TRttiField;
  RttiAttribute: TCustomAttribute;
begin
  result := '';
  RttiType := GetRttiType(Resource);
  for RttiField in RttiType.GetFields do
    for RttiAttribute in RttiField.GetAttributes do
      if RttiAttribute is DbField then
      begin
        if RttiField.Name.ToLower = LowerCase(value) then
        begin
          lastFieldType := '';

          SetFieldType(RttiField);

          if (RttiAttribute as DbField).TableSource <> '' then
            result := (RttiAttribute as DbField).TableSource + '.' +
              (RttiAttribute as DbField).FieldName
          else
            result := GetTableName(Resource) + '.' + (RttiAttribute as DbField)
              .FieldName
        end;
      end;

end;

procedure TSearchFilter.ProcessJsonObject(Obj: TJSONObject; oindex: Integer);
var
  index: Integer;

begin
  if (Obj.Pairs[oindex].JSonValue is TJSONObject) then
  begin
    latribs := (Obj.Pairs[oindex].JSonValue as TJSONObject);
    lfield := GetFieldAlias(Obj.Pairs[oindex].JsonString.value);
  end
  else
  begin
    latribs := Obj;
    lfield := GetFieldAlias(Obj.Pairs[oindex].JsonString.value);
  end;
  if lfield <> '' then
  begin
    for index := 0 to latribs.Count - 1 do
    begin
      loperator := decodeOperador(latribs.Pairs[index].JsonString.value);
      if (latribs.Pairs[index].JSonValue is TJSONArray) then
      begin
        optArray := (latribs.Pairs[index].JSonValue as TJSONArray);
        if loperator = cop_in then
          processInOperator()
        else if loperator = cop_bt then
          processbetweenOperator
        else  if loperator = cop_notin then
          processInOperator() ;
      end
      else
      begin
        lvalue := parseValue(latribs.Pairs[index].JSonValue.value);
      end;
    end;
  end;
end;

procedure TSearchFilter.makeFilter;
var
  indexCampo: Integer;
  indexAtribs: Integer;
Begin
  for indexCampo := 0 to lfiltros.Count - 1 do
  begin
    loperator := '=';
    lvalue := '';
    lfield := '';
    if (lfiltros.Pairs[indexCampo].JSonValue is TJSONObject) then
    begin
      ProcessJsonObject(lfiltros, indexCampo);
    end
    else
    begin
      if (lfiltros.Pairs[indexCampo].JSonValue is TJSONArray) then
      begin
       //EXMPLO search={"nomefantasia":"Qer" ,"$or":[{"cnpj":"59"}]}
        optArray := lfiltros.Pairs[indexCampo].JSonValue as TJSONArray;
        if LowerCase(lfiltros.Pairs[indexCampo].JsonString.value) = '$or' then
          processOrOperator;

      end
      else
      begin
        lfield := GetFieldAlias(lfiltros.Pairs[indexCampo].JsonString.value);
        if lfield <> '' then
          lvalue := parseValue(lfiltros.Pairs[indexCampo].JSonValue.value);
      end;
    end;
    if (concact = '') and (FwhereFilter <> '') then
      concact := ' AND ';
    if lfield <> '' then
    begin
      if (lastFieldType = 'string') and (loperator = '=') then

        FwhereFilter := FwhereFilter + '  ' + concact + 'lower(' + lfield + ' )'
          + ' LIKE lower( ' + QuotedStr('%' + StringReplace(LowerCase(lvalue),
          '''', '', [rfReplaceAll, rfIgnoreCase]) + '%') + ')' + #13#10

      else
        FwhereFilter := FwhereFilter + '  ' + concact + lfield + loperator +
          lvalue + #13#10;
    end;
  end;
  if FwhereFilter <> '' then
    FwhereFilter := 'WHERE' + #13#10 + FwhereFilter;
end;

constructor TSearchFilter.Create(Obj: TObject; filterSearch: string);
begin
  concact := '';
  Resource := Obj;
  FinputJson := filterSearch;
  lfiltros := TJSONObject.Create;
  JSonValue := lfiltros.ParseJSONValue(FinputJson);
  lfiltros := (JSonValue as TJSONObject);
  FFiltroField := TFiltroField.Create;
  makeFilter;
end;

destructor TSearchFilter.Destroy;
begin
  FFiltroField.Free;
  FreeAndNil(lfiltros);
  inherited;
end;

end.

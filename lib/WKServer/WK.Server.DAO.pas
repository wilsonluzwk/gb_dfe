unit WK.Server.DAO;

interface

uses
  WK.Server.Message,
  System.Rtti,
  WK.Server.Attributes,
  System.SysUtils,
  FireDAC.Stan.Param,
  WK.Utils.JsonSearchToWhere,
  FireDAC.Comp.Client,

  Web.HTTPApp,
  System.JSON,
  System.Generics.Collections,
  WK.Server.Connection,
  WK.Server.MessageList,
  System.DateUtils,
  System.Classes,
  WK.Util,
  WK.Server.Records,
  WK.Server.ResourceBaseClass,

  Data.DB;

type
  TExec = (teInsert, teUpdate, teDelete);
  TPesquisa = (tpInicio, tpTodoCampo, tpFim);

  TDAO = class
  private

    class function GetFields(Obj: TObject; ListHeader: Boolean = False;
      ListSelect: Boolean = False): String;
    class function GetWhere(Obj: TObject; ID: String; Search: String;
      WherePadrao: String; TipoPesquisa: TPesquisa): String; overload;

    Class function GetWhere(ID: string; Obj: TObject; Search: string)
      : String; overload;
    class function GetOrder(Obj: TObject; Sort: String;
      Direction: String): String;

    class procedure SetFieldsAndParams(Tipo: TExec; Obj: TObject;
      var FieldsName: String; var ParamsOrWhereName: String; Params: TFDParams;
      Dados: TJSONObject);

    class procedure SetParams(Obj: TObject; RttiField: TRttiField;
      RttiAttribute: TCustomAttribute; Params: TFDParams);

    class function GetSqlJoin(Obj: TObject): string;

    class function GetJsonValue(Obj: TObject; var OutJSONValue: JSONValue;
      var OutNameField: string): TObject;
    class procedure ProcessDetail(AValuesRequest: TValuesRequest; Obj: TObject;
      var DataJson: TJSONObject; Connection: TConnection;
      MasterValue, ParentNode: string);

    { OPEN QUERY }
    class function OpenQuery(Response: TWebResponse; lSQL: string;
      Connection: TConnection = nil): TJSONArray; overload; static;

    class function OpenQuery(const AValuesRequest: TValuesRequest;
      const ASQL: string; Resource: TObject): TJSONArray; overload; static;

    class function OpenQueryDetail(const AValuesRequest: TValuesRequest;
      Resource: TObject; Connection: TConnection; MasterValue, FKField: string)
      : TJSONArray;

    class procedure OpenQuerySubDetail(const AValuesRequest: TValuesRequest;
      const ASQL: string; Resource: TObject; Connection: TConnection;
      DadosArray: TJSONArray);

    { DATASETTOBJECTJSON }
    class function DataSetToJSONObject(ADataSet: TDataSet): TJSONObject;

    class Function FielIsLookUp(Field: DbField; Obj: TObject): Boolean;
    class procedure SetResourceListArray(Obj: TObject; lDados: TJSONArray);

    // --
    class function GetPrimaryKeyName(Instance: TObject): String;
  public
    class procedure SetDadosInMessage(Obj: TObject; var Result: TMessageType;
      JsonImput: TJSONObject; aResourceName: string; pChave: string = '';
      aJSONArray: TJSONArray = nil);
    { SELECT }
    class procedure Select(Response: TWebResponse; Obj: TObject;
      PageNumber: Integer; PageSize: Integer; Direction: String; Sort: String;
      Search: String; ID: String; WherePadrao: String; Join: string;
      JSON: TJSONObject); overload;
    class procedure Select(Obj: TObject;
      AValuesRequest: TValuesRequest); overload;
    { INSERT }
    class procedure Insert(Response: TWebResponse;
      ListObj: TObjectList<TObject>; Dados: TJSONObject;
      Conn: TConnection = nil);
    { UPDATE }
    class procedure Update(Response: TWebResponse;
      ListObj: TObjectList<TObject>; Dados: TJSONObject;
      Conn: TConnection = nil);
    { DELETE }
    class procedure Delete(Response: TWebResponse; Obj: TObject;
      Condicao: string = ''; Conn: TConnection = nil);
    class procedure DeleteDetails(RttiAttribute: TCustomAttribute;
      Obj, ResourceObj: TObject; Conn: TConnection);
  end;

var
  lTotalElements: Integer;

implementation

uses
  System.StrUtils, System.Variants;

{ TDAO }
class function TDAO.GetPrimaryKeyName(Instance: TObject): String;
var
  RttiType: TRttiType;
  RttiField: TRttiField;
  RttiAttribute: TCustomAttribute;
begin
  RttiType := TWKUtil.GetRttiType(Instance);
  for RttiField in RttiType.GetFields do
    for RttiAttribute in RttiField.GetAttributes do
      if RttiAttribute is DbField then
        if (RttiAttribute as DbField).Constraints = PrimaryKey then
          Result := (RttiAttribute as DbField).FieldName;
end;

{ ------------------------------------------------------------------------------ }
class procedure TDAO.Insert(Response: TWebResponse;
  ListObj: TObjectList<TObject>; Dados: TJSONObject; Conn: TConnection = nil);

var
  PrimaryKeyName: string;
  SQL: string;
  Connection: TConnection;
  TableName: String;
  FieldsName: String;
  ParamsName: String;
  Params: TFDParams;
  Mensagem: TMessageType;
  Obj: TObject;
  RttiType: TRttiType;
  LChave: string;
  LJSONArray: TJSONArray;
begin
  Mensagem := IRegistroInserido;
  if not assigned(Conn) then
  begin
    Connection := TConnection.Create;
    Connection.DB.StartTransaction;
  end
  else
    Connection := Conn;
  if ListObj.Count > 1 then
    LJSONArray := TJSONArray.Create;
  try
    try
      for Obj in ListObj do
      begin
        PrimaryKeyName := GetPrimaryKeyName(Obj);

        SQL := 'INSERT INTO %s (%s) VALUES (%s)';
        Params := TFDParams.Create;
        TableName := TWKUtil.GetTableName(Obj);
        SetFieldsAndParams(teInsert, Obj, FieldsName, ParamsName,
          Params, Dados);
        Connection.Query.SQL.Clear;
        Connection.Query.SQL.Add(Format(SQL, [TableName, FieldsName,
          ParamsName]));
        if DebugHook > 0 then
          TWKUtil.SaveSql(Connection.Query, 'InsertDebug');
        Connection.Query.Params := Params;
        Connection.Query.ExecSQL;

        if ListObj.Count = 1 then
          SetDadosInMessage(Obj, Mensagem, NIL, '', LChave)
        else
          SetDadosInMessage(Obj, Mensagem, NIL, 'Detail', LChave, LJSONArray);
        RttiType := TWKUtil.GetRttiType(Obj);
      end;
      if not assigned(Conn) then
        Connection.DB.Commit;
      if assigned(Response) then
        TMessage.Create(Mensagem).SendMessage(Response);
    except
      on e: Exception do
      begin
{$IFDEF CONSOLE}
        Writeln('Erro ao inserir  : ' + e.Message);
{$ENDIF}
        Connection.DB.Rollback;
        if assigned(Response) then
          TMessage.Create(EDadosNaoSalvos, e.Message).SendMessage(Response)
        else
          raise Exception.Create(e.Message);
      end;
    end;
  finally
    if not assigned(Conn) then
      Connection.Free;
  end;
end;

{ ------------------------------------------------------------------------------ }
class procedure TDAO.SetResourceListArray(Obj: TObject; lDados: TJSONArray);
var
  i: Integer;
  List: TObjectList<TObject>;
begin
  List := TObjectList<TObject>.Create;
  List.Add(Obj);
  if (Obj is TResourceBaseClass) then
  begin
    TResourceBaseClass(Obj).JsonArrayList := lDados;
    for i := 0 to lDados.Count - 1 do
      TResourceBaseClass(Obj).SetDados(TJSONObject(lDados.Items[i]));
  end;
end;

{ ------------------------------------------------------------------------------ }
class procedure TDAO.SetFieldsAndParams(Tipo: TExec; Obj: TObject;
  var FieldsName: String; var ParamsOrWhereName: String; Params: TFDParams;
  Dados: TJSONObject);
var
  RttiType: TRttiType;
  RttiField: TRttiField;
  LstFieldsJson: TStringList;
  RttiAttribute: TCustomAttribute;
  AliasTableName: String;
  DefaultAlias: string;
  Item: TJSONPair;
  procedure SetCamposChave();
  begin
    if ParamsOrWhereName <> EmptyStr then
      ParamsOrWhereName := ParamsOrWhereName + ' AND ';
    ParamsOrWhereName := ParamsOrWhereName + #13#10 + AliasTableName +
      (RttiAttribute as DbField).FieldName + ' = :' + (RttiAttribute as DbField)
      .FieldName;
  end;

begin
  LstFieldsJson := TStringList.Create;
  try
    if assigned(Dados) then
    begin
      for Item in Dados do
      begin
        LstFieldsJson.Add(LowerCase(Item.JsonString.Value));
      end;
    end;
    FieldsName := EmptyStr;
    ParamsOrWhereName := EmptyStr;
    RttiType := TWKUtil.GetRttiType(Obj);
    DefaultAlias := TWKUtil.GetTableName(Obj) + '.';
    for RttiField in RttiType.GetFields do
    begin
      for RttiAttribute in RttiField.GetAttributes do
        if RttiAttribute is DbField then
        begin
          AliasTableName := DefaultAlias;
          if ((RttiAttribute as DbField).TableSource <> '') then
            AliasTableName := (RttiAttribute as DbField).TableSource + '.';
          if ((RttiAttribute as DbField).Expression = true) then
            AliasTableName := '';

          if (((RttiAttribute as DbField).Constraints = PrimaryKey) and
            (Tipo in [teUpdate, teDelete])) then
            SetCamposChave()

          else
          begin
            if (RttiAttribute as DbField).Expression = true then
              Continue;

            if (Tipo in [teUpdate]) then
              if assigned(Dados) then
                if LstFieldsJson.IndexOf(LowerCase(RttiField.Name)) < 0 then
                  Continue;
            if (Tipo in [teInsert]) then
              if (RttiAttribute as DbField).Constraints = PrimaryKey then
                Continue;
            if (FielIsLookUp(RttiAttribute as DbField, Obj)) then
              Continue;

            if (Tipo in [teUpdate, teDelete, teInsert]) then
              FieldsName := FieldsName + #13#10 + (RttiAttribute as DbField)
                .FieldName
            else
              FieldsName := FieldsName + #13#10 + AliasTableName +
                (RttiAttribute as DbField).FieldName;
            if Tipo = teUpdate then
            begin
              FieldsName := FieldsName + ' = :' + (RttiAttribute as DbField)
                .FieldName;
              if RttiField.FieldType.Name = 'TMacAddress' then
                FieldsName := FieldsName + '::macaddr'
              else if RttiField.FieldType.Name = 'TBytea' then
                FieldsName := FieldsName + '::bytea'
            end;
            FieldsName := FieldsName + ',';
          end;
          SetParams(Obj, RttiField, RttiAttribute, Params);

        end;
    end;
    FieldsName := FieldsName.TrimRight([',']);
    // PARAMETROS
    if Tipo = teInsert then
    begin
      ParamsOrWhereName := ':' + StringReplace(FieldsName, ',', ',:',
        [rfReplaceAll]);
      ParamsOrWhereName := EmptyStr;
      RttiType := TWKUtil.GetRttiType(Obj);
      for RttiField in RttiType.GetFields do
      begin
        for RttiAttribute in RttiField.GetAttributes do
          if (RttiAttribute is DbField) and
            ((not assigned((RttiAttribute as DbField).AutoIncrement)) and
            ((RttiAttribute as DbField).Constraints <> PrimaryKey))

          then
          begin
            if (RttiAttribute as DbField).Expression = true then
              Continue;
            if (FielIsLookUp(RttiAttribute as DbField, Obj)) then
              Continue;
            ParamsOrWhereName := ParamsOrWhereName + ':' +
              (RttiAttribute as DbField).FieldName;
            if RttiField.FieldType.Name = 'TPoint' then
              ParamsOrWhereName := ParamsOrWhereName + '::point'
            else if RttiField.FieldType.Name = 'TMacAddress' then
              ParamsOrWhereName := ParamsOrWhereName + '::macaddr'
            else if RttiField.FieldType.Name = 'TBytea' then
              ParamsOrWhereName := ParamsOrWhereName + '::bytea'
            else if RttiField.FieldType.Name = 'TIP' then
              ParamsOrWhereName := ParamsOrWhereName + '::inet';
            ParamsOrWhereName := ParamsOrWhereName + ',';
          end;
      end;
      ParamsOrWhereName := ParamsOrWhereName.TrimRight([',']);
    end
    else if Tipo in [teUpdate, teDelete] then
      ParamsOrWhereName := ParamsOrWhereName.TrimRight([',']);

  finally
    FreeAndNil(LstFieldsJson);
  end;
end;

{ ------------------------------------------------------------------------------ }
class function TDAO.GetFields(Obj: TObject; ListHeader: Boolean = False;
  ListSelect: Boolean = False): String;
var
  RttiType: TRttiType;
  RttiField: TRttiField;
  RttiAttribute: TCustomAttribute;
  AliasTableName: String;
  DefaultAlias: string;
begin
  Result := EmptyStr;
  RttiType := TWKUtil.GetRttiType(Obj);
  DefaultAlias := TWKUtil.GetTableName(Obj) + '.';
  for RttiField in RttiType.GetFields do
    for RttiAttribute in RttiField.GetAttributes do
      if RttiAttribute is DbField then
      begin
        if not DbField(RttiAttribute).ListSelect then
          Continue;
        if (RttiAttribute as DbField).ObjectJson then
          Continue;

        AliasTableName := DefaultAlias;
        if (RttiAttribute as DbField).TableSource <> '' then
          AliasTableName := (RttiAttribute as DbField).TableSource + '.';

        if (RttiAttribute as DbField).Expression = true then
          AliasTableName := '';
        if ((RttiAttribute as DbField).Header) or
          ((RttiAttribute as DbField).ListSelect) then
          Result := Result + #13#10 + '     ' + AliasTableName +
            (RttiAttribute as DbField).FieldName + ' as "' +
            RttiField.Name + '",';
      end;
  Result := Result.TrimRight([',']);
end;

{ ------------------------------------------------------------------------------ }
class function TDAO.GetOrder(Obj: TObject; Sort: String;
  Direction: String): String;
var
  RttiType: TRttiType;
  RttiField: TRttiField;
  RttiAttribute: TCustomAttribute;
  Padrao: String;
  AliasTableName: String;
  DefaultAlias: string;
begin
  Result := EmptyStr;
  Padrao := EmptyStr;
  RttiType := TWKUtil.GetRttiType(Obj);
  DefaultAlias := TWKUtil.GetTableName(Obj) + '.';
  for RttiField in RttiType.GetFields do
    for RttiAttribute in RttiField.GetAttributes do
      if RttiAttribute is DbField then
      begin
        AliasTableName := DefaultAlias;
        if (RttiAttribute as DbField).TableSource <> '' then
          AliasTableName := (RttiAttribute as DbField).TableSource + '.';
        if (RttiAttribute as DbField).Sort then
        begin
          if Padrao <> EmptyStr then
            Padrao := Padrao + ',';
          Padrao := Padrao + #13#10 + AliasTableName +
            (RttiAttribute as DbField).FieldName;
          if Direction = 'desc' then
            Padrao := Padrao + ' DESC';

        end;
        if LowerCase(RttiField.Name) = LowerCase(Sort) then
        begin
          Result := #13#10 + ' ORDER BY ' + #13#10 + AliasTableName +
            (RttiAttribute as DbField).FieldName;
          if Direction = 'desc' then
            Result := Result + ' DESC';
        end;
      end;
  if Result = EmptyStr then
    if Padrao <> EmptyStr then
      Result := #13#10 + ' ORDER BY ' + Padrao;
end;

{ ------------------------------------------------------------------------------ }
class function TDAO.DataSetToJSONObject(ADataSet: TDataSet): TJSONObject;
var
  Field: TField;
begin
  Result := TJSONObject.Create;
  for Field in ADataSet.Fields do
  begin
    if Field.IsNull then
      Result.AddPair(LowerCase(Field.FieldName), TJSONNull.Create)
    else if Field.DataType = ftInteger then
      Result.AddPair(LowerCase(Field.FieldName),
        TJSONNumber.Create(Field.AsInteger))
    else if Field.DataType = ftBoolean then
    begin
      Result.AddPair(LowerCase(Field.FieldName),
        TJSONBool.Create(Field.AsBoolean))
    end
    else if Field.DataType in [ftDate] then
      Result.AddPair(LowerCase(Field.FieldName),
        Copy(DateToISO8601(Field.AsFloat), 1, 10))

    else if Field.DataType = ftTimeStamp then
      Result.AddPair(LowerCase(Field.FieldName),
        DateToISO8601(Field.AsDateTime))

    else if Field.DataType in [ftBCD, ftCurrency] then
      Result.AddPair(LowerCase(Field.FieldName),
        TJSONNumber.Create(Field.AsCurrency))

    else if Field.DataType in [ftFloat] then
      Result.AddPair(LowerCase(Field.FieldName),
        TJSONNumber.Create(Field.AsFloat))

    else if Field.DataType in [ftBlob, ftByte] then
      if ADataSet.RecordCount = 1 then

        Result.AddPair(LowerCase(Field.FieldName),
          TJSONString.Create(TrimRight(Field.AsString)))
      else
        Result.AddPair(LowerCase(Field.FieldName), '')
    else
      Result.AddPair(LowerCase(Field.FieldName), Field.AsString);
  end;
end;

{ ------------------------------------------------------------------------------ }
class procedure TDAO.Delete(Response: TWebResponse; Obj: TObject;
  Condicao: string = ''; Conn: TConnection = nil);
const
  SQL = 'DELETE FROM %s WHERE %s';
var
  TableName: String;
  Connection: TConnection;
  FieldsName: String;
  WhereCondition: String;
  Params: TFDParams;
  Mensagem: TMessageType;
  i: Integer;
begin
  Mensagem := IRegistroExcluido;
  try
    try
      if not assigned(Conn) then
      begin
        Connection := TConnection.Create;

      end
      else
        Connection := Conn;
      Mensagem := IRegistroExcluido;
      Params := TFDParams.Create;
      TableName := TWKUtil.GetTableName(Obj);

      if Condicao <> '' then
        Connection.Query.ExecSQL(Format(SQL, [TableName, Condicao]))
      else
      begin
        SetFieldsAndParams(teDelete, Obj, FieldsName, WhereCondition,
          Params, nil);

        Connection.Query.SQL.Clear;
        Connection.Query.SQL.Add(Format(SQL, [TableName, WhereCondition]));
        Connection.Query.Params := Params;

        Connection.Query.ExecSQL;

      end;
      if assigned(Response) then
        TMessage.Create(Mensagem).SendMessage(Response);
    except
      on e: Exception do
      begin
{$IFDEF LINUX}
        Writeln('Erro ao excluir  : ' + e.Message);
{$ENDIF}
        if assigned(Response) then
          TMessage.Create(EDadosNaoExcluidos, e.Message).SendMessage(Response)
        else
          raise Exception.Create(e.Message);
      end;
    end;
  finally
    if not assigned(Conn) then
      Connection.Free;
  end;
end;

{ ------------------------------------------------------------------------------ }
class procedure TDAO.SetParams(Obj: TObject; RttiField: TRttiField;
  RttiAttribute: TCustomAttribute; Params: TFDParams);
var
  lParam: TFDParam;
  LAttribute: TCustomAttribute;

begin
  lParam := Params.Add;
  lParam.Name := (RttiAttribute as DbField).FieldName;
  lParam.ParamType := ptInput;

  if RttiField.FieldType.TypeKind in [tkInteger] then
  begin
    lParam.DataType := ftInteger;
    if RttiField.GetValue(Obj).AsInteger < 0 then
      lParam.Value := Null
    else
      lParam.Value := RttiField.GetValue(Obj).AsInteger;
  end
  else if RttiField.FieldType.TypeKind in [tkString, tkUString, tkUnicodeString,
    tkWString, tkWideChar, tkWideString, tkChar] then
  begin
    lParam.DataType := ftString;
    if Length(  (RttiField.GetValue(Obj).AsString)) >4000 then
       lParam.DataType := ftWideMemo;

    for LAttribute in RttiField.GetAttributes do
    begin
      if (LAttribute is DBFieldTypeMemo) then
      begin
        lParam.DataType := ftWideMemo;
        break;
      end;
    end;
    if LowerCase(RttiField.GetValue(Obj).AsString) = 'null' then
      lParam.Value := Null
    else
      lParam.Value := (RttiField.GetValue(Obj).AsString);
  end
  else if RttiField.FieldType.TypeKind in [tkFloat] then
  begin
    case IndexStr(RttiField.FieldType.Name, ['TDateTime', 'TDate', 'TTime']) of
      0:
        begin
          lParam.DataType := ftDateTime;
          lParam.Value := RttiField.GetValue(Obj).AsType<TDateTime>;
        end;
      1:
        begin
          lParam.DataType := ftDate;
          lParam.Value := RttiField.GetValue(Obj).AsType<TDate>;
        end;
      2:
        begin
          lParam.DataType := ftTime;
          lParam.Value := RttiField.GetValue(Obj).AsType<TTime>;
        end;
    else
      begin
        lParam.DataType := ftFloat;
        lParam.Value := RttiField.GetValue(Obj).AsExtended;
      end;
    end;
  end
  else if RttiField.FieldType.TypeKind in [tkEnumeration] then
  begin
    lParam.DataType := ftBoolean;
    lParam.Value := RttiField.GetValue(Obj).AsBoolean;
  end
  else if RttiField.FieldType.TypeKind in [tkRecord] then
  begin
    case IndexStr(RttiField.FieldType.Name, ['TDateTime']) of
      0:
        begin
          lParam.DataType := ftDateTime;
          lParam.Value := RttiField.GetValue(Obj).AsType<TDateTime>;
        end;
    end;
  end
  else if RttiField.FieldType.Name = 'TMacAddress' then
  begin
    lParam.DataType := ftString;
    lParam.Value := TMacAddress(RttiField.GetValue(Obj).AsObject).Value;
  end
  else if RttiField.FieldType.Name = 'TBytea' then
  begin
    lParam.DataType := ftBlob;
    if assigned(TBytea(RttiField.GetValue(Obj).AsObject)) then

      lParam.Value := TBytea(RttiField.GetValue(Obj).AsObject).Value.Text;
  end
  else
  begin
    lParam.DataType := ftString;
    lParam.Value := RttiField.GetValue(Obj).AsString;
  end;

end;

{ ------------------------------------------------------------------------------ }
class procedure TDAO.Select(Response: TWebResponse; Obj: TObject;
  PageNumber: Integer; PageSize: Integer; Direction: String; Sort: String;
  Search: String; ID: String; WherePadrao: String; Join: string;
  JSON: TJSONObject);
const
  SQL = 'SELECT %s   FROM %s %s %s %s %s';
var
  lFields: String;
  lTableName: String;
  lWhere: String;
  lOrder: String;
  lPagination: String;
  lSQL: String;
  lDados: TJSONArray;
  lResult: TJSONObject;
  lTotalPages: Integer;
  lJoin: string;
  LTpPesquisa: TPesquisa;
  LValueTypeSearch: string;
begin
  LTpPesquisa := tpTodoCampo;
  if assigned(JSON) then
  begin
    LValueTypeSearch := JSON.GetValue<string>('TypeSearch').ToLower;
    if (LValueTypeSearch = 'first') then
      LTpPesquisa := tpInicio
    else if LValueTypeSearch = 'all' then
      LTpPesquisa := tpTodoCampo
    else if LValueTypeSearch = 'last' then
      LTpPesquisa := tpFim;
  end;
  if ID = 'list-select' then
    lFields := GetFields(Obj, False, true)
  else if ID = EmptyStr then
    lFields := GetFields(Obj, true)
  else
    lFields := GetFields(Obj);
  lTableName := TWKUtil.GetTableName(Obj);
  lJoin := GetSqlJoin(Obj);
  if pos('{', Search) > 0 then
  begin
    if assigned(TJSONObject.ParseJSONValue(Search)) then
      lWhere := GetWhere(ID, Obj, Search)
    else
      raise Exception.Create('Json informado na consulta e invalido !');
  end
  else
    lWhere := GetWhere(Obj, ID, Search, WherePadrao, LTpPesquisa);
  lOrder := GetOrder(Obj, Sort, Direction);

  lSQL := Format(SQL, [lFields, lTableName, lJoin, lWhere, lOrder,
    lPagination]);
  lDados := OpenQuery(Response, lSQL);

  SetResourceListArray(Obj, lDados);
  if ID = 'list-select' then
  begin
    Response.Content := lDados.ToString;
    Response.ContentType := 'application/json;charset=UTF-8';
    Response.SendResponse;
  end
  else if ID = EmptyStr then
  begin
    lResult := TJSONObject.Create;
    lResult.AddPair('content', lDados);
    lResult.AddPair('totalElements', TJSONNumber.Create(lTotalElements));
    if (lTotalElements mod PageSize) <> 0 then
      lTotalPages := (lTotalElements div PageSize) + 1
    else
      lTotalPages := (lTotalElements div PageSize);
    lResult.AddPair('totalPages', TJSONNumber.Create(lTotalPages));
    lResult.AddPair('pageSize', TJSONNumber.Create(PageSize));
    lResult.AddPair('pageNumber', TJSONNumber.Create(PageNumber));
    if assigned(Response) then
    begin
      Response.Content := lResult.ToString;
      TWKUtil.compactarResponse(Response);
      Response.ContentType := 'application/json;charset=UTF-8';
      Response.SendResponse;
    end;
  end
  else
  begin
    if lDados.Count >= 1 then
    begin
      lResult := TJSONObject(lDados.Items[0]);
      if assigned(Response) then
      begin
        Response.Content := lResult.ToString;
        TWKUtil.compactarResponse(Response);
        Response.ContentType := 'application/json;charset=UTF-8';
        Response.SendResponse;
      end;
    end
    else
    begin
      Response.Content := '{}';
      Response.SendResponse;
    end;
  end;
  TResourceBaseClass(Obj).setOutput(lResult);
end;

{ SELECT ------------------------------------------------------------------- }
class procedure TDAO.Select(Obj: TObject; AValuesRequest: TValuesRequest);
const
  SQL = 'SELECT DISTINCT %s FROM %s %s %s %s %s';
var
  lFields: String;
  lTableName: String;
  lWhere: String;
  lOrder: String;
  lPagination: String;
  lSQL: String;
  lDados: TJSONArray;
  lResult: TJSONObject;
  lTotalElements: Integer;
  lTotalPages: Integer;
  lJoin: string;
  i: Integer;
  procedure postResponse(Value: string);
  begin
    try
      if assigned(AValuesRequest.Response) then
      begin
        try
          AValuesRequest.Response.Content := Value;
        except

        end;
        TWKUtil.compactarResponse(AValuesRequest.Response);
        AValuesRequest.Response.ContentType := 'application/json;charset=UTF-8';
        AValuesRequest.Response.SendResponse;
      end;
    except
      on e: Exception do
        Writeln('Falha ao enviar resultado');
    end;
  end;

begin
  lFields := GetFields(Obj);
  if pos('{', AValuesRequest.Search) > 0 then
  begin
    if assigned(TJSONObject.ParseJSONValue(AValuesRequest.Search)) then
      lWhere := GetWhere(AValuesRequest.ID, Obj, AValuesRequest.Search)
    else if pos('{', AValuesRequest.Search) > 0 then
      raise Exception.Create('Json informado na consulta e invalido !');

  end
  else
    lWhere := GetWhere(Obj, AValuesRequest.ID, AValuesRequest.Search, '',
      TPesquisa.tpTodoCampo);
  lOrder := GetOrder(Obj, AValuesRequest.Sort, AValuesRequest.Direction);
  lTableName := TWKUtil.GetTableName(Obj);
  lJoin := GetSqlJoin(Obj);
  lSQL := Format(SQL, [lFields, lTableName, lJoin, lWhere, lOrder,
    lPagination]);
  lDados := OpenQuery(AValuesRequest, lSQL, Obj);
  SetResourceListArray(Obj, lDados);
  if AValuesRequest.ID = EmptyStr then
  begin
    lResult := TJSONObject.Create;
    lResult.AddPair('content', lDados);
    lTotalElements := lDados.Count;
    lResult.AddPair('totalElements', TJSONNumber.Create(lTotalElements));
    if (lTotalElements mod AValuesRequest.PageSize) <> 0 then
      lTotalPages := (lTotalElements div AValuesRequest.PageSize) + 1
    else
      lTotalPages := (lTotalElements div AValuesRequest.PageSize);
    lResult.AddPair('totalPages', TJSONNumber.Create(lTotalPages));
    lResult.AddPair('pageSize', TJSONNumber.Create(AValuesRequest.PageSize));
    lResult.AddPair('pageNumber',
      TJSONNumber.Create(AValuesRequest.PageNumber));

    TResourceBaseClass(Obj).setOutput(lResult);
    postResponse(lResult.ToString);
  end
  else if lDados.Count >= 1 then
  begin
    postResponse(lDados.Items[0].ToString);
    TResourceBaseClass(Obj).setOutput(lDados.Items[0] as TJSONObject);
  end
  else
  begin
    postResponse('{}');
    TResourceBaseClass(Obj).setOutput(TJSONObject.Create);
  end;

end;

{ ------------------------------------------------------------------------------ }
class procedure TDAO.SetDadosInMessage(Obj: TObject; var Result: TMessageType;
  JsonImput: TJSONObject; aResourceName: string; pChave: string = '';
  aJSONArray: TJSONArray = nil);
var
  RttiType: TRttiType;
  RttiField: TRttiField;
  RttiAttribute: TCustomAttribute;
  Dados: TJSONObject;
  DadosArray: TJSONObject;
  LstFieldsJson: TStringList;
  Item: TJSONPair;
begin
  LstFieldsJson := TStringList.Create;
  try
    if assigned(JsonImput) then
    begin
      for Item in JsonImput do
      begin
        LstFieldsJson.Add(LowerCase(Item.JsonString.Value));
      end;
    end;
    Dados := TJSONObject.Create;
    RttiType := TWKUtil.GetRttiType(Obj);
    for RttiField in RttiType.GetFields do
      for RttiAttribute in RttiField.GetAttributes do
        if RttiAttribute is DbField then
        begin
          if assigned(JsonImput) then
            if LstFieldsJson.IndexOf(LowerCase(RttiField.Name)) < 0 then
              Continue;
          if RttiField.FieldType.TypeKind in [tkInteger] then
          begin
            if ((RttiAttribute as DbField).Constraints = PrimaryKey) and
              (pChave <> EmptyStr) then
              Dados.AddPair(RttiField.Name,
                TJSONNumber.Create(pChave.ToInteger))
            else
              Dados.AddPair(RttiField.Name,
                TJSONNumber.Create(RttiField.GetValue(Obj).AsInteger));
          end
          else if RttiField.FieldType.TypeKind in [tkInt64] then
          begin
            if ((RttiAttribute as DbField).Constraints = PrimaryKey) and
              (pChave <> EmptyStr) then
              Dados.AddPair(RttiField.Name, TJSONNumber.Create(pChave.ToInt64))
            else
              Dados.AddPair(RttiField.Name,
                TJSONNumber.Create(RttiField.GetValue(Obj).AsInt64))
          end
          else if RttiField.FieldType.TypeKind
            in [tkString, tkUString, tkUnicodeString, tkWString, tkWideChar,
            tkWideString, tkChar] then
            Dados.AddPair(RttiField.Name, RttiField.GetValue(Obj).AsString)
          else if RttiField.FieldType.TypeKind in [tkFloat] then
            Dados.AddPair(RttiField.Name,
              TJSONNumber.Create(TDateTime(RttiField.GetValue(Obj).AsExtended)))
          else if RttiField.FieldType.TypeKind in [tkEnumeration] then
            Dados.AddPair(RttiField.Name,
              TJSONBool.Create(RttiField.GetValue(Obj).AsBoolean))
          else if RttiField.FieldType.Name = 'TMacAddress' then
            Dados.AddPair(RttiField.Name,
              TMacAddress(RttiField.GetValue(Obj).AsObject).Value)
          else if RttiField.FieldType.Name = 'TBytea' then
            if not(RttiField.GetValue(Obj).IsEmpty) then

              Dados.AddPair(RttiField.Name,
                TBytea(RttiField.GetValue(Obj).AsObject).Value.Text)
            else
              Dados.AddPair(RttiField.Name, RttiField.GetValue(Obj).AsString)
        end;

    if (assigned(aJSONArray)) and (aJSONArray.Count > 0) then
    begin
      DadosArray := TJSONObject.Create;
      aJSONArray.AddElement(Dados);
      DadosArray.AddPair(aResourceName, aJSONArray);
      Result.Content := DadosArray;
    end
    else
      Result.Content := Dados;
  finally
    FreeAndNil(LstFieldsJson)
  end;

end;

{ ------------------------------------------------------------------------------ }
class function TDAO.FielIsLookUp(Field: DbField; Obj: TObject): Boolean;
begin
  Result := False;
  if Field.TableSource = '' then
    exit;
  Result := Field.TableSource <> TWKUtil.GetTableName(Obj);
end;

class function TDAO.OpenQuery(Response: TWebResponse; lSQL: string;
  Connection: TConnection = nil): TJSONArray;
var
  lItem: TJSONObject;
  Field: TField;
  isOwnerConnection: Boolean;
begin
  Result := TJSONArray.Create;
  isOwnerConnection := not assigned(Connection);
  if isOwnerConnection then
    Connection := TConnection.Create;

  try
    Connection.Query.Close;
    Connection.Query.SQL.Clear;
    Connection.Query.SQL.Add(lSQL);
    try
      if DebugHook > 0 then
        TWKUtil.SaveSql(Connection.Query, 'OpenQuery');
      Connection.Query.Open;
      Connection.Query.First;
      while not(Connection.Query.Eof) do
      begin
        lItem := TJSONObject.Create;
        Result.AddElement(lItem);
        for Field in Connection.Query.Fields do
          if Field.IsNull then
            lItem.AddPair(LowerCase(Field.FieldName), TJSONNull.Create)
          else if Field.DataType = ftInteger then
            lItem.AddPair(LowerCase(Field.FieldName),
              TJSONNumber.Create(Field.AsInteger))
          else if Field.DataType = ftBoolean then
          begin
            lItem.AddPair(LowerCase(Field.FieldName),
              TJSONBool.Create(Field.AsBoolean))
          end
          else if Field.DataType in [ftDate] then
            lItem.AddPair(LowerCase(Field.FieldName),
              Copy(DateToISO8601(Field.AsFloat), 1, 10))

          else if Field.DataType = ftTimeStamp then
            lItem.AddPair(LowerCase(Field.FieldName),
              DateToISO8601(Field.AsDateTime))

          else if Field.DataType in [ftBCD, ftCurrency] then
            lItem.AddPair(LowerCase(Field.FieldName),
              TJSONNumber.Create(Field.AsCurrency))

          else if Field.DataType in [ftFloat] then
            lItem.AddPair(LowerCase(Field.FieldName),
              TJSONNumber.Create(Field.AsFloat))

          else if Field.DataType in [ftBlob, ftByte] then
            if Connection.Query.RecordCount = 1 then
              lItem.AddPair(LowerCase(Field.FieldName),
                TJSONString.Create(TrimRight(Field.AsString)))
            else
              lItem.AddPair(LowerCase(Field.FieldName), '')
          else
            lItem.AddPair(LowerCase(Field.FieldName), Field.AsString);
        Connection.Query.Next;

      end;
      lTotalElements := Connection.Query.RecordCount;
    except
      on e: Exception do
      begin
        Connection.Query.SQL.saveTofile(ExtractFilePath(GetModuleName(HInstance)
          ) + 'ErroSql.sql');
        if assigned(Response) then
          TMessage.Create(EErroGeral, 'Erro ao executar a consulta (' +
            e.Message + ')').SendMessage(Response);
      end;
    end;
  finally
    if isOwnerConnection then
      Connection.Free;
  end;
end;

{ ------------------------------------------------------------------------------ }
class procedure TDAO.Update(Response: TWebResponse;
  ListObj: TObjectList<TObject>; Dados: TJSONObject; Conn: TConnection = nil);
const
  SQL = 'UPDATE %s SET %s WHERE %s';
var
  Connection: TConnection;
  TableName: String;
  FieldsName: String;
  WhereCondition: String;
  Params: TFDParams;
  Mensagem: TMessageType;
  Obj: TObject;
  RttiType: TRttiType;

begin
  Mensagem := IRegistroAlterado;
  if not assigned(Conn) then
  begin
    Connection := TConnection.Create;
    Connection.DB.StartTransaction;
  end
  else
    Connection := Conn;
  try
    try
      for Obj in ListObj do
      begin
        Params := TFDParams.Create;
        TableName := TWKUtil.GetTableName(Obj);
        SetFieldsAndParams(teUpdate, Obj, FieldsName, WhereCondition,
          Params, Dados);
        Connection.Query.SQL.Clear;
        Connection.Query.SQL.Add(Format(SQL, [TableName, FieldsName,
          WhereCondition]));
        Connection.Query.Params := Params;
        Connection.Query.ExecSQL;
        RttiType := TWKUtil.GetRttiType(Obj);
      end;
      if not assigned(Conn) then
        Connection.DB.Commit;
      SetDadosInMessage(ListObj.First, Mensagem, Dados, '');
      if assigned(Response) then
        TMessage.Create(Mensagem).SendMessage(Response);
    except
      on e: Exception do
      begin
{$IFDEF CONSOLE}
        Writeln('Erro ao atualizar  : ' + e.Message + ' SQL: ' +
          Connection.Query.SQL.Text);
{$ENDIF}
        Connection.DB.Rollback;
        if assigned(Response) then
          TMessage.Create(EDadosNaoSalvos, e.Message).SendMessage(Response)
        else
          raise Exception.Create(e.Message);
      end;
    end;
  finally
    try
      if not assigned(Conn) then
        Connection.Free;
    except

    end;
  end;
end;

{ ------------------------------------------------------------------------------ }
class function TDAO.GetWhere(ID: string; Obj: TObject; Search: string): String;
var
  filtro: TSearchFilter;
  RttiType: TRttiType;
  RttiField: TRttiField;
  RttiAttribute: TCustomAttribute;
  lTableName: String;
begin
  try
    filtro := TSearchFilter.Create(Obj, Search);
    Result := filtro.whereFilter;
    lTableName := TWKUtil.GetTableName(Obj);
    if ((ID <> EmptyStr) and (ID <> 'list-select')) then
    begin
      RttiType := TWKUtil.GetRttiType(Obj);
      for RttiField in RttiType.GetFields do
        for RttiAttribute in RttiField.GetAttributes do
          if RttiAttribute is DbField then
            if (RttiAttribute as DbField).Constraints = PrimaryKey then
            begin
              if Result <> '' then

                Result := Result + #13#10 + 'AND ' + #13#10 + lTableName + '.' +
                  (RttiAttribute as DbField).FieldName + ' = ' + ID
              else
                Result := #13#10 + 'WHERE ' + lTableName + '.' +
                  (RttiAttribute as DbField).FieldName + ' = ' + ID
            end;
    end
  finally
    FreeAndNil(filtro);
  end;
end;

class function TDAO.GetWhere(Obj: TObject; ID: String; Search: String;
  WherePadrao: String; TipoPesquisa: TPesquisa): String;
var
  RttiType: TRttiType;
  RttiField: TRttiField;
  RttiAttribute: TCustomAttribute;
  ListWhere: TArray<String>;
  Item: String;
  FieldName: String;
  lTableName: string;
  Filter: String;
begin
  Result := EmptyStr;
  lTableName := TWKUtil.GetTableName(Obj);
  if ((ID <> EmptyStr) and (ID <> 'list-select')) then
  begin
    RttiType := TWKUtil.GetRttiType(Obj);
    for RttiField in RttiType.GetFields do
      for RttiAttribute in RttiField.GetAttributes do
        if RttiAttribute is DbField then
          if (RttiAttribute as DbField).Constraints = PrimaryKey then
          begin
            Result := ' WHERE ' + #13#10 + lTableName + '.' +
              (RttiAttribute as DbField).FieldName + ' = ' + ID;
          end;
  end
  else if Search <> EmptyStr then
  begin
    ListWhere := Search.Split(['@@@']);
    for Item in ListWhere do
    begin
      if Length(Item.Split([':'])) = 2 then
      begin
        FieldName := Item.Split([':'])[0];
        Filter := Item.Split([':'])[1];
        RttiType := TWKUtil.GetRttiType(Obj);
        for RttiField in RttiType.GetFields do
        begin
          for RttiAttribute in RttiField.GetAttributes do
          begin
            lTableName := TWKUtil.GetTableName(Obj);

            if RttiAttribute is DbField then
            begin

              if LowerCase(RttiField.Name) = LowerCase(FieldName) then
              begin
                if (RttiAttribute as DbField).TableSource <> '' then
                  lTableName := (RttiAttribute as DbField).TableSource;

                if ((RttiField.FieldType.ToString) = 'Integer') or
                  (RttiField.FieldType.ToString = 'Boolean') then
                begin
                  if Result = EmptyStr then
                    Result := ' WHERE (' + #13#10 + lTableName + '.' +
                      (RttiAttribute as DbField).FieldName + ') = ' + Filter
                  else
                    Result := Result + ' AND (' + lTableName + '.' +
                      (RttiAttribute as DbField).FieldName + ') = ' + Filter;
                end
                else
                begin
                  if (TipoPesquisa = tpInicio) then
                    Filter := Filter + '%'
                  else if (TipoPesquisa = tpTodoCampo) then
                    Filter := '%' + Filter + '%'
                  else if (TipoPesquisa = tpFim) then
                    Filter := '%' + Filter;

                  if Result = EmptyStr then
                    Result := ' WHERE lower(' + lTableName + '.' +
                      (RttiAttribute as DbField).FieldName + ') LIKE lower(' +
                      QuotedStr(Filter) + ')'
                  else
                    Result := Result + ' AND lower(' + lTableName + '.' +
                      (RttiAttribute as DbField).FieldName + ') LIKE lower(' +
                      QuotedStr('%' + Filter + '%') + ')';
                end;
              end
              else
              begin

              end;
            end;
          end;
        end;
      end;
    end;
  end;
  if WherePadrao <> EmptyStr then
  begin
    if Result = EmptyStr then
      Result := ' WHERE ' + WherePadrao
    else
      Result := Result + ' AND ' + WherePadrao;
  end;
end;

{ ------------------------------------------------------------------------------ }
class function TDAO.GetJsonValue(Obj: TObject; var OutJSONValue: JSONValue;
  var OutNameField: string): TObject;
var
  RttiType: TRttiType;
  RttiField: TRttiField;
  RttiAttribute: TCustomAttribute;
begin
  Result := Nil;
  RttiType := TWKUtil.GetRttiType(Obj);
  for RttiField in RttiType.GetFields do
  begin
    for RttiAttribute in RttiField.GetAttributes do
    begin
      if (RttiAttribute is JSONValue) then
      begin
        Result := TWKUtil.GetResourceByName((RttiAttribute as JSONValue)
          .ResourceName);
        OutJSONValue := RttiAttribute as JSONValue;
        OutNameField := LowerCase(RttiField.Name);
        exit;
      end;
    end;
  end;
end;

{ ------------------------------------------------------------------------------ }
class procedure TDAO.ProcessDetail(AValuesRequest: TValuesRequest; Obj: TObject;
  var DataJson: TJSONObject; Connection: TConnection;
  MasterValue, ParentNode: string);
var
  RttiType: TRttiType;
  RttiField: TRttiField;
  RttiAttribute: TCustomAttribute;
  ljsonValue: JSONValue;
  ObjDetail: TObject;
  DetailName: String;
  FkName: string;
  lMasterValue: string;
begin
  RttiType := TWKUtil.GetRttiType(Obj);
  for RttiField in RttiType.GetFields do
  begin
    for RttiAttribute in RttiField.GetAttributes do
    begin
      if (RttiAttribute is JSONValue) then
      begin
        FkName := (RttiAttribute as JSONValue).FKField;
        ObjDetail := TWKUtil.GetResourceByName((RttiAttribute as JSONValue)
          .ResourceName);

        DataJson.AddPair(LowerCase(RttiField.Name),
          OpenQueryDetail(AValuesRequest, ObjDetail, Connection,
          MasterValue, FkName));

      end;
    end;
  end;
end;

{ ------------------------------------------------------------------------------ }
{ OPENQUERYDETAIL }
{ ------------------------------------------------------------------------------ }
class function TDAO.OpenQueryDetail(const AValuesRequest: TValuesRequest;
  Resource: TObject; Connection: TConnection; MasterValue, FKField: string)
  : TJSONArray;
const
  SQL = 'SELECT %s FROM %s %s %s %s %s';
var

  lTableName: String;
  lJoin: string;
  lWhere: string;
  lSQL: String;
  lFields: string;

begin
  Result := TJSONArray.Create;
  if not assigned(Connection) then
    Connection := TConnection.Create;
  Connection.Query.Close;
  Connection.Query.SQL.Clear;
  lTableName := TWKUtil.GetTableName(Resource);
  lJoin := GetSqlJoin(Resource);
  lFields := GetFields(Resource, true);
  if AValuesRequest.Search <> '' then
  begin
    if assigned(TJSONObject.ParseJSONValue(AValuesRequest.Search)) then
      lWhere := GetWhere('', Resource, AValuesRequest.Search)
    else if pos('{', AValuesRequest.Search) > 0 then
    begin
      raise Exception.Create('Json informado na consulta e invalido !');
    end;
    lWhere := GetWhere(Resource, '', AValuesRequest.Search, '',
      TPesquisa.tpTodoCampo);
  end;

  if lWhere = '' then
    lWhere := #13#10 + ' WHERE ' + #13#10 + lTableName + '.' + FKField + ' = ' +
      QuotedStr(MasterValue)
  else
    lWhere := lWhere + #13#10 + ' AND  ' + #13#10 + lTableName + '.' + FKField +
      ' = ' + QuotedStr(MasterValue);

  lSQL := Format(SQL, [lFields, lTableName, lJoin, lWhere, '', '']);

  OpenQuerySubDetail(AValuesRequest, lSQL, Resource, Connection, Result);

end;

{ ------------------------------------------------------------------------------ }
class procedure TDAO.OpenQuerySubDetail(const AValuesRequest: TValuesRequest;
  const ASQL: string; Resource: TObject; Connection: TConnection;
  DadosArray: TJSONArray);

var
  lItem: TJSONObject;
  MasterValue: string;
  ljsonValue: JSONValue;
  DetailName: string;
  qry: TFDQuery;

begin
  qry := TFDQuery.Create(Nil);
  qry.Connection := Connection.DB;
  qry.FetchOptions.Unidirectional := true;
  try
    qry.SQL.Add(ASQL);
    if DebugHook > 0 then
      TWKUtil.SaveSql(qry, 'OpenQuery');
    try
      qry.Open;
      qry.First;
      qry.DisableControls;
      while not(qry.Eof) do
      begin
        MasterValue := '';
        DetailName := '';
        lItem := DataSetToJSONObject(qry);
        If (GetJsonValue(Resource, ljsonValue, DetailName) <> nil) and
          (DetailName <> '') then
        begin

          MasterValue := qry.FieldByName(ljsonValue.MasterField).AsString;
          ProcessDetail(AValuesRequest, Resource, lItem, Connection,
            MasterValue, '');
        end;

        DadosArray.AddElement(lItem);
        qry.Next;
      end;
    except
      on e: Exception do
      begin
        TWKUtil.SaveSql(Connection.Query, 'OpenQuery');
        TMessage.Create(EErroGeral, 'Erro ao executar a consulta (' + e.Message
          + ')').SendMessage(AValuesRequest.Response);
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    qry.Close;
    FreeAndNil(qry)
  end;
end;

{ ------------------------------------------------------------------------------ }
{ OPENQUERY MAPED }
{ ------------------------------------------------------------------------------ }
class function TDAO.OpenQuery(const AValuesRequest: TValuesRequest;
  const ASQL: string; Resource: TObject): TJSONArray;
const
  SQL = 'SELECT %s FROM %s %s %s %s %s';
var
  lItem: TJSONObject;
  Connection: TConnection;
  ConnectionObject: TConnection;
  MasterValue: string;
  ljsonValue: JSONValue;
  DetailName: string;
  ItensCount: Integer;
begin
  Result := TJSONArray.Create;
  AValuesRequest.Response.ContentType := 'application/json;charset=UTF-8';
  Connection := TConnection.Create;
  Connection.Query.FetchOptions.Unidirectional := true;
  ConnectionObject := TConnection.Create;
  try
    Connection.Query.SQL.Add(ASQL);
    if DebugHook > 0 then
      TWKUtil.SaveSql(Connection.Query, 'OpenQuery');
    try
      Connection.Query.Open;
      ItensCount := Connection.Query.RecordCount;
      Connection.Query.First;
      Connection.Query.DisableControls;
      while not(Connection.Query.Eof) do
      begin
        lItem := DataSetToJSONObject(Connection.Query);
        // SO TRAZER DETALHES CASO CONSULTE UM REGISTRO
        if ItensCount = 1 then
        begin

          If GetJsonValue(Resource, ljsonValue, DetailName) <> nil then
          begin

            MasterValue := Connection.Query.FieldByName
              (ljsonValue.MasterField).AsString;
            ProcessDetail(AValuesRequest, Resource, lItem, ConnectionObject,
              MasterValue, '');
          end;
        end;

        Result.AddElement(lItem);
        Connection.Query.Next;
      end;
    except
      on e: Exception do
      begin
        TWKUtil.SaveSql(Connection.Query, 'OpenQuery');
        TMessage.Create(EErroGeral, 'Erro ao executar a consulta (' + e.Message
          + ')').SendMessage(AValuesRequest.Response);
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    Connection.Free;
    ConnectionObject.Free;
  end;
end;

{ ------------------------------------------------------------------------------ }
class function TDAO.GetSqlJoin(Obj: TObject): string;
var
  RttiType: TRttiType;
  RttiField: TRttiField;
  RttiAttribute: TCustomAttribute;
  Join: String;
  TableReference: string;
  ListJoinedTables: TStringList;
  LCountSubTables: Integer;
  LAliasTable: string;
  TableReferenceAlias: String;
begin
  Result := '';

  LCountSubTables := 1;
  ListJoinedTables := TStringList.Create;
  RttiType := TWKUtil.GetRttiType(Obj);
  for RttiField in RttiType.GetFields do
    for RttiAttribute in RttiField.GetAttributes do
      if RttiAttribute is FKConstraints then
      begin
        TableReference := (RttiAttribute as FKConstraints).TableReference;
        if (RttiAttribute as FKConstraints).MasterTable = '' then
          LAliasTable := TWKUtil.GetTableName(Obj) + '.'

        else
          LAliasTable := (RttiAttribute as FKConstraints).MasterTable + '.';
        TableReferenceAlias := TableReference;
        if ListJoinedTables.IndexOf(TableReference) > -1 then
        begin
          TableReferenceAlias := TableReference + inttostr(LCountSubTables);
          Inc(LCountSubTables);
        end;

        Join := 'INNER JOIN';
        if (RttiAttribute as FKConstraints).TipoJoin = LEFT then
          Join := 'LEFT JOIN'
        else if (RttiAttribute as FKConstraints).TipoJoin = RIGHT then
          Join := 'RIGHT'
        else if (RttiAttribute as FKConstraints).TipoJoin = FULL then
          Join := 'FULL JOIN';

        Result := Result + #13#10 + ' ' + Join + ' ' + TableReference + ' as ' +
          TableReferenceAlias;
        Result := Result + #13#10 + ' ON ' + TableReferenceAlias + '.' +
          (RttiAttribute as FKConstraints).KeyReference + ' = ' + LAliasTable +
          (RttiAttribute as FKConstraints).KeyField;

        ListJoinedTables.Add(TableReference);
      end;

end;

{ ------------------------------------------------------------------------------ }
class procedure TDAO.DeleteDetails(RttiAttribute: TCustomAttribute;
  Obj, ResourceObj: TObject; Conn: TConnection);

var
  KeyValue: string;
  KeyName: string;
const
  SQL = 'DELETE FROM %s WHERE %s';
begin
  { KeyValue := '';
    KeyValue := TWKUtil.GetRttiField((RttiAttribute as TResourceDetail).KeyField,
    Obj).GetValue(Obj).AsVariant;
    KeyName := TWKUtil.GetFieldAlias((RttiAttribute as TResourceDetail)
    .KeyReference, ResourceObj);

    if KeyValue <> '' then
    begin
    Conn.Query.SQL.Clear;
    Conn.Query.SQL.Add(Format(SQL, [TWKUtil.GetTableName(ResourceObj),
    KeyName + '=' + KeyValue]));
    Conn.Query.ExecSQL;
    end; }
end;

{ ------------------------------------------------------------------------------ }
end.

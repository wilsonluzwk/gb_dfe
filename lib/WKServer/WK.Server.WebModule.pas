unit WK.Server.WebModule;

interface

uses
  System.SysUtils,
  System.Classes,
  Web.HTTPApp,
  Datasnap.DSHTTPCommon,
  Datasnap.DSHTTPWebBroker,
  Datasnap.DSServer,
  FireDAC.Stan.Param,
  Web.WebFileDispatcher,
  Web.HTTPProd,
  WK.Server.TokenWK,
  System.JSON,
  WK.Util,
  Datasnap.DSAuth,
  Datasnap.DSProxyJavaScript,
  IPPeerServer,
  Datasnap.DSMetadata,
  Datasnap.DSServerMetadata,
  Datasnap.DSClientMetadata,
  Datasnap.DSCommonServer,
  WK.Server.Records,
  Datasnap.DSHTTP,
  System.Rtti,
  WK.Server.Attributes,
  WK.Server.Config,
  WK.Server.Connection,
  Data.DB,
  System.Generics.Collections,
  dfe.controller.auth,
  WK.Server.Authentication,
  WK.Server.Constants;

type
  TWebModuleApi = class(TWebModule)
    procedure WebModuleCreate(Sender: TObject);
    procedure WebModuleApiWebActionPadraoAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModuleBeforeDispatch(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebModuleDestroy(Sender: TObject);
    procedure WebModuleException(Sender: TObject; E: Exception;
      var Handled: Boolean);
    procedure WebModuleApiwebAuthorizationAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    FListEndpointValidadeAcess: TList<string>;
    procedure GetClassesProc(AClass: TPersistentClass);
    procedure SetAction(Classe: TRttiType; Attribute: TCustomAttribute;
      Metodo: TRttiMethod; AttributeMethod: TCustomAttribute);
    procedure WebModuleApiWebAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure Execute(AClassName, AMethodName: String; Params: array of TValue);
    procedure SetClassName(lDados: TArray<String>; var ClassName: string);
    procedure SetParamsGet(Request: TWebRequest; var PageNumber: Integer;
      var PageSize: Integer; var Direction: String; var Sort: String;
      var Search: String; var Join: string; var Method: string); overload;
    procedure SetParamsGet(Request: TWebRequest;
      var PageNumber, PageSize: Integer; var Direction, Sort, Search,
      Join: string; var Method: string; var JSON: TJSONObject); overload;
    procedure ExecAction(Request: TWebRequest; Response: TWebResponse;
      Name: String);
    procedure ValidarAcesso(pValue: String);
    function ValidarUsuarioPadrao(AParams: TDictionary<string, string>)
      : Boolean;
    function IsFileRequest(Request: TWebRequest;
      Response: TWebResponse): Boolean;
    function IsMasterDatail(AClassName: string): Boolean;

  public
  end;

var
  WebModuleClass: TComponentClass = TWebModuleApi;
procedure ProcessRequest(Request: TWebRequest);

implementation

{$R *.dfm}

uses
  Web.WebReq, FireDAC.Comp.Client, System.Types, System.DateUtils,
  WK.Server.Message, WK.Server.MessageList,
  System.NetEncoding, IdMultipartFormData, IdGlobal;

procedure TWebModuleApi.WebModuleApiWebActionPadraoAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  lDados: TArray<String>;
  Resource: String;
  Item: String;
  I: Integer;
  Redirect: Boolean;
begin
  try
    Redirect := False;
    I := 0;
    lDados := string(Request.PathInfo).Split(['/']);
    for Item in lDados do
    begin
      if Item = 'v1' then
      begin
        Resource := lDados[I + 1];
        Break;
      end
      else
        Inc(I);
    end;
    for I := 0 to Self.Actions.Count - 1 do
    begin
      if Self.Actions.Items[I].MethodType = Request.MethodType then
      begin
        if Self.Actions.Items[I].PathInfo = '/v1/' + Resource then
        begin
          ExecAction(Request, Response, Self.Actions.Items[I].Name);
          Redirect := True;
        end;
      end;
    end;
    if not(Redirect) then
      Response.Content := 'Dfe Server - 1.0';
  except
    on E: Exception do
    begin
{$IFDEF LINUX}
      Writeln('-----------------------------------------------------------');
      Writeln('Erro [126] -> Request:  ' + Request.URL + ' Erro: ' + E.Message);
{$ENDIF}
    end;

  end;
end;

procedure TWebModuleApi.WebModuleApiwebAuthorizationAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  // **/
  Response.Content := '{"token":"123","statusCod":200,"msg":"sucesso"}';
  Response.SendResponse;
end;

procedure TWebModuleApi.WebModuleBeforeDispatch(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  try
    Response.SetCustomHeader('Access-Control-Allow-Origin', '*');
    Response.SetCustomHeader('Access-Control-Allow-Methods', 'Content-Type');
    Response.SetCustomHeader('Access-Control-Allow-Methods', 'Authorization');
    Response.SetCustomHeader('Access-Control-Allow-Methods',
      'GET,POST,PUT,PATCH,OPTIONS,DELETE');
    if trim(Request.GetFieldByName('Access-Control-Request-Headers')) <> EmptyStr
    then
    begin
      Response.SetCustomHeader('Access-Control-Allow-Headers',
        Request.GetFieldByName('Access-Control-Request-Headers'));
      Handled := True;
    end;

    if Request.Method <> 'OPTIONS' then
    begin
      Response.SetCustomHeader('path', Request.PathInfo);
      var
        LPathInfo: string;
      LPathInfo := LowerCase(Request.PathInfo);

      if Request.Method.ToLower.Equals('put') or Request.Method.ToLower.Equals
        ('delete') then
        LPathInfo := Copy(LPathInfo, 1, LPathInfo.Length - 2);

      if LowerCase(Request.PathInfo) = '/v1/ping' then
        TMessage.Create(IServidorConnectado, 'Server connectado')
          .SendMessage(Response)
      else if not IsFileRequest(Request, Response) then
      begin
        Response.ContentType := 'application/json;charset=UTF-8';
        if FListEndpointValidadeAcess.IndexOf(LowerCase(Request.PathInfo)) < 0
        then
        begin
          if (Request.Authorization <> '') then
          begin
            if pos('Bearer ', Request.GetFieldByName('Authorization')) > 0 then
              ValidarAcesso(Request.GetFieldByName('Authorization'))
            else
              ValidarAcesso('Bearer ' + Request.GetFieldByName('Authorization'))
          end
          else
            ValidarAcesso(Request.GetFieldByName('x-api-key'));
        end;
      end;
    end;
  except
    on E: Exception do
    begin
{$IFDEF CONSOLE}
      Writeln('-----------------------------------------------------------');
      Writeln('Erro [208] -> Request:  ' + Request.URL + ' Erro: ' + E.Message);
{$ENDIF}
    end;

  end;
end;

procedure TWebModuleApi.WebModuleCreate(Sender: TObject);
var
  ClassFinder: TClassFinder;
begin
  if assigned(FListEndpointValidadeAcess) then
    exit;

  try
{$IFDEF LINUX}
    Writeln('-----------------------------------------------------------');
    Writeln('criando  modulo web');
{$ENDIF}
    ClassFinder := TClassFinder.Create(Nil);
    try
      ClassFinder.GetClasses(GetClassesProc);
      TServerConfig.GetInstance;
    finally
      ClassFinder.Free;
    end;
    FListEndpointValidadeAcess := TList<string>.Create;
    FListEndpointValidadeAcess.Add('/v1/alterarsenha');
    FListEndpointValidadeAcess.Add('/v1/authorization');
    FListEndpointValidadeAcess.Add('/v1/enviarcodigoreset');
    FListEndpointValidadeAcess.Add('/v1/novousuario');
    FListEndpointValidadeAcess.Add('/v1/sendemail');
    FListEndpointValidadeAcess.Add('/v1/recuperarsenha');

  except
    on E: Exception do
    begin
{$IFDEF LINUX}
      Writeln('-----------------------------------------------------------');
      Writeln('Erro [237] -> ' + E.Message);
{$ENDIF}
    end;

  end;
end;

procedure TWebModuleApi.WebModuleDestroy(Sender: TObject);
begin
  FListEndpointValidadeAcess.Free;
end;

procedure TWebModuleApi.WebModuleException(Sender: TObject; E: Exception;
  var Handled: Boolean);
begin
{$IFDEF LINUX}
  Writeln('-----------------------------------------------------------');
  Writeln('Erro [260] -> ' + E.Message);
  Handled := True;
{$ENDIF}
end;

procedure TWebModuleApi.GetClassesProc(AClass: TPersistentClass);
var
  RttiContext: TRttiContext;
  Classe: TRttiType;
  Attribute: TCustomAttribute;
  Metodo: TRttiMethod;
  AttributeMethod: TCustomAttribute;
begin
  try

    RttiContext := TRttiContext.Create;
    Classe := RttiContext.GetType(AClass);
    for Attribute in Classe.GetAttributes do
      if Attribute is Resource then
        for Metodo in Classe.GetMethods do
          for AttributeMethod in Metodo.GetAttributes do
            SetAction(Classe, Attribute, Metodo, AttributeMethod);
  except
    on E: Exception do
    begin
{$IFDEF LINUX}
      Writeln('-----------------------------------------------------------');
      Writeln('Erro [270] -> Classe' + Classe.QualifiedName + '.' + Metodo.Name
        + ' Erro ' + E.Message);
{$ENDIF}
    end;

  end;
end;

function TWebModuleApi.IsFileRequest(Request: TWebRequest;
  Response: TWebResponse): Boolean;

var
  lfilename: string;
  outstrem: TFileStream;
  isbasePath: Boolean;
  function isGraphicFile(lfilename: string): Boolean;
  begin
    result := (lfilename = '.ico') or (lfilename = '.png') or
      (lfilename = '.jpg') or (lfilename = '.jpeg') or (lfilename = '.bmp') or
      (lfilename = '.tif') or (lfilename = '.gif');
  end;
  procedure setContentType;
  begin
    if LowerCase(lfilename) = '.css' then
      Response.ContentType := 'text/css';
    if LowerCase(lfilename) = '.pdf' then
      Response.ContentType := 'application/pdf';
    if isGraphicFile(LowerCase(lfilename)) then
      Response.ContentType := 'image/x-icon';

  end;
  procedure setExpiresData();
  begin
    if (LowerCase(lfilename) = '.css') or (UpperCase(lfilename) = '.js') or
      (LowerCase(lfilename) = '.html') Then
    begin
      Response.Date := now;
      Response.LastModified := now;
      Response.Expires := Date + 10;
    end;
    if (LowerCase(lfilename) = 'app.js') or (LowerCase(lfilename) = '.js') then
    begin
      Response.Expires := now;
    end;
  end;

begin
  result := False;
  try
    lfilename := '';
    isbasePath := Length(Request.PathInfo) = 1;
    lfilename := ExtractFileExt(stringReplace(Request.PathInfo, '/', PathDelim,
      [rfReplaceAll]));
    if (pos('.', lfilename) > 0) or (isbasePath) then
    begin
      result := True;
      setContentType();
      setExpiresData();
      if isbasePath then
        lfilename := ExtractFilePath(GetModuleName(HInstance)) + cWebRepository
          + PathDelim + 'login.html'
      else
        lfilename := ExtractFilePath(GetModuleName(HInstance)) + cWebRepository
          + stringReplace(Request.PathInfo, '/', PathDelim, [rfReplaceAll]);
      if FileExists(lfilename) then
      begin
        outstrem := TFileStream.Create(lfilename, fmOpenRead);
        Response.ContentStream := outstrem;
        Response.StatusCode := 200;

        Response.SendResponse;
      end
      else
      begin
        Response.StatusCode := 400;
        TMessage.Create(EErroGeral, 'Arquivo não encontrado')
          .SendMessage(Response);

      end;
    end;
  except
    on E: Exception do
    begin
      if IsConsole then
        Writeln('Erro [355] -> ' + E.Message);
    end;
  end;
end;

function TWebModuleApi.IsMasterDatail(AClassName: string): Boolean;
var
  RttiContext: TRttiContext;
  RttiInstanceType: TRttiInstanceType;
  Classe: TRttiType;
  Attribute: TCustomAttribute;
  RttiMethod: TRttiMethod;
  Instance: TObject;
begin
  result := False;
  RttiContext := TRttiContext.Create;
  try
    RttiInstanceType := RttiContext.FindType(AClassName).AsInstance;
    RttiMethod := RttiInstanceType.GetMethod('Create');
    Instance := RttiMethod.Invoke(RttiInstanceType.MetaclassType, []).AsObject;
    for Attribute in RttiInstanceType.GetAttributes do
      if Attribute is Resource then
      begin
        result := Resource(Attribute).MasterDateil
      end;
  finally
    RttiContext.Free;
  end;
end;

procedure TWebModuleApi.SetAction(Classe: TRttiType;
  Attribute: TCustomAttribute; Metodo: TRttiMethod;
  AttributeMethod: TCustomAttribute);
begin

  Self.Actions.Add;
  with Self.Actions.Items[Self.Actions.Count - 1] do
  begin
    try
      PathInfo := '/v1/' + Resource(Attribute).ResourceName;
      Name := Classe.QualifiedName + '.' + Metodo.Name;
      if AttributeMethod is Get then
        MethodType := mtGet
      else if AttributeMethod is Post then
        MethodType := mtPost
      else if AttributeMethod is Put then
        MethodType := mtPut
      else if AttributeMethod is Delete then
        MethodType := mtDelete;
      OnAction := WebModuleApiWebAction;
    except
      on E: Exception do
      begin
        Writeln('Erro ao registar action ' + Classe.QualifiedName + '- ' +
          Metodo.Name);

      end;

    end;
  end;
end;

procedure TWebModuleApi.WebModuleApiWebAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  ExecAction(Request, Response, TWebActionItem(Sender).Name);
end;

procedure TWebModuleApi.ExecAction(Request: TWebRequest; Response: TWebResponse;
  Name: String);
var
  ClassName: String;
  MethodName: String;
  lDados: TArray<String>;
  Body: TJSONObject;
  lParams: Array of TValue;
  Resource: String;
  ID: String;
  PageNumber: Integer;
  PageSize: Integer;
  Direction: String;
  Sort: String;
  Search: String;
  Join: string;
  Method: String;
  Item: String;
  JSON: TJSONObject;
  LValueRequest: TValuesRequest;
  I: Integer;
  RaisedError: Boolean;
  LInicio: Ttime;
begin

  try
    LInicio := time;
    lDados := Name.Split(['.']);
    MethodName := lDados[Length(lDados) - 1];
    SetClassName(lDados, ClassName);
    RaisedError := False;
{$IFDEF LINUX}
    Writeln('-----------------------------------------------------------');
    Writeln('Executando Path -> ' + ClassName + ' metodo : ' + MethodName +
      ' Content: ' + Request.Content);
{$ENDIF}
    Body := nil;
    if Request.Content <> EmptyStr then
      Body := TJSONObject(TJSONObject.ParseJSONValue(Request.Content))
        as TJSONObject;
    lDados := string(Request.PathInfo).Split(['/']);
    I := 0;
    ID := EmptyStr;
    for Item in lDados do
    begin
      if Item = 'v1' then
      begin
        Resource := lDados[I + 1];
        if ((I + 3) = Length(lDados)) then
        begin
          ID := lDados[I + 2];
          Break;
        end;
      end
      else
        Inc(I);
    end;

    if Request.MethodType = mtGet then
    begin

      if IsMasterDatail(ClassName) then
      begin
        SetParamsGet(Request, PageNumber, PageSize, Direction, Sort, Search,
          Join, Method, JSON);
        LValueRequest := TValuesRequest.Create;
        LValueRequest.Request := Request;
        LValueRequest.Response := Response;
        LValueRequest.PageNumber := PageNumber;
        LValueRequest.PageSize := PageSize;
        LValueRequest.Direction := Direction;
        LValueRequest.Sort := Sort;
        LValueRequest.Search := Search;
        LValueRequest.Join := Join;
        LValueRequest.ID := ID;
        lParams := [LValueRequest];
      end
      else
      begin
        SetParamsGet(Request, PageNumber, PageSize, Direction, Sort, Search,
          Join, Method, JSON);
        lParams := [Response, PageNumber, PageSize, Direction, Sort, Search, ID,
          Join, JSON];
      end;

    end
    else if Request.MethodType in [mtPost] then
    begin
      if Request.QueryFields.IndexOfName('method') >= 0 then
      begin
        if ID.IsEmpty then
          ID := '0';
        var
        LMethod := Request.QueryFields.Values['method'];
        lParams := [Response, Body, LMethod];
      end
      else
        lParams := [Response, Body, nil]
    end
    else if Request.MethodType in [mtPut] then
    begin
      if Request.QueryFields.IndexOfName('method') >= 0 then
      begin
        if ID.IsEmpty then
          ID := '0';
        var
        LMethod := Request.QueryFields.Values['method'];
        lParams := [Response, StrToIntDef(ID, 0),
          TJSONObject.ParseJSONValue(Request.Content), LMethod]
      end
      else
        lParams := [Response, ID.ToInteger, Body, nil]
    end
    else if Request.MethodType in [mtDelete] then
    begin
      if Request.QueryFields.IndexOfName('method') >= 0 then
      begin
        if ID.IsEmpty then
          ID := '0';
        SetParamsGet(Request, PageNumber, PageSize, Direction, Sort, Search,
          Join, Method, JSON);
        lParams := [Response, StrToIntDef(ID, 0), Search, Method];
      end
      else
        lParams := [Response, ID.ToInteger, '', ''];
    end;
    Response.StatusCode := 200;
    Execute(ClassName, MethodName, lParams);
  except
    on E: Exception do
    begin
      RaisedError := True;
      TWKUtil.gravalog('  --> Erro ao executar Path: ' + ClassName + 'Msg :' +
        E.Message);
      if E.Message <> 'Operation aborted' then
      begin
        if assigned(Response) then
        begin
          Response.StatusCode := 500;
          TMessage.Create(EErroGeral, E.Message).SendMessage(Response);
        end;
      end;
    end;
  end;
{$IFDEF LINUX}
  if not RaisedError then
  begin
    Writeln('Excucao finalizalizada  : ' + ClassName + '  Tempo Resposta : ' +
      FormatDateTime('hh:nn:ss.zzz', time - LInicio));
  end;
{$ENDIF}
end;

procedure TWebModuleApi.Execute(AClassName: String; AMethodName: String;
  Params: Array of TValue);
var
  RttiContext: TRttiContext;
  RttiInstanceType: TRttiInstanceType;
  RttiMethod: TRttiMethod;
begin

  RttiContext := TRttiContext.Create;
  RttiInstanceType := RttiContext.FindType(AClassName).AsInstance;
  RttiMethod := RttiInstanceType.GetMethod('Create');

  var
  Instance := RttiMethod.Invoke(RttiInstanceType.MetaclassType, []).AsObject;
  RttiMethod := RttiInstanceType.GetMethod(AMethodName);
  RttiMethod.Invoke(Instance, Params).AsString;
end;

procedure TWebModuleApi.SetClassName(lDados: TArray<String>;
  var ClassName: string);
var
  I: Integer;
begin
  ClassName := EmptyStr;
  for I := 0 to Length(lDados) - 2 do
    ClassName := ClassName + lDados[I] + '.';
  ClassName := ClassName.TrimRight(['.']);
end;

procedure TWebModuleApi.SetParamsGet(Request: TWebRequest;
  var PageNumber, PageSize: Integer; var Direction, Sort, Search, Join: string;
  var Method: string; var JSON: TJSONObject);
var
  LJSONString: String;
begin
  SetParamsGet(Request, PageNumber, PageSize, Direction, Sort, Search,
    Join, Method);
  JSON := nil;
  if Request.QueryFields.IndexOfName('JSON') >= 0 then
  begin
    LJSONString := Request.QueryFields.Values['JSON'].Replace('<!', '{', [])
      .Replace('!>', '}', []);
    JSON := TJSONObject.ParseJSONValue(LJSONString) AS TJSONObject;
  end;
end;

procedure TWebModuleApi.SetParamsGet(Request: TWebRequest;
  var PageNumber: Integer; var PageSize: Integer; var Direction: String;
  var Sort: String; var Search: String; var Join: string; var Method: string);
begin

  PageNumber := 1;
  PageSize := 50;
  Direction := EmptyStr;
  Sort := EmptyStr;
  Search := EmptyStr;
  Join := EmptyStr;
  Method := EmptyStr;
  if Request.QueryFields.IndexOfName('pageNumber') >= 0 then
    PageNumber := Request.QueryFields.Values['pageNumber'].ToInteger;
  if Request.QueryFields.IndexOfName('pageSize') >= 0 then
    PageSize := Request.QueryFields.Values['pageSize'].ToInteger;
  if Request.QueryFields.IndexOfName('direction') >= 0 then
    Direction := Request.QueryFields.Values['direction'];
  if Request.QueryFields.IndexOfName('sort') >= 0 then
    Sort := Request.QueryFields.Values['sort'];
  if Request.QueryFields.IndexOfName('search') >= 0 then
  begin
    if Request.GetFieldByName('x-api-mobile').Equals('device-mobile') then
      Search := Request.QueryFields.Values['search'].Replace('<!', '{',
        [rfReplaceAll]).Replace('!>', '}', [rfReplaceAll])
    else
      Search := Request.QueryFields.Values['search'];
  end;
  if Request.QueryFields.IndexOfName('join') >= 0 then
    Join := Request.QueryFields.Values['join'];
  if Request.QueryFields.IndexOfName('method') >= 0 then
    Method := Request.QueryFields.Values['method'];
end;

procedure TWebModuleApi.ValidarAcesso(pValue: String);
const
  TAG: String = 'Bearer ';
Var
  lToken: String;
  lResult: Boolean;
  controller: TAuthController;
begin
  try
    lResult := False;
    if pos(TAG, pValue) = 1 then
    begin
      lToken := stringReplace(pValue, TAG, '', []);
      try
        controller := TAuthController.Create;
        lResult := controller.Validar(lToken);
      finally
        FreeAndNil(controller);
      end;

    end;
    if Not lResult then
    begin
      TMessage.Create(EAcessoNegado, 'Token inválido.').SendMessage(Response);
    end;
  except
    on E: Exception do
    begin
      TMessage.Create(EErroGeral, E.Message).SendMessage(Response);
    end;

  end;
end;

function TWebModuleApi.ValidarUsuarioPadrao
  (AParams: TDictionary<string, string>): Boolean;
const
  USER = 'WK_TECNOLOGY';
  PASSWORD = '12345';
var
  LUser, LPassword: String;
begin
  result := False;

  LUser := AParams.Items['user'];
  LPassword := AParams.Items['password'];

  if (LUser.ToUpper = USER) and (LPassword.ToUpper = PASSWORD) then
    result := True;
end;

procedure ProcessRequest(Request: TWebRequest);
var
  I: Integer;
  FileStream: TFileStream;
  FileName: string;
  Stream: TStream;
begin

end;

initialization

finalization

Web.WebReq.FreeWebModules;

end.

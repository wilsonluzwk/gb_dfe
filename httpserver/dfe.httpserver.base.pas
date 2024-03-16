unit dfe.httpserver.base;

interface

uses
  math,
  System.SysUtils,
  IdCoder3to4,
  Winsock,
  System.JSON,
  Variants,
  Classes,
  dfe.lib.util,
  System.ZLib,
  IdContext,
  IdCustomHTTPServer,
  IdBaseComponent,
  IdComponent,
  IdCustomTCPServer,
  IdHTTPServer,
  REST.Client,
  Data.Bind.Components,
  Data.Bind.ObjectScope,
  IdTCPConnection,
  IdTCPClient,
  dfe.lib.constants,
  IdHTTP

    ;

type
  httpVerbs = (vrGet, vrPost, vrDelete, vrPut, vrOptions, vrHead);

type

  TOnProcessRequest = procedure() of object;

  THttpServerBase = class
  private
    FOnProcessRequest: TOnProcessRequest;
    os: string;
    oc: string;
    ot: string;
    Fstep: Integer;
    isfileRequest: Boolean;
    Fisjason: Boolean;
    Fcommand: httpVerbs;
    Fserver: TIdHTTPServer;
    FContext: TIdContext;
    FRequestInfo: TIdHTTPRequestInfo;
    FResponseInfo: TIdHTTPResponseInfo;
    FjValue: TJSONObject;
    procedure FserverCommandGet(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    procedure FserverCommandOther(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);

    procedure processcommand(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);

    procedure pipelog(value: string);
    function getComandVerb(value: string): httpVerbs;

  public

    // deve ser implementado nas implementa��es
    procedure processrequest(); virtual;
    procedure setResponse(coderetorno, respno: Integer; msg: string);
    procedure setUpWebTemplate();
  published
    property Context: TIdContext read FContext write FContext;
    property RequestInfo: TIdHTTPRequestInfo read FRequestInfo
      write FRequestInfo;
    property ResponseInfo: TIdHTTPResponseInfo read FResponseInfo
      write FResponseInfo;
    property jValue: TJSONObject read FjValue write FjValue;
    property isjason: Boolean read Fisjason write Fisjason;
    property Command: httpVerbs read Fcommand write Fcommand;
    property OnProcessRequest: TOnProcessRequest read FOnProcessRequest
      write FOnProcessRequest;
    constructor create; virtual;

  end;

implementation

{ TItecNfseApi }
{ ------------------------------------------------------------------------------ }
constructor THttpServerBase.create;
begin
  Fserver := TIdHTTPServer.create(Nil);
  Fserver.AutoStartSession := false;
  Fserver.KeepAlive := false;

  Fserver.DefaultPort := _HTTP_PORT;
  Fserver.OnCommandOther := FserverCommandOther;
  Fserver.OnCommandGet := FserverCommandGet;
  Fserver.Active := true;
  setUpWebTemplate();
end;

{ ------------------------------------------------------------------------------ }
function THttpServerBase.getComandVerb(value: string): httpVerbs;
begin
  if SameText(value, 'GET') then
    result := vrGet
  else if SameText(value, 'POST') then
    result := vrPost
  else if SameText(value, 'DELETE') then
    result := vrDelete
  else if SameText(value, 'PUT') then
    result := vrPut
  else if SameText(value, 'OPTIONS') then
    result := vrOptions
  else if SameText(value, 'HEAD') then
    result := vrHead;
end;

{ ------------------------------------------------------------------------------ }
procedure THttpServerBase.processcommand(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
  aFilename: string;
  aRequestStream: TStringStream;

  aRequestContent, aResponseContent: string;
  i: Integer;
  outstrem: TFileStream;
  os: string;
  srcbuf, destbuf: TBytes;
  str: string;
  s: string;
  procedure setCompactacao;
  var
    requestUserAgent: string;
  begin

    try
      if assigned(ARequestInfo) then
        requestUserAgent := ARequestInfo.UserAgent;
      if (Length(AResponseInfo.ContentText) > 10000) and
        (requestUserAgent <> 'DFEaPIConsumerD7') and
        (requestUserAgent <> 'Mozilla/3.0 (compatible; Indy Library)') then
      begin
        Fstep := 5;
        str := AResponseInfo.ContentText;
        srcbuf := BytesOf(str);
        ZCompress(srcbuf, destbuf, zcDefault);
        AResponseInfo.ContentText := '';
        AResponseInfo.ContentStream := TMemoryStream.create;
        AResponseInfo.ContentEncoding := 'deflate';
        Fstep := 6;
        AResponseInfo.ContentStream.WriteData(@(destbuf[0]), Length(destbuf));
        AResponseInfo.ContentLength := (Length(destbuf));
        AResponseInfo.ContentStream.Position := 0;

      end;
    except
      on e: Exception do
      begin

        str := 'Falha na compacta��o de dados ' + e.Message + 'Fstep ' +
          inttostr(Fstep);
      end;
    end;
  end;

begin
  Fstep := 0;
  FjValue := nil;
  FContext := nil;
  FRequestInfo := nil;
  FResponseInfo := nil;
  try
    try
      FContext := AContext;
      FRequestInfo := ARequestInfo;
      FResponseInfo := AResponseInfo;

      FResponseInfo.ResponseNo := 200;
      FResponseInfo.ContentText := '';
      AResponseInfo.CustomHeaders.AddValue('Access-Control-Allow-Methods',
        'POST, GET, OPTIONS, PUT, DELETE, HEAD');
      os := ARequestInfo.RawHeaders.Values['Origin'];
      oc := ARequestInfo.RawHeaders.Values['Access-Control-Request-Headers'];
      ot := ARequestInfo.RawHeaders.Values['Accept'];
      AResponseInfo.CustomHeaders.AddValue('Access-Control-Allow-Origin', os);
      AResponseInfo.CustomHeaders.AddValue('Content-Type', oc);
      AResponseInfo.CustomHeaders.AddValue('Access-Control-Allow-Headers', oc);
      AResponseInfo.CustomHeaders.AddValue('Accept', ot);
      Fisjason := false;
      Fstep := 1;
      os := ARequestInfo.Host;

      Fcommand := getComandVerb(ARequestInfo.Command);
      os := ARequestInfo.RemoteIP;
      i := ARequestInfo.Cookies.Count;
      if i > 0 then
        os := ARequestInfo.Cookies[0].value;
      os := '';
      if assigned(ARequestInfo.PostStream) then
      begin
        aRequestStream := TStringStream.create;
        try
          aRequestStream.LoadFromStream(ARequestInfo.PostStream);
          aRequestStream.Position := 0;
          if (pos('{', aRequestStream.DataString) > 0) and
            (ARequestInfo.ContentType = 'application/json') then
          begin

            FjValue := TJSONObject.ParseJSONValue
              (UTF8ToString(aRequestStream.DataString)) as TJSONObject;
            Fisjason := true;

          end
          else
          Begin

            aRequestContent := aRequestStream.DataString;
          End;
        finally
          aRequestStream.Free;
        end;
      end
      else
      begin
        if (pos('{', ARequestInfo.Params.Text) > 0) then
        begin

          FjValue := TJSONObject.ParseJSONValue
            (UTF8ToString(ARequestInfo.Params.Text)) as TJSONObject;
          if not assigned(FjValue) then
            raise Exception.create('Conteudo json invalido : ' +
              ARequestInfo.Params.Text);

          Fisjason := true;

        end
      end;
      Fstep := 2;
      isfileRequest := false;
      aFilename := '';
      aFilename := ExtractFileExt(StringReplace(ARequestInfo.URI, '/', '\',
        [rfReplaceAll]));
      if (pos('.', aFilename) > 0) or (FRequestInfo.URI = '/') then
      begin
        isfileRequest := true;
        AResponseInfo.Connection := 'keep-alive';

        if (UpperCase(aFilename) = '.CSS') or (UpperCase(aFilename) = '.JS') or

          (UpperCase(aFilename) = '.HTML') Then
        begin
          AResponseInfo.Date := now;
          AResponseInfo.LastModified := now;
          AResponseInfo.CacheControl := 'private';
          AResponseInfo.Expires := Date + 10;
        end;

        if (UpperCase(aFilename) = 'nfe_app.js') or
          (UpperCase(aFilename) = '.js') then
        begin
          AResponseInfo.Expires := now;
        end;

        if UpperCase(aFilename) = '.CSS' then
          AResponseInfo.ContentType := 'text/css';

        if UpperCase(aFilename) = '.PDF' then
          AResponseInfo.ContentType := 'application/pdf';
        if UpperCase(aFilename) = '.XML' then
          AResponseInfo.ContentType := 'text/xml';

        if FRequestInfo.URI = '/' then
          aFilename := ExtractFilePath(GetModuleName(HInstance)) + _SERVERROOT +
            '\login.html'
        else
          aFilename := ExtractFilePath(GetModuleName(HInstance)) + _SERVERROOT +
            StringReplace(ARequestInfo.URI, '/', '\', [rfReplaceAll]);
        if FileExists(aFilename) then
        begin

          outstrem := TFileStream.create(aFilename, fmOpenRead);
          Try
            AResponseInfo.ContentStream := outstrem;
            AResponseInfo.ResponseNo := 200;
            exit;
          except
          End;
        end
        else
        begin
          AResponseInfo.ResponseNo := 400;
          AResponseInfo.ContentText :=
            '<html><head><title>Arquivo n�o encontrado</title></head><body><h1>'
            + 'O arquivo : ' + ExtractFileName(aFilename) +
            '\nao foi localizado no servidor  </h1></body></html>';
          exit;
        end;
      end;
      Fstep := 3;
      AContext := FContext;
      ARequestInfo := FRequestInfo;
      AResponseInfo := FResponseInfo;
      if not isfileRequest then
        processrequest();
      Fstep := 4;
      setCompactacao();
    except
      on e: Exception do
      begin
        str := e.Message + ' step ' + inttostr(Fstep);
      end;

    end;
  finally
    try
      FjValue := nil;
    except
    end;
  end;

end;
{ ------------------------------------------------------------------------------ }

procedure THttpServerBase.FserverCommandGet(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
begin
  processcommand(AContext, ARequestInfo, AResponseInfo);
end;

{ ------------------------------------------------------------------------------ }
procedure THttpServerBase.FserverCommandOther(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);

begin
  Fcommand := getComandVerb(ARequestInfo.Command);
  if Fcommand = vrOptions then
  begin
    AResponseInfo.CustomHeaders.AddValue('Access-Control-Allow-Methods',
      'POST, GET, OPTIONS, PUT, DELETE, HEAD');
    os := ARequestInfo.RawHeaders.Values['Origin'];
    oc := ARequestInfo.RawHeaders.Values['Access-Control-Request-Headers'];
    ot := ARequestInfo.RawHeaders.Values['Accept'];
    AResponseInfo.CustomHeaders.AddValue('Access-Control-Allow-Origin', os);
    AResponseInfo.CustomHeaders.AddValue('Content-Type', oc);
    AResponseInfo.CustomHeaders.AddValue('Access-Control-Allow-Headers', oc);
    AResponseInfo.CustomHeaders.AddValue('Accept', ot);
    AResponseInfo.ResponseNo := 200
  end
  else
  begin
    processcommand(AContext, ARequestInfo, AResponseInfo);
  end;
end;

{ ------------------------------------------------------------------------------ }
procedure THttpServerBase.pipelog(value: string);
begin
  gravalog(value, '');
end;

{ ------------------------------------------------------------------------------ }
procedure THttpServerBase.processrequest();
begin

end;

procedure THttpServerBase.setResponse(coderetorno, respno: Integer;
  msg: string);
begin
  ResponseInfo.ContentType := 'application/json; charset=utf-8';
  ResponseInfo.ResponseNo := respno;
  ResponseInfo.ContentText := '{"codretorno":' + inttostr(coderetorno) +
    ' ,"msg":"' + msg + '"}'

end;

function GetLocalIP: string;
type
  TaPInAddr = array [0 .. 10] of PInAddr;
  PaPInAddr = ^TaPInAddr;
var
  phe: PHostEnt;
  pptr: PaPInAddr;
  Buffer: array [0 .. 63] of Ansichar;
  i: Integer;
  GInitData: TWSADATA;
begin
  WSAStartup($101, GInitData);
  result := '';
  GetHostName(Buffer, SizeOf(Buffer));
  phe := GetHostByName(Buffer);
  if phe = nil then
    exit;
  pptr := PaPInAddr(phe^.h_addr_list);
  i := 0;
  while pptr^[i] <> nil do
  begin
    result := StrPas(inet_ntoa(pptr^[i]^));
    Inc(i);
  end;
  WSACleanup;
end;

procedure THttpServerBase.setUpWebTemplate;
var
  ofile: string;
  lst: TStringList;
  vserver: string;
begin
  ofile := ExtractFilePath(GetModuleName(HInstance)) + _SERVERROOT +
    '\assets\js2\nfe_app.js';
  if FileExists(ofile) then
  begin
    lst := TStringList.create();
    lst.LoadFromFile(ofile);
    if pos('{nodefined}', lst[0]) > 0 then
    begin
      vserver := 'http://' + GetLocalIP;
      lst[0] := 'var _HOST = ' + QuotedStr(vserver + ':' + inttostr(_HTTP_PORT))
        + '  //{nodefined}';
      lst.SaveToFile(ofile);
      FreeAndNil(lst);
    end;
  end;

end;

{ ------------------------------------------------------------------------------ }
end.

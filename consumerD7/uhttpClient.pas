unit uhttpClient;

interface

uses
  IdComponent,
  SysUtils,
  Variants,
  Classes,
  IdHTTP,
  ZLib,
  idCookieManager,
  IdHashMessageDigest

    ;

type
  TbeforeExecute = TNotifyEvent;

type
  TipoRequest = (vpost, vget, vput, vdelete);

type
  ThttpClient = class
  private
    Fhost: string;
    Fuser: string;
    Fpass: String;
    FPath: string;

    Fresponse: string;
    myHttpCom: TIdHTTP;
    FbeforeExecute: TbeforeExecute;
    FMensageReturneD: string;
    Flogedin: Boolean;
    FFinalized: Boolean;
    Fparam: String;
    Ftiporequest: TipoRequest;
    function decompress(value: TStream): TStream;
    procedure setupIndy();
  public
    procedure execute;
    property OnBeforeExecute: TbeforeExecute Read FbeforeExecute
      write FbeforeExecute;
    property response: string Read Fresponse write Fresponse;
    property Host: string read Fhost write Fhost;
    property User: string read Fuser write Fuser;
    property Paht: string read FPath write FPath;
    property Param: string read Fparam write Fparam;
    property TipoRequest: TipoRequest read Ftiporequest write Ftiporequest;
    property Finalized:Boolean read  FFinalized write  FFinalized;
    property HttpCom:TIdHTTP read  myHttpCom write  myHttpCom;
    constructor create;
  end;

implementation

{ ThttpClient }
procedure ThttpClient.setupIndy();
begin

  with myHttpCom do
  begin
    AllowCookies := true;
    ProxyParams.BasicAuthentication := false;
    HandleRedirects := true;

    Request.Host := Fhost;
    Request.CustomHeaders.Values['Content-Type'] := 'application/json';
    Request.ContentType := 'application/json; charset=iso-8859-1';
    Request.CustomHeaders.Values['User-Agent'] := 'DFEaPIConsumerD7';
  end;
end;

function ThttpClient.decompress(value: TStream): TStream;
var
  Descompressor: TDecompressionStream ;
  buffer:Integer;

  len:Integer;
  outputString: string;
  size:Integer;
  fim: Byte;
begin
  value.Position := 0;
  result:=value;
  try
    Descompressor:= TDecompressionStream.Create(value) ;
    buffer:=0;
    len:=0;
    Descompressor.Read(buffer, SizeOf(Integer));
    try
     Descompressor.Read(Len, SizeOf(Integer));
     SetLength(outputString, Len );
    Descompressor.Read(outputString[1], Len);

      result := TstringStream.Create('');
      result.CopyFrom(Descompressor,Len);
      result.Position:=0;
    finally
      FreeAndNil(Descompressor);
    end;
  except
  end;
end;

{ ------------------------------------------------------------------------------ }
procedure ThttpClient.execute;
var
  srespose: string;

  idmd5: TIdHashMessageDigest5;
  Req_Json: TStream;
  aurl: string;
  decoded: string;
  aresponse: TStream;
  procedure setresponse;
  begin
    if TstringStream(aresponse).DataString <> '' then
    begin
      try
        aresponse :=aresponse;
     //  if Length( TstringStream(aresponse).DataString) > 1000 then
     //     aresponse := decompress(aresponse)
      except
      end;
      Fresponse := TstringStream(aresponse).DataString;
    end;
  end;

begin
  idmd5 := TIdHashMessageDigest5.Create;

  try
    FFinalized := false;
    setupIndy();

    Req_Json := TstringStream.Create(Fparam);
    Req_Json.Position := 0;
    try
      aresponse := TstringStream.Create('');
      case Ftiporequest of
        vget:
          begin
            myHttpCom.Get(Fhost + FPath + '?' + Fparam, aresponse);
            setresponse();
          end;
        vpost:
          begin
            myHttpCom.post(Fhost + FPath, Req_Json, aresponse);
            setresponse();

          end;
        vput:
          begin
            myHttpCom.Put(Fhost + FPath, Req_Json, aresponse);
            setresponse();

          end;
        vdelete:
          begin
            aurl := Fhost + FPath + Fparam;
            //myHttpCom.Delete(aurl, aresponse);
            setresponse();
          end;
      end;

    except
      on E: EIdHTTPProtocolException do
      begin

        if pos('forbidden', AnsiLowerCase(E.Message)) > 0 then
        begin
          FMensageReturneD := 'Servidor recusou a conexão,Atualize a versão';
        end
        else
        begin
          FMensageReturneD := 'Erro ao acessar servidor : '
          + e.ErrorMessage;
          ;
        end;
        Fresponse := FMensageReturneD;
      end;
    end;
  finally
    try
      FreeAndNil(myHttpCom);
      try
        if Assigned(FbeforeExecute) then
          FbeforeExecute(Nil);
      except
      end;
      FreeAndNil(idmd5);

    except
    end;

  end;
end;  
constructor ThttpClient.create;
begin
 myHttpCom := TIdHTTP.Create(nil);
end;

end.

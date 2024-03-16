unit consumerApi;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  Buttons,
  ExtCtrls,
  DB,
  uLkJSON,
  UrlMon,
  IdHTTP,
  IdIOHandler,
  IdIOHandlerSocket,
  IdSSLOpenSSL;

type
  Tconsumer = class

  private
  { Private declarations }
   FnumeroNota:string;
   FtipoNota:Integer;
   FcnpjEmitente:String;
   function enviarRequisicao(jsonHeader:string):TlkJSONbase;
  function setnota:string ;
  public
    { Public declarations }
   function enviarNota(numeroNota:string):TlkJSONbase;
   function cancelarNota(numero,serie,modelo,ano,just,prot,chave:string):TlkJSONbase;
   function inutilizar(ninicial,nfinal,serie,just,modelo,ano:string):TlkJSONbase;
   function manifesto(chave,just:string;tipo,sequencia:integer):TlkJSONbase;
   function cartaCorrecao(chave,correcao,sequencia: string):TlkJSONbase;
   function consultarNota(jsonHeader:string):TlkJSONbase;

  published
     property tipoNota:integer read FtipoNota write FtipoNota;
     property cnpjEmitente:string read FcnpjEmitente write FcnpjEmitente;
  end;
  const url = 'http://localhost:4475' ;

var
  FTconsumer: Tconsumer;

implementation
uses
  synacode,
  geradorXml,
  uhttpClient
  ;
function Tconsumer.cancelarNota(numero,serie,modelo,ano,just,prot,chave: string): TlkJSONbase;
var
 jso : TlkJSONobject;
 i:Integer;
 srequest:string;
begin
  jso := TlkJSONobject.Create;
  try
    jso.Add('cnpj', FcnpjEmitente);
    jso.Add('operacao', 'cancelamento');
    jso.Add('chave',chave);
    jso.Add('numero',numero);
    jso.Add('serie',serie);
    jso.Add('protocolo',prot) ;
    jso.Add('emailDestinatario' ,'wilson.rodrigues@wkconsultoria.com.br');
    jso.Add('justificativa',just);
    jso.Add('Data',FormatDateTime('YYYY-MM-DD ', Now));
    jso.Add('modelo',modelo) ;
    jso.Add('ano',ano);
  finally
    i:=0;
    srequest:=StringReplace(GenerateReadableText(jso, i),#13#10,'',[rfReplaceAll, rfIgnoreCase]);

  end;
  FnumeroNota:=numero;
  result:=enviarRequisicao(srequest);

end;
{------------------------------------------------------------------------------}
function Tconsumer.cartaCorrecao(chave,correcao,sequencia: string): TlkJSONbase;
var
 jso : TlkJSONobject;
 i:Integer;
 srequest:string;
begin
  jso := TlkJSONobject.Create;
  try
    jso.Add('cnpj', FcnpjEmitente);
    jso.Add('operacao', 'cartacorrecao');
    jso.Add('emailDestinatario' ,'wilson.rodrigues@wkconsultoria.com.br');
    jso.Add('chave',chave);
    jso.Add('xcorrecao',correcao) ;
    jso.Add('dataHora',FormatDateTime('YYYY-MM-DD ', Now));
    jso.Add('sequencia',sequencia) ;

  finally
    i:=0;
    srequest:=StringReplace(GenerateReadableText(jso, i),#13#10,'',[rfReplaceAll, rfIgnoreCase]);

  end;

  result:=enviarRequisicao(srequest);


end;
{------------------------------------------------------------------------------}
function Tconsumer.consultarNota(jsonHeader: string): TlkJSONbase;
begin
  //***
end;
{------------------------------------------------------------------------------}
function Tconsumer.enviarNota(numeroNota: string): TlkJSONbase;
begin
  FnumeroNota:=numeroNota;
  result:=enviarRequisicao( setnota);
end;
{------------------------------------------------------------------------------}
function Tconsumer.enviarRequisicao(jsonHeader: string):TlkJSONbase;
var
  cli:ThttpClient;
 // Ssl:TIdSSLIOHandlerSocket ;

  vParseResult:Integer;
begin
  cli:=ThttpClient.create;
  If pos('https',url)> 0 then
  begin
   // Ssl:=TIdSSLIOHandlerSocket.Create(cli.HttpCom) ;
   // cli.HttpCom.IOHandler:=Ssl;
  end;
  try
    cli.param:=jsonHeader;
    cli.Host:= url ;
    cli.Paht:= '/dfeapi/nfe/' ;
    cli.TipoRequest:=vpost;

   if DebugHook > 0 then
    begin
      with TStringList.create do
      begin
        text:= cli.Param;
        SaveToFile('c:\api.json');
        free;
      end;
    end ;
    cli.execute;
    try 
      result := TlkJSON.ParseText(cli.response);
      with TStringList.create do
      begin
         text:= cli.response;
         savetofile('c:\json.json') ;

      end;
      if not Assigned(result) then
      begin
       result := TlkJSON.ParseText('{"error":"'+ cli.response+'"}');

      end;
   except
      on e:exception do
         result := TlkJSON.ParseText('{"error":"'+ e.Message+'"}');
    end;

  finally
    FreeAndNil(cli);

  end;
end;
{------------------------------------------------------------------------------}
function Tconsumer.inutilizar(ninicial,nfinal,serie,just,modelo,ano:string): TlkJSONbase;
var
 jso : TlkJSONobject;
 i:Integer;
 srequest:string;
begin
  jso := TlkJSONobject.Create;
  try
    jso.Add('cnpj', FcnpjEmitente);
    jso.Add('operacao', 'inutilizacao');
    jso.Add('numeroInicial',ninicial);
    jso.Add('numeroFinal',nfinal);
    jso.Add('serie',serie);
    jso.Add('justificativa',just);
    jso.Add('Data',FormatDateTime('YYYY-MM-DD', Now));
    jso.Add('modelo',modelo) ;
    jso.Add('ano',ano);
  finally
    i:=0;
    srequest:=StringReplace(GenerateReadableText(jso, i),#13#10,'',[rfReplaceAll, rfIgnoreCase]);

  end;
  result:=enviarRequisicao(srequest);

end;
{------------------------------------------------------------------------------}
function Tconsumer.manifesto(chave, just: string;
  tipo,sequencia: integer): TlkJSONbase;
var
 jso : TlkJSONobject;
 i:Integer;
 srequest:string;
begin
  jso := TlkJSONobject.Create;
  try
    jso.Add('cnpj', FcnpjEmitente);
    jso.Add('operacao', 'manifesto');
    jso.Add('chave',chave);
    jso.Add('justificativa',just) ;
    //no delphi 7 nao  tem a funcao DateToISO8601
    jso.Add('dataHora', FormatDateTime('YYYY-MM-dd' , Now)+'T'+FormatDateTime('hh:nn:ss' , Now));
    jso.Add('tipo',tipo) ;
    jso.Add('sequencia',sequencia) ;
  finally
    i:=0;
    srequest:=StringReplace(GenerateReadableText(jso, i),#13#10,'',[rfReplaceAll, rfIgnoreCase]);
  end;
  result:=enviarRequisicao(srequest);
end;  
function Tconsumer.setnota(): string;
var
 jso : TlkJSONobject;
 i:Integer;
 FgeradorXml:TgeraXml;
 modelo:string;
 FxmlNfe:string;
begin
  result:='';
  FgeradorXml:=TgeraXml.Create;
  jso := TlkJSONobject.Create;
  If FtipoNota =55  then
  begin
    FxmlNfe:=FgeradorXml.gerarXmlNFE(FnumeroNota) ;
  end Else
  begin
    FxmlNfe:=FgeradorXml.gerarXmlNFCE(FnumeroNota) ;
  end;
  try
    jso.Add('cnpj', FcnpjEmitente);
    //e-mail transportadora
    jso.Add('emailtransportadora', 'wilson.rodrigues@wkconsultoria.com.br');
    jso.Add('operacao', 'validacao');
    jso.Add('numero',FnumeroNota);
    jso.Add('serie','1');
    jso.Add('Xml',String(EncodeBase64(AnsiString(FxmlNfe))));
    jso.Add('lote','1') ;
    jso.Add('modelo',inttostr(FtipoNota));
  finally
    i:=0;

    result:=StringReplace(GenerateReadableText(jso, i),#13#10,'',[rfReplaceAll, rfIgnoreCase]);

  end;
end;
{------------------------------------------------------------------------------}


end.

unit consumerApi;

interface

uses
  Windows,
  Messages,
  SysUtils,
  json,
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
   FserieNota:string;
   FtipoNota:Integer;
   FcnpjEmitente:String;
   function enviarRequisicao(jsonHeader:string):TjsonObject;
  function setnota:string ;
  public
    { Public declarations }
   function enviarNota(numeroNota,serieNota:string):TjsonObject;
   function cancelarNota(numero,serie,modelo,ano,just,prot,chave:string):TjsonObject;
   function inutilizar(ninicial,nfinal,serie,just,modelo,ano:string):TjsonObject;
   function manifesto(chave,just:string;tipo,sequencia:integer):TjsonObject;
   function cartaCorrecao(chave,correcao,sequencia: string):TjsonObject;
   function consultarNota(jsonHeader:string):TjsonObject;

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
function Tconsumer.cancelarNota(numero,serie,modelo,ano,just,prot,chave: string): TjsonObject;
var
 jso : tjsonObject;
 i:Integer;
 srequest:string;
begin
  jso := tjsonObject.Create;
  try
    jso.AddPair ('cnpj', FcnpjEmitente);
    jso.AddPair('operacao', 'cancelamento');
    jso.AddPair('chave',chave);
    jso.AddPair('numero',numero);
    jso.AddPair('serie',serie);
    jso.AddPair('protocolo',prot) ;
    jso.AddPair('emailDestinatario' ,'wilson.rodrigues@wkconsultoria.com.br');
    jso.AddPair('justificativa',just);
    jso.AddPair('Data',FormatDateTime('YYYY-MM-DD ', Now));
    jso.AddPair('modelo',modelo) ;
    jso.AddPair('ano',ano);
  finally
    i:=0;
    srequest:=StringReplace(jso.tostring,#13#10,'',[rfReplaceAll, rfIgnoreCase]);

  end;
  FnumeroNota:=numero;
  result:=enviarRequisicao(srequest);

end;
{------------------------------------------------------------------------------}
function Tconsumer.cartaCorrecao(chave,correcao,sequencia: string): TjsonObject;
var
 jso : tjsonObject;
 i:Integer;
 srequest:string;
begin
  jso := tjsonObject.Create;
  try
    jso.AddPair('cnpj', FcnpjEmitente);
    jso.AddPair('operacao', 'cartacorrecao');
    jso.AddPair('emailDestinatario' ,'wilson.rodrigues@wkconsultoria.com.br');
    jso.AddPair('chave',chave);
    jso.AddPair('xcorrecao',correcao) ;
    jso.AddPair('dataHora',FormatDateTime('YYYY-MM-DD ', Now));
    jso.AddPair('sequencia',sequencia) ;

  finally
    i:=0;
    srequest:=StringReplace(jso.tostring,#13#10,'',[rfReplaceAll, rfIgnoreCase]);

  end;

  result:=enviarRequisicao(srequest);


end;
{------------------------------------------------------------------------------}
function Tconsumer.consultarNota(jsonHeader: string): TjsonObject;
begin
  //***
end;
{------------------------------------------------------------------------------}
function Tconsumer.enviarNota(numeroNota,serieNota: string): TjsonObject;
begin
  FnumeroNota:=numeroNota;
  FserieNota:=serieNota;
  result:=enviarRequisicao( setnota);
end;
{------------------------------------------------------------------------------}
function Tconsumer.enviarRequisicao(jsonHeader: string):TjsonObject;
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
      result := TJSonObject.ParseJSONValue(cli.response) as TJSONObject;
      with TStringList.create do
      begin
         text:= cli.response;
         savetofile('c:\json.json') ;

      end;
      if not Assigned(result) then
      begin
       result := TJSonObject.ParseJSONValue('{"error":"'+ cli.response+'"}') as TJSONObject;

      end;
   except
      on e:exception do
         result := TJSonObject.ParseJSONValue('{"error":"'+ e.Message+'"}') as TJSONObject;
    end;

  finally
    FreeAndNil(cli);

  end;
end;
{------------------------------------------------------------------------------}
function Tconsumer.inutilizar(ninicial,nfinal,serie,just,modelo,ano:string): TjsonObject;
var
 jso : tjsonObject;
 i:Integer;
 srequest:string;
begin
  jso := tjsonObject.Create;
  try
    jso.AddPair('cnpj', FcnpjEmitente);
    jso.AddPair('operacao', 'inutilizacao');
    jso.AddPair('numeroInicial',ninicial);
    jso.AddPair('numeroFinal',nfinal);
    jso.AddPair('serie',serie);
    jso.AddPair('justificativa',just);
    jso.AddPair('Data',FormatDateTime('YYYY-MM-DD', Now));
    jso.AddPair('modelo',modelo) ;
    jso.AddPair('ano',ano);
  finally
    i:=0;
    srequest:=StringReplace(jso.tostring,#13#10,'',[rfReplaceAll, rfIgnoreCase]);

  end;
  result:=enviarRequisicao(srequest);

end;
{------------------------------------------------------------------------------}
function Tconsumer.manifesto(chave, just: string;
  tipo,sequencia: integer): TjsonObject;
var
 jso : tjsonObject;
 i:Integer;
 srequest:string;
begin
  jso := tjsonObject.Create;
  try
    jso.AddPair('cnpj', FcnpjEmitente);
    jso.AddPair('operacao', 'manifesto');
    jso.AddPair('chave',chave);
    jso.AddPair('justificativa',just) ;
    //no delphi 7 nao  tem a funcao DateToISO8601
    jso.AddPair('dataHora', FormatDateTime('YYYY-MM-dd' , Now)+'T'+FormatDateTime('hh:nn:ss' , Now));
    jso.AddPair('tipo',tipo) ;
    jso.AddPair('sequencia',sequencia) ;
  finally
    i:=0;
    srequest:=StringReplace(jso.tostring,#13#10,'',[rfReplaceAll, rfIgnoreCase]);
  end;
  result:=enviarRequisicao(srequest);
end;  
function Tconsumer.setnota(): string;
var
 jso : tjsonObject;
 i:Integer;
 FgeradorXml:TgeraXml;
 modelo:string;
 FxmlNfe:string;
begin
  result:='';
  FgeradorXml:=TgeraXml.Create;
  jso := tjsonObject.Create;
  If FtipoNota =55  then
  begin
    FxmlNfe:=FgeradorXml.gerarXmlNFE(FnumeroNota,FserieNota) ;
  end Else
  begin
    FxmlNfe:=FgeradorXml.gerarXmlNFCE(FnumeroNota,FserieNota) ;
  end;
  try
    jso.AddPair('cnpj', FcnpjEmitente);
    //e-mail transportadora
    jso.AddPair('emailtransportadora', 'wilson.rodrigues@wkconsultoria.com.br');
    jso.AddPair('operacao', 'validacao');
    jso.AddPair('numero',FnumeroNota);
    jso.AddPair('serie','1');
    jso.AddPair('Xml',String(EncodeBase64(AnsiString(FxmlNfe))));
    jso.AddPair('lote','1') ;
    jso.AddPair('modelo',inttostr(FtipoNota));
  finally
    i:=0;

    result:=StringReplace(  jso.tostring,#13#10,'',[rfReplaceAll, rfIgnoreCase]);

  end;
end;
{------------------------------------------------------------------------------}


end.

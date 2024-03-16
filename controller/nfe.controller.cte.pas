unit nfe.controller.cte;

interface

uses
  classes,
  Xml.XmlTransform,
  Xml.XMLIntf,
  Xml.xmldom,
  dateUtils,
  System.JSON,
  Xml.XMLDoc,
  REST.JSON.Types,
  dfe.model.manifestoRequest,
  dfe.services.cteManifestar,
  dfe.dto.DtoCteIde,
  dfe.dao.cte,
  REST.JSON,
  sysutils,
  dfe.lib.XmltoJson,
  dfe.lib.jsontoXml,
  System.NetEncoding;

type
  TCteController = class
  private

  public

    function manifestoCte(pjson: TJSONObject): string;
    function listarCte(pjson: TJSONObject): string;

  end;

implementation

uses
  dfe.model.manifesto;

function TCteController.manifestoCte(pjson: TJSONObject): string;
var
  manifesto: Tmanifesto;
  service: TServicemanifestoCte;
  request: TmanifestoRequest;
  response: Tmanifesto;
  procedure setResponsebyManifesto();
  begin
    response := Tmanifesto.create;
    response.Cnpj := manifesto.Cnpj;
    response.chave := manifesto.chave;
    response.dataHora := request.dataHora;
    response.sequencia := request.sequencia;
    response.justificativa := request.justificativa;
    response.xmotivo := manifesto.xmotivo;
    response.cstat := manifesto.cstat;
    response.xmlEvento := TNetEncoding.base64.Encode(manifesto.xmlEvento);
    response.danfe := manifesto.danfe;
    response.cstat := manifesto.cstat;
    response.xmotivo := manifesto.xmotivo;
    response.protocolo := manifesto.protocolo;
    response.danfeBase64 := manifesto.danfe;
  end;

begin
  try
    request := tjson.JsonToObject<TmanifestoRequest>(pjson.tostring);
    manifesto := Tmanifesto.create();
    manifesto.Cnpj := request.Cnpj;
    manifesto.chave := request.chave;
    manifesto.dataHora := request.dataHora;
    manifesto.sequencia := request.sequencia;
    manifesto.justificativa := request.justificativa;
    manifesto.tipo := request.tipo;
    service := TServicemanifestoCte.create(manifesto);
    setResponsebyManifesto();
    result := tjson.ObjectToJsonString(response);
  finally
    FreeAndNil(service);
    if assigned(response) then
      FreeAndNil(response);
  end;
end;

{ --------------------------------------------------------------------------- }
function TCteController.listarCte(pjson: TJSONObject): string;
var
  dao: TDaoCte;
  CteCollection: TDtoCteIdeCollection;
begin
  dao := TDaoCte.create();
  try
    if assigned(pjson) then
      CteCollection := dao.listarCte(pjson)
    else
      CteCollection := dao.listarCte(Nil);
    result := tjson.ObjectToJsonString(CteCollection);
  finally
    if assigned(CteCollection) then
      FreeAndNil(CteCollection);
    FreeAndNil(dao);
  end;

end;

{ -------------------------------------------------------------------------- }
end.

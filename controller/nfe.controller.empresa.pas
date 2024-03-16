unit nfe.controller.empresa;

interface

uses
  classes,
  REST.JSON.Types,
  REST.JSON,
  JSON,
  sysutils,

  dfe.dao.empresa,

  dfe.model.infonfe,
  dfe.dao.infonfe,
  dfe.lib.util,
  dfe.model.empresa;

type
  TEmpresaController = class
  private

  public
    function gravarEmpresa(JSON: TJSONObject): string;
    function apagarEmpresa(JSON: TJSONObject): string;
    function getEmpresa(JSON: TJSONObject): string;
    function listarEmpresa(JSON: TJSONObject): string;

  end;

implementation

{ TEmpresaController }
{ ----------------------------------------------------------------------------- }
function TEmpresaController.apagarEmpresa(JSON: TJSONObject): string;
var
  dao: TDaoEmpresa;
  empresa: TEmpresa;
begin
  dao := TDaoEmpresa.create;
  try
    empresa := TEmpresa.create('');
    empresa := TJson.JsonToObject<TEmpresa>(JSON);
    dao.apagarEmpresa(empresa);
    result := 'Empresa ' + empresa.cnpj + ' excluida';
  finally
    if assigned(empresa) then
      FreeAndNil(empresa);
    FreeAndNil(dao);
  end;
end;

{ ----------------------------------------------------------------------------- }
function TEmpresaController.getEmpresa(JSON: TJSONObject): string;
var
  dao: TDaoEmpresa;
  empresas: Tempresas;
  s:string;
begin
  dao := TDaoEmpresa.create;
  try
    try
    if assigned(JSON) then
      empresas := dao.listEmpresas(JSON)
    else
      empresas := dao.listEmpresas(Nil);
    result := TJson.ObjectToJsonString(empresas);
    except
      on e:exception do
         s:=e.Message
    end;
  finally
    if assigned(empresas) then
      FreeAndNil(empresas);
    if assigned(dao) then
      FreeAndNil(dao);
  end;

end;

{ ----------------------------------------------------------------------------- }
function TEmpresaController.gravarEmpresa(JSON: TJSONObject): string;
var
  dao: TDaoEmpresa;
  empresa: TEmpresa;

begin
  dao := TDaoEmpresa.create;
  try
    empresa := TEmpresa.create('');
   //TJSONParseOption = (IsUTF8, UseBool, RaiseExc);
    empresa := TJson.JsonToObject<TEmpresa>(UTF8Encode( JSON.ToString));
   
    if empresa.razao_social = '' then
      raise Exception.create('Raz�o social n�o informada');
    if empresa.certificadoPfx = '' then
      raise Exception.create('Arquivo pfx n�o informado');
    if empresa.senhaPfx = '' then
      raise Exception.create('Senha do arquivo pfx n�o informada');

    dao.gravarEmpresa(empresa);
    result := 'Empresa ' + empresa.cnpj + ' gravada/atualizada';
  finally
    if assigned(empresa) then
      FreeAndNil(empresa);
    FreeAndNil(dao);
  end;
end;

{ ----------------------------------------------------------------------------- }
function TEmpresaController.listarEmpresa(JSON: TJSONObject): string;
var
  dao: TDaoEmpresa;
  empresas: Tempresas;
begin
  dao := TDaoEmpresa.create;
  try
    if assigned(JSON) then
      empresas := dao.listEmpresas(JSON)
    else
      empresas := dao.listEmpresas(Nil);
    result := TJson.ObjectToJsonString(empresas);
  finally
    if assigned(empresas) then
      FreeAndNil(empresas);
    FreeAndNil(dao);
  end;
end;

{ ----------------------------------------------------------------------------- }
end.

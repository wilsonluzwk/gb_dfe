unit dfe.dao.usuarios;

interface

Uses
  windows,
  sysutils,
  REST.JSON.Types,
  REST.JSON,
  system.JSON,
  dfe.dao.base,
  dfe.model.nfe,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.MongoDBDef,
  FireDAC.Phys.MongoDB,
  FireDAC.Comp.UI,
  FireDac.Stan.param,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Phys.MongoDBWrapper,
  system.JSON.Types,
  system.JSON.BSON,
  system.JSON.Builders,
  system.Rtti,
  system.JSON.Readers,
  system.Diagnostics,
  dfe.lib.util,
  FireDAC.Stan.util,
  classes;

type
  TDaoUsuarios = class(TDaoBase)
  private


  public
    function validarUsuario(user,senha:string): Boolean;

  end;

implementation

{ TDaoUsuarios }
{ ---------------------------------------------------------------------------- }

function TDaoUsuarios.validarUsuario(user,senha:string): Boolean;
var

  qry: TFDQuery;

begin
  qry := TFDQuery.Create(Nil);
  qry.Connection := FDConNFe;
  qry.FetchOptions.Unidirectional := true;
  qry.UpdateOptions.ReadOnly := true;

  try
    qry.sql.Add('SELECT *          ');
    qry.sql.Add('FROM              ');
    qry.sql.Add('   TabUsu         ');
    qry.sql.Add('WHERE             ');
    qry.sql.Add('  login = :login  ');
    qry.sql.Add('  AND  senha = :senha') ;
    qry.ParamByName('Login').AsString :=user;
    qry.ParamByName('senha').AsString :=senha;
    qry.Open();
    result:=qry.RecordCount > 0;


  finally
    qry.Close;
    FreeAndNil(qry);

  end;
end;



{ ---------------------------------------------------------------------------- }
end.

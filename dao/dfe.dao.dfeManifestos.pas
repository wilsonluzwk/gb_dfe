unit dfe.dao.dfeManifestos;

interface

Uses
  windows,
  sysutils,
  REST.JSON.Types,
  REST.JSON,
  system.JSON,
  dfe.dao.base,
  dfe.model.cancelamento,
  dfe.model.nfe,
 
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Phys.MongoDBWrapper,
  system.JSON.Types,
  system.JSON.BSON,
  system.JSON.Builders,
  system.Rtti,
  system.JSON.Readers,
  system.Diagnostics,
  FireDAC.Stan.Util,
  classes;

type
  TDaoManifestos = class(TDaoBase)
  private

  public
  procedure getdadosNSU(var sequencia: double; var dataConsulta: TDateTime;
  codigo_loja: integer);

  end;

implementation

{ TDaoNfe }
{ ---------------------------------------------------------------------------- }



{ ---------------------------------------------------------------------------- }
{ TDaoManifestos }

procedure TDaoManifestos.getdadosNSU(var sequencia: double;
  var dataConsulta: TDateTime; codigo_loja: integer);

var
  qry: TFDQuery;
begin

  qry := TFDQuery.Create(Nil);
  qry.Connection := FDConNFe;
  try
    qry.SQL.Clear;
    with qry.SQL do
    begin
      qry.SQL.Add('SELECT                            ');
      qry.SQL.Add('  NSU_SEQUENCIA,NSU_DATA_CONSULTA ');
      qry.SQL.Add('FROM                              ');
      qry.SQL.Add('   emitente                       ');
      qry.SQL.Add('WHERE                             ');
      qry.SQL.Add('  Codigo_loja = ' + IntToStr(codigo_loja));
      qry.open();
      sequencia := qry.FieldByName('NSU_SEQUENCIA').AsFloat;
      dataConsulta := qry.FieldByName('NSU_DATA_CONSULTA').AsDateTime;

    end;
  finally
    qry.Close;
    FreeAndNil(qry);
  end;

end;

end.

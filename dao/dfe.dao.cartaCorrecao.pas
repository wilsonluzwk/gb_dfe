unit dfe.dao.cartaCorrecao;

interface

Uses
  windows,
  sysutils,
  REST.JSON.Types,
  REST.JSON,
  system.JSON,
  dfe.dao.base,
  dfe.lib.util,

  dfe.model.cartaCorrecao,
  Data.DB,
  Resources.cartaCorrecao,
  system.JSON.Types,
  system.JSON.BSON,
  system.JSON.Builders,
  system.Rtti,
  system.JSON.Readers,
  system.Diagnostics,
  FireDAC.Stan.util,
  classes;

type
  TDaoCartaCorrecao = class(TDaoBase)
  private

  public
    function gravarCartaCorrecao(pCartaCorrecao: TCartaCorrecao): Boolean;
    function getCartaCorrecao(param: TJSONObject): TCartaCorrecao;
    function listCartaCorrecaos(param: TJSONObject): TcartasCorrecao;

  end;

implementation

{ TDaoNfe }
{ ---------------------------------------------------------------------------- }
function TDaoCartaCorrecao.getCartaCorrecao(param: TJSONObject): TCartaCorrecao;
var
  Lresult: string;
  Lresource: TResourceCartacorrecao;
  i: Integer;
  LcartaCorrecao: TCartaCorrecao;
begin
  try
    result := TcartaCorrecao.create;
    Lresource := TResourceCartacorrecao.create();
    try
      Lresource.Get(Nil, 1, 50, '', '', param.ToString, '', '', Nil);
      for i := 0 to Lresource.JsonArrayList.Count - 1 do
      begin
        result:=LcartaCorrecao;
      end;
    finally
      FreeAndNil(Lresource)
    end;
  except
    on e: exception do
    begin
      GravaLog(self.ClassName + '-' + e.Message, '');
    end;
  end;
end;

{ ---------------------------------------------------------------------------- }
function TDaoCartaCorrecao.gravarCartaCorrecao(pCartaCorrecao
  : TCartaCorrecao): Boolean;
var
  Lresource: TResourceCartacorrecao;
begin

  Lresource := TResourceCartacorrecao.create();
  try
    try
      Lresource.Post(nil, tjson.ObjectToJsonObject(pCartaCorrecao));
    except
      on e: exception do
      begin
        GravaLog(self.ClassName + '-' + e.Message, pCartaCorrecao.Cnpj);
      end;
    end;
  finally
    FreeAndNil(Lresource);
  end;
end;

{ ---------------------------------------------------------------------------- }

function TDaoCartaCorrecao.listCartaCorrecaos(param: TJSONObject)
  : TcartasCorrecao;
var
  Lresult: string;
  Lresource: TResourceCartacorrecao;
  i: Integer;
  LcartaCorrecao: TCartaCorrecao;
  Lsearch:string;
begin
  try
    result := TcartasCorrecao.create;
    Lsearch:=PrepareFilter('protocoloCCe','dataHora', param);
    Lresource := TResourceCartacorrecao.create();
    try
      Lresource.Get(Nil, 1, 50, '', '', Lsearch, '', '', Nil);
      for i := 0 to Lresource.JsonArrayList.Count - 1 do
      begin
        LcartaCorrecao := tjson.JsonToObject<TCartaCorrecao>
          (Lresource.JsonArrayList[i].ToJSON);
        result.Add(LcartaCorrecao);
      end;
    finally
      FreeAndNil(Lresource)
    end;
  except
    on e: exception do
    begin
      GravaLog(self.ClassName + '-' + e.Message, '');
    end;
  end;

end;

{ ---------------------------------------------------------------------------- }
end.

unit dfe.dao.inutilizacao;

interface

Uses
  windows,
  sysutils,
  REST.JSON.Types,
  REST.JSON,
  system.JSON,
  dfe.dao.base,
  dfe.model.inutilizacao,
  Data.DB,
  system.JSON.Types,
  system.JSON.BSON,
  system.JSON.Builders,
  system.Rtti,
  system.JSON.Readers,
  system.Diagnostics,
  FireDAC.Stan.Util,
  dfe.lib.Util,
  Resources.inutilizacao,
  classes;

type
  TDaoInutilizacao = class(TDaoBase)
  private
  public
    function gravarInutilizacao(pInutilizacao: TInutilizacao): Boolean;
    function getInutilizacao(param: TJSONObject): TInutilizacao;
    function listInutilizacaos(param: TJSONObject): TInutilizacoes;

  end;

implementation

{ TDaoNfe }
{ ---------------------------------------------------------------------------- }

function TDaoInutilizacao.getInutilizacao(param: TJSONObject): TInutilizacao;
begin

end;

{ ---------------------------------------------------------------------------- }
function TDaoInutilizacao.gravarInutilizacao(pInutilizacao
  : TInutilizacao): Boolean;
var
  Lresource: TResourceInutilizacao;
begin
  Lresource := TResourceInutilizacao.create();
  try
    try
      Lresource.Post(nil, tjson.ObjectToJsonObject(pInutilizacao));
    except
      on e: exception do
      begin
        GravaLog(self.ClassName + '-' + e.Message, pInutilizacao.Cnpj);
      end;
    end;
  finally
    FreeAndNil(Lresource);
  end;

end;

{ ---------------------------------------------------------------------------- }
function TDaoInutilizacao.listInutilizacaos(param: TJSONObject): TInutilizacoes;
var
  Lresult: string;
  Lresource: TResourceInutilizacao;
  i: Integer;
  LInutilizacao: TInutilizacao;
  LConsulta: string;
begin
  try
    result := TInutilizacoes.create;
    LConsulta := PrepareFilter('protocolo', 'dhRecbto', param);
    Lresource := TResourceInutilizacao.create();
    try
      Lresource.Get(Nil, 1, 50, '', '', LConsulta, '', '', Nil);
      for i := 0 to Lresource.JsonArrayList.Count - 1 do
      begin
        LInutilizacao := tjson.JsonToObject<TInutilizacao>
          (Lresource.JsonArrayList[i].ToJSON);
        result.Add(LInutilizacao);
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

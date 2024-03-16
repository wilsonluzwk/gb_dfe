unit dfe.dao.cancelamento;

interface

Uses
  windows,
  System.DateUtils,
  sysutils,
  REST.JSON.Types,
  REST.JSON,
  System.JSON,
  dfe.dao.base,
  dfe.dao.nfe,
  dfe.dao.empresa,
  Math,
  dfe.model.empresa,
  dfe.model.cancelamento,
  dfe.model.nfe,
  System.JSON.Types,
  System.JSON.BSON,
  System.JSON.Builders,
  System.Rtti,
  System.JSON.Readers,
  System.Diagnostics,
  FireDAC.Stan.Util,
  Resources.cancelamento,
  dfe.lib.Util,
  classes;

type
  TDaoCancelamento = class(TDaoBase)
  private

  public
    function gravarCancelamento(pCancelamento: TCancelamento): Boolean;
    function getCancelamento(param: TJSONObject): TCancelamento;
    function listCancelamentos(param: TJSONObject): TCancelamentos;

    procedure testeinsert();
  end;

implementation

{ TDaoNfe }
{ ---------------------------------------------------------------------------- }
function TDaoCancelamento.getCancelamento(param: TJSONObject): TCancelamento;
begin

end;

{ ---------------------------------------------------------------------------- }
function TDaoCancelamento.gravarCancelamento(pCancelamento
  : TCancelamento): Boolean;
var
  oText: string;
  dao: TDaoNfe;
  daoEmpresa: TDaoEmpresa;
  nota: Tnota;
  empresa: TEmpresa;
  Lresource: TResourceCancelamento;
begin
  dao := TDaoNfe.create;
  nota := Tnota.create;
  daoEmpresa := TDaoEmpresa.create;
  try
    if pCancelamento.protocoloCancelamento <> '' then
    begin
      nota.cnpj := pCancelamento.cnpj;
      empresa := daoEmpresa.getEmpresaCnpj(pCancelamento.cnpj);
      nota.codigo_loja := empresa.codigo_loja;
      nota.numero := pCancelamento.numero;
      nota.protocolo := pCancelamento.protocoloCancelamento;
      nota.motivo := pCancelamento.xmotivo;
      nota.chave := pCancelamento.chave;
      nota.situacao := inttostr(pCancelamento.cstat);
      dao.atualizarStatus(nota);
      Lresource := TResourceCancelamento.create();
      try
        try
          Lresource.Post(nil, tjson.ObjectToJsonObject(pCancelamento));
        except
          on e: exception do
          begin
            GravaLog(self.ClassName + '-' + e.Message, pCancelamento.cnpj);
          end;
        end;
      finally
        FreeAndNil(Lresource);
      end;
    end;
  finally
    FreeAndNil(nota);
    FreeAndNil(dao);
  end;
end;

{ ---------------------------------------------------------------------------- }
function TDaoCancelamento.listCancelamentos(param: TJSONObject): TCancelamentos;
var
  Lresult: string;
  Lresource: TResourceCancelamento;
  i: Integer;
  Lcancelamento: TCancelamento;
  LConsulta:string;
begin
  try
    result := TCancelamentos.create;
     LConsulta := PrepareFilter('protocoloCancelamento', 'data', param);
    Lresource := TResourceCancelamento.create();
    try
      Lresource.Get(Nil, 1, 50, '', '', LConsulta, '', '', Nil);
      for i := 0 to Lresource.JsonArrayList.Count - 1 do
      begin
        Lcancelamento := tjson.JsonToObject<TCancelamento>
          (Lresource.JsonArrayList[i].ToJSON);
        result.Add(Lcancelamento);
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

procedure TDaoCancelamento.testeinsert;
begin

end;

{ ---------------------------------------------------------------------------- }
end.

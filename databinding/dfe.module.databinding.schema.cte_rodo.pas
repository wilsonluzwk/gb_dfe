
{**************************************************************************************}
{                                                                                      }
{                                   XML Data Binding                                   }
{                                                                                      }
{         Generated on: 02/06/2024 17:05:51                                            }
{       Generated from: C:\DESENV\COMPONENTES\ABCR2\CTE\cteModalRodoviario_v2.00.xsd   }
{   Settings stored in: C:\DESENV\COMPONENTES\ABCR2\CTE\cteModalRodoviario_v2.00.xdb   }
{                                                                                      }
{**************************************************************************************}

unit dfe.module.databinding.schema.cte_rodo;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLRodo = interface;
  IXMLOcc = interface;
  IXMLEmiOcc = interface;
  IXMLValePed = interface;
  IXMLValePedList = interface;
  IXMLVeic = interface;
  IXMLVeicList = interface;
  IXMLProp = interface;
  IXMLLacRodo = interface;
  IXMLLacRodoList = interface;
  IXMLMoto = interface;
  IXMLMotoList = interface;

{ IXMLRodo }

  IXMLRodo = interface(IXMLNode)
    ['{3DE483B0-8947-4990-8A9D-059222E490E5}']
    { Property Accessors }
    function Get_RNTRC: WideString;
    function Get_DPrev: WideString;
    function Get_Lota: WideString;
    function Get_CIOT: WideString;
    function Get_Occ: IXMLOcc;
    function Get_ValePed: IXMLValePedList;
    function Get_Veic: IXMLVeicList;
    function Get_LacRodo: IXMLLacRodoList;
    function Get_Moto: IXMLMotoList;
    procedure Set_RNTRC(Value: WideString);
    procedure Set_DPrev(Value: WideString);
    procedure Set_Lota(Value: WideString);
    procedure Set_CIOT(Value: WideString);
    { Methods & Properties }
    property RNTRC: WideString read Get_RNTRC write Set_RNTRC;
    property DPrev: WideString read Get_DPrev write Set_DPrev;
    property Lota: WideString read Get_Lota write Set_Lota;
    property CIOT: WideString read Get_CIOT write Set_CIOT;
    property Occ: IXMLOcc read Get_Occ;
    property ValePed: IXMLValePedList read Get_ValePed;
    property Veic: IXMLVeicList read Get_Veic;
    property LacRodo: IXMLLacRodoList read Get_LacRodo;
    property Moto: IXMLMotoList read Get_Moto;
  end;

{ IXMLOcc }

  IXMLOcc = interface(IXMLNode)
    ['{06F19993-2363-4472-A788-9ADDF0CA0E4A}']
    { Property Accessors }
    function Get_Serie: WideString;
    function Get_NOcc: WideString;
    function Get_DEmi: WideString;
    function Get_EmiOcc: IXMLEmiOcc;
    procedure Set_Serie(Value: WideString);
    procedure Set_NOcc(Value: WideString);
    procedure Set_DEmi(Value: WideString);
    { Methods & Properties }
    property Serie: WideString read Get_Serie write Set_Serie;
    property NOcc: WideString read Get_NOcc write Set_NOcc;
    property DEmi: WideString read Get_DEmi write Set_DEmi;
    property EmiOcc: IXMLEmiOcc read Get_EmiOcc;
  end;

{ IXMLEmiOcc }

  IXMLEmiOcc = interface(IXMLNode)
    ['{93039AAF-C04D-4C89-A8A5-4E2FBA82DEB9}']
    { Property Accessors }
    function Get_CNPJ: WideString;
    function Get_CInt: WideString;
    function Get_IE: WideString;
    function Get_UF: WideString;
    function Get_Fone: WideString;
    procedure Set_CNPJ(Value: WideString);
    procedure Set_CInt(Value: WideString);
    procedure Set_IE(Value: WideString);
    procedure Set_UF(Value: WideString);
    procedure Set_Fone(Value: WideString);
    { Methods & Properties }
    property CNPJ: WideString read Get_CNPJ write Set_CNPJ;
    property CInt: WideString read Get_CInt write Set_CInt;
    property IE: WideString read Get_IE write Set_IE;
    property UF: WideString read Get_UF write Set_UF;
    property Fone: WideString read Get_Fone write Set_Fone;
  end;

{ IXMLValePed }

  IXMLValePed = interface(IXMLNode)
    ['{9540CD57-11F8-4681-9331-D798F4A7D08B}']
    { Property Accessors }
    function Get_CNPJForn: WideString;
    function Get_NCompra: WideString;
    function Get_CNPJPg: WideString;
    function Get_VValePed: WideString;
    procedure Set_CNPJForn(Value: WideString);
    procedure Set_NCompra(Value: WideString);
    procedure Set_CNPJPg(Value: WideString);
    procedure Set_VValePed(Value: WideString);
    { Methods & Properties }
    property CNPJForn: WideString read Get_CNPJForn write Set_CNPJForn;
    property NCompra: WideString read Get_NCompra write Set_NCompra;
    property CNPJPg: WideString read Get_CNPJPg write Set_CNPJPg;
    property VValePed: WideString read Get_VValePed write Set_VValePed;
  end;

{ IXMLValePedList }

  IXMLValePedList = interface(IXMLNodeCollection)
    ['{B315F577-E25A-444B-8EA3-6C1EC70A86CB}']
    { Methods & Properties }
    function Add: IXMLValePed;
    function Insert(const Index: Integer): IXMLValePed;
    function Get_Item(Index: Integer): IXMLValePed;
    property Items[Index: Integer]: IXMLValePed read Get_Item; default;
  end;

{ IXMLVeic }

  IXMLVeic = interface(IXMLNode)
    ['{D77F87BD-E496-42B7-9413-E58D63E663DD}']
    { Property Accessors }
    function Get_CInt: WideString;
    function Get_RENAVAM: WideString;
    function Get_Placa: WideString;
    function Get_Tara: WideString;
    function Get_CapKG: WideString;
    function Get_CapM3: WideString;
    function Get_TpProp: WideString;
    function Get_TpVeic: WideString;
    function Get_TpRod: WideString;
    function Get_TpCar: WideString;
    function Get_UF: WideString;
    function Get_Prop: IXMLProp;
    procedure Set_CInt(Value: WideString);
    procedure Set_RENAVAM(Value: WideString);
    procedure Set_Placa(Value: WideString);
    procedure Set_Tara(Value: WideString);
    procedure Set_CapKG(Value: WideString);
    procedure Set_CapM3(Value: WideString);
    procedure Set_TpProp(Value: WideString);
    procedure Set_TpVeic(Value: WideString);
    procedure Set_TpRod(Value: WideString);
    procedure Set_TpCar(Value: WideString);
    procedure Set_UF(Value: WideString);
    { Methods & Properties }
    property CInt: WideString read Get_CInt write Set_CInt;
    property RENAVAM: WideString read Get_RENAVAM write Set_RENAVAM;
    property Placa: WideString read Get_Placa write Set_Placa;
    property Tara: WideString read Get_Tara write Set_Tara;
    property CapKG: WideString read Get_CapKG write Set_CapKG;
    property CapM3: WideString read Get_CapM3 write Set_CapM3;
    property TpProp: WideString read Get_TpProp write Set_TpProp;
    property TpVeic: WideString read Get_TpVeic write Set_TpVeic;
    property TpRod: WideString read Get_TpRod write Set_TpRod;
    property TpCar: WideString read Get_TpCar write Set_TpCar;
    property UF: WideString read Get_UF write Set_UF;
    property Prop: IXMLProp read Get_Prop;
  end;

{ IXMLVeicList }

  IXMLVeicList = interface(IXMLNodeCollection)
    ['{CB22B54F-2EF4-489D-8C1D-1CCFFD3D2A67}']
    { Methods & Properties }
    function Add: IXMLVeic;
    function Insert(const Index: Integer): IXMLVeic;
    function Get_Item(Index: Integer): IXMLVeic;
    property Items[Index: Integer]: IXMLVeic read Get_Item; default;
  end;

{ IXMLProp }

  IXMLProp = interface(IXMLNode)
    ['{69B48C1A-F979-4A0F-97F7-5AFE0B668481}']
    { Property Accessors }
    function Get_CPF: WideString;
    function Get_CNPJ: WideString;
    function Get_RNTRC: WideString;
    function Get_XNome: WideString;
    function Get_IE: WideString;
    function Get_UF: WideString;
    function Get_TpProp: WideString;
    procedure Set_CPF(Value: WideString);
    procedure Set_CNPJ(Value: WideString);
    procedure Set_RNTRC(Value: WideString);
    procedure Set_XNome(Value: WideString);
    procedure Set_IE(Value: WideString);
    procedure Set_UF(Value: WideString);
    procedure Set_TpProp(Value: WideString);
    { Methods & Properties }
    property CPF: WideString read Get_CPF write Set_CPF;
    property CNPJ: WideString read Get_CNPJ write Set_CNPJ;
    property RNTRC: WideString read Get_RNTRC write Set_RNTRC;
    property XNome: WideString read Get_XNome write Set_XNome;
    property IE: WideString read Get_IE write Set_IE;
    property UF: WideString read Get_UF write Set_UF;
    property TpProp: WideString read Get_TpProp write Set_TpProp;
  end;

{ IXMLLacRodo }

  IXMLLacRodo = interface(IXMLNode)
    ['{CF9C5E28-D5B5-41AB-878B-4EF0F79AC684}']
    { Property Accessors }
    function Get_NLacre: WideString;
    procedure Set_NLacre(Value: WideString);
    { Methods & Properties }
    property NLacre: WideString read Get_NLacre write Set_NLacre;
  end;

{ IXMLLacRodoList }

  IXMLLacRodoList = interface(IXMLNodeCollection)
    ['{7427B067-3958-44CA-96AD-53162F22395B}']
    { Methods & Properties }
    function Add: IXMLLacRodo;
    function Insert(const Index: Integer): IXMLLacRodo;
    function Get_Item(Index: Integer): IXMLLacRodo;
    property Items[Index: Integer]: IXMLLacRodo read Get_Item; default;
  end;

{ IXMLMoto }

  IXMLMoto = interface(IXMLNode)
    ['{A5ED2A10-0F8B-4297-A834-D5684F81C096}']
    { Property Accessors }
    function Get_XNome: WideString;
    function Get_CPF: WideString;
    procedure Set_XNome(Value: WideString);
    procedure Set_CPF(Value: WideString);
    { Methods & Properties }
    property XNome: WideString read Get_XNome write Set_XNome;
    property CPF: WideString read Get_CPF write Set_CPF;
  end;

{ IXMLMotoList }

  IXMLMotoList = interface(IXMLNodeCollection)
    ['{245D0E98-B854-4C4D-81B9-7EF17ED569E8}']
    { Methods & Properties }
    function Add: IXMLMoto;
    function Insert(const Index: Integer): IXMLMoto;
    function Get_Item(Index: Integer): IXMLMoto;
    property Items[Index: Integer]: IXMLMoto read Get_Item; default;
  end;

{ Forward Decls }

  TXMLRodo = class;
  TXMLOcc = class;
  TXMLEmiOcc = class;
  TXMLValePed = class;
  TXMLValePedList = class;
  TXMLVeic = class;
  TXMLVeicList = class;
  TXMLProp = class;
  TXMLLacRodo = class;
  TXMLLacRodoList = class;
  TXMLMoto = class;
  TXMLMotoList = class;

{ TXMLRodo }

  TXMLRodo = class(TXMLNode, IXMLRodo)
  private
    FValePed: IXMLValePedList;
    FVeic: IXMLVeicList;
    FLacRodo: IXMLLacRodoList;
    FMoto: IXMLMotoList;
  protected
    { IXMLRodo }
    function Get_RNTRC: WideString;
    function Get_DPrev: WideString;
    function Get_Lota: WideString;
    function Get_CIOT: WideString;
    function Get_Occ: IXMLOcc;
    function Get_ValePed: IXMLValePedList;
    function Get_Veic: IXMLVeicList;
    function Get_LacRodo: IXMLLacRodoList;
    function Get_Moto: IXMLMotoList;
    procedure Set_RNTRC(Value: WideString);
    procedure Set_DPrev(Value: WideString);
    procedure Set_Lota(Value: WideString);
    procedure Set_CIOT(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLOcc }

  TXMLOcc = class(TXMLNode, IXMLOcc)
  protected
    { IXMLOcc }
    function Get_Serie: WideString;
    function Get_NOcc: WideString;
    function Get_DEmi: WideString;
    function Get_EmiOcc: IXMLEmiOcc;
    procedure Set_Serie(Value: WideString);
    procedure Set_NOcc(Value: WideString);
    procedure Set_DEmi(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLEmiOcc }

  TXMLEmiOcc = class(TXMLNode, IXMLEmiOcc)
  protected
    { IXMLEmiOcc }
    function Get_CNPJ: WideString;
    function Get_CInt: WideString;
    function Get_IE: WideString;
    function Get_UF: WideString;
    function Get_Fone: WideString;
    procedure Set_CNPJ(Value: WideString);
    procedure Set_CInt(Value: WideString);
    procedure Set_IE(Value: WideString);
    procedure Set_UF(Value: WideString);
    procedure Set_Fone(Value: WideString);
  end;

{ TXMLValePed }

  TXMLValePed = class(TXMLNode, IXMLValePed)
  protected
    { IXMLValePed }
    function Get_CNPJForn: WideString;
    function Get_NCompra: WideString;
    function Get_CNPJPg: WideString;
    function Get_VValePed: WideString;
    procedure Set_CNPJForn(Value: WideString);
    procedure Set_NCompra(Value: WideString);
    procedure Set_CNPJPg(Value: WideString);
    procedure Set_VValePed(Value: WideString);
  end;

{ TXMLValePedList }

  TXMLValePedList = class(TXMLNodeCollection, IXMLValePedList)
  protected
    { IXMLValePedList }
    function Add: IXMLValePed;
    function Insert(const Index: Integer): IXMLValePed;
    function Get_Item(Index: Integer): IXMLValePed;
  end;

{ TXMLVeic }

  TXMLVeic = class(TXMLNode, IXMLVeic)
  protected
    { IXMLVeic }
    function Get_CInt: WideString;
    function Get_RENAVAM: WideString;
    function Get_Placa: WideString;
    function Get_Tara: WideString;
    function Get_CapKG: WideString;
    function Get_CapM3: WideString;
    function Get_TpProp: WideString;
    function Get_TpVeic: WideString;
    function Get_TpRod: WideString;
    function Get_TpCar: WideString;
    function Get_UF: WideString;
    function Get_Prop: IXMLProp;
    procedure Set_CInt(Value: WideString);
    procedure Set_RENAVAM(Value: WideString);
    procedure Set_Placa(Value: WideString);
    procedure Set_Tara(Value: WideString);
    procedure Set_CapKG(Value: WideString);
    procedure Set_CapM3(Value: WideString);
    procedure Set_TpProp(Value: WideString);
    procedure Set_TpVeic(Value: WideString);
    procedure Set_TpRod(Value: WideString);
    procedure Set_TpCar(Value: WideString);
    procedure Set_UF(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLVeicList }

  TXMLVeicList = class(TXMLNodeCollection, IXMLVeicList)
  protected
    { IXMLVeicList }
    function Add: IXMLVeic;
    function Insert(const Index: Integer): IXMLVeic;
    function Get_Item(Index: Integer): IXMLVeic;
  end;

{ TXMLProp }

  TXMLProp = class(TXMLNode, IXMLProp)
  protected
    { IXMLProp }
    function Get_CPF: WideString;
    function Get_CNPJ: WideString;
    function Get_RNTRC: WideString;
    function Get_XNome: WideString;
    function Get_IE: WideString;
    function Get_UF: WideString;
    function Get_TpProp: WideString;
    procedure Set_CPF(Value: WideString);
    procedure Set_CNPJ(Value: WideString);
    procedure Set_RNTRC(Value: WideString);
    procedure Set_XNome(Value: WideString);
    procedure Set_IE(Value: WideString);
    procedure Set_UF(Value: WideString);
    procedure Set_TpProp(Value: WideString);
  end;

{ TXMLLacRodo }

  TXMLLacRodo = class(TXMLNode, IXMLLacRodo)
  protected
    { IXMLLacRodo }
    function Get_NLacre: WideString;
    procedure Set_NLacre(Value: WideString);
  end;

{ TXMLLacRodoList }

  TXMLLacRodoList = class(TXMLNodeCollection, IXMLLacRodoList)
  protected
    { IXMLLacRodoList }
    function Add: IXMLLacRodo;
    function Insert(const Index: Integer): IXMLLacRodo;
    function Get_Item(Index: Integer): IXMLLacRodo;
  end;

{ TXMLMoto }

  TXMLMoto = class(TXMLNode, IXMLMoto)
  protected
    { IXMLMoto }
    function Get_XNome: WideString;
    function Get_CPF: WideString;
    procedure Set_XNome(Value: WideString);
    procedure Set_CPF(Value: WideString);
  end;

{ TXMLMotoList }

  TXMLMotoList = class(TXMLNodeCollection, IXMLMotoList)
  protected
    { IXMLMotoList }
    function Add: IXMLMoto;
    function Insert(const Index: Integer): IXMLMoto;
    function Get_Item(Index: Integer): IXMLMoto;
  end;

{ Global Functions }

function Getrodo(Doc: IXMLDocument): IXMLRodo;
function Loadrodo(const FileName: WideString): IXMLRodo;
function Newrodo: IXMLRodo;

const
  TargetNamespace = 'http://www.portalfiscal.inf.br/cte';

implementation

{ Global Functions }

function Getrodo(Doc: IXMLDocument): IXMLRodo;
begin
  Result := Doc.GetDocBinding('rodo', TXMLRodo, TargetNamespace) as IXMLRodo;
end;

function Loadrodo(const FileName: WideString): IXMLRodo;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('rodo', TXMLRodo, TargetNamespace) as IXMLRodo;
end;

function Newrodo: IXMLRodo;
begin
  Result := NewXMLDocument.GetDocBinding('rodo', TXMLRodo, TargetNamespace) as IXMLRodo;
end;

{ TXMLRodo }

procedure TXMLRodo.AfterConstruction;
begin
  RegisterChildNode('occ', TXMLOcc);
  RegisterChildNode('valePed', TXMLValePed);
  RegisterChildNode('veic', TXMLVeic);
  RegisterChildNode('lacRodo', TXMLLacRodo);
  RegisterChildNode('moto', TXMLMoto);
  FValePed := CreateCollection(TXMLValePedList, IXMLValePed, 'valePed') as IXMLValePedList;
  FVeic := CreateCollection(TXMLVeicList, IXMLVeic, 'veic') as IXMLVeicList;
  FLacRodo := CreateCollection(TXMLLacRodoList, IXMLLacRodo, 'lacRodo') as IXMLLacRodoList;
  FMoto := CreateCollection(TXMLMotoList, IXMLMoto, 'moto') as IXMLMotoList;
  inherited;
end;

function TXMLRodo.Get_RNTRC: WideString;
begin
  Result := ChildNodes['RNTRC'].Text;
end;

procedure TXMLRodo.Set_RNTRC(Value: WideString);
begin
  ChildNodes['RNTRC'].NodeValue := Value;
end;

function TXMLRodo.Get_DPrev: WideString;
begin
  Result := ChildNodes['dPrev'].Text;
end;

procedure TXMLRodo.Set_DPrev(Value: WideString);
begin
  ChildNodes['dPrev'].NodeValue := Value;
end;

function TXMLRodo.Get_Lota: WideString;
begin
  Result := ChildNodes['lota'].Text;
end;

procedure TXMLRodo.Set_Lota(Value: WideString);
begin
  ChildNodes['lota'].NodeValue := Value;
end;

function TXMLRodo.Get_CIOT: WideString;
begin
  Result := ChildNodes['CIOT'].Text;
end;

procedure TXMLRodo.Set_CIOT(Value: WideString);
begin
  ChildNodes['CIOT'].NodeValue := Value;
end;

function TXMLRodo.Get_Occ: IXMLOcc;
begin
  Result := ChildNodes['occ'] as IXMLOcc;
end;

function TXMLRodo.Get_ValePed: IXMLValePedList;
begin
  Result := FValePed;
end;

function TXMLRodo.Get_Veic: IXMLVeicList;
begin
  Result := FVeic;
end;

function TXMLRodo.Get_LacRodo: IXMLLacRodoList;
begin
  Result := FLacRodo;
end;

function TXMLRodo.Get_Moto: IXMLMotoList;
begin
  Result := FMoto;
end;

{ TXMLOcc }

procedure TXMLOcc.AfterConstruction;
begin
  RegisterChildNode('emiOcc', TXMLEmiOcc);
  inherited;
end;

function TXMLOcc.Get_Serie: WideString;
begin
  Result := ChildNodes['serie'].Text;
end;

procedure TXMLOcc.Set_Serie(Value: WideString);
begin
  ChildNodes['serie'].NodeValue := Value;
end;

function TXMLOcc.Get_NOcc: WideString;
begin
  Result := ChildNodes['nOcc'].Text;
end;

procedure TXMLOcc.Set_NOcc(Value: WideString);
begin
  ChildNodes['nOcc'].NodeValue := Value;
end;

function TXMLOcc.Get_DEmi: WideString;
begin
  Result := ChildNodes['dEmi'].Text;
end;

procedure TXMLOcc.Set_DEmi(Value: WideString);
begin
  ChildNodes['dEmi'].NodeValue := Value;
end;

function TXMLOcc.Get_EmiOcc: IXMLEmiOcc;
begin
  Result := ChildNodes['emiOcc'] as IXMLEmiOcc;
end;

{ TXMLEmiOcc }

function TXMLEmiOcc.Get_CNPJ: WideString;
begin
  Result := ChildNodes['CNPJ'].Text;
end;

procedure TXMLEmiOcc.Set_CNPJ(Value: WideString);
begin
  ChildNodes['CNPJ'].NodeValue := Value;
end;

function TXMLEmiOcc.Get_CInt: WideString;
begin
  Result := ChildNodes['cInt'].Text;
end;

procedure TXMLEmiOcc.Set_CInt(Value: WideString);
begin
  ChildNodes['cInt'].NodeValue := Value;
end;

function TXMLEmiOcc.Get_IE: WideString;
begin
  Result := ChildNodes['IE'].Text;
end;

procedure TXMLEmiOcc.Set_IE(Value: WideString);
begin
  ChildNodes['IE'].NodeValue := Value;
end;

function TXMLEmiOcc.Get_UF: WideString;
begin
  Result := ChildNodes['UF'].Text;
end;

procedure TXMLEmiOcc.Set_UF(Value: WideString);
begin
  ChildNodes['UF'].NodeValue := Value;
end;

function TXMLEmiOcc.Get_Fone: WideString;
begin
  Result := ChildNodes['fone'].Text;
end;

procedure TXMLEmiOcc.Set_Fone(Value: WideString);
begin
  ChildNodes['fone'].NodeValue := Value;
end;

{ TXMLValePed }

function TXMLValePed.Get_CNPJForn: WideString;
begin
  Result := ChildNodes['CNPJForn'].Text;
end;

procedure TXMLValePed.Set_CNPJForn(Value: WideString);
begin
  ChildNodes['CNPJForn'].NodeValue := Value;
end;

function TXMLValePed.Get_NCompra: WideString;
begin
  Result := ChildNodes['nCompra'].Text;
end;

procedure TXMLValePed.Set_NCompra(Value: WideString);
begin
  ChildNodes['nCompra'].NodeValue := Value;
end;

function TXMLValePed.Get_CNPJPg: WideString;
begin
  Result := ChildNodes['CNPJPg'].Text;
end;

procedure TXMLValePed.Set_CNPJPg(Value: WideString);
begin
  ChildNodes['CNPJPg'].NodeValue := Value;
end;

function TXMLValePed.Get_VValePed: WideString;
begin
  Result := ChildNodes['vValePed'].Text;
end;

procedure TXMLValePed.Set_VValePed(Value: WideString);
begin
  ChildNodes['vValePed'].NodeValue := Value;
end;

{ TXMLValePedList }

function TXMLValePedList.Add: IXMLValePed;
begin
  Result := AddItem(-1) as IXMLValePed;
end;

function TXMLValePedList.Insert(const Index: Integer): IXMLValePed;
begin
  Result := AddItem(Index) as IXMLValePed;
end;
function TXMLValePedList.Get_Item(Index: Integer): IXMLValePed;
begin
  Result := List[Index] as IXMLValePed;
end;

{ TXMLVeic }

procedure TXMLVeic.AfterConstruction;
begin
  RegisterChildNode('prop', TXMLProp);
  inherited;
end;

function TXMLVeic.Get_CInt: WideString;
begin
  Result := ChildNodes['cInt'].Text;
end;

procedure TXMLVeic.Set_CInt(Value: WideString);
begin
  ChildNodes['cInt'].NodeValue := Value;
end;

function TXMLVeic.Get_RENAVAM: WideString;
begin
  Result := ChildNodes['RENAVAM'].Text;
end;

procedure TXMLVeic.Set_RENAVAM(Value: WideString);
begin
  ChildNodes['RENAVAM'].NodeValue := Value;
end;

function TXMLVeic.Get_Placa: WideString;
begin
  Result := ChildNodes['placa'].Text;
end;

procedure TXMLVeic.Set_Placa(Value: WideString);
begin
  ChildNodes['placa'].NodeValue := Value;
end;

function TXMLVeic.Get_Tara: WideString;
begin
  Result := ChildNodes['tara'].Text;
end;

procedure TXMLVeic.Set_Tara(Value: WideString);
begin
  ChildNodes['tara'].NodeValue := Value;
end;

function TXMLVeic.Get_CapKG: WideString;
begin
  Result := ChildNodes['capKG'].Text;
end;

procedure TXMLVeic.Set_CapKG(Value: WideString);
begin
  ChildNodes['capKG'].NodeValue := Value;
end;

function TXMLVeic.Get_CapM3: WideString;
begin
  Result := ChildNodes['capM3'].Text;
end;

procedure TXMLVeic.Set_CapM3(Value: WideString);
begin
  ChildNodes['capM3'].NodeValue := Value;
end;

function TXMLVeic.Get_TpProp: WideString;
begin
  Result := ChildNodes['tpProp'].Text;
end;

procedure TXMLVeic.Set_TpProp(Value: WideString);
begin
  ChildNodes['tpProp'].NodeValue := Value;
end;

function TXMLVeic.Get_TpVeic: WideString;
begin
  Result := ChildNodes['tpVeic'].Text;
end;

procedure TXMLVeic.Set_TpVeic(Value: WideString);
begin
  ChildNodes['tpVeic'].NodeValue := Value;
end;

function TXMLVeic.Get_TpRod: WideString;
begin
  Result := ChildNodes['tpRod'].Text;
end;

procedure TXMLVeic.Set_TpRod(Value: WideString);
begin
  ChildNodes['tpRod'].NodeValue := Value;
end;

function TXMLVeic.Get_TpCar: WideString;
begin
  Result := ChildNodes['tpCar'].Text;
end;

procedure TXMLVeic.Set_TpCar(Value: WideString);
begin
  ChildNodes['tpCar'].NodeValue := Value;
end;

function TXMLVeic.Get_UF: WideString;
begin
  Result := ChildNodes['UF'].Text;
end;

procedure TXMLVeic.Set_UF(Value: WideString);
begin
  ChildNodes['UF'].NodeValue := Value;
end;

function TXMLVeic.Get_Prop: IXMLProp;
begin
  Result := ChildNodes['prop'] as IXMLProp;
end;

{ TXMLVeicList }

function TXMLVeicList.Add: IXMLVeic;
begin
  Result := AddItem(-1) as IXMLVeic;
end;

function TXMLVeicList.Insert(const Index: Integer): IXMLVeic;
begin
  Result := AddItem(Index) as IXMLVeic;
end;
function TXMLVeicList.Get_Item(Index: Integer): IXMLVeic;
begin
  Result := List[Index] as IXMLVeic;
end;

{ TXMLProp }

function TXMLProp.Get_CPF: WideString;
begin
  Result := ChildNodes['CPF'].Text;
end;

procedure TXMLProp.Set_CPF(Value: WideString);
begin
  ChildNodes['CPF'].NodeValue := Value;
end;

function TXMLProp.Get_CNPJ: WideString;
begin
  Result := ChildNodes['CNPJ'].Text;
end;

procedure TXMLProp.Set_CNPJ(Value: WideString);
begin
  ChildNodes['CNPJ'].NodeValue := Value;
end;

function TXMLProp.Get_RNTRC: WideString;
begin
  Result := ChildNodes['RNTRC'].Text;
end;

procedure TXMLProp.Set_RNTRC(Value: WideString);
begin
  ChildNodes['RNTRC'].NodeValue := Value;
end;

function TXMLProp.Get_XNome: WideString;
begin
  Result := ChildNodes['xNome'].Text;
end;

procedure TXMLProp.Set_XNome(Value: WideString);
begin
  ChildNodes['xNome'].NodeValue := Value;
end;

function TXMLProp.Get_IE: WideString;
begin
  Result := ChildNodes['IE'].Text;
end;

procedure TXMLProp.Set_IE(Value: WideString);
begin
  ChildNodes['IE'].NodeValue := Value;
end;

function TXMLProp.Get_UF: WideString;
begin
  Result := ChildNodes['UF'].Text;
end;

procedure TXMLProp.Set_UF(Value: WideString);
begin
  ChildNodes['UF'].NodeValue := Value;
end;

function TXMLProp.Get_TpProp: WideString;
begin
  Result := ChildNodes['tpProp'].Text;
end;

procedure TXMLProp.Set_TpProp(Value: WideString);
begin
  ChildNodes['tpProp'].NodeValue := Value;
end;

{ TXMLLacRodo }

function TXMLLacRodo.Get_NLacre: WideString;
begin
  Result := ChildNodes['nLacre'].Text;
end;

procedure TXMLLacRodo.Set_NLacre(Value: WideString);
begin
  ChildNodes['nLacre'].NodeValue := Value;
end;

{ TXMLLacRodoList }

function TXMLLacRodoList.Add: IXMLLacRodo;
begin
  Result := AddItem(-1) as IXMLLacRodo;
end;

function TXMLLacRodoList.Insert(const Index: Integer): IXMLLacRodo;
begin
  Result := AddItem(Index) as IXMLLacRodo;
end;
function TXMLLacRodoList.Get_Item(Index: Integer): IXMLLacRodo;
begin
  Result := List[Index] as IXMLLacRodo;
end;

{ TXMLMoto }

function TXMLMoto.Get_XNome: WideString;
begin
  Result := ChildNodes['xNome'].Text;
end;

procedure TXMLMoto.Set_XNome(Value: WideString);
begin
  ChildNodes['xNome'].NodeValue := Value;
end;

function TXMLMoto.Get_CPF: WideString;
begin
  Result := ChildNodes['CPF'].Text;
end;

procedure TXMLMoto.Set_CPF(Value: WideString);
begin
  ChildNodes['CPF'].NodeValue := Value;
end;

{ TXMLMotoList }

function TXMLMotoList.Add: IXMLMoto;
begin
  Result := AddItem(-1) as IXMLMoto;
end;

function TXMLMotoList.Insert(const Index: Integer): IXMLMoto;
begin
  Result := AddItem(Index) as IXMLMoto;
end;
function TXMLMotoList.Get_Item(Index: Integer): IXMLMoto;
begin
  Result := List[Index] as IXMLMoto;
end;

end.
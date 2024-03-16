
{*********************************************************************}
{                                                                     }
{                          XML Data Binding                           }
{                                                                     }
{         Generated on: 09/06/2021 11:27:08                           }
{       Generated from: D:\WORK\nfeserver\bin\Schemas\nfe_v4.00.xsd   }
{                                                                     }
{*********************************************************************}

unit dfe.databinding.nfe_v400;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLTNFe = interface;
  IXMLTNFeList = interface;
  IXMLInfNFe = interface;
  IXMLIde = interface;
  IXMLNFref = interface;
  IXMLNFrefList = interface;
  IXMLRefNF = interface;
  IXMLRefNFP = interface;
  IXMLRefECF = interface;
  IXMLEmit = interface;
  IXMLTEnderEmi = interface;
  IXMLAvulsa = interface;
  IXMLDest = interface;
  IXMLTEndereco = interface;
  IXMLTLocal = interface;
  IXMLAutXML = interface;
  IXMLAutXMLList = interface;
  IXMLDet = interface;
  IXMLDetList = interface;
  IXMLProd = interface;
  IXMLDI = interface;
  IXMLDIList = interface;
  IXMLAdi = interface;
  IXMLAdiList = interface;
  IXMLDetExport = interface;
  IXMLDetExportList = interface;
  IXMLExportInd = interface;
  IXMLRastro = interface;
  IXMLRastroList = interface;
  IXMLVeicProd = interface;
  IXMLMed = interface;
  IXMLArma = interface;
  IXMLArmaList = interface;
  IXMLComb = interface;
  IXMLCIDE = interface;
  IXMLEncerrante = interface;
  IXMLImposto = interface;
  IXMLICMS = interface;
  IXMLICMS00 = interface;
  IXMLICMS10 = interface;
  IXMLICMS20 = interface;
  IXMLICMS30 = interface;
  IXMLICMS40 = interface;
  IXMLICMS51 = interface;
  IXMLICMS60 = interface;
  IXMLICMS70 = interface;
  IXMLICMS90 = interface;
  IXMLICMSPart = interface;
  IXMLICMSST = interface;
  IXMLICMSSN101 = interface;
  IXMLICMSSN102 = interface;
  IXMLICMSSN201 = interface;
  IXMLICMSSN202 = interface;
  IXMLICMSSN500 = interface;
  IXMLICMSSN900 = interface;
  IXMLTIpi = interface;
  IXMLIPITrib = interface;
  IXMLIPINT = interface;
  IXMLII = interface;
  IXMLISSQN = interface;
  IXMLPIS = interface;
  IXMLPISAliq = interface;
  IXMLPISQtde = interface;
  IXMLPISNT = interface;
  IXMLPISOutr = interface;
  IXMLPISST = interface;
  IXMLCOFINS = interface;
  IXMLCOFINSAliq = interface;
  IXMLCOFINSQtde = interface;
  IXMLCOFINSNT = interface;
  IXMLCOFINSOutr = interface;
  IXMLCOFINSST = interface;
  IXMLICMSUFDest = interface;
  IXMLImpostoDevol = interface;
  IXMLIPI = interface;
  IXMLTotal = interface;
  IXMLICMSTot = interface;
  IXMLISSQNtot = interface;
  IXMLRetTrib = interface;
  IXMLTransp = interface;
  IXMLTransporta = interface;
  IXMLRetTransp = interface;
  IXMLTVeiculo = interface;
  IXMLTVeiculoList = interface;
  IXMLVol = interface;
  IXMLVolList = interface;
  IXMLLacres = interface;
  IXMLLacresList = interface;
  IXMLCobr = interface;
  IXMLFat = interface;
  IXMLDup = interface;
  IXMLDupList = interface;
  IXMLPag = interface;
  IXMLDetPag = interface;
  IXMLDetPagList = interface;
  IXMLCard = interface;
  IXMLInfIntermed = interface;
  IXMLInfAdic = interface;
  IXMLObsCont = interface;
  IXMLObsContList = interface;
  IXMLObsFisco = interface;
  IXMLObsFiscoList = interface;
  IXMLProcRef = interface;
  IXMLProcRefList = interface;
  IXMLExporta = interface;
  IXMLCompra = interface;
  IXMLCana = interface;
  IXMLForDia = interface;
  IXMLForDiaList = interface;
  IXMLDeduc = interface;
  IXMLDeducList = interface;
  IXMLTInfRespTec = interface;
  IXMLInfNFeSupl = interface;
  IXMLSignatureType_ds = interface;
  IXMLSignedInfoType_ds = interface;
  IXMLCanonicalizationMethod_ds = interface;
  IXMLSignatureMethod_ds = interface;
  IXMLReferenceType_ds = interface;
  IXMLTransformsType_ds = interface;
  IXMLTransformType_ds = interface;
  IXMLDigestMethod_ds = interface;
  IXMLSignatureValueType_ds = interface;
  IXMLKeyInfoType_ds = interface;
  IXMLX509DataType_ds = interface;
  IXMLTProtNFe = interface;
  IXMLTProtNFeList = interface;
  IXMLInfProt = interface;
  IXMLTEnviNFe = interface;
  IXMLTRetEnviNFe = interface;
  IXMLInfRec = interface;
  IXMLTConsReciNFe = interface;
  IXMLTRetConsReciNFe = interface;
  IXMLTNfeProc = interface;
  IXMLNVEList = interface;

{ IXMLTNFe }

  IXMLTNFe = interface(IXMLNode)
    ['{31305044-2EB8-4658-A40F-F4B2406B67FD}']
    { Property Accessors }
    function Get_InfNFe: IXMLInfNFe;
    function Get_InfNFeSupl: IXMLInfNFeSupl;
    function Get_Signature: IXMLSignatureType_ds;
    { Methods & Properties }
    property InfNFe: IXMLInfNFe read Get_InfNFe;
    property InfNFeSupl: IXMLInfNFeSupl read Get_InfNFeSupl;
    property Signature: IXMLSignatureType_ds read Get_Signature;
  end;

{ IXMLTNFeList }

  IXMLTNFeList = interface(IXMLNodeCollection)
    ['{21350723-790F-4E1D-AAFD-45B4AC8549FB}']
    { Methods & Properties }
    function Add: IXMLTNFe;
    function Insert(const Index: Integer): IXMLTNFe;

    function Get_Item(Index: Integer): IXMLTNFe;
    property Items[Index: Integer]: IXMLTNFe read Get_Item; default;
  end;

{ IXMLInfNFe }

  IXMLInfNFe = interface(IXMLNode)
    ['{2EC82700-FB25-409B-9824-034A6B06C951}']
    { Property Accessors }
    function Get_Versao: string;
    function Get_Id: string;
    function Get_Ide: IXMLIde;
    function Get_Emit: IXMLEmit;
    function Get_Avulsa: IXMLAvulsa;
    function Get_Dest: IXMLDest;
    function Get_Retirada: IXMLTLocal;
    function Get_Entrega: IXMLTLocal;
    function Get_AutXML: IXMLAutXMLList;
    function Get_Det: IXMLDetList;
    function Get_Total: IXMLTotal;
    function Get_Transp: IXMLTransp;
    function Get_Cobr: IXMLCobr;
    function Get_Pag: IXMLPag;
    function Get_InfIntermed: IXMLInfIntermed;
    function Get_InfAdic: IXMLInfAdic;
    function Get_Exporta: IXMLExporta;
    function Get_Compra: IXMLCompra;
    function Get_Cana: IXMLCana;
    function Get_InfRespTec: IXMLTInfRespTec;
    procedure Set_Versao(Value: string);
    procedure Set_Id(Value: string);
    { Methods & Properties }
    property Versao: string read Get_Versao write Set_Versao;
    property Id: string read Get_Id write Set_Id;
    property Ide: IXMLIde read Get_Ide;
    property Emit: IXMLEmit read Get_Emit;
    property Avulsa: IXMLAvulsa read Get_Avulsa;
    property Dest: IXMLDest read Get_Dest;
    property Retirada: IXMLTLocal read Get_Retirada;
    property Entrega: IXMLTLocal read Get_Entrega;
    property AutXML: IXMLAutXMLList read Get_AutXML;
    property Det: IXMLDetList read Get_Det;
    property Total: IXMLTotal read Get_Total;
    property Transp: IXMLTransp read Get_Transp;
    property Cobr: IXMLCobr read Get_Cobr;
    property Pag: IXMLPag read Get_Pag;
    property InfIntermed: IXMLInfIntermed read Get_InfIntermed;
    property InfAdic: IXMLInfAdic read Get_InfAdic;
    property Exporta: IXMLExporta read Get_Exporta;
    property Compra: IXMLCompra read Get_Compra;
    property Cana: IXMLCana read Get_Cana;
    property InfRespTec: IXMLTInfRespTec read Get_InfRespTec;
  end;

{ IXMLIde }

  IXMLIde = interface(IXMLNode)
    ['{9A11CE8F-C1AF-49BA-81DA-F9918F39CF05}']
    { Property Accessors }
    function Get_CUF: string;
    function Get_CNF: string;
    function Get_NatOp: string;
    function Get_Mod_: string;
    function Get_Serie: string;
    function Get_NNF: string;
    function Get_DhEmi: string;
    function Get_DhSaiEnt: string;
    function Get_TpNF: string;
    function Get_IdDest: string;
    function Get_CMunFG: string;
    function Get_TpImp: string;
    function Get_TpEmis: string;
    function Get_CDV: string;
    function Get_TpAmb: string;
    function Get_FinNFe: string;
    function Get_IndFinal: string;
    function Get_IndPres: string;
    function Get_IndIntermed: string;
    function Get_ProcEmi: string;
    function Get_VerProc: string;
    function Get_DhCont: string;
    function Get_XJust: string;
    function Get_NFref: IXMLNFrefList;
    procedure Set_CUF(Value: string);
    procedure Set_CNF(Value: string);
    procedure Set_NatOp(Value: string);
    procedure Set_Mod_(Value: string);
    procedure Set_Serie(Value: string);
    procedure Set_NNF(Value: string);
    procedure Set_DhEmi(Value: string);
    procedure Set_DhSaiEnt(Value: string);
    procedure Set_TpNF(Value: string);
    procedure Set_IdDest(Value: string);
    procedure Set_CMunFG(Value: string);
    procedure Set_TpImp(Value: string);
    procedure Set_TpEmis(Value: string);
    procedure Set_CDV(Value: string);
    procedure Set_TpAmb(Value: string);
    procedure Set_FinNFe(Value: string);
    procedure Set_IndFinal(Value: string);
    procedure Set_IndPres(Value: string);
    procedure Set_IndIntermed(Value: string);
    procedure Set_ProcEmi(Value: string);
    procedure Set_VerProc(Value: string);
    procedure Set_DhCont(Value: string);
    procedure Set_XJust(Value: string);
    { Methods & Properties }
    property CUF: string read Get_CUF write Set_CUF;
    property CNF: string read Get_CNF write Set_CNF;
    property NatOp: string read Get_NatOp write Set_NatOp;
    property Mod_: string read Get_Mod_ write Set_Mod_;
    property Serie: string read Get_Serie write Set_Serie;
    property NNF: string read Get_NNF write Set_NNF;
    property DhEmi: string read Get_DhEmi write Set_DhEmi;
    property DhSaiEnt: string read Get_DhSaiEnt write Set_DhSaiEnt;
    property TpNF: string read Get_TpNF write Set_TpNF;
    property IdDest: string read Get_IdDest write Set_IdDest;
    property CMunFG: string read Get_CMunFG write Set_CMunFG;
    property TpImp: string read Get_TpImp write Set_TpImp;
    property TpEmis: string read Get_TpEmis write Set_TpEmis;
    property CDV: string read Get_CDV write Set_CDV;
    property TpAmb: string read Get_TpAmb write Set_TpAmb;
    property FinNFe: string read Get_FinNFe write Set_FinNFe;
    property IndFinal: string read Get_IndFinal write Set_IndFinal;
    property IndPres: string read Get_IndPres write Set_IndPres;
    property IndIntermed: string read Get_IndIntermed write Set_IndIntermed;
    property ProcEmi: string read Get_ProcEmi write Set_ProcEmi;
    property VerProc: string read Get_VerProc write Set_VerProc;
    property DhCont: string read Get_DhCont write Set_DhCont;
    property XJust: string read Get_XJust write Set_XJust;
    property NFref: IXMLNFrefList read Get_NFref;
  end;

{ IXMLNFref }

  IXMLNFref = interface(IXMLNode)
    ['{6123B393-341D-49A2-9098-DCDEEF9FBE9A}']
    { Property Accessors }
    function Get_RefNFe: string;
    function Get_RefNF: IXMLRefNF;
    function Get_RefNFP: IXMLRefNFP;
    function Get_RefCTe: string;
    function Get_RefECF: IXMLRefECF;
    procedure Set_RefNFe(Value: string);
    procedure Set_RefCTe(Value: string);
    { Methods & Properties }
    property RefNFe: string read Get_RefNFe write Set_RefNFe;
    property RefNF: IXMLRefNF read Get_RefNF;
    property RefNFP: IXMLRefNFP read Get_RefNFP;
    property RefCTe: string read Get_RefCTe write Set_RefCTe;
    property RefECF: IXMLRefECF read Get_RefECF;
  end;

{ IXMLNFrefList }

  IXMLNFrefList = interface(IXMLNodeCollection)
    ['{6D9AC861-F2B2-4807-8721-11670DE1DDFB}']
    { Methods & Properties }
    function Add: IXMLNFref;
    function Insert(const Index: Integer): IXMLNFref;

    function Get_Item(Index: Integer): IXMLNFref;
    property Items[Index: Integer]: IXMLNFref read Get_Item; default;
  end;

{ IXMLRefNF }

  IXMLRefNF = interface(IXMLNode)
    ['{6BCF0261-A3C2-44B6-91B0-CCFA18158543}']
    { Property Accessors }
    function Get_CUF: string;
    function Get_AAMM: string;
    function Get_CNPJ: string;
    function Get_Mod_: string;
    function Get_Serie: string;
    function Get_NNF: string;
    procedure Set_CUF(Value: string);
    procedure Set_AAMM(Value: string);
    procedure Set_CNPJ(Value: string);
    procedure Set_Mod_(Value: string);
    procedure Set_Serie(Value: string);
    procedure Set_NNF(Value: string);
    { Methods & Properties }
    property CUF: string read Get_CUF write Set_CUF;
    property AAMM: string read Get_AAMM write Set_AAMM;
    property CNPJ: string read Get_CNPJ write Set_CNPJ;
    property Mod_: string read Get_Mod_ write Set_Mod_;
    property Serie: string read Get_Serie write Set_Serie;
    property NNF: string read Get_NNF write Set_NNF;
  end;

{ IXMLRefNFP }

  IXMLRefNFP = interface(IXMLNode)
    ['{08A6181E-558E-4AAD-87E9-8936529B94AA}']
    { Property Accessors }
    function Get_CUF: string;
    function Get_AAMM: string;
    function Get_CNPJ: string;
    function Get_CPF: string;
    function Get_IE: string;
    function Get_Mod_: string;
    function Get_Serie: string;
    function Get_NNF: string;
    procedure Set_CUF(Value: string);
    procedure Set_AAMM(Value: string);
    procedure Set_CNPJ(Value: string);
    procedure Set_CPF(Value: string);
    procedure Set_IE(Value: string);
    procedure Set_Mod_(Value: string);
    procedure Set_Serie(Value: string);
    procedure Set_NNF(Value: string);
    { Methods & Properties }
    property CUF: string read Get_CUF write Set_CUF;
    property AAMM: string read Get_AAMM write Set_AAMM;
    property CNPJ: string read Get_CNPJ write Set_CNPJ;
    property CPF: string read Get_CPF write Set_CPF;
    property IE: string read Get_IE write Set_IE;
    property Mod_: string read Get_Mod_ write Set_Mod_;
    property Serie: string read Get_Serie write Set_Serie;
    property NNF: string read Get_NNF write Set_NNF;
  end;

{ IXMLRefECF }

  IXMLRefECF = interface(IXMLNode)
    ['{0601A421-9CCF-46CB-B798-7B45DDD95C8E}']
    { Property Accessors }
    function Get_Mod_: string;
    function Get_NECF: string;
    function Get_NCOO: string;
    procedure Set_Mod_(Value: string);
    procedure Set_NECF(Value: string);
    procedure Set_NCOO(Value: string);
    { Methods & Properties }
    property Mod_: string read Get_Mod_ write Set_Mod_;
    property NECF: string read Get_NECF write Set_NECF;
    property NCOO: string read Get_NCOO write Set_NCOO;
  end;

{ IXMLEmit }

  IXMLEmit = interface(IXMLNode)
    ['{674232E1-3151-435A-99A9-B6ABD56100F3}']
    { Property Accessors }
    function Get_CNPJ: string;
    function Get_CPF: string;
    function Get_XNome: string;
    function Get_XFant: string;
    function Get_EnderEmit: IXMLTEnderEmi;
    function Get_IE: string;
    function Get_IEST: string;
    function Get_IM: string;
    function Get_CNAE: string;
    function Get_CRT: string;
    procedure Set_CNPJ(Value: string);
    procedure Set_CPF(Value: string);
    procedure Set_XNome(Value: string);
    procedure Set_XFant(Value: string);
    procedure Set_IE(Value: string);
    procedure Set_IEST(Value: string);
    procedure Set_IM(Value: string);
    procedure Set_CNAE(Value: string);
    procedure Set_CRT(Value: string);
    { Methods & Properties }
    property CNPJ: string read Get_CNPJ write Set_CNPJ;
    property CPF: string read Get_CPF write Set_CPF;
    property XNome: string read Get_XNome write Set_XNome;
    property XFant: string read Get_XFant write Set_XFant;
    property EnderEmit: IXMLTEnderEmi read Get_EnderEmit;
    property IE: string read Get_IE write Set_IE;
    property IEST: string read Get_IEST write Set_IEST;
    property IM: string read Get_IM write Set_IM;
    property CNAE: string read Get_CNAE write Set_CNAE;
    property CRT: string read Get_CRT write Set_CRT;
  end;

{ IXMLTEnderEmi }

  IXMLTEnderEmi = interface(IXMLNode)
    ['{6A8332AF-3545-41AE-A1C7-88B5DE5B0494}']
    { Property Accessors }
    function Get_XLgr: string;
    function Get_Nro: string;
    function Get_XCpl: string;
    function Get_XBairro: string;
    function Get_CMun: string;
    function Get_XMun: string;
    function Get_UF: string;
    function Get_CEP: string;
    function Get_CPais: string;
    function Get_XPais: string;
    function Get_Fone: string;
    procedure Set_XLgr(Value: string);
    procedure Set_Nro(Value: string);
    procedure Set_XCpl(Value: string);
    procedure Set_XBairro(Value: string);
    procedure Set_CMun(Value: string);
    procedure Set_XMun(Value: string);
    procedure Set_UF(Value: string);
    procedure Set_CEP(Value: string);
    procedure Set_CPais(Value: string);
    procedure Set_XPais(Value: string);
    procedure Set_Fone(Value: string);
    { Methods & Properties }
    property XLgr: string read Get_XLgr write Set_XLgr;
    property Nro: string read Get_Nro write Set_Nro;
    property XCpl: string read Get_XCpl write Set_XCpl;
    property XBairro: string read Get_XBairro write Set_XBairro;
    property CMun: string read Get_CMun write Set_CMun;
    property XMun: string read Get_XMun write Set_XMun;
    property UF: string read Get_UF write Set_UF;
    property CEP: string read Get_CEP write Set_CEP;
    property CPais: string read Get_CPais write Set_CPais;
    property XPais: string read Get_XPais write Set_XPais;
    property Fone: string read Get_Fone write Set_Fone;
  end;

{ IXMLAvulsa }

  IXMLAvulsa = interface(IXMLNode)
    ['{EF5BDE10-49B3-4743-8AEC-A97FCF3A0E8D}']
    { Property Accessors }
    function Get_CNPJ: string;
    function Get_XOrgao: string;
    function Get_Matr: string;
    function Get_XAgente: string;
    function Get_Fone: string;
    function Get_UF: string;
    function Get_NDAR: string;
    function Get_DEmi: string;
    function Get_VDAR: string;
    function Get_RepEmi: string;
    function Get_DPag: string;
    procedure Set_CNPJ(Value: string);
    procedure Set_XOrgao(Value: string);
    procedure Set_Matr(Value: string);
    procedure Set_XAgente(Value: string);
    procedure Set_Fone(Value: string);
    procedure Set_UF(Value: string);
    procedure Set_NDAR(Value: string);
    procedure Set_DEmi(Value: string);
    procedure Set_VDAR(Value: string);
    procedure Set_RepEmi(Value: string);
    procedure Set_DPag(Value: string);
    { Methods & Properties }
    property CNPJ: string read Get_CNPJ write Set_CNPJ;
    property XOrgao: string read Get_XOrgao write Set_XOrgao;
    property Matr: string read Get_Matr write Set_Matr;
    property XAgente: string read Get_XAgente write Set_XAgente;
    property Fone: string read Get_Fone write Set_Fone;
    property UF: string read Get_UF write Set_UF;
    property NDAR: string read Get_NDAR write Set_NDAR;
    property DEmi: string read Get_DEmi write Set_DEmi;
    property VDAR: string read Get_VDAR write Set_VDAR;
    property RepEmi: string read Get_RepEmi write Set_RepEmi;
    property DPag: string read Get_DPag write Set_DPag;
  end;

{ IXMLDest }

  IXMLDest = interface(IXMLNode)
    ['{9D5A103D-A619-4740-833A-8FF0720A8001}']
    { Property Accessors }
    function Get_CNPJ: string;
    function Get_CPF: string;
    function Get_IdEstrangeiro: string;
    function Get_XNome: string;
    function Get_EnderDest: IXMLTEndereco;
    function Get_IndIEDest: string;
    function Get_IE: string;
    function Get_ISUF: string;
    function Get_IM: string;
    function Get_Email: string;
    procedure Set_CNPJ(Value: string);
    procedure Set_CPF(Value: string);
    procedure Set_IdEstrangeiro(Value: string);
    procedure Set_XNome(Value: string);
    procedure Set_IndIEDest(Value: string);
    procedure Set_IE(Value: string);
    procedure Set_ISUF(Value: string);
    procedure Set_IM(Value: string);
    procedure Set_Email(Value: string);
    { Methods & Properties }
    property CNPJ: string read Get_CNPJ write Set_CNPJ;
    property CPF: string read Get_CPF write Set_CPF;
    property IdEstrangeiro: string read Get_IdEstrangeiro write Set_IdEstrangeiro;
    property XNome: string read Get_XNome write Set_XNome;
    property EnderDest: IXMLTEndereco read Get_EnderDest;
    property IndIEDest: string read Get_IndIEDest write Set_IndIEDest;
    property IE: string read Get_IE write Set_IE;
    property ISUF: string read Get_ISUF write Set_ISUF;
    property IM: string read Get_IM write Set_IM;
    property Email: string read Get_Email write Set_Email;
  end;

{ IXMLTEndereco }

  IXMLTEndereco = interface(IXMLNode)
    ['{166C7D3E-AC98-42FD-A73F-0F106F69011B}']
    { Property Accessors }
    function Get_XLgr: string;
    function Get_Nro: string;
    function Get_XCpl: string;
    function Get_XBairro: string;
    function Get_CMun: string;
    function Get_XMun: string;
    function Get_UF: string;
    function Get_CEP: string;
    function Get_CPais: string;
    function Get_XPais: string;
    function Get_Fone: string;
    procedure Set_XLgr(Value: string);
    procedure Set_Nro(Value: string);
    procedure Set_XCpl(Value: string);
    procedure Set_XBairro(Value: string);
    procedure Set_CMun(Value: string);
    procedure Set_XMun(Value: string);
    procedure Set_UF(Value: string);
    procedure Set_CEP(Value: string);
    procedure Set_CPais(Value: string);
    procedure Set_XPais(Value: string);
    procedure Set_Fone(Value: string);
    { Methods & Properties }
    property XLgr: string read Get_XLgr write Set_XLgr;
    property Nro: string read Get_Nro write Set_Nro;
    property XCpl: string read Get_XCpl write Set_XCpl;
    property XBairro: string read Get_XBairro write Set_XBairro;
    property CMun: string read Get_CMun write Set_CMun;
    property XMun: string read Get_XMun write Set_XMun;
    property UF: string read Get_UF write Set_UF;
    property CEP: string read Get_CEP write Set_CEP;
    property CPais: string read Get_CPais write Set_CPais;
    property XPais: string read Get_XPais write Set_XPais;
    property Fone: string read Get_Fone write Set_Fone;
  end;

{ IXMLTLocal }

  IXMLTLocal = interface(IXMLNode)
    ['{58C572FF-B7B3-4B63-B786-D0D6AAD1E513}']
    { Property Accessors }
    function Get_CNPJ: string;
    function Get_CPF: string;
    function Get_XNome: string;
    function Get_XLgr: string;
    function Get_Nro: string;
    function Get_XCpl: string;
    function Get_XBairro: string;
    function Get_CMun: string;
    function Get_XMun: string;
    function Get_UF: string;
    function Get_CEP: string;
    function Get_CPais: string;
    function Get_XPais: string;
    function Get_Fone: string;
    function Get_Email: string;
    function Get_IE: string;
    procedure Set_CNPJ(Value: string);
    procedure Set_CPF(Value: string);
    procedure Set_XNome(Value: string);
    procedure Set_XLgr(Value: string);
    procedure Set_Nro(Value: string);
    procedure Set_XCpl(Value: string);
    procedure Set_XBairro(Value: string);
    procedure Set_CMun(Value: string);
    procedure Set_XMun(Value: string);
    procedure Set_UF(Value: string);
    procedure Set_CEP(Value: string);
    procedure Set_CPais(Value: string);
    procedure Set_XPais(Value: string);
    procedure Set_Fone(Value: string);
    procedure Set_Email(Value: string);
    procedure Set_IE(Value: string);
    { Methods & Properties }
    property CNPJ: string read Get_CNPJ write Set_CNPJ;
    property CPF: string read Get_CPF write Set_CPF;
    property XNome: string read Get_XNome write Set_XNome;
    property XLgr: string read Get_XLgr write Set_XLgr;
    property Nro: string read Get_Nro write Set_Nro;
    property XCpl: string read Get_XCpl write Set_XCpl;
    property XBairro: string read Get_XBairro write Set_XBairro;
    property CMun: string read Get_CMun write Set_CMun;
    property XMun: string read Get_XMun write Set_XMun;
    property UF: string read Get_UF write Set_UF;
    property CEP: string read Get_CEP write Set_CEP;
    property CPais: string read Get_CPais write Set_CPais;
    property XPais: string read Get_XPais write Set_XPais;
    property Fone: string read Get_Fone write Set_Fone;
    property Email: string read Get_Email write Set_Email;
    property IE: string read Get_IE write Set_IE;
  end;

{ IXMLAutXML }

  IXMLAutXML = interface(IXMLNode)
    ['{3C11B850-6C74-4CA9-B23F-7236F2DD0F11}']
    { Property Accessors }
    function Get_CNPJ: string;
    function Get_CPF: string;
    procedure Set_CNPJ(Value: string);
    procedure Set_CPF(Value: string);
    { Methods & Properties }
    property CNPJ: string read Get_CNPJ write Set_CNPJ;
    property CPF: string read Get_CPF write Set_CPF;
  end;

{ IXMLAutXMLList }

  IXMLAutXMLList = interface(IXMLNodeCollection)
    ['{9FC3FA57-DCBE-4887-93E4-4DAE72130754}']
    { Methods & Properties }
    function Add: IXMLAutXML;
    function Insert(const Index: Integer): IXMLAutXML;

    function Get_Item(Index: Integer): IXMLAutXML;
    property Items[Index: Integer]: IXMLAutXML read Get_Item; default;
  end;

{ IXMLDet }

  IXMLDet = interface(IXMLNode)
    ['{03A3A17B-5150-48D0-AFA4-315D82820C2C}']
    { Property Accessors }
    function Get_NItem: string;
    function Get_Prod: IXMLProd;
    function Get_Imposto: IXMLImposto;
    function Get_ImpostoDevol: IXMLImpostoDevol;
    function Get_InfAdProd: string;
    procedure Set_NItem(Value: string);
    procedure Set_InfAdProd(Value: string);
    { Methods & Properties }
    property NItem: string read Get_NItem write Set_NItem;
    property Prod: IXMLProd read Get_Prod;
    property Imposto: IXMLImposto read Get_Imposto;
    property ImpostoDevol: IXMLImpostoDevol read Get_ImpostoDevol;
    property InfAdProd: string read Get_InfAdProd write Set_InfAdProd;
  end;

{ IXMLDetList }

  IXMLDetList = interface(IXMLNodeCollection)
    ['{D882B743-64FC-404F-A38C-F90D60B7486E}']
    { Methods & Properties }
    function Add: IXMLDet;
    function Insert(const Index: Integer): IXMLDet;

    function Get_Item(Index: Integer): IXMLDet;
    property Items[Index: Integer]: IXMLDet read Get_Item; default;
  end;

{ IXMLProd }

  IXMLProd = interface(IXMLNode)
    ['{EB934D4D-DFCD-4204-B7B3-1B04276C7EAC}']
    { Property Accessors }
    function Get_CProd: string;
    function Get_CEAN: string;
    function Get_XProd: string;
    function Get_NCM: string;
    function Get_NVE: IXMLNVEList;
    function Get_CEST: string;
    function Get_IndEscala: string;
    function Get_CNPJFab: string;
    function Get_CBenef: string;
    function Get_EXTIPI: string;
    function Get_CFOP: string;
    function Get_UCom: string;
    function Get_QCom: string;
    function Get_VUnCom: string;
    function Get_VProd: string;
    function Get_CEANTrib: string;
    function Get_UTrib: string;
    function Get_QTrib: string;
    function Get_VUnTrib: string;
    function Get_VFrete: string;
    function Get_VSeg: string;
    function Get_VDesc: string;
    function Get_VOutro: string;
    function Get_IndTot: string;
    function Get_DI: IXMLDIList;
    function Get_DetExport: IXMLDetExportList;
    function Get_XPed: string;
    function Get_NItemPed: string;
    function Get_NFCI: string;
    function Get_Rastro: IXMLRastroList;
    function Get_VeicProd: IXMLVeicProd;
    function Get_Med: IXMLMed;
    function Get_Arma: IXMLArmaList;
    function Get_Comb: IXMLComb;
    function Get_NRECOPI: string;
    procedure Set_CProd(Value: string);
    procedure Set_CEAN(Value: string);
    procedure Set_XProd(Value: string);
    procedure Set_NCM(Value: string);
    procedure Set_CEST(Value: string);
    procedure Set_IndEscala(Value: string);
    procedure Set_CNPJFab(Value: string);
    procedure Set_CBenef(Value: string);
    procedure Set_EXTIPI(Value: string);
    procedure Set_CFOP(Value: string);
    procedure Set_UCom(Value: string);
    procedure Set_QCom(Value: string);
    procedure Set_VUnCom(Value: string);
    procedure Set_VProd(Value: string);
    procedure Set_CEANTrib(Value: string);
    procedure Set_UTrib(Value: string);
    procedure Set_QTrib(Value: string);
    procedure Set_VUnTrib(Value: string);
    procedure Set_VFrete(Value: string);
    procedure Set_VSeg(Value: string);
    procedure Set_VDesc(Value: string);
    procedure Set_VOutro(Value: string);
    procedure Set_IndTot(Value: string);
    procedure Set_XPed(Value: string);
    procedure Set_NItemPed(Value: string);
    procedure Set_NFCI(Value: string);
    procedure Set_NRECOPI(Value: string);
    { Methods & Properties }
    property CProd: string read Get_CProd write Set_CProd;
    property CEAN: string read Get_CEAN write Set_CEAN;
    property XProd: string read Get_XProd write Set_XProd;
    property NCM: string read Get_NCM write Set_NCM;
    property NVE: IXMLNVEList read Get_NVE;
    property CEST: string read Get_CEST write Set_CEST;
    property IndEscala: string read Get_IndEscala write Set_IndEscala;
    property CNPJFab: string read Get_CNPJFab write Set_CNPJFab;
    property CBenef: string read Get_CBenef write Set_CBenef;
    property EXTIPI: string read Get_EXTIPI write Set_EXTIPI;
    property CFOP: string read Get_CFOP write Set_CFOP;
    property UCom: string read Get_UCom write Set_UCom;
    property QCom: string read Get_QCom write Set_QCom;
    property VUnCom: string read Get_VUnCom write Set_VUnCom;
    property VProd: string read Get_VProd write Set_VProd;
    property CEANTrib: string read Get_CEANTrib write Set_CEANTrib;
    property UTrib: string read Get_UTrib write Set_UTrib;
    property QTrib: string read Get_QTrib write Set_QTrib;
    property VUnTrib: string read Get_VUnTrib write Set_VUnTrib;
    property VFrete: string read Get_VFrete write Set_VFrete;
    property VSeg: string read Get_VSeg write Set_VSeg;
    property VDesc: string read Get_VDesc write Set_VDesc;
    property VOutro: string read Get_VOutro write Set_VOutro;
    property IndTot: string read Get_IndTot write Set_IndTot;
    property DI: IXMLDIList read Get_DI;
    property DetExport: IXMLDetExportList read Get_DetExport;
    property XPed: string read Get_XPed write Set_XPed;
    property NItemPed: string read Get_NItemPed write Set_NItemPed;
    property NFCI: string read Get_NFCI write Set_NFCI;
    property Rastro: IXMLRastroList read Get_Rastro;
    property VeicProd: IXMLVeicProd read Get_VeicProd;
    property Med: IXMLMed read Get_Med;
    property Arma: IXMLArmaList read Get_Arma;
    property Comb: IXMLComb read Get_Comb;
    property NRECOPI: string read Get_NRECOPI write Set_NRECOPI;
  end;

{ IXMLDI }

  IXMLDI = interface(IXMLNode)
    ['{D29D6853-192D-4A21-B8BA-4353BF5C69C5}']
    { Property Accessors }
    function Get_NDI: string;
    function Get_DDI: string;
    function Get_XLocDesemb: string;
    function Get_UFDesemb: string;
    function Get_DDesemb: string;
    function Get_TpViaTransp: string;
    function Get_VAFRMM: string;
    function Get_TpIntermedio: string;
    function Get_CNPJ: string;
    function Get_UFTerceiro: string;
    function Get_CExportador: string;
    function Get_Adi: IXMLAdiList;
    procedure Set_NDI(Value: string);
    procedure Set_DDI(Value: string);
    procedure Set_XLocDesemb(Value: string);
    procedure Set_UFDesemb(Value: string);
    procedure Set_DDesemb(Value: string);
    procedure Set_TpViaTransp(Value: string);
    procedure Set_VAFRMM(Value: string);
    procedure Set_TpIntermedio(Value: string);
    procedure Set_CNPJ(Value: string);
    procedure Set_UFTerceiro(Value: string);
    procedure Set_CExportador(Value: string);
    { Methods & Properties }
    property NDI: string read Get_NDI write Set_NDI;
    property DDI: string read Get_DDI write Set_DDI;
    property XLocDesemb: string read Get_XLocDesemb write Set_XLocDesemb;
    property UFDesemb: string read Get_UFDesemb write Set_UFDesemb;
    property DDesemb: string read Get_DDesemb write Set_DDesemb;
    property TpViaTransp: string read Get_TpViaTransp write Set_TpViaTransp;
    property VAFRMM: string read Get_VAFRMM write Set_VAFRMM;
    property TpIntermedio: string read Get_TpIntermedio write Set_TpIntermedio;
    property CNPJ: string read Get_CNPJ write Set_CNPJ;
    property UFTerceiro: string read Get_UFTerceiro write Set_UFTerceiro;
    property CExportador: string read Get_CExportador write Set_CExportador;
    property Adi: IXMLAdiList read Get_Adi;
  end;

{ IXMLDIList }

  IXMLDIList = interface(IXMLNodeCollection)
    ['{CF34B5B4-1076-42D9-A187-F93703EB2BB0}']
    { Methods & Properties }
    function Add: IXMLDI;
    function Insert(const Index: Integer): IXMLDI;

    function Get_Item(Index: Integer): IXMLDI;
    property Items[Index: Integer]: IXMLDI read Get_Item; default;
  end;

{ IXMLAdi }

  IXMLAdi = interface(IXMLNode)
    ['{7D3EA6B5-75D1-410C-9D0A-861770EF285B}']
    { Property Accessors }
    function Get_NAdicao: string;
    function Get_NSeqAdic: string;
    function Get_CFabricante: string;
    function Get_VDescDI: string;
    function Get_NDraw: string;
    procedure Set_NAdicao(Value: string);
    procedure Set_NSeqAdic(Value: string);
    procedure Set_CFabricante(Value: string);
    procedure Set_VDescDI(Value: string);
    procedure Set_NDraw(Value: string);
    { Methods & Properties }
    property NAdicao: string read Get_NAdicao write Set_NAdicao;
    property NSeqAdic: string read Get_NSeqAdic write Set_NSeqAdic;
    property CFabricante: string read Get_CFabricante write Set_CFabricante;
    property VDescDI: string read Get_VDescDI write Set_VDescDI;
    property NDraw: string read Get_NDraw write Set_NDraw;
  end;

{ IXMLAdiList }

  IXMLAdiList = interface(IXMLNodeCollection)
    ['{5C28652B-D6BB-437F-AA14-445FA988D404}']
    { Methods & Properties }
    function Add: IXMLAdi;
    function Insert(const Index: Integer): IXMLAdi;

    function Get_Item(Index: Integer): IXMLAdi;
    property Items[Index: Integer]: IXMLAdi read Get_Item; default;
  end;

{ IXMLDetExport }

  IXMLDetExport = interface(IXMLNode)
    ['{94180EBC-FDE6-4FC6-9A81-C44994152AC5}']
    { Property Accessors }
    function Get_NDraw: string;
    function Get_ExportInd: IXMLExportInd;
    procedure Set_NDraw(Value: string);
    { Methods & Properties }
    property NDraw: string read Get_NDraw write Set_NDraw;
    property ExportInd: IXMLExportInd read Get_ExportInd;
  end;

{ IXMLDetExportList }

  IXMLDetExportList = interface(IXMLNodeCollection)
    ['{56EF1755-22F7-4990-8C11-6D67ACEFF347}']
    { Methods & Properties }
    function Add: IXMLDetExport;
    function Insert(const Index: Integer): IXMLDetExport;

    function Get_Item(Index: Integer): IXMLDetExport;
    property Items[Index: Integer]: IXMLDetExport read Get_Item; default;
  end;

{ IXMLExportInd }

  IXMLExportInd = interface(IXMLNode)
    ['{E7C84FA6-6FBC-4EB1-AF9B-B189E4DC8E25}']
    { Property Accessors }
    function Get_NRE: string;
    function Get_ChNFe: string;
    function Get_QExport: string;
    procedure Set_NRE(Value: string);
    procedure Set_ChNFe(Value: string);
    procedure Set_QExport(Value: string);
    { Methods & Properties }
    property NRE: string read Get_NRE write Set_NRE;
    property ChNFe: string read Get_ChNFe write Set_ChNFe;
    property QExport: string read Get_QExport write Set_QExport;
  end;

{ IXMLRastro }

  IXMLRastro = interface(IXMLNode)
    ['{47D7113F-E72F-4996-A331-7058846652BC}']
    { Property Accessors }
    function Get_NLote: string;
    function Get_QLote: string;
    function Get_DFab: string;
    function Get_DVal: string;
    function Get_CAgreg: string;
    procedure Set_NLote(Value: string);
    procedure Set_QLote(Value: string);
    procedure Set_DFab(Value: string);
    procedure Set_DVal(Value: string);
    procedure Set_CAgreg(Value: string);
    { Methods & Properties }
    property NLote: string read Get_NLote write Set_NLote;
    property QLote: string read Get_QLote write Set_QLote;
    property DFab: string read Get_DFab write Set_DFab;
    property DVal: string read Get_DVal write Set_DVal;
    property CAgreg: string read Get_CAgreg write Set_CAgreg;
  end;

{ IXMLRastroList }

  IXMLRastroList = interface(IXMLNodeCollection)
    ['{8596DACA-85A3-47E5-9301-C429426F2CB3}']
    { Methods & Properties }
    function Add: IXMLRastro;
    function Insert(const Index: Integer): IXMLRastro;

    function Get_Item(Index: Integer): IXMLRastro;
    property Items[Index: Integer]: IXMLRastro read Get_Item; default;
  end;

{ IXMLVeicProd }

  IXMLVeicProd = interface(IXMLNode)
    ['{22E1BBCC-468B-4365-B151-B446860F541A}']
    { Property Accessors }
    function Get_TpOp: string;
    function Get_Chassi: string;
    function Get_CCor: string;
    function Get_XCor: string;
    function Get_Pot: string;
    function Get_Cilin: string;
    function Get_PesoL: string;
    function Get_PesoB: string;
    function Get_NSerie: string;
    function Get_TpComb: string;
    function Get_NMotor: string;
    function Get_CMT: string;
    function Get_Dist: string;
    function Get_AnoMod: string;
    function Get_AnoFab: string;
    function Get_TpPint: string;
    function Get_TpVeic: string;
    function Get_EspVeic: string;
    function Get_VIN: string;
    function Get_CondVeic: string;
    function Get_CMod: string;
    function Get_CCorDENATRAN: string;
    function Get_Lota: string;
    function Get_TpRest: string;
    procedure Set_TpOp(Value: string);
    procedure Set_Chassi(Value: string);
    procedure Set_CCor(Value: string);
    procedure Set_XCor(Value: string);
    procedure Set_Pot(Value: string);
    procedure Set_Cilin(Value: string);
    procedure Set_PesoL(Value: string);
    procedure Set_PesoB(Value: string);
    procedure Set_NSerie(Value: string);
    procedure Set_TpComb(Value: string);
    procedure Set_NMotor(Value: string);
    procedure Set_CMT(Value: string);
    procedure Set_Dist(Value: string);
    procedure Set_AnoMod(Value: string);
    procedure Set_AnoFab(Value: string);
    procedure Set_TpPint(Value: string);
    procedure Set_TpVeic(Value: string);
    procedure Set_EspVeic(Value: string);
    procedure Set_VIN(Value: string);
    procedure Set_CondVeic(Value: string);
    procedure Set_CMod(Value: string);
    procedure Set_CCorDENATRAN(Value: string);
    procedure Set_Lota(Value: string);
    procedure Set_TpRest(Value: string);
    { Methods & Properties }
    property TpOp: string read Get_TpOp write Set_TpOp;
    property Chassi: string read Get_Chassi write Set_Chassi;
    property CCor: string read Get_CCor write Set_CCor;
    property XCor: string read Get_XCor write Set_XCor;
    property Pot: string read Get_Pot write Set_Pot;
    property Cilin: string read Get_Cilin write Set_Cilin;
    property PesoL: string read Get_PesoL write Set_PesoL;
    property PesoB: string read Get_PesoB write Set_PesoB;
    property NSerie: string read Get_NSerie write Set_NSerie;
    property TpComb: string read Get_TpComb write Set_TpComb;
    property NMotor: string read Get_NMotor write Set_NMotor;
    property CMT: string read Get_CMT write Set_CMT;
    property Dist: string read Get_Dist write Set_Dist;
    property AnoMod: string read Get_AnoMod write Set_AnoMod;
    property AnoFab: string read Get_AnoFab write Set_AnoFab;
    property TpPint: string read Get_TpPint write Set_TpPint;
    property TpVeic: string read Get_TpVeic write Set_TpVeic;
    property EspVeic: string read Get_EspVeic write Set_EspVeic;
    property VIN: string read Get_VIN write Set_VIN;
    property CondVeic: string read Get_CondVeic write Set_CondVeic;
    property CMod: string read Get_CMod write Set_CMod;
    property CCorDENATRAN: string read Get_CCorDENATRAN write Set_CCorDENATRAN;
    property Lota: string read Get_Lota write Set_Lota;
    property TpRest: string read Get_TpRest write Set_TpRest;
  end;

{ IXMLMed }

  IXMLMed = interface(IXMLNode)
    ['{8861B68F-316F-411C-B842-ECDCB690FA48}']
    { Property Accessors }
    function Get_CProdANVISA: string;
    function Get_XMotivoIsencao: string;
    function Get_VPMC: string;
    procedure Set_CProdANVISA(Value: string);
    procedure Set_XMotivoIsencao(Value: string);
    procedure Set_VPMC(Value: string);
    { Methods & Properties }
    property CProdANVISA: string read Get_CProdANVISA write Set_CProdANVISA;
    property XMotivoIsencao: string read Get_XMotivoIsencao write Set_XMotivoIsencao;
    property VPMC: string read Get_VPMC write Set_VPMC;
  end;

{ IXMLArma }

  IXMLArma = interface(IXMLNode)
    ['{466A1D85-B45F-4ADF-9216-E6CB4C4031A4}']
    { Property Accessors }
    function Get_TpArma: string;
    function Get_NSerie: string;
    function Get_NCano: string;
    function Get_Descr: string;
    procedure Set_TpArma(Value: string);
    procedure Set_NSerie(Value: string);
    procedure Set_NCano(Value: string);
    procedure Set_Descr(Value: string);
    { Methods & Properties }
    property TpArma: string read Get_TpArma write Set_TpArma;
    property NSerie: string read Get_NSerie write Set_NSerie;
    property NCano: string read Get_NCano write Set_NCano;
    property Descr: string read Get_Descr write Set_Descr;
  end;

{ IXMLArmaList }

  IXMLArmaList = interface(IXMLNodeCollection)
    ['{0C8A1792-72AE-4C16-9923-2A3C5B8B5FE6}']
    { Methods & Properties }
    function Add: IXMLArma;
    function Insert(const Index: Integer): IXMLArma;

    function Get_Item(Index: Integer): IXMLArma;
    property Items[Index: Integer]: IXMLArma read Get_Item; default;
  end;

{ IXMLComb }

  IXMLComb = interface(IXMLNode)
    ['{8372BD8A-EBBF-4FE6-BF62-8B7240C49259}']
    { Property Accessors }
    function Get_CProdANP: string;
    function Get_DescANP: string;
    function Get_PGLP: string;
    function Get_PGNn: string;
    function Get_PGNi: string;
    function Get_VPart: string;
    function Get_CODIF: string;
    function Get_QTemp: string;
    function Get_UFCons: string;
    function Get_CIDE: IXMLCIDE;
    function Get_Encerrante: IXMLEncerrante;
    procedure Set_CProdANP(Value: string);
    procedure Set_DescANP(Value: string);
    procedure Set_PGLP(Value: string);
    procedure Set_PGNn(Value: string);
    procedure Set_PGNi(Value: string);
    procedure Set_VPart(Value: string);
    procedure Set_CODIF(Value: string);
    procedure Set_QTemp(Value: string);
    procedure Set_UFCons(Value: string);
    { Methods & Properties }
    property CProdANP: string read Get_CProdANP write Set_CProdANP;
    property DescANP: string read Get_DescANP write Set_DescANP;
    property PGLP: string read Get_PGLP write Set_PGLP;
    property PGNn: string read Get_PGNn write Set_PGNn;
    property PGNi: string read Get_PGNi write Set_PGNi;
    property VPart: string read Get_VPart write Set_VPart;
    property CODIF: string read Get_CODIF write Set_CODIF;
    property QTemp: string read Get_QTemp write Set_QTemp;
    property UFCons: string read Get_UFCons write Set_UFCons;
    property CIDE: IXMLCIDE read Get_CIDE;
    property Encerrante: IXMLEncerrante read Get_Encerrante;
  end;

{ IXMLCIDE }

  IXMLCIDE = interface(IXMLNode)
    ['{EF8BB1E9-0B03-4A39-B725-1F8BBA1A400B}']
    { Property Accessors }
    function Get_QBCProd: string;
    function Get_VAliqProd: string;
    function Get_VCIDE: string;
    procedure Set_QBCProd(Value: string);
    procedure Set_VAliqProd(Value: string);
    procedure Set_VCIDE(Value: string);
    { Methods & Properties }
    property QBCProd: string read Get_QBCProd write Set_QBCProd;
    property VAliqProd: string read Get_VAliqProd write Set_VAliqProd;
    property VCIDE: string read Get_VCIDE write Set_VCIDE;
  end;

{ IXMLEncerrante }

  IXMLEncerrante = interface(IXMLNode)
    ['{0DB2F37B-1B46-469D-B737-143B9198E7C5}']
    { Property Accessors }
    function Get_NBico: string;
    function Get_NBomba: string;
    function Get_NTanque: string;
    function Get_VEncIni: string;
    function Get_VEncFin: string;
    procedure Set_NBico(Value: string);
    procedure Set_NBomba(Value: string);
    procedure Set_NTanque(Value: string);
    procedure Set_VEncIni(Value: string);
    procedure Set_VEncFin(Value: string);
    { Methods & Properties }
    property NBico: string read Get_NBico write Set_NBico;
    property NBomba: string read Get_NBomba write Set_NBomba;
    property NTanque: string read Get_NTanque write Set_NTanque;
    property VEncIni: string read Get_VEncIni write Set_VEncIni;
    property VEncFin: string read Get_VEncFin write Set_VEncFin;
  end;

{ IXMLImposto }

  IXMLImposto = interface(IXMLNode)
    ['{7A116B20-011D-4173-BD68-5DD2683A19B7}']
    { Property Accessors }
    function Get_VTotTrib: string;
    function Get_ICMS: IXMLICMS;
    function Get_IPI: IXMLTIpi;
    function Get_II: IXMLII;
    function Get_ISSQN: IXMLISSQN;
    function Get_PIS: IXMLPIS;
    function Get_PISST: IXMLPISST;
    function Get_COFINS: IXMLCOFINS;
    function Get_COFINSST: IXMLCOFINSST;
    function Get_ICMSUFDest: IXMLICMSUFDest;
    procedure Set_VTotTrib(Value: string);
    { Methods & Properties }
    property VTotTrib: string read Get_VTotTrib write Set_VTotTrib;
    property ICMS: IXMLICMS read Get_ICMS;
    property IPI: IXMLTIpi read Get_IPI;
    property II: IXMLII read Get_II;
    property ISSQN: IXMLISSQN read Get_ISSQN;
    property PIS: IXMLPIS read Get_PIS;
    property PISST: IXMLPISST read Get_PISST;
    property COFINS: IXMLCOFINS read Get_COFINS;
    property COFINSST: IXMLCOFINSST read Get_COFINSST;
    property ICMSUFDest: IXMLICMSUFDest read Get_ICMSUFDest;
  end;

{ IXMLICMS }

  IXMLICMS = interface(IXMLNode)
    ['{5AC344CA-6E9A-42A4-B8DA-D4203624E427}']
    { Property Accessors }
    function Get_ICMS00: IXMLICMS00;
    function Get_ICMS10: IXMLICMS10;
    function Get_ICMS20: IXMLICMS20;
    function Get_ICMS30: IXMLICMS30;
    function Get_ICMS40: IXMLICMS40;
    function Get_ICMS51: IXMLICMS51;
    function Get_ICMS60: IXMLICMS60;
    function Get_ICMS70: IXMLICMS70;
    function Get_ICMS90: IXMLICMS90;
    function Get_ICMSPart: IXMLICMSPart;
    function Get_ICMSST: IXMLICMSST;
    function Get_ICMSSN101: IXMLICMSSN101;
    function Get_ICMSSN102: IXMLICMSSN102;
    function Get_ICMSSN201: IXMLICMSSN201;
    function Get_ICMSSN202: IXMLICMSSN202;
    function Get_ICMSSN500: IXMLICMSSN500;
    function Get_ICMSSN900: IXMLICMSSN900;
    { Methods & Properties }
    property ICMS00: IXMLICMS00 read Get_ICMS00;
    property ICMS10: IXMLICMS10 read Get_ICMS10;
    property ICMS20: IXMLICMS20 read Get_ICMS20;
    property ICMS30: IXMLICMS30 read Get_ICMS30;
    property ICMS40: IXMLICMS40 read Get_ICMS40;
    property ICMS51: IXMLICMS51 read Get_ICMS51;
    property ICMS60: IXMLICMS60 read Get_ICMS60;
    property ICMS70: IXMLICMS70 read Get_ICMS70;
    property ICMS90: IXMLICMS90 read Get_ICMS90;
    property ICMSPart: IXMLICMSPart read Get_ICMSPart;
    property ICMSST: IXMLICMSST read Get_ICMSST;
    property ICMSSN101: IXMLICMSSN101 read Get_ICMSSN101;
    property ICMSSN102: IXMLICMSSN102 read Get_ICMSSN102;
    property ICMSSN201: IXMLICMSSN201 read Get_ICMSSN201;
    property ICMSSN202: IXMLICMSSN202 read Get_ICMSSN202;
    property ICMSSN500: IXMLICMSSN500 read Get_ICMSSN500;
    property ICMSSN900: IXMLICMSSN900 read Get_ICMSSN900;
  end;

{ IXMLICMS00 }

  IXMLICMS00 = interface(IXMLNode)
    ['{A055A653-4E31-4FCD-B12F-667CC4B69960}']
    { Property Accessors }
    function Get_Orig: string;
    function Get_CST: string;
    function Get_ModBC: string;
    function Get_VBC: string;
    function Get_PICMS: string;
    function Get_VICMS: string;
    function Get_PFCP: string;
    function Get_VFCP: string;
    procedure Set_Orig(Value: string);
    procedure Set_CST(Value: string);
    procedure Set_ModBC(Value: string);
    procedure Set_VBC(Value: string);
    procedure Set_PICMS(Value: string);
    procedure Set_VICMS(Value: string);
    procedure Set_PFCP(Value: string);
    procedure Set_VFCP(Value: string);
    { Methods & Properties }
    property Orig: string read Get_Orig write Set_Orig;
    property CST: string read Get_CST write Set_CST;
    property ModBC: string read Get_ModBC write Set_ModBC;
    property VBC: string read Get_VBC write Set_VBC;
    property PICMS: string read Get_PICMS write Set_PICMS;
    property VICMS: string read Get_VICMS write Set_VICMS;
    property PFCP: string read Get_PFCP write Set_PFCP;
    property VFCP: string read Get_VFCP write Set_VFCP;
  end;

{ IXMLICMS10 }

  IXMLICMS10 = interface(IXMLNode)
    ['{8670CEEC-7797-4980-97D8-7439784F8CF3}']
    { Property Accessors }
    function Get_Orig: string;
    function Get_CST: string;
    function Get_ModBC: string;
    function Get_VBC: string;
    function Get_PICMS: string;
    function Get_VICMS: string;
    function Get_VBCFCP: string;
    function Get_PFCP: string;
    function Get_VFCP: string;
    function Get_ModBCST: string;
    function Get_PMVAST: string;
    function Get_PRedBCST: string;
    function Get_VBCST: string;
    function Get_PICMSST: string;
    function Get_VICMSST: string;
    function Get_VBCFCPST: string;
    function Get_PFCPST: string;
    function Get_VFCPST: string;
    procedure Set_Orig(Value: string);
    procedure Set_CST(Value: string);
    procedure Set_ModBC(Value: string);
    procedure Set_VBC(Value: string);
    procedure Set_PICMS(Value: string);
    procedure Set_VICMS(Value: string);
    procedure Set_VBCFCP(Value: string);
    procedure Set_PFCP(Value: string);
    procedure Set_VFCP(Value: string);
    procedure Set_ModBCST(Value: string);
    procedure Set_PMVAST(Value: string);
    procedure Set_PRedBCST(Value: string);
    procedure Set_VBCST(Value: string);
    procedure Set_PICMSST(Value: string);
    procedure Set_VICMSST(Value: string);
    procedure Set_VBCFCPST(Value: string);
    procedure Set_PFCPST(Value: string);
    procedure Set_VFCPST(Value: string);
    { Methods & Properties }
    property Orig: string read Get_Orig write Set_Orig;
    property CST: string read Get_CST write Set_CST;
    property ModBC: string read Get_ModBC write Set_ModBC;
    property VBC: string read Get_VBC write Set_VBC;
    property PICMS: string read Get_PICMS write Set_PICMS;
    property VICMS: string read Get_VICMS write Set_VICMS;
    property VBCFCP: string read Get_VBCFCP write Set_VBCFCP;
    property PFCP: string read Get_PFCP write Set_PFCP;
    property VFCP: string read Get_VFCP write Set_VFCP;
    property ModBCST: string read Get_ModBCST write Set_ModBCST;
    property PMVAST: string read Get_PMVAST write Set_PMVAST;
    property PRedBCST: string read Get_PRedBCST write Set_PRedBCST;
    property VBCST: string read Get_VBCST write Set_VBCST;
    property PICMSST: string read Get_PICMSST write Set_PICMSST;
    property VICMSST: string read Get_VICMSST write Set_VICMSST;
    property VBCFCPST: string read Get_VBCFCPST write Set_VBCFCPST;
    property PFCPST: string read Get_PFCPST write Set_PFCPST;
    property VFCPST: string read Get_VFCPST write Set_VFCPST;
  end;

{ IXMLICMS20 }

  IXMLICMS20 = interface(IXMLNode)
    ['{0FE7E84B-6AEB-44F9-822A-41DF558E98F3}']
    { Property Accessors }
    function Get_Orig: string;
    function Get_CST: string;
    function Get_ModBC: string;
    function Get_PRedBC: string;
    function Get_VBC: string;
    function Get_PICMS: string;
    function Get_VICMS: string;
    function Get_VBCFCP: string;
    function Get_PFCP: string;
    function Get_VFCP: string;
    function Get_VICMSDeson: string;
    function Get_MotDesICMS: string;
    procedure Set_Orig(Value: string);
    procedure Set_CST(Value: string);
    procedure Set_ModBC(Value: string);
    procedure Set_PRedBC(Value: string);
    procedure Set_VBC(Value: string);
    procedure Set_PICMS(Value: string);
    procedure Set_VICMS(Value: string);
    procedure Set_VBCFCP(Value: string);
    procedure Set_PFCP(Value: string);
    procedure Set_VFCP(Value: string);
    procedure Set_VICMSDeson(Value: string);
    procedure Set_MotDesICMS(Value: string);
    { Methods & Properties }
    property Orig: string read Get_Orig write Set_Orig;
    property CST: string read Get_CST write Set_CST;
    property ModBC: string read Get_ModBC write Set_ModBC;
    property PRedBC: string read Get_PRedBC write Set_PRedBC;
    property VBC: string read Get_VBC write Set_VBC;
    property PICMS: string read Get_PICMS write Set_PICMS;
    property VICMS: string read Get_VICMS write Set_VICMS;
    property VBCFCP: string read Get_VBCFCP write Set_VBCFCP;
    property PFCP: string read Get_PFCP write Set_PFCP;
    property VFCP: string read Get_VFCP write Set_VFCP;
    property VICMSDeson: string read Get_VICMSDeson write Set_VICMSDeson;
    property MotDesICMS: string read Get_MotDesICMS write Set_MotDesICMS;
  end;

{ IXMLICMS30 }

  IXMLICMS30 = interface(IXMLNode)
    ['{3CC14476-DD14-4707-8427-C50494E70D57}']
    { Property Accessors }
    function Get_Orig: string;
    function Get_CST: string;
    function Get_ModBCST: string;
    function Get_PMVAST: string;
    function Get_PRedBCST: string;
    function Get_VBCST: string;
    function Get_PICMSST: string;
    function Get_VICMSST: string;
    function Get_VBCFCPST: string;
    function Get_PFCPST: string;
    function Get_VFCPST: string;
    function Get_VICMSDeson: string;
    function Get_MotDesICMS: string;
    procedure Set_Orig(Value: string);
    procedure Set_CST(Value: string);
    procedure Set_ModBCST(Value: string);
    procedure Set_PMVAST(Value: string);
    procedure Set_PRedBCST(Value: string);
    procedure Set_VBCST(Value: string);
    procedure Set_PICMSST(Value: string);
    procedure Set_VICMSST(Value: string);
    procedure Set_VBCFCPST(Value: string);
    procedure Set_PFCPST(Value: string);
    procedure Set_VFCPST(Value: string);
    procedure Set_VICMSDeson(Value: string);
    procedure Set_MotDesICMS(Value: string);
    { Methods & Properties }
    property Orig: string read Get_Orig write Set_Orig;
    property CST: string read Get_CST write Set_CST;
    property ModBCST: string read Get_ModBCST write Set_ModBCST;
    property PMVAST: string read Get_PMVAST write Set_PMVAST;
    property PRedBCST: string read Get_PRedBCST write Set_PRedBCST;
    property VBCST: string read Get_VBCST write Set_VBCST;
    property PICMSST: string read Get_PICMSST write Set_PICMSST;
    property VICMSST: string read Get_VICMSST write Set_VICMSST;
    property VBCFCPST: string read Get_VBCFCPST write Set_VBCFCPST;
    property PFCPST: string read Get_PFCPST write Set_PFCPST;
    property VFCPST: string read Get_VFCPST write Set_VFCPST;
    property VICMSDeson: string read Get_VICMSDeson write Set_VICMSDeson;
    property MotDesICMS: string read Get_MotDesICMS write Set_MotDesICMS;
  end;

{ IXMLICMS40 }

  IXMLICMS40 = interface(IXMLNode)
    ['{7D239242-C0C4-4BC6-B826-FEEDB7834775}']
    { Property Accessors }
    function Get_Orig: string;
    function Get_CST: string;
    function Get_VICMSDeson: string;
    function Get_MotDesICMS: string;
    procedure Set_Orig(Value: string);
    procedure Set_CST(Value: string);
    procedure Set_VICMSDeson(Value: string);
    procedure Set_MotDesICMS(Value: string);
    { Methods & Properties }
    property Orig: string read Get_Orig write Set_Orig;
    property CST: string read Get_CST write Set_CST;
    property VICMSDeson: string read Get_VICMSDeson write Set_VICMSDeson;
    property MotDesICMS: string read Get_MotDesICMS write Set_MotDesICMS;
  end;

{ IXMLICMS51 }

  IXMLICMS51 = interface(IXMLNode)
    ['{4123F249-3A19-4ECE-A3AA-EA047D9177D7}']
    { Property Accessors }
    function Get_Orig: string;
    function Get_CST: string;
    function Get_ModBC: string;
    function Get_PRedBC: string;
    function Get_VBC: string;
    function Get_PICMS: string;
    function Get_VICMSOp: string;
    function Get_PDif: string;
    function Get_VICMSDif: string;
    function Get_VICMS: string;
    function Get_VBCFCP: string;
    function Get_PFCP: string;
    function Get_VFCP: string;
    procedure Set_Orig(Value: string);
    procedure Set_CST(Value: string);
    procedure Set_ModBC(Value: string);
    procedure Set_PRedBC(Value: string);
    procedure Set_VBC(Value: string);
    procedure Set_PICMS(Value: string);
    procedure Set_VICMSOp(Value: string);
    procedure Set_PDif(Value: string);
    procedure Set_VICMSDif(Value: string);
    procedure Set_VICMS(Value: string);
    procedure Set_VBCFCP(Value: string);
    procedure Set_PFCP(Value: string);
    procedure Set_VFCP(Value: string);
    { Methods & Properties }
    property Orig: string read Get_Orig write Set_Orig;
    property CST: string read Get_CST write Set_CST;
    property ModBC: string read Get_ModBC write Set_ModBC;
    property PRedBC: string read Get_PRedBC write Set_PRedBC;
    property VBC: string read Get_VBC write Set_VBC;
    property PICMS: string read Get_PICMS write Set_PICMS;
    property VICMSOp: string read Get_VICMSOp write Set_VICMSOp;
    property PDif: string read Get_PDif write Set_PDif;
    property VICMSDif: string read Get_VICMSDif write Set_VICMSDif;
    property VICMS: string read Get_VICMS write Set_VICMS;
    property VBCFCP: string read Get_VBCFCP write Set_VBCFCP;
    property PFCP: string read Get_PFCP write Set_PFCP;
    property VFCP: string read Get_VFCP write Set_VFCP;
  end;

{ IXMLICMS60 }

  IXMLICMS60 = interface(IXMLNode)
    ['{713A66F9-5849-45E8-A723-DED70D35F11C}']
    { Property Accessors }
    function Get_Orig: string;
    function Get_CST: string;
    function Get_VBCSTRet: string;
    function Get_PST: string;
    function Get_VICMSSubstituto: string;
    function Get_VICMSSTRet: string;
    function Get_VBCFCPSTRet: string;
    function Get_PFCPSTRet: string;
    function Get_VFCPSTRet: string;
    function Get_PRedBCEfet: string;
    function Get_VBCEfet: string;
    function Get_PICMSEfet: string;
    function Get_VICMSEfet: string;
    procedure Set_Orig(Value: string);
    procedure Set_CST(Value: string);
    procedure Set_VBCSTRet(Value: string);
    procedure Set_PST(Value: string);
    procedure Set_VICMSSubstituto(Value: string);
    procedure Set_VICMSSTRet(Value: string);
    procedure Set_VBCFCPSTRet(Value: string);
    procedure Set_PFCPSTRet(Value: string);
    procedure Set_VFCPSTRet(Value: string);
    procedure Set_PRedBCEfet(Value: string);
    procedure Set_VBCEfet(Value: string);
    procedure Set_PICMSEfet(Value: string);
    procedure Set_VICMSEfet(Value: string);
    { Methods & Properties }
    property Orig: string read Get_Orig write Set_Orig;
    property CST: string read Get_CST write Set_CST;
    property VBCSTRet: string read Get_VBCSTRet write Set_VBCSTRet;
    property PST: string read Get_PST write Set_PST;
    property VICMSSubstituto: string read Get_VICMSSubstituto write Set_VICMSSubstituto;
    property VICMSSTRet: string read Get_VICMSSTRet write Set_VICMSSTRet;
    property VBCFCPSTRet: string read Get_VBCFCPSTRet write Set_VBCFCPSTRet;
    property PFCPSTRet: string read Get_PFCPSTRet write Set_PFCPSTRet;
    property VFCPSTRet: string read Get_VFCPSTRet write Set_VFCPSTRet;
    property PRedBCEfet: string read Get_PRedBCEfet write Set_PRedBCEfet;
    property VBCEfet: string read Get_VBCEfet write Set_VBCEfet;
    property PICMSEfet: string read Get_PICMSEfet write Set_PICMSEfet;
    property VICMSEfet: string read Get_VICMSEfet write Set_VICMSEfet;
  end;

{ IXMLICMS70 }

  IXMLICMS70 = interface(IXMLNode)
    ['{72BDE322-137C-408E-86B4-F61BE8354947}']
    { Property Accessors }
    function Get_Orig: string;
    function Get_CST: string;
    function Get_ModBC: string;
    function Get_PRedBC: string;
    function Get_VBC: string;
    function Get_PICMS: string;
    function Get_VICMS: string;
    function Get_VBCFCP: string;
    function Get_PFCP: string;
    function Get_VFCP: string;
    function Get_ModBCST: string;
    function Get_PMVAST: string;
    function Get_PRedBCST: string;
    function Get_VBCST: string;
    function Get_PICMSST: string;
    function Get_VICMSST: string;
    function Get_VBCFCPST: string;
    function Get_PFCPST: string;
    function Get_VFCPST: string;
    function Get_VICMSDeson: string;
    function Get_MotDesICMS: string;
    procedure Set_Orig(Value: string);
    procedure Set_CST(Value: string);
    procedure Set_ModBC(Value: string);
    procedure Set_PRedBC(Value: string);
    procedure Set_VBC(Value: string);
    procedure Set_PICMS(Value: string);
    procedure Set_VICMS(Value: string);
    procedure Set_VBCFCP(Value: string);
    procedure Set_PFCP(Value: string);
    procedure Set_VFCP(Value: string);
    procedure Set_ModBCST(Value: string);
    procedure Set_PMVAST(Value: string);
    procedure Set_PRedBCST(Value: string);
    procedure Set_VBCST(Value: string);
    procedure Set_PICMSST(Value: string);
    procedure Set_VICMSST(Value: string);
    procedure Set_VBCFCPST(Value: string);
    procedure Set_PFCPST(Value: string);
    procedure Set_VFCPST(Value: string);
    procedure Set_VICMSDeson(Value: string);
    procedure Set_MotDesICMS(Value: string);
    { Methods & Properties }
    property Orig: string read Get_Orig write Set_Orig;
    property CST: string read Get_CST write Set_CST;
    property ModBC: string read Get_ModBC write Set_ModBC;
    property PRedBC: string read Get_PRedBC write Set_PRedBC;
    property VBC: string read Get_VBC write Set_VBC;
    property PICMS: string read Get_PICMS write Set_PICMS;
    property VICMS: string read Get_VICMS write Set_VICMS;
    property VBCFCP: string read Get_VBCFCP write Set_VBCFCP;
    property PFCP: string read Get_PFCP write Set_PFCP;
    property VFCP: string read Get_VFCP write Set_VFCP;
    property ModBCST: string read Get_ModBCST write Set_ModBCST;
    property PMVAST: string read Get_PMVAST write Set_PMVAST;
    property PRedBCST: string read Get_PRedBCST write Set_PRedBCST;
    property VBCST: string read Get_VBCST write Set_VBCST;
    property PICMSST: string read Get_PICMSST write Set_PICMSST;
    property VICMSST: string read Get_VICMSST write Set_VICMSST;
    property VBCFCPST: string read Get_VBCFCPST write Set_VBCFCPST;
    property PFCPST: string read Get_PFCPST write Set_PFCPST;
    property VFCPST: string read Get_VFCPST write Set_VFCPST;
    property VICMSDeson: string read Get_VICMSDeson write Set_VICMSDeson;
    property MotDesICMS: string read Get_MotDesICMS write Set_MotDesICMS;
  end;

{ IXMLICMS90 }

  IXMLICMS90 = interface(IXMLNode)
    ['{31C94E52-4022-4AE6-95B3-71555B651252}']
    { Property Accessors }
    function Get_Orig: string;
    function Get_CST: string;
    function Get_ModBC: string;
    function Get_VBC: string;
    function Get_PRedBC: string;
    function Get_PICMS: string;
    function Get_VICMS: string;
    function Get_VBCFCP: string;
    function Get_PFCP: string;
    function Get_VFCP: string;
    function Get_ModBCST: string;
    function Get_PMVAST: string;
    function Get_PRedBCST: string;
    function Get_VBCST: string;
    function Get_PICMSST: string;
    function Get_VICMSST: string;
    function Get_VBCFCPST: string;
    function Get_PFCPST: string;
    function Get_VFCPST: string;
    function Get_VICMSDeson: string;
    function Get_MotDesICMS: string;
    procedure Set_Orig(Value: string);
    procedure Set_CST(Value: string);
    procedure Set_ModBC(Value: string);
    procedure Set_VBC(Value: string);
    procedure Set_PRedBC(Value: string);
    procedure Set_PICMS(Value: string);
    procedure Set_VICMS(Value: string);
    procedure Set_VBCFCP(Value: string);
    procedure Set_PFCP(Value: string);
    procedure Set_VFCP(Value: string);
    procedure Set_ModBCST(Value: string);
    procedure Set_PMVAST(Value: string);
    procedure Set_PRedBCST(Value: string);
    procedure Set_VBCST(Value: string);
    procedure Set_PICMSST(Value: string);
    procedure Set_VICMSST(Value: string);
    procedure Set_VBCFCPST(Value: string);
    procedure Set_PFCPST(Value: string);
    procedure Set_VFCPST(Value: string);
    procedure Set_VICMSDeson(Value: string);
    procedure Set_MotDesICMS(Value: string);
    { Methods & Properties }
    property Orig: string read Get_Orig write Set_Orig;
    property CST: string read Get_CST write Set_CST;
    property ModBC: string read Get_ModBC write Set_ModBC;
    property VBC: string read Get_VBC write Set_VBC;
    property PRedBC: string read Get_PRedBC write Set_PRedBC;
    property PICMS: string read Get_PICMS write Set_PICMS;
    property VICMS: string read Get_VICMS write Set_VICMS;
    property VBCFCP: string read Get_VBCFCP write Set_VBCFCP;
    property PFCP: string read Get_PFCP write Set_PFCP;
    property VFCP: string read Get_VFCP write Set_VFCP;
    property ModBCST: string read Get_ModBCST write Set_ModBCST;
    property PMVAST: string read Get_PMVAST write Set_PMVAST;
    property PRedBCST: string read Get_PRedBCST write Set_PRedBCST;
    property VBCST: string read Get_VBCST write Set_VBCST;
    property PICMSST: string read Get_PICMSST write Set_PICMSST;
    property VICMSST: string read Get_VICMSST write Set_VICMSST;
    property VBCFCPST: string read Get_VBCFCPST write Set_VBCFCPST;
    property PFCPST: string read Get_PFCPST write Set_PFCPST;
    property VFCPST: string read Get_VFCPST write Set_VFCPST;
    property VICMSDeson: string read Get_VICMSDeson write Set_VICMSDeson;
    property MotDesICMS: string read Get_MotDesICMS write Set_MotDesICMS;
  end;

{ IXMLICMSPart }

  IXMLICMSPart = interface(IXMLNode)
    ['{D27F6547-CAEE-4463-A1B3-5959855975E5}']
    { Property Accessors }
    function Get_Orig: string;
    function Get_CST: string;
    function Get_ModBC: string;
    function Get_VBC: string;
    function Get_PRedBC: string;
    function Get_PICMS: string;
    function Get_VICMS: string;
    function Get_ModBCST: string;
    function Get_PMVAST: string;
    function Get_PRedBCST: string;
    function Get_VBCST: string;
    function Get_PICMSST: string;
    function Get_VICMSST: string;
    function Get_PBCOp: string;
    function Get_UFST: string;
    procedure Set_Orig(Value: string);
    procedure Set_CST(Value: string);
    procedure Set_ModBC(Value: string);
    procedure Set_VBC(Value: string);
    procedure Set_PRedBC(Value: string);
    procedure Set_PICMS(Value: string);
    procedure Set_VICMS(Value: string);
    procedure Set_ModBCST(Value: string);
    procedure Set_PMVAST(Value: string);
    procedure Set_PRedBCST(Value: string);
    procedure Set_VBCST(Value: string);
    procedure Set_PICMSST(Value: string);
    procedure Set_VICMSST(Value: string);
    procedure Set_PBCOp(Value: string);
    procedure Set_UFST(Value: string);
    { Methods & Properties }
    property Orig: string read Get_Orig write Set_Orig;
    property CST: string read Get_CST write Set_CST;
    property ModBC: string read Get_ModBC write Set_ModBC;
    property VBC: string read Get_VBC write Set_VBC;
    property PRedBC: string read Get_PRedBC write Set_PRedBC;
    property PICMS: string read Get_PICMS write Set_PICMS;
    property VICMS: string read Get_VICMS write Set_VICMS;
    property ModBCST: string read Get_ModBCST write Set_ModBCST;
    property PMVAST: string read Get_PMVAST write Set_PMVAST;
    property PRedBCST: string read Get_PRedBCST write Set_PRedBCST;
    property VBCST: string read Get_VBCST write Set_VBCST;
    property PICMSST: string read Get_PICMSST write Set_PICMSST;
    property VICMSST: string read Get_VICMSST write Set_VICMSST;
    property PBCOp: string read Get_PBCOp write Set_PBCOp;
    property UFST: string read Get_UFST write Set_UFST;
  end;

{ IXMLICMSST }

  IXMLICMSST = interface(IXMLNode)
    ['{917E1F7C-B180-42D7-87C6-8DB2B37DC948}']
    { Property Accessors }
    function Get_Orig: string;
    function Get_CST: string;
    function Get_VBCSTRet: string;
    function Get_PST: string;
    function Get_VICMSSubstituto: string;
    function Get_VICMSSTRet: string;
    function Get_VBCFCPSTRet: string;
    function Get_PFCPSTRet: string;
    function Get_VFCPSTRet: string;
    function Get_VBCSTDest: string;
    function Get_VICMSSTDest: string;
    function Get_PRedBCEfet: string;
    function Get_VBCEfet: string;
    function Get_PICMSEfet: string;
    function Get_VICMSEfet: string;
    procedure Set_Orig(Value: string);
    procedure Set_CST(Value: string);
    procedure Set_VBCSTRet(Value: string);
    procedure Set_PST(Value: string);
    procedure Set_VICMSSubstituto(Value: string);
    procedure Set_VICMSSTRet(Value: string);
    procedure Set_VBCFCPSTRet(Value: string);
    procedure Set_PFCPSTRet(Value: string);
    procedure Set_VFCPSTRet(Value: string);
    procedure Set_VBCSTDest(Value: string);
    procedure Set_VICMSSTDest(Value: string);
    procedure Set_PRedBCEfet(Value: string);
    procedure Set_VBCEfet(Value: string);
    procedure Set_PICMSEfet(Value: string);
    procedure Set_VICMSEfet(Value: string);
    { Methods & Properties }
    property Orig: string read Get_Orig write Set_Orig;
    property CST: string read Get_CST write Set_CST;
    property VBCSTRet: string read Get_VBCSTRet write Set_VBCSTRet;
    property PST: string read Get_PST write Set_PST;
    property VICMSSubstituto: string read Get_VICMSSubstituto write Set_VICMSSubstituto;
    property VICMSSTRet: string read Get_VICMSSTRet write Set_VICMSSTRet;
    property VBCFCPSTRet: string read Get_VBCFCPSTRet write Set_VBCFCPSTRet;
    property PFCPSTRet: string read Get_PFCPSTRet write Set_PFCPSTRet;
    property VFCPSTRet: string read Get_VFCPSTRet write Set_VFCPSTRet;
    property VBCSTDest: string read Get_VBCSTDest write Set_VBCSTDest;
    property VICMSSTDest: string read Get_VICMSSTDest write Set_VICMSSTDest;
    property PRedBCEfet: string read Get_PRedBCEfet write Set_PRedBCEfet;
    property VBCEfet: string read Get_VBCEfet write Set_VBCEfet;
    property PICMSEfet: string read Get_PICMSEfet write Set_PICMSEfet;
    property VICMSEfet: string read Get_VICMSEfet write Set_VICMSEfet;
  end;

{ IXMLICMSSN101 }

  IXMLICMSSN101 = interface(IXMLNode)
    ['{BB1B6C85-CB06-4507-8E5C-29C35A5618F0}']
    { Property Accessors }
    function Get_Orig: string;
    function Get_CSOSN: string;
    function Get_PCredSN: string;
    function Get_VCredICMSSN: string;
    procedure Set_Orig(Value: string);
    procedure Set_CSOSN(Value: string);
    procedure Set_PCredSN(Value: string);
    procedure Set_VCredICMSSN(Value: string);
    { Methods & Properties }
    property Orig: string read Get_Orig write Set_Orig;
    property CSOSN: string read Get_CSOSN write Set_CSOSN;
    property PCredSN: string read Get_PCredSN write Set_PCredSN;
    property VCredICMSSN: string read Get_VCredICMSSN write Set_VCredICMSSN;
  end;

{ IXMLICMSSN102 }

  IXMLICMSSN102 = interface(IXMLNode)
    ['{20413A35-5AD1-4A82-8695-DCBF8DAEF5B6}']
    { Property Accessors }
    function Get_Orig: string;
    function Get_CSOSN: string;
    procedure Set_Orig(Value: string);
    procedure Set_CSOSN(Value: string);
    { Methods & Properties }
    property Orig: string read Get_Orig write Set_Orig;
    property CSOSN: string read Get_CSOSN write Set_CSOSN;
  end;

{ IXMLICMSSN201 }

  IXMLICMSSN201 = interface(IXMLNode)
    ['{BE242F86-16E3-42AB-A980-721215DE5638}']
    { Property Accessors }
    function Get_Orig: string;
    function Get_CSOSN: string;
    function Get_ModBCST: string;
    function Get_PMVAST: string;
    function Get_PRedBCST: string;
    function Get_VBCST: string;
    function Get_PICMSST: string;
    function Get_VICMSST: string;
    function Get_VBCFCPST: string;
    function Get_PFCPST: string;
    function Get_VFCPST: string;
    function Get_PCredSN: string;
    function Get_VCredICMSSN: string;
    procedure Set_Orig(Value: string);
    procedure Set_CSOSN(Value: string);
    procedure Set_ModBCST(Value: string);
    procedure Set_PMVAST(Value: string);
    procedure Set_PRedBCST(Value: string);
    procedure Set_VBCST(Value: string);
    procedure Set_PICMSST(Value: string);
    procedure Set_VICMSST(Value: string);
    procedure Set_VBCFCPST(Value: string);
    procedure Set_PFCPST(Value: string);
    procedure Set_VFCPST(Value: string);
    procedure Set_PCredSN(Value: string);
    procedure Set_VCredICMSSN(Value: string);
    { Methods & Properties }
    property Orig: string read Get_Orig write Set_Orig;
    property CSOSN: string read Get_CSOSN write Set_CSOSN;
    property ModBCST: string read Get_ModBCST write Set_ModBCST;
    property PMVAST: string read Get_PMVAST write Set_PMVAST;
    property PRedBCST: string read Get_PRedBCST write Set_PRedBCST;
    property VBCST: string read Get_VBCST write Set_VBCST;
    property PICMSST: string read Get_PICMSST write Set_PICMSST;
    property VICMSST: string read Get_VICMSST write Set_VICMSST;
    property VBCFCPST: string read Get_VBCFCPST write Set_VBCFCPST;
    property PFCPST: string read Get_PFCPST write Set_PFCPST;
    property VFCPST: string read Get_VFCPST write Set_VFCPST;
    property PCredSN: string read Get_PCredSN write Set_PCredSN;
    property VCredICMSSN: string read Get_VCredICMSSN write Set_VCredICMSSN;
  end;

{ IXMLICMSSN202 }

  IXMLICMSSN202 = interface(IXMLNode)
    ['{CF1124DD-4AE8-497F-B98A-2E1CB28670F4}']
    { Property Accessors }
    function Get_Orig: string;
    function Get_CSOSN: string;
    function Get_ModBCST: string;
    function Get_PMVAST: string;
    function Get_PRedBCST: string;
    function Get_VBCST: string;
    function Get_PICMSST: string;
    function Get_VICMSST: string;
    function Get_VBCFCPST: string;
    function Get_PFCPST: string;
    function Get_VFCPST: string;
    procedure Set_Orig(Value: string);
    procedure Set_CSOSN(Value: string);
    procedure Set_ModBCST(Value: string);
    procedure Set_PMVAST(Value: string);
    procedure Set_PRedBCST(Value: string);
    procedure Set_VBCST(Value: string);
    procedure Set_PICMSST(Value: string);
    procedure Set_VICMSST(Value: string);
    procedure Set_VBCFCPST(Value: string);
    procedure Set_PFCPST(Value: string);
    procedure Set_VFCPST(Value: string);
    { Methods & Properties }
    property Orig: string read Get_Orig write Set_Orig;
    property CSOSN: string read Get_CSOSN write Set_CSOSN;
    property ModBCST: string read Get_ModBCST write Set_ModBCST;
    property PMVAST: string read Get_PMVAST write Set_PMVAST;
    property PRedBCST: string read Get_PRedBCST write Set_PRedBCST;
    property VBCST: string read Get_VBCST write Set_VBCST;
    property PICMSST: string read Get_PICMSST write Set_PICMSST;
    property VICMSST: string read Get_VICMSST write Set_VICMSST;
    property VBCFCPST: string read Get_VBCFCPST write Set_VBCFCPST;
    property PFCPST: string read Get_PFCPST write Set_PFCPST;
    property VFCPST: string read Get_VFCPST write Set_VFCPST;
  end;

{ IXMLICMSSN500 }

  IXMLICMSSN500 = interface(IXMLNode)
    ['{EA4552B1-9301-475C-8827-DFAE46EBCF3C}']
    { Property Accessors }
    function Get_Orig: string;
    function Get_CSOSN: string;
    function Get_VBCSTRet: string;
    function Get_PST: string;
    function Get_VICMSSubstituto: string;
    function Get_VICMSSTRet: string;
    function Get_VBCFCPSTRet: string;
    function Get_PFCPSTRet: string;
    function Get_VFCPSTRet: string;
    function Get_PRedBCEfet: string;
    function Get_VBCEfet: string;
    function Get_PICMSEfet: string;
    function Get_VICMSEfet: string;
    procedure Set_Orig(Value: string);
    procedure Set_CSOSN(Value: string);
    procedure Set_VBCSTRet(Value: string);
    procedure Set_PST(Value: string);
    procedure Set_VICMSSubstituto(Value: string);
    procedure Set_VICMSSTRet(Value: string);
    procedure Set_VBCFCPSTRet(Value: string);
    procedure Set_PFCPSTRet(Value: string);
    procedure Set_VFCPSTRet(Value: string);
    procedure Set_PRedBCEfet(Value: string);
    procedure Set_VBCEfet(Value: string);
    procedure Set_PICMSEfet(Value: string);
    procedure Set_VICMSEfet(Value: string);
    { Methods & Properties }
    property Orig: string read Get_Orig write Set_Orig;
    property CSOSN: string read Get_CSOSN write Set_CSOSN;
    property VBCSTRet: string read Get_VBCSTRet write Set_VBCSTRet;
    property PST: string read Get_PST write Set_PST;
    property VICMSSubstituto: string read Get_VICMSSubstituto write Set_VICMSSubstituto;
    property VICMSSTRet: string read Get_VICMSSTRet write Set_VICMSSTRet;
    property VBCFCPSTRet: string read Get_VBCFCPSTRet write Set_VBCFCPSTRet;
    property PFCPSTRet: string read Get_PFCPSTRet write Set_PFCPSTRet;
    property VFCPSTRet: string read Get_VFCPSTRet write Set_VFCPSTRet;
    property PRedBCEfet: string read Get_PRedBCEfet write Set_PRedBCEfet;
    property VBCEfet: string read Get_VBCEfet write Set_VBCEfet;
    property PICMSEfet: string read Get_PICMSEfet write Set_PICMSEfet;
    property VICMSEfet: string read Get_VICMSEfet write Set_VICMSEfet;
  end;

{ IXMLICMSSN900 }

  IXMLICMSSN900 = interface(IXMLNode)
    ['{72D0E4C3-0C7A-4B49-9CCF-879B5CA2366E}']
    { Property Accessors }
    function Get_Orig: string;
    function Get_CSOSN: string;
    function Get_ModBC: string;
    function Get_VBC: string;
    function Get_PRedBC: string;
    function Get_PICMS: string;
    function Get_VICMS: string;
    function Get_ModBCST: string;
    function Get_PMVAST: string;
    function Get_PRedBCST: string;
    function Get_VBCST: string;
    function Get_PICMSST: string;
    function Get_VICMSST: string;
    function Get_VBCFCPST: string;
    function Get_PFCPST: string;
    function Get_VFCPST: string;
    function Get_PCredSN: string;
    function Get_VCredICMSSN: string;
    procedure Set_Orig(Value: string);
    procedure Set_CSOSN(Value: string);
    procedure Set_ModBC(Value: string);
    procedure Set_VBC(Value: string);
    procedure Set_PRedBC(Value: string);
    procedure Set_PICMS(Value: string);
    procedure Set_VICMS(Value: string);
    procedure Set_ModBCST(Value: string);
    procedure Set_PMVAST(Value: string);
    procedure Set_PRedBCST(Value: string);
    procedure Set_VBCST(Value: string);
    procedure Set_PICMSST(Value: string);
    procedure Set_VICMSST(Value: string);
    procedure Set_VBCFCPST(Value: string);
    procedure Set_PFCPST(Value: string);
    procedure Set_VFCPST(Value: string);
    procedure Set_PCredSN(Value: string);
    procedure Set_VCredICMSSN(Value: string);
    { Methods & Properties }
    property Orig: string read Get_Orig write Set_Orig;
    property CSOSN: string read Get_CSOSN write Set_CSOSN;
    property ModBC: string read Get_ModBC write Set_ModBC;
    property VBC: string read Get_VBC write Set_VBC;
    property PRedBC: string read Get_PRedBC write Set_PRedBC;
    property PICMS: string read Get_PICMS write Set_PICMS;
    property VICMS: string read Get_VICMS write Set_VICMS;
    property ModBCST: string read Get_ModBCST write Set_ModBCST;
    property PMVAST: string read Get_PMVAST write Set_PMVAST;
    property PRedBCST: string read Get_PRedBCST write Set_PRedBCST;
    property VBCST: string read Get_VBCST write Set_VBCST;
    property PICMSST: string read Get_PICMSST write Set_PICMSST;
    property VICMSST: string read Get_VICMSST write Set_VICMSST;
    property VBCFCPST: string read Get_VBCFCPST write Set_VBCFCPST;
    property PFCPST: string read Get_PFCPST write Set_PFCPST;
    property VFCPST: string read Get_VFCPST write Set_VFCPST;
    property PCredSN: string read Get_PCredSN write Set_PCredSN;
    property VCredICMSSN: string read Get_VCredICMSSN write Set_VCredICMSSN;
  end;

{ IXMLTIpi }

  IXMLTIpi = interface(IXMLNode)
    ['{74A40C5B-8D6F-4E2E-8EBC-4B53100554B9}']
    { Property Accessors }
    function Get_CNPJProd: string;
    function Get_CSelo: string;
    function Get_QSelo: string;
    function Get_CEnq: string;
    function Get_IPITrib: IXMLIPITrib;
    function Get_IPINT: IXMLIPINT;
    procedure Set_CNPJProd(Value: string);
    procedure Set_CSelo(Value: string);
    procedure Set_QSelo(Value: string);
    procedure Set_CEnq(Value: string);
    { Methods & Properties }
    property CNPJProd: string read Get_CNPJProd write Set_CNPJProd;
    property CSelo: string read Get_CSelo write Set_CSelo;
    property QSelo: string read Get_QSelo write Set_QSelo;
    property CEnq: string read Get_CEnq write Set_CEnq;
    property IPITrib: IXMLIPITrib read Get_IPITrib;
    property IPINT: IXMLIPINT read Get_IPINT;
  end;

{ IXMLIPITrib }

  IXMLIPITrib = interface(IXMLNode)
    ['{96829744-C672-4C0B-AC06-67590384FE64}']
    { Property Accessors }
    function Get_CST: string;
    function Get_VBC: string;
    function Get_PIPI: string;
    function Get_QUnid: string;
    function Get_VUnid: string;
    function Get_VIPI: string;
    procedure Set_CST(Value: string);
    procedure Set_VBC(Value: string);
    procedure Set_PIPI(Value: string);
    procedure Set_QUnid(Value: string);
    procedure Set_VUnid(Value: string);
    procedure Set_VIPI(Value: string);
    { Methods & Properties }
    property CST: string read Get_CST write Set_CST;
    property VBC: string read Get_VBC write Set_VBC;
    property PIPI: string read Get_PIPI write Set_PIPI;
    property QUnid: string read Get_QUnid write Set_QUnid;
    property VUnid: string read Get_VUnid write Set_VUnid;
    property VIPI: string read Get_VIPI write Set_VIPI;
  end;

{ IXMLIPINT }

  IXMLIPINT = interface(IXMLNode)
    ['{111B09DC-31FD-4FCC-8789-2D2576BBC0C8}']
    { Property Accessors }
    function Get_CST: string;
    procedure Set_CST(Value: string);
    { Methods & Properties }
    property CST: string read Get_CST write Set_CST;
  end;

{ IXMLII }

  IXMLII = interface(IXMLNode)
    ['{182BFDBF-7A41-4F6C-80CD-7A7672EFEE88}']
    { Property Accessors }
    function Get_VBC: string;
    function Get_VDespAdu: string;
    function Get_VII: string;
    function Get_VIOF: string;
    procedure Set_VBC(Value: string);
    procedure Set_VDespAdu(Value: string);
    procedure Set_VII(Value: string);
    procedure Set_VIOF(Value: string);
    { Methods & Properties }
    property VBC: string read Get_VBC write Set_VBC;
    property VDespAdu: string read Get_VDespAdu write Set_VDespAdu;
    property VII: string read Get_VII write Set_VII;
    property VIOF: string read Get_VIOF write Set_VIOF;
  end;

{ IXMLISSQN }

  IXMLISSQN = interface(IXMLNode)
    ['{1E453DF5-02FE-4BB0-88A5-A8BF28F457F0}']
    { Property Accessors }
    function Get_VBC: string;
    function Get_VAliq: string;
    function Get_VISSQN: string;
    function Get_CMunFG: string;
    function Get_CListServ: string;
    function Get_VDeducao: string;
    function Get_VOutro: string;
    function Get_VDescIncond: string;
    function Get_VDescCond: string;
    function Get_VISSRet: string;
    function Get_IndISS: string;
    function Get_CServico: string;
    function Get_CMun: string;
    function Get_CPais: string;
    function Get_NProcesso: string;
    function Get_IndIncentivo: string;
    procedure Set_VBC(Value: string);
    procedure Set_VAliq(Value: string);
    procedure Set_VISSQN(Value: string);
    procedure Set_CMunFG(Value: string);
    procedure Set_CListServ(Value: string);
    procedure Set_VDeducao(Value: string);
    procedure Set_VOutro(Value: string);
    procedure Set_VDescIncond(Value: string);
    procedure Set_VDescCond(Value: string);
    procedure Set_VISSRet(Value: string);
    procedure Set_IndISS(Value: string);
    procedure Set_CServico(Value: string);
    procedure Set_CMun(Value: string);
    procedure Set_CPais(Value: string);
    procedure Set_NProcesso(Value: string);
    procedure Set_IndIncentivo(Value: string);
    { Methods & Properties }
    property VBC: string read Get_VBC write Set_VBC;
    property VAliq: string read Get_VAliq write Set_VAliq;
    property VISSQN: string read Get_VISSQN write Set_VISSQN;
    property CMunFG: string read Get_CMunFG write Set_CMunFG;
    property CListServ: string read Get_CListServ write Set_CListServ;
    property VDeducao: string read Get_VDeducao write Set_VDeducao;
    property VOutro: string read Get_VOutro write Set_VOutro;
    property VDescIncond: string read Get_VDescIncond write Set_VDescIncond;
    property VDescCond: string read Get_VDescCond write Set_VDescCond;
    property VISSRet: string read Get_VISSRet write Set_VISSRet;
    property IndISS: string read Get_IndISS write Set_IndISS;
    property CServico: string read Get_CServico write Set_CServico;
    property CMun: string read Get_CMun write Set_CMun;
    property CPais: string read Get_CPais write Set_CPais;
    property NProcesso: string read Get_NProcesso write Set_NProcesso;
    property IndIncentivo: string read Get_IndIncentivo write Set_IndIncentivo;
  end;

{ IXMLPIS }

  IXMLPIS = interface(IXMLNode)
    ['{674E5F92-CD56-4460-9718-375A319EBEAF}']
    { Property Accessors }
    function Get_PISAliq: IXMLPISAliq;
    function Get_PISQtde: IXMLPISQtde;
    function Get_PISNT: IXMLPISNT;
    function Get_PISOutr: IXMLPISOutr;
    { Methods & Properties }
    property PISAliq: IXMLPISAliq read Get_PISAliq;
    property PISQtde: IXMLPISQtde read Get_PISQtde;
    property PISNT: IXMLPISNT read Get_PISNT;
    property PISOutr: IXMLPISOutr read Get_PISOutr;
  end;

{ IXMLPISAliq }

  IXMLPISAliq = interface(IXMLNode)
    ['{30AA9F49-F07B-4B36-85A6-F776AB15CCA4}']
    { Property Accessors }
    function Get_CST: string;
    function Get_VBC: string;
    function Get_PPIS: string;
    function Get_VPIS: string;
    procedure Set_CST(Value: string);
    procedure Set_VBC(Value: string);
    procedure Set_PPIS(Value: string);
    procedure Set_VPIS(Value: string);
    { Methods & Properties }
    property CST: string read Get_CST write Set_CST;
    property VBC: string read Get_VBC write Set_VBC;
    property PPIS: string read Get_PPIS write Set_PPIS;
    property VPIS: string read Get_VPIS write Set_VPIS;
  end;

{ IXMLPISQtde }

  IXMLPISQtde = interface(IXMLNode)
    ['{B1492CB9-67D5-4F44-8469-CF6D9DB80222}']
    { Property Accessors }
    function Get_CST: string;
    function Get_QBCProd: string;
    function Get_VAliqProd: string;
    function Get_VPIS: string;
    procedure Set_CST(Value: string);
    procedure Set_QBCProd(Value: string);
    procedure Set_VAliqProd(Value: string);
    procedure Set_VPIS(Value: string);
    { Methods & Properties }
    property CST: string read Get_CST write Set_CST;
    property QBCProd: string read Get_QBCProd write Set_QBCProd;
    property VAliqProd: string read Get_VAliqProd write Set_VAliqProd;
    property VPIS: string read Get_VPIS write Set_VPIS;
  end;

{ IXMLPISNT }

  IXMLPISNT = interface(IXMLNode)
    ['{7F71D776-80E9-4ED8-8C25-2A81300AFEE7}']
    { Property Accessors }
    function Get_CST: string;
    procedure Set_CST(Value: string);
    { Methods & Properties }
    property CST: string read Get_CST write Set_CST;
  end;

{ IXMLPISOutr }

  IXMLPISOutr = interface(IXMLNode)
    ['{7038B4BE-6D98-4029-9625-B8A736D87150}']
    { Property Accessors }
    function Get_CST: string;
    function Get_VBC: string;
    function Get_PPIS: string;
    function Get_QBCProd: string;
    function Get_VAliqProd: string;
    function Get_VPIS: string;
    procedure Set_CST(Value: string);
    procedure Set_VBC(Value: string);
    procedure Set_PPIS(Value: string);
    procedure Set_QBCProd(Value: string);
    procedure Set_VAliqProd(Value: string);
    procedure Set_VPIS(Value: string);
    { Methods & Properties }
    property CST: string read Get_CST write Set_CST;
    property VBC: string read Get_VBC write Set_VBC;
    property PPIS: string read Get_PPIS write Set_PPIS;
    property QBCProd: string read Get_QBCProd write Set_QBCProd;
    property VAliqProd: string read Get_VAliqProd write Set_VAliqProd;
    property VPIS: string read Get_VPIS write Set_VPIS;
  end;

{ IXMLPISST }

  IXMLPISST = interface(IXMLNode)
    ['{0D79A56B-C2C3-4E87-B508-BCC25A9B3488}']
    { Property Accessors }
    function Get_VBC: string;
    function Get_PPIS: string;
    function Get_QBCProd: string;
    function Get_VAliqProd: string;
    function Get_VPIS: string;
    procedure Set_VBC(Value: string);
    procedure Set_PPIS(Value: string);
    procedure Set_QBCProd(Value: string);
    procedure Set_VAliqProd(Value: string);
    procedure Set_VPIS(Value: string);
    { Methods & Properties }
    property VBC: string read Get_VBC write Set_VBC;
    property PPIS: string read Get_PPIS write Set_PPIS;
    property QBCProd: string read Get_QBCProd write Set_QBCProd;
    property VAliqProd: string read Get_VAliqProd write Set_VAliqProd;
    property VPIS: string read Get_VPIS write Set_VPIS;
  end;

{ IXMLCOFINS }

  IXMLCOFINS = interface(IXMLNode)
    ['{68C5E721-1CEC-4884-91DB-0A8C5ED66C26}']
    { Property Accessors }
    function Get_COFINSAliq: IXMLCOFINSAliq;
    function Get_COFINSQtde: IXMLCOFINSQtde;
    function Get_COFINSNT: IXMLCOFINSNT;
    function Get_COFINSOutr: IXMLCOFINSOutr;
    { Methods & Properties }
    property COFINSAliq: IXMLCOFINSAliq read Get_COFINSAliq;
    property COFINSQtde: IXMLCOFINSQtde read Get_COFINSQtde;
    property COFINSNT: IXMLCOFINSNT read Get_COFINSNT;
    property COFINSOutr: IXMLCOFINSOutr read Get_COFINSOutr;
  end;

{ IXMLCOFINSAliq }

  IXMLCOFINSAliq = interface(IXMLNode)
    ['{CD77559A-B49D-4DA6-ADC9-EFE6514732BE}']
    { Property Accessors }
    function Get_CST: string;
    function Get_VBC: string;
    function Get_PCOFINS: string;
    function Get_VCOFINS: string;
    procedure Set_CST(Value: string);
    procedure Set_VBC(Value: string);
    procedure Set_PCOFINS(Value: string);
    procedure Set_VCOFINS(Value: string);
    { Methods & Properties }
    property CST: string read Get_CST write Set_CST;
    property VBC: string read Get_VBC write Set_VBC;
    property PCOFINS: string read Get_PCOFINS write Set_PCOFINS;
    property VCOFINS: string read Get_VCOFINS write Set_VCOFINS;
  end;

{ IXMLCOFINSQtde }

  IXMLCOFINSQtde = interface(IXMLNode)
    ['{9E3D4BDA-C1D1-4A1D-9070-F2C0C75E1C3C}']
    { Property Accessors }
    function Get_CST: string;
    function Get_QBCProd: string;
    function Get_VAliqProd: string;
    function Get_VCOFINS: string;
    procedure Set_CST(Value: string);
    procedure Set_QBCProd(Value: string);
    procedure Set_VAliqProd(Value: string);
    procedure Set_VCOFINS(Value: string);
    { Methods & Properties }
    property CST: string read Get_CST write Set_CST;
    property QBCProd: string read Get_QBCProd write Set_QBCProd;
    property VAliqProd: string read Get_VAliqProd write Set_VAliqProd;
    property VCOFINS: string read Get_VCOFINS write Set_VCOFINS;
  end;

{ IXMLCOFINSNT }

  IXMLCOFINSNT = interface(IXMLNode)
    ['{FE97C879-421A-44B0-9602-2ECC10E6FC96}']
    { Property Accessors }
    function Get_CST: string;
    procedure Set_CST(Value: string);
    { Methods & Properties }
    property CST: string read Get_CST write Set_CST;
  end;

{ IXMLCOFINSOutr }

  IXMLCOFINSOutr = interface(IXMLNode)
    ['{43182BD1-E525-4525-B2A8-89FCD981CA1C}']
    { Property Accessors }
    function Get_CST: string;
    function Get_VBC: string;
    function Get_PCOFINS: string;
    function Get_QBCProd: string;
    function Get_VAliqProd: string;
    function Get_VCOFINS: string;
    procedure Set_CST(Value: string);
    procedure Set_VBC(Value: string);
    procedure Set_PCOFINS(Value: string);
    procedure Set_QBCProd(Value: string);
    procedure Set_VAliqProd(Value: string);
    procedure Set_VCOFINS(Value: string);
    { Methods & Properties }
    property CST: string read Get_CST write Set_CST;
    property VBC: string read Get_VBC write Set_VBC;
    property PCOFINS: string read Get_PCOFINS write Set_PCOFINS;
    property QBCProd: string read Get_QBCProd write Set_QBCProd;
    property VAliqProd: string read Get_VAliqProd write Set_VAliqProd;
    property VCOFINS: string read Get_VCOFINS write Set_VCOFINS;
  end;

{ IXMLCOFINSST }

  IXMLCOFINSST = interface(IXMLNode)
    ['{E7F70877-B352-4538-A7A7-ECAB51927A01}']
    { Property Accessors }
    function Get_VBC: string;
    function Get_PCOFINS: string;
    function Get_QBCProd: string;
    function Get_VAliqProd: string;
    function Get_VCOFINS: string;
    procedure Set_VBC(Value: string);
    procedure Set_PCOFINS(Value: string);
    procedure Set_QBCProd(Value: string);
    procedure Set_VAliqProd(Value: string);
    procedure Set_VCOFINS(Value: string);
    { Methods & Properties }
    property VBC: string read Get_VBC write Set_VBC;
    property PCOFINS: string read Get_PCOFINS write Set_PCOFINS;
    property QBCProd: string read Get_QBCProd write Set_QBCProd;
    property VAliqProd: string read Get_VAliqProd write Set_VAliqProd;
    property VCOFINS: string read Get_VCOFINS write Set_VCOFINS;
  end;

{ IXMLICMSUFDest }

  IXMLICMSUFDest = interface(IXMLNode)
    ['{3D3C09D4-3C67-4DCE-8C4E-CFB0937D618B}']
    { Property Accessors }
    function Get_VBCUFDest: string;
    function Get_VBCFCPUFDest: string;
    function Get_PFCPUFDest: string;
    function Get_PICMSUFDest: string;
    function Get_PICMSInter: string;
    function Get_PICMSInterPart: string;
    function Get_VFCPUFDest: string;
    function Get_VICMSUFDest: string;
    function Get_VICMSUFRemet: string;
    procedure Set_VBCUFDest(Value: string);
    procedure Set_VBCFCPUFDest(Value: string);
    procedure Set_PFCPUFDest(Value: string);
    procedure Set_PICMSUFDest(Value: string);
    procedure Set_PICMSInter(Value: string);
    procedure Set_PICMSInterPart(Value: string);
    procedure Set_VFCPUFDest(Value: string);
    procedure Set_VICMSUFDest(Value: string);
    procedure Set_VICMSUFRemet(Value: string);
    { Methods & Properties }
    property VBCUFDest: string read Get_VBCUFDest write Set_VBCUFDest;
    property VBCFCPUFDest: string read Get_VBCFCPUFDest write Set_VBCFCPUFDest;
    property PFCPUFDest: string read Get_PFCPUFDest write Set_PFCPUFDest;
    property PICMSUFDest: string read Get_PICMSUFDest write Set_PICMSUFDest;
    property PICMSInter: string read Get_PICMSInter write Set_PICMSInter;
    property PICMSInterPart: string read Get_PICMSInterPart write Set_PICMSInterPart;
    property VFCPUFDest: string read Get_VFCPUFDest write Set_VFCPUFDest;
    property VICMSUFDest: string read Get_VICMSUFDest write Set_VICMSUFDest;
    property VICMSUFRemet: string read Get_VICMSUFRemet write Set_VICMSUFRemet;
  end;

{ IXMLImpostoDevol }

  IXMLImpostoDevol = interface(IXMLNode)
    ['{DE9CF8F6-7242-4064-BAA5-65687B89E4AC}']
    { Property Accessors }
    function Get_PDevol: string;
    function Get_IPI: IXMLIPI;
    procedure Set_PDevol(Value: string);
    { Methods & Properties }
    property PDevol: string read Get_PDevol write Set_PDevol;
    property IPI: IXMLIPI read Get_IPI;
  end;

{ IXMLIPI }

  IXMLIPI = interface(IXMLNode)
    ['{2E3CA0E1-AA37-4AA2-B3E7-4E28C204539B}']
    { Property Accessors }
    function Get_VIPIDevol: string;
    procedure Set_VIPIDevol(Value: string);
    { Methods & Properties }
    property VIPIDevol: string read Get_VIPIDevol write Set_VIPIDevol;
  end;

{ IXMLTotal }

  IXMLTotal = interface(IXMLNode)
    ['{5F3E552B-B136-4105-A548-3663D92A7FA9}']
    { Property Accessors }
    function Get_ICMSTot: IXMLICMSTot;
    function Get_ISSQNtot: IXMLISSQNtot;
    function Get_RetTrib: IXMLRetTrib;
    { Methods & Properties }
    property ICMSTot: IXMLICMSTot read Get_ICMSTot;
    property ISSQNtot: IXMLISSQNtot read Get_ISSQNtot;
    property RetTrib: IXMLRetTrib read Get_RetTrib;
  end;

{ IXMLICMSTot }

  IXMLICMSTot = interface(IXMLNode)
    ['{D6FCD4A3-2B1C-452B-A627-4F7A07940AF7}']
    { Property Accessors }
    function Get_VBC: string;
    function Get_VICMS: string;
    function Get_VICMSDeson: string;
    function Get_VFCPUFDest: string;
    function Get_VICMSUFDest: string;
    function Get_VICMSUFRemet: string;
    function Get_VFCP: string;
    function Get_VBCST: string;
    function Get_VST: string;
    function Get_VFCPST: string;
    function Get_VFCPSTRet: string;
    function Get_VProd: string;
    function Get_VFrete: string;
    function Get_VSeg: string;
    function Get_VDesc: string;
    function Get_VII: string;
    function Get_VIPI: string;
    function Get_VIPIDevol: string;
    function Get_VPIS: string;
    function Get_VCOFINS: string;
    function Get_VOutro: string;
    function Get_VNF: string;
    function Get_VTotTrib: string;
    procedure Set_VBC(Value: string);
    procedure Set_VICMS(Value: string);
    procedure Set_VICMSDeson(Value: string);
    procedure Set_VFCPUFDest(Value: string);
    procedure Set_VICMSUFDest(Value: string);
    procedure Set_VICMSUFRemet(Value: string);
    procedure Set_VFCP(Value: string);
    procedure Set_VBCST(Value: string);
    procedure Set_VST(Value: string);
    procedure Set_VFCPST(Value: string);
    procedure Set_VFCPSTRet(Value: string);
    procedure Set_VProd(Value: string);
    procedure Set_VFrete(Value: string);
    procedure Set_VSeg(Value: string);
    procedure Set_VDesc(Value: string);
    procedure Set_VII(Value: string);
    procedure Set_VIPI(Value: string);
    procedure Set_VIPIDevol(Value: string);
    procedure Set_VPIS(Value: string);
    procedure Set_VCOFINS(Value: string);
    procedure Set_VOutro(Value: string);
    procedure Set_VNF(Value: string);
    procedure Set_VTotTrib(Value: string);
    { Methods & Properties }
    property VBC: string read Get_VBC write Set_VBC;
    property VICMS: string read Get_VICMS write Set_VICMS;
    property VICMSDeson: string read Get_VICMSDeson write Set_VICMSDeson;
    property VFCPUFDest: string read Get_VFCPUFDest write Set_VFCPUFDest;
    property VICMSUFDest: string read Get_VICMSUFDest write Set_VICMSUFDest;
    property VICMSUFRemet: string read Get_VICMSUFRemet write Set_VICMSUFRemet;
    property VFCP: string read Get_VFCP write Set_VFCP;
    property VBCST: string read Get_VBCST write Set_VBCST;
    property VST: string read Get_VST write Set_VST;
    property VFCPST: string read Get_VFCPST write Set_VFCPST;
    property VFCPSTRet: string read Get_VFCPSTRet write Set_VFCPSTRet;
    property VProd: string read Get_VProd write Set_VProd;
    property VFrete: string read Get_VFrete write Set_VFrete;
    property VSeg: string read Get_VSeg write Set_VSeg;
    property VDesc: string read Get_VDesc write Set_VDesc;
    property VII: string read Get_VII write Set_VII;
    property VIPI: string read Get_VIPI write Set_VIPI;
    property VIPIDevol: string read Get_VIPIDevol write Set_VIPIDevol;
    property VPIS: string read Get_VPIS write Set_VPIS;
    property VCOFINS: string read Get_VCOFINS write Set_VCOFINS;
    property VOutro: string read Get_VOutro write Set_VOutro;
    property VNF: string read Get_VNF write Set_VNF;
    property VTotTrib: string read Get_VTotTrib write Set_VTotTrib;
  end;

{ IXMLISSQNtot }

  IXMLISSQNtot = interface(IXMLNode)
    ['{0000D9FD-0792-40B8-AC2D-B1815D8AA5BD}']
    { Property Accessors }
    function Get_VServ: string;
    function Get_VBC: string;
    function Get_VISS: string;
    function Get_VPIS: string;
    function Get_VCOFINS: string;
    function Get_DCompet: string;
    function Get_VDeducao: string;
    function Get_VOutro: string;
    function Get_VDescIncond: string;
    function Get_VDescCond: string;
    function Get_VISSRet: string;
    function Get_CRegTrib: string;
    procedure Set_VServ(Value: string);
    procedure Set_VBC(Value: string);
    procedure Set_VISS(Value: string);
    procedure Set_VPIS(Value: string);
    procedure Set_VCOFINS(Value: string);
    procedure Set_DCompet(Value: string);
    procedure Set_VDeducao(Value: string);
    procedure Set_VOutro(Value: string);
    procedure Set_VDescIncond(Value: string);
    procedure Set_VDescCond(Value: string);
    procedure Set_VISSRet(Value: string);
    procedure Set_CRegTrib(Value: string);
    { Methods & Properties }
    property VServ: string read Get_VServ write Set_VServ;
    property VBC: string read Get_VBC write Set_VBC;
    property VISS: string read Get_VISS write Set_VISS;
    property VPIS: string read Get_VPIS write Set_VPIS;
    property VCOFINS: string read Get_VCOFINS write Set_VCOFINS;
    property DCompet: string read Get_DCompet write Set_DCompet;
    property VDeducao: string read Get_VDeducao write Set_VDeducao;
    property VOutro: string read Get_VOutro write Set_VOutro;
    property VDescIncond: string read Get_VDescIncond write Set_VDescIncond;
    property VDescCond: string read Get_VDescCond write Set_VDescCond;
    property VISSRet: string read Get_VISSRet write Set_VISSRet;
    property CRegTrib: string read Get_CRegTrib write Set_CRegTrib;
  end;

{ IXMLRetTrib }

  IXMLRetTrib = interface(IXMLNode)
    ['{93C53F31-C0D1-49AA-9F93-470886E7742A}']
    { Property Accessors }
    function Get_VRetPIS: string;
    function Get_VRetCOFINS: string;
    function Get_VRetCSLL: string;
    function Get_VBCIRRF: string;
    function Get_VIRRF: string;
    function Get_VBCRetPrev: string;
    function Get_VRetPrev: string;
    procedure Set_VRetPIS(Value: string);
    procedure Set_VRetCOFINS(Value: string);
    procedure Set_VRetCSLL(Value: string);
    procedure Set_VBCIRRF(Value: string);
    procedure Set_VIRRF(Value: string);
    procedure Set_VBCRetPrev(Value: string);
    procedure Set_VRetPrev(Value: string);
    { Methods & Properties }
    property VRetPIS: string read Get_VRetPIS write Set_VRetPIS;
    property VRetCOFINS: string read Get_VRetCOFINS write Set_VRetCOFINS;
    property VRetCSLL: string read Get_VRetCSLL write Set_VRetCSLL;
    property VBCIRRF: string read Get_VBCIRRF write Set_VBCIRRF;
    property VIRRF: string read Get_VIRRF write Set_VIRRF;
    property VBCRetPrev: string read Get_VBCRetPrev write Set_VBCRetPrev;
    property VRetPrev: string read Get_VRetPrev write Set_VRetPrev;
  end;

{ IXMLTransp }

  IXMLTransp = interface(IXMLNode)
    ['{176DA2F8-191C-4B8E-B201-C852785A1A82}']
    { Property Accessors }
    function Get_ModFrete: string;
    function Get_Transporta: IXMLTransporta;
    function Get_RetTransp: IXMLRetTransp;
    function Get_VeicTransp: IXMLTVeiculo;
    function Get_Reboque: IXMLTVeiculoList;
    function Get_Vagao: string;
    function Get_Balsa: string;
    function Get_Vol: IXMLVolList;
    procedure Set_ModFrete(Value: string);
    procedure Set_Vagao(Value: string);
    procedure Set_Balsa(Value: string);
    { Methods & Properties }
    property ModFrete: string read Get_ModFrete write Set_ModFrete;
    property Transporta: IXMLTransporta read Get_Transporta;
    property RetTransp: IXMLRetTransp read Get_RetTransp;
    property VeicTransp: IXMLTVeiculo read Get_VeicTransp;
    property Reboque: IXMLTVeiculoList read Get_Reboque;
    property Vagao: string read Get_Vagao write Set_Vagao;
    property Balsa: string read Get_Balsa write Set_Balsa;
    property Vol: IXMLVolList read Get_Vol;
  end;

{ IXMLTransporta }

  IXMLTransporta = interface(IXMLNode)
    ['{55F125E0-DE1B-45BC-AFBE-AC57EAD91266}']
    { Property Accessors }
    function Get_CNPJ: string;
    function Get_CPF: string;
    function Get_XNome: string;
    function Get_IE: string;
    function Get_XEnder: string;
    function Get_XMun: string;
    function Get_UF: string;
    procedure Set_CNPJ(Value: string);
    procedure Set_CPF(Value: string);
    procedure Set_XNome(Value: string);
    procedure Set_IE(Value: string);
    procedure Set_XEnder(Value: string);
    procedure Set_XMun(Value: string);
    procedure Set_UF(Value: string);
    { Methods & Properties }
    property CNPJ: string read Get_CNPJ write Set_CNPJ;
    property CPF: string read Get_CPF write Set_CPF;
    property XNome: string read Get_XNome write Set_XNome;
    property IE: string read Get_IE write Set_IE;
    property XEnder: string read Get_XEnder write Set_XEnder;
    property XMun: string read Get_XMun write Set_XMun;
    property UF: string read Get_UF write Set_UF;
  end;

{ IXMLRetTransp }

  IXMLRetTransp = interface(IXMLNode)
    ['{1AA669FB-CBE9-4E4D-BE08-94662862BED9}']
    { Property Accessors }
    function Get_VServ: string;
    function Get_VBCRet: string;
    function Get_PICMSRet: string;
    function Get_VICMSRet: string;
    function Get_CFOP: string;
    function Get_CMunFG: string;
    procedure Set_VServ(Value: string);
    procedure Set_VBCRet(Value: string);
    procedure Set_PICMSRet(Value: string);
    procedure Set_VICMSRet(Value: string);
    procedure Set_CFOP(Value: string);
    procedure Set_CMunFG(Value: string);
    { Methods & Properties }
    property VServ: string read Get_VServ write Set_VServ;
    property VBCRet: string read Get_VBCRet write Set_VBCRet;
    property PICMSRet: string read Get_PICMSRet write Set_PICMSRet;
    property VICMSRet: string read Get_VICMSRet write Set_VICMSRet;
    property CFOP: string read Get_CFOP write Set_CFOP;
    property CMunFG: string read Get_CMunFG write Set_CMunFG;
  end;

{ IXMLTVeiculo }

  IXMLTVeiculo = interface(IXMLNode)
    ['{30E660FC-5C7E-4904-8FCE-D21BD49A66EE}']
    { Property Accessors }
    function Get_Placa: string;
    function Get_UF: string;
    function Get_RNTC: string;
    procedure Set_Placa(Value: string);
    procedure Set_UF(Value: string);
    procedure Set_RNTC(Value: string);
    { Methods & Properties }
    property Placa: string read Get_Placa write Set_Placa;
    property UF: string read Get_UF write Set_UF;
    property RNTC: string read Get_RNTC write Set_RNTC;
  end;

{ IXMLTVeiculoList }

  IXMLTVeiculoList = interface(IXMLNodeCollection)
    ['{86547297-2BC9-4793-9B9A-C3DC6B7041FA}']
    { Methods & Properties }
    function Add: IXMLTVeiculo;
    function Insert(const Index: Integer): IXMLTVeiculo;

    function Get_Item(Index: Integer): IXMLTVeiculo;
    property Items[Index: Integer]: IXMLTVeiculo read Get_Item; default;
  end;

{ IXMLVol }

  IXMLVol = interface(IXMLNode)
    ['{E627B830-003D-4848-B986-B2ABCE89D16A}']
    { Property Accessors }
    function Get_QVol: string;
    function Get_Esp: string;
    function Get_Marca: string;
    function Get_NVol: string;
    function Get_PesoL: string;
    function Get_PesoB: string;
    function Get_Lacres: IXMLLacresList;
    procedure Set_QVol(Value: string);
    procedure Set_Esp(Value: string);
    procedure Set_Marca(Value: string);
    procedure Set_NVol(Value: string);
    procedure Set_PesoL(Value: string);
    procedure Set_PesoB(Value: string);
    { Methods & Properties }
    property QVol: string read Get_QVol write Set_QVol;
    property Esp: string read Get_Esp write Set_Esp;
    property Marca: string read Get_Marca write Set_Marca;
    property NVol: string read Get_NVol write Set_NVol;
    property PesoL: string read Get_PesoL write Set_PesoL;
    property PesoB: string read Get_PesoB write Set_PesoB;
    property Lacres: IXMLLacresList read Get_Lacres;
  end;

{ IXMLVolList }

  IXMLVolList = interface(IXMLNodeCollection)
    ['{84C4C6F3-A021-49BA-B368-E41770BB2BB2}']
    { Methods & Properties }
    function Add: IXMLVol;
    function Insert(const Index: Integer): IXMLVol;

    function Get_Item(Index: Integer): IXMLVol;
    property Items[Index: Integer]: IXMLVol read Get_Item; default;
  end;

{ IXMLLacres }

  IXMLLacres = interface(IXMLNode)
    ['{3B37BEA4-47E4-473D-A4D0-CBC13F018D8A}']
    { Property Accessors }
    function Get_NLacre: string;
    procedure Set_NLacre(Value: string);
    { Methods & Properties }
    property NLacre: string read Get_NLacre write Set_NLacre;
  end;

{ IXMLLacresList }

  IXMLLacresList = interface(IXMLNodeCollection)
    ['{A98AF4FF-7460-4A53-BBD9-E31542BF571C}']
    { Methods & Properties }
    function Add: IXMLLacres;
    function Insert(const Index: Integer): IXMLLacres;

    function Get_Item(Index: Integer): IXMLLacres;
    property Items[Index: Integer]: IXMLLacres read Get_Item; default;
  end;

{ IXMLCobr }

  IXMLCobr = interface(IXMLNode)
    ['{F8893A7C-160E-4FCC-A51F-C9ED2B45772C}']
    { Property Accessors }
    function Get_Fat: IXMLFat;
    function Get_Dup: IXMLDupList;
    { Methods & Properties }
    property Fat: IXMLFat read Get_Fat;
    property Dup: IXMLDupList read Get_Dup;
  end;

{ IXMLFat }

  IXMLFat = interface(IXMLNode)
    ['{CDC1D56D-C78C-4776-8211-4EB39ABCE708}']
    { Property Accessors }
    function Get_NFat: string;
    function Get_VOrig: string;
    function Get_VDesc: string;
    function Get_VLiq: string;
    procedure Set_NFat(Value: string);
    procedure Set_VOrig(Value: string);
    procedure Set_VDesc(Value: string);
    procedure Set_VLiq(Value: string);
    { Methods & Properties }
    property NFat: string read Get_NFat write Set_NFat;
    property VOrig: string read Get_VOrig write Set_VOrig;
    property VDesc: string read Get_VDesc write Set_VDesc;
    property VLiq: string read Get_VLiq write Set_VLiq;
  end;

{ IXMLDup }

  IXMLDup = interface(IXMLNode)
    ['{E666FBC9-1A0B-4A43-B417-872B3D8447DC}']
    { Property Accessors }
    function Get_NDup: string;
    function Get_DVenc: string;
    function Get_VDup: string;
    procedure Set_NDup(Value: string);
    procedure Set_DVenc(Value: string);
    procedure Set_VDup(Value: string);
    { Methods & Properties }
    property NDup: string read Get_NDup write Set_NDup;
    property DVenc: string read Get_DVenc write Set_DVenc;
    property VDup: string read Get_VDup write Set_VDup;
  end;

{ IXMLDupList }

  IXMLDupList = interface(IXMLNodeCollection)
    ['{D9432195-6877-42AF-806F-97CE57387EAB}']
    { Methods & Properties }
    function Add: IXMLDup;
    function Insert(const Index: Integer): IXMLDup;

    function Get_Item(Index: Integer): IXMLDup;
    property Items[Index: Integer]: IXMLDup read Get_Item; default;
  end;

{ IXMLPag }

  IXMLPag = interface(IXMLNode)
    ['{BFF389BF-DD39-415B-BC8E-BFA9F6B06802}']
    { Property Accessors }
    function Get_DetPag: IXMLDetPagList;
    function Get_VTroco: string;
    procedure Set_VTroco(Value: string);
    { Methods & Properties }
    property DetPag: IXMLDetPagList read Get_DetPag;
    property VTroco: string read Get_VTroco write Set_VTroco;
  end;

{ IXMLDetPag }

  IXMLDetPag = interface(IXMLNode)
    ['{8D496841-F6AB-473E-8A91-6C71A97EE80E}']
    { Property Accessors }
    function Get_IndPag: string;
    function Get_TPag: string;
    function Get_VPag: string;
    function Get_Card: IXMLCard;
    procedure Set_IndPag(Value: string);
    procedure Set_TPag(Value: string);
    procedure Set_VPag(Value: string);
    { Methods & Properties }
    property IndPag: string read Get_IndPag write Set_IndPag;
    property TPag: string read Get_TPag write Set_TPag;
    property VPag: string read Get_VPag write Set_VPag;
    property Card: IXMLCard read Get_Card;
  end;

{ IXMLDetPagList }

  IXMLDetPagList = interface(IXMLNodeCollection)
    ['{6D8BBBB8-04CB-430E-9628-C8465A5AFDDE}']
    { Methods & Properties }
    function Add: IXMLDetPag;
    function Insert(const Index: Integer): IXMLDetPag;

    function Get_Item(Index: Integer): IXMLDetPag;
    property Items[Index: Integer]: IXMLDetPag read Get_Item; default;
  end;

{ IXMLCard }

  IXMLCard = interface(IXMLNode)
    ['{879B4F2D-4F9B-428D-9E7A-10EE0E59E4B2}']
    { Property Accessors }
    function Get_TpIntegra: string;
    function Get_CNPJ: string;
    function Get_TBand: string;
    function Get_CAut: string;
    procedure Set_TpIntegra(Value: string);
    procedure Set_CNPJ(Value: string);
    procedure Set_TBand(Value: string);
    procedure Set_CAut(Value: string);
    { Methods & Properties }
    property TpIntegra: string read Get_TpIntegra write Set_TpIntegra;
    property CNPJ: string read Get_CNPJ write Set_CNPJ;
    property TBand: string read Get_TBand write Set_TBand;
    property CAut: string read Get_CAut write Set_CAut;
  end;

{ IXMLInfIntermed }

  IXMLInfIntermed = interface(IXMLNode)
    ['{65A5451B-E04F-4A62-A135-7A1C78B8E004}']
    { Property Accessors }
    function Get_CNPJ: string;
    function Get_IdCadIntTran: string;
    procedure Set_CNPJ(Value: string);
    procedure Set_IdCadIntTran(Value: string);
    { Methods & Properties }
    property CNPJ: string read Get_CNPJ write Set_CNPJ;
    property IdCadIntTran: string read Get_IdCadIntTran write Set_IdCadIntTran;
  end;

{ IXMLInfAdic }

  IXMLInfAdic = interface(IXMLNode)
    ['{87436614-A14A-40FF-8D7A-2C3444DC242A}']
    { Property Accessors }
    function Get_InfAdFisco: string;
    function Get_InfCpl: string;
    function Get_ObsCont: IXMLObsContList;
    function Get_ObsFisco: IXMLObsFiscoList;
    function Get_ProcRef: IXMLProcRefList;
    procedure Set_InfAdFisco(Value: string);
    procedure Set_InfCpl(Value: string);
    { Methods & Properties }
    property InfAdFisco: string read Get_InfAdFisco write Set_InfAdFisco;
    property InfCpl: string read Get_InfCpl write Set_InfCpl;
    property ObsCont: IXMLObsContList read Get_ObsCont;
    property ObsFisco: IXMLObsFiscoList read Get_ObsFisco;
    property ProcRef: IXMLProcRefList read Get_ProcRef;
  end;

{ IXMLObsCont }

  IXMLObsCont = interface(IXMLNode)
    ['{2CED60ED-CDAA-4661-B0D1-71E291910C0A}']
    { Property Accessors }
    function Get_XCampo: string;
    function Get_XTexto: string;
    procedure Set_XCampo(Value: string);
    procedure Set_XTexto(Value: string);
    { Methods & Properties }
    property XCampo: string read Get_XCampo write Set_XCampo;
    property XTexto: string read Get_XTexto write Set_XTexto;
  end;

{ IXMLObsContList }

  IXMLObsContList = interface(IXMLNodeCollection)
    ['{1095883E-0D1B-4B03-92A9-E91997A50426}']
    { Methods & Properties }
    function Add: IXMLObsCont;
    function Insert(const Index: Integer): IXMLObsCont;

    function Get_Item(Index: Integer): IXMLObsCont;
    property Items[Index: Integer]: IXMLObsCont read Get_Item; default;
  end;

{ IXMLObsFisco }

  IXMLObsFisco = interface(IXMLNode)
    ['{D746C437-2345-45E6-AFD9-322C1EBDAA58}']
    { Property Accessors }
    function Get_XCampo: string;
    function Get_XTexto: string;
    procedure Set_XCampo(Value: string);
    procedure Set_XTexto(Value: string);
    { Methods & Properties }
    property XCampo: string read Get_XCampo write Set_XCampo;
    property XTexto: string read Get_XTexto write Set_XTexto;
  end;

{ IXMLObsFiscoList }

  IXMLObsFiscoList = interface(IXMLNodeCollection)
    ['{AA3C6FDB-C78B-44EC-9655-B2DF039E49B5}']
    { Methods & Properties }
    function Add: IXMLObsFisco;
    function Insert(const Index: Integer): IXMLObsFisco;

    function Get_Item(Index: Integer): IXMLObsFisco;
    property Items[Index: Integer]: IXMLObsFisco read Get_Item; default;
  end;

{ IXMLProcRef }

  IXMLProcRef = interface(IXMLNode)
    ['{A52E2FDC-5C21-4B8B-8F12-C9329E706AC7}']
    { Property Accessors }
    function Get_NProc: string;
    function Get_IndProc: string;
    procedure Set_NProc(Value: string);
    procedure Set_IndProc(Value: string);
    { Methods & Properties }
    property NProc: string read Get_NProc write Set_NProc;
    property IndProc: string read Get_IndProc write Set_IndProc;
  end;

{ IXMLProcRefList }

  IXMLProcRefList = interface(IXMLNodeCollection)
    ['{FA5BD4BF-CDCA-4784-A68B-0B6A336A9787}']
    { Methods & Properties }
    function Add: IXMLProcRef;
    function Insert(const Index: Integer): IXMLProcRef;

    function Get_Item(Index: Integer): IXMLProcRef;
    property Items[Index: Integer]: IXMLProcRef read Get_Item; default;
  end;

{ IXMLExporta }

  IXMLExporta = interface(IXMLNode)
    ['{99E36438-20AA-44D4-8C71-DF8C393E3E5B}']
    { Property Accessors }
    function Get_UFSaidaPais: string;
    function Get_XLocExporta: string;
    function Get_XLocDespacho: string;
    procedure Set_UFSaidaPais(Value: string);
    procedure Set_XLocExporta(Value: string);
    procedure Set_XLocDespacho(Value: string);
    { Methods & Properties }
    property UFSaidaPais: string read Get_UFSaidaPais write Set_UFSaidaPais;
    property XLocExporta: string read Get_XLocExporta write Set_XLocExporta;
    property XLocDespacho: string read Get_XLocDespacho write Set_XLocDespacho;
  end;

{ IXMLCompra }

  IXMLCompra = interface(IXMLNode)
    ['{563E1B4F-1339-4DD0-A66C-7E992D9E91EC}']
    { Property Accessors }
    function Get_XNEmp: string;
    function Get_XPed: string;
    function Get_XCont: string;
    procedure Set_XNEmp(Value: string);
    procedure Set_XPed(Value: string);
    procedure Set_XCont(Value: string);
    { Methods & Properties }
    property XNEmp: string read Get_XNEmp write Set_XNEmp;
    property XPed: string read Get_XPed write Set_XPed;
    property XCont: string read Get_XCont write Set_XCont;
  end;

{ IXMLCana }

  IXMLCana = interface(IXMLNode)
    ['{186DC27B-FD56-4554-BF4B-D75C18D08ED2}']
    { Property Accessors }
    function Get_Safra: string;
    function Get_Ref: string;
    function Get_ForDia: IXMLForDiaList;
    function Get_QTotMes: string;
    function Get_QTotAnt: string;
    function Get_QTotGer: string;
    function Get_Deduc: IXMLDeducList;
    function Get_VFor: string;
    function Get_VTotDed: string;
    function Get_VLiqFor: string;
    procedure Set_Safra(Value: string);
    procedure Set_Ref(Value: string);
    procedure Set_QTotMes(Value: string);
    procedure Set_QTotAnt(Value: string);
    procedure Set_QTotGer(Value: string);
    procedure Set_VFor(Value: string);
    procedure Set_VTotDed(Value: string);
    procedure Set_VLiqFor(Value: string);
    { Methods & Properties }
    property Safra: string read Get_Safra write Set_Safra;
    property Ref: string read Get_Ref write Set_Ref;
    property ForDia: IXMLForDiaList read Get_ForDia;
    property QTotMes: string read Get_QTotMes write Set_QTotMes;
    property QTotAnt: string read Get_QTotAnt write Set_QTotAnt;
    property QTotGer: string read Get_QTotGer write Set_QTotGer;
    property Deduc: IXMLDeducList read Get_Deduc;
    property VFor: string read Get_VFor write Set_VFor;
    property VTotDed: string read Get_VTotDed write Set_VTotDed;
    property VLiqFor: string read Get_VLiqFor write Set_VLiqFor;
  end;

{ IXMLForDia }

  IXMLForDia = interface(IXMLNode)
    ['{3CAF87F8-0498-4EBB-9662-70DE950330A7}']
    { Property Accessors }
    function Get_Dia: string;
    function Get_Qtde: string;
    procedure Set_Dia(Value: string);
    procedure Set_Qtde(Value: string);
    { Methods & Properties }
    property Dia: string read Get_Dia write Set_Dia;
    property Qtde: string read Get_Qtde write Set_Qtde;
  end;

{ IXMLForDiaList }

  IXMLForDiaList = interface(IXMLNodeCollection)
    ['{45A7B53B-3198-4F53-9CDC-EE86F44A4EB0}']
    { Methods & Properties }
    function Add: IXMLForDia;
    function Insert(const Index: Integer): IXMLForDia;

    function Get_Item(Index: Integer): IXMLForDia;
    property Items[Index: Integer]: IXMLForDia read Get_Item; default;
  end;

{ IXMLDeduc }

  IXMLDeduc = interface(IXMLNode)
    ['{5FAED567-C989-469E-8EC8-1891345DCFBC}']
    { Property Accessors }
    function Get_XDed: string;
    function Get_VDed: string;
    procedure Set_XDed(Value: string);
    procedure Set_VDed(Value: string);
    { Methods & Properties }
    property XDed: string read Get_XDed write Set_XDed;
    property VDed: string read Get_VDed write Set_VDed;
  end;

{ IXMLDeducList }

  IXMLDeducList = interface(IXMLNodeCollection)
    ['{9B825458-C4A2-4EB3-AAFC-C22D34374B70}']
    { Methods & Properties }
    function Add: IXMLDeduc;
    function Insert(const Index: Integer): IXMLDeduc;

    function Get_Item(Index: Integer): IXMLDeduc;
    property Items[Index: Integer]: IXMLDeduc read Get_Item; default;
  end;

{ IXMLTInfRespTec }

  IXMLTInfRespTec = interface(IXMLNode)
    ['{4B9B6433-451B-46D3-A515-C7E81CE60B73}']
    { Property Accessors }
    function Get_CNPJ: string;
    function Get_XContato: string;
    function Get_Email: string;
    function Get_Fone: string;
    function Get_IdCSRT: string;
    function Get_HashCSRT: string;
    procedure Set_CNPJ(Value: string);
    procedure Set_XContato(Value: string);
    procedure Set_Email(Value: string);
    procedure Set_Fone(Value: string);
    procedure Set_IdCSRT(Value: string);
    procedure Set_HashCSRT(Value: string);
    { Methods & Properties }
    property CNPJ: string read Get_CNPJ write Set_CNPJ;
    property XContato: string read Get_XContato write Set_XContato;
    property Email: string read Get_Email write Set_Email;
    property Fone: string read Get_Fone write Set_Fone;
    property IdCSRT: string read Get_IdCSRT write Set_IdCSRT;
    property HashCSRT: string read Get_HashCSRT write Set_HashCSRT;
  end;

{ IXMLInfNFeSupl }

  IXMLInfNFeSupl = interface(IXMLNode)
    ['{DA50B20F-BBA5-4FBD-A037-AA723CE4F01A}']
    { Property Accessors }
    function Get_QrCode: string;
    function Get_UrlChave: string;
    procedure Set_QrCode(Value: string);
    procedure Set_UrlChave(Value: string);
    { Methods & Properties }
    property QrCode: string read Get_QrCode write Set_QrCode;
    property UrlChave: string read Get_UrlChave write Set_UrlChave;
  end;

{ IXMLSignatureType_ds }

  IXMLSignatureType_ds = interface(IXMLNode)
    ['{FE52FFB5-5EDC-4C8E-A8EB-2F494FFF2E24}']
    { Property Accessors }
    function Get_Id: string;
    function Get_SignedInfo: IXMLSignedInfoType_ds;
    function Get_SignatureValue: IXMLSignatureValueType_ds;
    function Get_KeyInfo: IXMLKeyInfoType_ds;
    procedure Set_Id(Value: string);
    { Methods & Properties }
    property Id: string read Get_Id write Set_Id;
    property SignedInfo: IXMLSignedInfoType_ds read Get_SignedInfo;
    property SignatureValue: IXMLSignatureValueType_ds read Get_SignatureValue;
    property KeyInfo: IXMLKeyInfoType_ds read Get_KeyInfo;
  end;

{ IXMLSignedInfoType_ds }

  IXMLSignedInfoType_ds = interface(IXMLNode)
    ['{9ECF2B1F-0FCC-46B4-A09B-071393A14162}']
    { Property Accessors }
    function Get_Id: string;
    function Get_CanonicalizationMethod: IXMLCanonicalizationMethod_ds;
    function Get_SignatureMethod: IXMLSignatureMethod_ds;
    function Get_Reference: IXMLReferenceType_ds;
    procedure Set_Id(Value: string);
    { Methods & Properties }
    property Id: string read Get_Id write Set_Id;
    property CanonicalizationMethod: IXMLCanonicalizationMethod_ds read Get_CanonicalizationMethod;
    property SignatureMethod: IXMLSignatureMethod_ds read Get_SignatureMethod;
    property Reference: IXMLReferenceType_ds read Get_Reference;
  end;

{ IXMLCanonicalizationMethod_ds }

  IXMLCanonicalizationMethod_ds = interface(IXMLNode)
    ['{617C4360-BFDA-467A-AA95-728781C6E108}']
    { Property Accessors }
    function Get_Algorithm: string;
    procedure Set_Algorithm(Value: string);
    { Methods & Properties }
    property Algorithm: string read Get_Algorithm write Set_Algorithm;
  end;

{ IXMLSignatureMethod_ds }

  IXMLSignatureMethod_ds = interface(IXMLNode)
    ['{2EF6D62A-E1D0-4F2E-A5BC-9DE037CABF39}']
    { Property Accessors }
    function Get_Algorithm: string;
    procedure Set_Algorithm(Value: string);
    { Methods & Properties }
    property Algorithm: string read Get_Algorithm write Set_Algorithm;
  end;

{ IXMLReferenceType_ds }

  IXMLReferenceType_ds = interface(IXMLNode)
    ['{12278C9E-9DB2-4163-81C6-971D2D769E8C}']
    { Property Accessors }
    function Get_Id: string;
    function Get_URI: string;
    function Get_Type_: string;
    function Get_Transforms: IXMLTransformsType_ds;
    function Get_DigestMethod: IXMLDigestMethod_ds;
    function Get_DigestValue: string;
    procedure Set_Id(Value: string);
    procedure Set_URI(Value: string);
    procedure Set_Type_(Value: string);
    procedure Set_DigestValue(Value: string);
    { Methods & Properties }
    property Id: string read Get_Id write Set_Id;
    property URI: string read Get_URI write Set_URI;
    property Type_: string read Get_Type_ write Set_Type_;
    property Transforms: IXMLTransformsType_ds read Get_Transforms;
    property DigestMethod: IXMLDigestMethod_ds read Get_DigestMethod;
    property DigestValue: string read Get_DigestValue write Set_DigestValue;
  end;

{ IXMLTransformsType_ds }

  IXMLTransformsType_ds = interface(IXMLNodeCollection)
    ['{63AED7E1-1F46-4FFF-8B58-794DE2E0E527}']
    { Property Accessors }
    function Get_Transform(Index: Integer): IXMLTransformType_ds;
    { Methods & Properties }
    function Add: IXMLTransformType_ds;
    function Insert(const Index: Integer): IXMLTransformType_ds;
    property Transform[Index: Integer]: IXMLTransformType_ds read Get_Transform; default;
  end;

{ IXMLTransformType_ds }

  IXMLTransformType_ds = interface(IXMLNodeCollection)
    ['{4B8D1E6C-D300-4B8A-AA15-9E31CD05AD62}']
    { Property Accessors }
    function Get_Algorithm: string;
    function Get_XPath(Index: Integer): string;
    procedure Set_Algorithm(Value: string);
    { Methods & Properties }
    function Add(const XPath: string): IXMLNode;
    function Insert(const Index: Integer; const XPath: string): IXMLNode;
    property Algorithm: string read Get_Algorithm write Set_Algorithm;
    property XPath[Index: Integer]: string read Get_XPath; default;
  end;

{ IXMLDigestMethod_ds }

  IXMLDigestMethod_ds = interface(IXMLNode)
    ['{FF703674-BFD0-4862-A77D-3CAAAE9299AA}']
    { Property Accessors }
    function Get_Algorithm: string;
    procedure Set_Algorithm(Value: string);
    { Methods & Properties }
    property Algorithm: string read Get_Algorithm write Set_Algorithm;
  end;

{ IXMLSignatureValueType_ds }

  IXMLSignatureValueType_ds = interface(IXMLNode)
    ['{F18CB5C2-E6F3-462D-844B-D9A395B5DA2E}']
    { Property Accessors }
    function Get_Id: string;
    procedure Set_Id(Value: string);
    { Methods & Properties }
    property Id: string read Get_Id write Set_Id;
  end;

{ IXMLKeyInfoType_ds }

  IXMLKeyInfoType_ds = interface(IXMLNode)
    ['{59D53AC9-6FCF-48E7-80D0-B2CDED6300ED}']
    { Property Accessors }
    function Get_Id: string;
    function Get_X509Data: IXMLX509DataType_ds;
    procedure Set_Id(Value: string);
    { Methods & Properties }
    property Id: string read Get_Id write Set_Id;
    property X509Data: IXMLX509DataType_ds read Get_X509Data;
  end;

{ IXMLX509DataType_ds }

  IXMLX509DataType_ds = interface(IXMLNode)
    ['{E8B71D15-27A9-485F-93A4-546D4C825076}']
    { Property Accessors }
    function Get_X509Certificate: string;
    procedure Set_X509Certificate(Value: string);
    { Methods & Properties }
    property X509Certificate: string read Get_X509Certificate write Set_X509Certificate;
  end;

{ IXMLTProtNFe }

  IXMLTProtNFe = interface(IXMLNode)
    ['{E88CCBC2-208D-466F-9348-AE4D6B1BAD50}']
    { Property Accessors }
    function Get_Versao: string;
    function Get_InfProt: IXMLInfProt;
    function Get_Signature: IXMLSignatureType_ds;
    procedure Set_Versao(Value: string);
    { Methods & Properties }
    property Versao: string read Get_Versao write Set_Versao;
    property InfProt: IXMLInfProt read Get_InfProt;
    property Signature: IXMLSignatureType_ds read Get_Signature;
  end;

{ IXMLTProtNFeList }

  IXMLTProtNFeList = interface(IXMLNodeCollection)
    ['{2A1F511A-E0ED-4185-858E-A1459DCD7DC8}']
    { Methods & Properties }
    function Add: IXMLTProtNFe;
    function Insert(const Index: Integer): IXMLTProtNFe;

    function Get_Item(Index: Integer): IXMLTProtNFe;
    property Items[Index: Integer]: IXMLTProtNFe read Get_Item; default;
  end;

{ IXMLInfProt }

  IXMLInfProt = interface(IXMLNode)
    ['{FAFC8642-5433-4F56-B4DF-38DB6D586726}']
    { Property Accessors }
    function Get_Id: string;
    function Get_TpAmb: string;
    function Get_VerAplic: string;
    function Get_ChNFe: string;
    function Get_DhRecbto: string;
    function Get_NProt: string;
    function Get_DigVal: string;
    function Get_CStat: string;
    function Get_XMotivo: string;
    function Get_CMsg: string;
    function Get_XMsg: string;
    procedure Set_Id(Value: string);
    procedure Set_TpAmb(Value: string);
    procedure Set_VerAplic(Value: string);
    procedure Set_ChNFe(Value: string);
    procedure Set_DhRecbto(Value: string);
    procedure Set_NProt(Value: string);
    procedure Set_DigVal(Value: string);
    procedure Set_CStat(Value: string);
    procedure Set_XMotivo(Value: string);
    procedure Set_CMsg(Value: string);
    procedure Set_XMsg(Value: string);
    { Methods & Properties }
    property Id: string read Get_Id write Set_Id;
    property TpAmb: string read Get_TpAmb write Set_TpAmb;
    property VerAplic: string read Get_VerAplic write Set_VerAplic;
    property ChNFe: string read Get_ChNFe write Set_ChNFe;
    property DhRecbto: string read Get_DhRecbto write Set_DhRecbto;
    property NProt: string read Get_NProt write Set_NProt;
    property DigVal: string read Get_DigVal write Set_DigVal;
    property CStat: string read Get_CStat write Set_CStat;
    property XMotivo: string read Get_XMotivo write Set_XMotivo;
    property CMsg: string read Get_CMsg write Set_CMsg;
    property XMsg: string read Get_XMsg write Set_XMsg;
  end;

{ IXMLTEnviNFe }

  IXMLTEnviNFe = interface(IXMLNode)
    ['{93C427D1-A22E-4DE2-B89C-60AD9E874F45}']
    { Property Accessors }
    function Get_Versao: string;
    function Get_IdLote: string;
    function Get_IndSinc: string;
    function Get_NFe: IXMLTNFeList;
    procedure Set_Versao(Value: string);
    procedure Set_IdLote(Value: string);
    procedure Set_IndSinc(Value: string);
    { Methods & Properties }
    property Versao: string read Get_Versao write Set_Versao;
    property IdLote: string read Get_IdLote write Set_IdLote;
    property IndSinc: string read Get_IndSinc write Set_IndSinc;
    property NFe: IXMLTNFeList read Get_NFe;
  end;

{ IXMLTRetEnviNFe }

  IXMLTRetEnviNFe = interface(IXMLNode)
    ['{4C99A08A-533E-4700-9FF6-BB82B6C63E3E}']
    { Property Accessors }
    function Get_Versao: string;
    function Get_TpAmb: string;
    function Get_VerAplic: string;
    function Get_CStat: string;
    function Get_XMotivo: string;
    function Get_CUF: string;
    function Get_DhRecbto: string;
    function Get_InfRec: IXMLInfRec;
    function Get_ProtNFe: IXMLTProtNFe;
    procedure Set_Versao(Value: string);
    procedure Set_TpAmb(Value: string);
    procedure Set_VerAplic(Value: string);
    procedure Set_CStat(Value: string);
    procedure Set_XMotivo(Value: string);
    procedure Set_CUF(Value: string);
    procedure Set_DhRecbto(Value: string);
    { Methods & Properties }
    property Versao: string read Get_Versao write Set_Versao;
    property TpAmb: string read Get_TpAmb write Set_TpAmb;
    property VerAplic: string read Get_VerAplic write Set_VerAplic;
    property CStat: string read Get_CStat write Set_CStat;
    property XMotivo: string read Get_XMotivo write Set_XMotivo;
    property CUF: string read Get_CUF write Set_CUF;
    property DhRecbto: string read Get_DhRecbto write Set_DhRecbto;
    property InfRec: IXMLInfRec read Get_InfRec;
    property ProtNFe: IXMLTProtNFe read Get_ProtNFe;
  end;

{ IXMLInfRec }

  IXMLInfRec = interface(IXMLNode)
    ['{BD1ADDD1-BCA4-4B53-8574-8F623A8A3CD3}']
    { Property Accessors }
    function Get_NRec: string;
    function Get_TMed: string;
    procedure Set_NRec(Value: string);
    procedure Set_TMed(Value: string);
    { Methods & Properties }
    property NRec: string read Get_NRec write Set_NRec;
    property TMed: string read Get_TMed write Set_TMed;
  end;

{ IXMLTConsReciNFe }

  IXMLTConsReciNFe = interface(IXMLNode)
    ['{E94243AC-669F-4104-87F4-9F59A523D557}']
    { Property Accessors }
    function Get_Versao: string;
    function Get_TpAmb: string;
    function Get_NRec: string;
    procedure Set_Versao(Value: string);
    procedure Set_TpAmb(Value: string);
    procedure Set_NRec(Value: string);
    { Methods & Properties }
    property Versao: string read Get_Versao write Set_Versao;
    property TpAmb: string read Get_TpAmb write Set_TpAmb;
    property NRec: string read Get_NRec write Set_NRec;
  end;

{ IXMLTRetConsReciNFe }

  IXMLTRetConsReciNFe = interface(IXMLNode)
    ['{ACD2B9D5-3C30-4888-B3D4-D3E4FEB0AF3E}']
    { Property Accessors }
    function Get_Versao: string;
    function Get_TpAmb: string;
    function Get_VerAplic: string;
    function Get_NRec: string;
    function Get_CStat: string;
    function Get_XMotivo: string;
    function Get_CUF: string;
    function Get_DhRecbto: string;
    function Get_CMsg: string;
    function Get_XMsg: string;
    function Get_ProtNFe: IXMLTProtNFeList;
    procedure Set_Versao(Value: string);
    procedure Set_TpAmb(Value: string);
    procedure Set_VerAplic(Value: string);
    procedure Set_NRec(Value: string);
    procedure Set_CStat(Value: string);
    procedure Set_XMotivo(Value: string);
    procedure Set_CUF(Value: string);
    procedure Set_DhRecbto(Value: string);
    procedure Set_CMsg(Value: string);
    procedure Set_XMsg(Value: string);
    { Methods & Properties }
    property Versao: string read Get_Versao write Set_Versao;
    property TpAmb: string read Get_TpAmb write Set_TpAmb;
    property VerAplic: string read Get_VerAplic write Set_VerAplic;
    property NRec: string read Get_NRec write Set_NRec;
    property CStat: string read Get_CStat write Set_CStat;
    property XMotivo: string read Get_XMotivo write Set_XMotivo;
    property CUF: string read Get_CUF write Set_CUF;
    property DhRecbto: string read Get_DhRecbto write Set_DhRecbto;
    property CMsg: string read Get_CMsg write Set_CMsg;
    property XMsg: string read Get_XMsg write Set_XMsg;
    property ProtNFe: IXMLTProtNFeList read Get_ProtNFe;
  end;

{ IXMLTNfeProc }

  IXMLTNfeProc = interface(IXMLNode)
    ['{20A4BBD3-911E-4AC4-8006-DF58DF3A3B96}']
    { Property Accessors }
    function Get_Versao: string;
    function Get_NFe: IXMLTNFe;
    function Get_ProtNFe: IXMLTProtNFe;
    procedure Set_Versao(Value: string);
    { Methods & Properties }
    property Versao: string read Get_Versao write Set_Versao;
    property NFe: IXMLTNFe read Get_NFe;
    property ProtNFe: IXMLTProtNFe read Get_ProtNFe;
  end;

{ IXMLNVEList }

  IXMLNVEList = interface(IXMLNodeCollection)
    ['{C100ACB2-0C0C-49CA-A2FF-F3E27974A431}']
    { Methods & Properties }
    function Add(const Value: string): IXMLNode;
    function Insert(const Index: Integer; const Value: string): IXMLNode;

    function Get_Item(Index: Integer): string;
    property Items[Index: Integer]: string read Get_Item; default;
  end;

{ Forward Decls }

  TXMLTNFe = class;
  TXMLTNFeList = class;
  TXMLInfNFe = class;
  TXMLIde = class;
  TXMLNFref = class;
  TXMLNFrefList = class;
  TXMLRefNF = class;
  TXMLRefNFP = class;
  TXMLRefECF = class;
  TXMLEmit = class;
  TXMLTEnderEmi = class;
  TXMLAvulsa = class;
  TXMLDest = class;
  TXMLTEndereco = class;
  TXMLTLocal = class;
  TXMLAutXML = class;
  TXMLAutXMLList = class;
  TXMLDet = class;
  TXMLDetList = class;
  TXMLProd = class;
  TXMLDI = class;
  TXMLDIList = class;
  TXMLAdi = class;
  TXMLAdiList = class;
  TXMLDetExport = class;
  TXMLDetExportList = class;
  TXMLExportInd = class;
  TXMLRastro = class;
  TXMLRastroList = class;
  TXMLVeicProd = class;
  TXMLMed = class;
  TXMLArma = class;
  TXMLArmaList = class;
  TXMLComb = class;
  TXMLCIDE = class;
  TXMLEncerrante = class;
  TXMLImposto = class;
  TXMLICMS = class;
  TXMLICMS00 = class;
  TXMLICMS10 = class;
  TXMLICMS20 = class;
  TXMLICMS30 = class;
  TXMLICMS40 = class;
  TXMLICMS51 = class;
  TXMLICMS60 = class;
  TXMLICMS70 = class;
  TXMLICMS90 = class;
  TXMLICMSPart = class;
  TXMLICMSST = class;
  TXMLICMSSN101 = class;
  TXMLICMSSN102 = class;
  TXMLICMSSN201 = class;
  TXMLICMSSN202 = class;
  TXMLICMSSN500 = class;
  TXMLICMSSN900 = class;
  TXMLTIpi = class;
  TXMLIPITrib = class;
  TXMLIPINT = class;
  TXMLII = class;
  TXMLISSQN = class;
  TXMLPIS = class;
  TXMLPISAliq = class;
  TXMLPISQtde = class;
  TXMLPISNT = class;
  TXMLPISOutr = class;
  TXMLPISST = class;
  TXMLCOFINS = class;
  TXMLCOFINSAliq = class;
  TXMLCOFINSQtde = class;
  TXMLCOFINSNT = class;
  TXMLCOFINSOutr = class;
  TXMLCOFINSST = class;
  TXMLICMSUFDest = class;
  TXMLImpostoDevol = class;
  TXMLIPI = class;
  TXMLTotal = class;
  TXMLICMSTot = class;
  TXMLISSQNtot = class;
  TXMLRetTrib = class;
  TXMLTransp = class;
  TXMLTransporta = class;
  TXMLRetTransp = class;
  TXMLTVeiculo = class;
  TXMLTVeiculoList = class;
  TXMLVol = class;
  TXMLVolList = class;
  TXMLLacres = class;
  TXMLLacresList = class;
  TXMLCobr = class;
  TXMLFat = class;
  TXMLDup = class;
  TXMLDupList = class;
  TXMLPag = class;
  TXMLDetPag = class;
  TXMLDetPagList = class;
  TXMLCard = class;
  TXMLInfIntermed = class;
  TXMLInfAdic = class;
  TXMLObsCont = class;
  TXMLObsContList = class;
  TXMLObsFisco = class;
  TXMLObsFiscoList = class;
  TXMLProcRef = class;
  TXMLProcRefList = class;
  TXMLExporta = class;
  TXMLCompra = class;
  TXMLCana = class;
  TXMLForDia = class;
  TXMLForDiaList = class;
  TXMLDeduc = class;
  TXMLDeducList = class;
  TXMLTInfRespTec = class;
  TXMLInfNFeSupl = class;
  TXMLSignatureType_ds = class;
  TXMLSignedInfoType_ds = class;
  TXMLCanonicalizationMethod_ds = class;
  TXMLSignatureMethod_ds = class;
  TXMLReferenceType_ds = class;
  TXMLTransformsType_ds = class;
  TXMLTransformType_ds = class;
  TXMLDigestMethod_ds = class;
  TXMLSignatureValueType_ds = class;
  TXMLKeyInfoType_ds = class;
  TXMLX509DataType_ds = class;
  TXMLTProtNFe = class;
  TXMLTProtNFeList = class;
  TXMLInfProt = class;
  TXMLTEnviNFe = class;
  TXMLTRetEnviNFe = class;
  TXMLInfRec = class;
  TXMLTConsReciNFe = class;
  TXMLTRetConsReciNFe = class;
  TXMLTNfeProc = class;
  TXMLNVEList = class;

{ TXMLTNFe }

  TXMLTNFe = class(TXMLNode, IXMLTNFe)
  protected
    { IXMLTNFe }
    function Get_InfNFe: IXMLInfNFe;
    function Get_InfNFeSupl: IXMLInfNFeSupl;
    function Get_Signature: IXMLSignatureType_ds;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTNFeList }

  TXMLTNFeList = class(TXMLNodeCollection, IXMLTNFeList)
  protected
    { IXMLTNFeList }
    function Add: IXMLTNFe;
    function Insert(const Index: Integer): IXMLTNFe;

    function Get_Item(Index: Integer): IXMLTNFe;
  end;

{ TXMLInfNFe }

  TXMLInfNFe = class(TXMLNode, IXMLInfNFe)
  private
    FAutXML: IXMLAutXMLList;
    FDet: IXMLDetList;
  protected
    { IXMLInfNFe }
    function Get_Versao: string;
    function Get_Id: string;
    function Get_Ide: IXMLIde;
    function Get_Emit: IXMLEmit;
    function Get_Avulsa: IXMLAvulsa;
    function Get_Dest: IXMLDest;
    function Get_Retirada: IXMLTLocal;
    function Get_Entrega: IXMLTLocal;
    function Get_AutXML: IXMLAutXMLList;
    function Get_Det: IXMLDetList;
    function Get_Total: IXMLTotal;
    function Get_Transp: IXMLTransp;
    function Get_Cobr: IXMLCobr;
    function Get_Pag: IXMLPag;
    function Get_InfIntermed: IXMLInfIntermed;
    function Get_InfAdic: IXMLInfAdic;
    function Get_Exporta: IXMLExporta;
    function Get_Compra: IXMLCompra;
    function Get_Cana: IXMLCana;
    function Get_InfRespTec: IXMLTInfRespTec;
    procedure Set_Versao(Value: string);
    procedure Set_Id(Value: string);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLIde }

  TXMLIde = class(TXMLNode, IXMLIde)
  private
    FNFref: IXMLNFrefList;
  protected
    { IXMLIde }
    function Get_CUF: string;
    function Get_CNF: string;
    function Get_NatOp: string;
    function Get_Mod_: string;
    function Get_Serie: string;
    function Get_NNF: string;
    function Get_DhEmi: string;
    function Get_DhSaiEnt: string;
    function Get_TpNF: string;
    function Get_IdDest: string;
    function Get_CMunFG: string;
    function Get_TpImp: string;
    function Get_TpEmis: string;
    function Get_CDV: string;
    function Get_TpAmb: string;
    function Get_FinNFe: string;
    function Get_IndFinal: string;
    function Get_IndPres: string;
    function Get_IndIntermed: string;
    function Get_ProcEmi: string;
    function Get_VerProc: string;
    function Get_DhCont: string;
    function Get_XJust: string;
    function Get_NFref: IXMLNFrefList;
    procedure Set_CUF(Value: string);
    procedure Set_CNF(Value: string);
    procedure Set_NatOp(Value: string);
    procedure Set_Mod_(Value: string);
    procedure Set_Serie(Value: string);
    procedure Set_NNF(Value: string);
    procedure Set_DhEmi(Value: string);
    procedure Set_DhSaiEnt(Value: string);
    procedure Set_TpNF(Value: string);
    procedure Set_IdDest(Value: string);
    procedure Set_CMunFG(Value: string);
    procedure Set_TpImp(Value: string);
    procedure Set_TpEmis(Value: string);
    procedure Set_CDV(Value: string);
    procedure Set_TpAmb(Value: string);
    procedure Set_FinNFe(Value: string);
    procedure Set_IndFinal(Value: string);
    procedure Set_IndPres(Value: string);
    procedure Set_IndIntermed(Value: string);
    procedure Set_ProcEmi(Value: string);
    procedure Set_VerProc(Value: string);
    procedure Set_DhCont(Value: string);
    procedure Set_XJust(Value: string);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLNFref }

  TXMLNFref = class(TXMLNode, IXMLNFref)
  protected
    { IXMLNFref }
    function Get_RefNFe: string;
    function Get_RefNF: IXMLRefNF;
    function Get_RefNFP: IXMLRefNFP;
    function Get_RefCTe: string;
    function Get_RefECF: IXMLRefECF;
    procedure Set_RefNFe(Value: string);
    procedure Set_RefCTe(Value: string);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLNFrefList }

  TXMLNFrefList = class(TXMLNodeCollection, IXMLNFrefList)
  protected
    { IXMLNFrefList }
    function Add: IXMLNFref;
    function Insert(const Index: Integer): IXMLNFref;

    function Get_Item(Index: Integer): IXMLNFref;
  end;

{ TXMLRefNF }

  TXMLRefNF = class(TXMLNode, IXMLRefNF)
  protected
    { IXMLRefNF }
    function Get_CUF: string;
    function Get_AAMM: string;
    function Get_CNPJ: string;
    function Get_Mod_: string;
    function Get_Serie: string;
    function Get_NNF: string;
    procedure Set_CUF(Value: string);
    procedure Set_AAMM(Value: string);
    procedure Set_CNPJ(Value: string);
    procedure Set_Mod_(Value: string);
    procedure Set_Serie(Value: string);
    procedure Set_NNF(Value: string);
  end;

{ TXMLRefNFP }

  TXMLRefNFP = class(TXMLNode, IXMLRefNFP)
  protected
    { IXMLRefNFP }
    function Get_CUF: string;
    function Get_AAMM: string;
    function Get_CNPJ: string;
    function Get_CPF: string;
    function Get_IE: string;
    function Get_Mod_: string;
    function Get_Serie: string;
    function Get_NNF: string;
    procedure Set_CUF(Value: string);
    procedure Set_AAMM(Value: string);
    procedure Set_CNPJ(Value: string);
    procedure Set_CPF(Value: string);
    procedure Set_IE(Value: string);
    procedure Set_Mod_(Value: string);
    procedure Set_Serie(Value: string);
    procedure Set_NNF(Value: string);
  end;

{ TXMLRefECF }

  TXMLRefECF = class(TXMLNode, IXMLRefECF)
  protected
    { IXMLRefECF }
    function Get_Mod_: string;
    function Get_NECF: string;
    function Get_NCOO: string;
    procedure Set_Mod_(Value: string);
    procedure Set_NECF(Value: string);
    procedure Set_NCOO(Value: string);
  end;

{ TXMLEmit }

  TXMLEmit = class(TXMLNode, IXMLEmit)
  protected
    { IXMLEmit }
    function Get_CNPJ: string;
    function Get_CPF: string;
    function Get_XNome: string;
    function Get_XFant: string;
    function Get_EnderEmit: IXMLTEnderEmi;
    function Get_IE: string;
    function Get_IEST: string;
    function Get_IM: string;
    function Get_CNAE: string;
    function Get_CRT: string;
    procedure Set_CNPJ(Value: string);
    procedure Set_CPF(Value: string);
    procedure Set_XNome(Value: string);
    procedure Set_XFant(Value: string);
    procedure Set_IE(Value: string);
    procedure Set_IEST(Value: string);
    procedure Set_IM(Value: string);
    procedure Set_CNAE(Value: string);
    procedure Set_CRT(Value: string);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTEnderEmi }

  TXMLTEnderEmi = class(TXMLNode, IXMLTEnderEmi)
  protected
    { IXMLTEnderEmi }
    function Get_XLgr: string;
    function Get_Nro: string;
    function Get_XCpl: string;
    function Get_XBairro: string;
    function Get_CMun: string;
    function Get_XMun: string;
    function Get_UF: string;
    function Get_CEP: string;
    function Get_CPais: string;
    function Get_XPais: string;
    function Get_Fone: string;
    procedure Set_XLgr(Value: string);
    procedure Set_Nro(Value: string);
    procedure Set_XCpl(Value: string);
    procedure Set_XBairro(Value: string);
    procedure Set_CMun(Value: string);
    procedure Set_XMun(Value: string);
    procedure Set_UF(Value: string);
    procedure Set_CEP(Value: string);
    procedure Set_CPais(Value: string);
    procedure Set_XPais(Value: string);
    procedure Set_Fone(Value: string);
  end;

{ TXMLAvulsa }

  TXMLAvulsa = class(TXMLNode, IXMLAvulsa)
  protected
    { IXMLAvulsa }
    function Get_CNPJ: string;
    function Get_XOrgao: string;
    function Get_Matr: string;
    function Get_XAgente: string;
    function Get_Fone: string;
    function Get_UF: string;
    function Get_NDAR: string;
    function Get_DEmi: string;
    function Get_VDAR: string;
    function Get_RepEmi: string;
    function Get_DPag: string;
    procedure Set_CNPJ(Value: string);
    procedure Set_XOrgao(Value: string);
    procedure Set_Matr(Value: string);
    procedure Set_XAgente(Value: string);
    procedure Set_Fone(Value: string);
    procedure Set_UF(Value: string);
    procedure Set_NDAR(Value: string);
    procedure Set_DEmi(Value: string);
    procedure Set_VDAR(Value: string);
    procedure Set_RepEmi(Value: string);
    procedure Set_DPag(Value: string);
  end;

{ TXMLDest }

  TXMLDest = class(TXMLNode, IXMLDest)
  protected
    { IXMLDest }
    function Get_CNPJ: string;
    function Get_CPF: string;
    function Get_IdEstrangeiro: string;
    function Get_XNome: string;
    function Get_EnderDest: IXMLTEndereco;
    function Get_IndIEDest: string;
    function Get_IE: string;
    function Get_ISUF: string;
    function Get_IM: string;
    function Get_Email: string;
    procedure Set_CNPJ(Value: string);
    procedure Set_CPF(Value: string);
    procedure Set_IdEstrangeiro(Value: string);
    procedure Set_XNome(Value: string);
    procedure Set_IndIEDest(Value: string);
    procedure Set_IE(Value: string);
    procedure Set_ISUF(Value: string);
    procedure Set_IM(Value: string);
    procedure Set_Email(Value: string);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTEndereco }

  TXMLTEndereco = class(TXMLNode, IXMLTEndereco)
  protected
    { IXMLTEndereco }
    function Get_XLgr: string;
    function Get_Nro: string;
    function Get_XCpl: string;
    function Get_XBairro: string;
    function Get_CMun: string;
    function Get_XMun: string;
    function Get_UF: string;
    function Get_CEP: string;
    function Get_CPais: string;
    function Get_XPais: string;
    function Get_Fone: string;
    procedure Set_XLgr(Value: string);
    procedure Set_Nro(Value: string);
    procedure Set_XCpl(Value: string);
    procedure Set_XBairro(Value: string);
    procedure Set_CMun(Value: string);
    procedure Set_XMun(Value: string);
    procedure Set_UF(Value: string);
    procedure Set_CEP(Value: string);
    procedure Set_CPais(Value: string);
    procedure Set_XPais(Value: string);
    procedure Set_Fone(Value: string);
  end;

{ TXMLTLocal }

  TXMLTLocal = class(TXMLNode, IXMLTLocal)
  protected
    { IXMLTLocal }
    function Get_CNPJ: string;
    function Get_CPF: string;
    function Get_XNome: string;
    function Get_XLgr: string;
    function Get_Nro: string;
    function Get_XCpl: string;
    function Get_XBairro: string;
    function Get_CMun: string;
    function Get_XMun: string;
    function Get_UF: string;
    function Get_CEP: string;
    function Get_CPais: string;
    function Get_XPais: string;
    function Get_Fone: string;
    function Get_Email: string;
    function Get_IE: string;
    procedure Set_CNPJ(Value: string);
    procedure Set_CPF(Value: string);
    procedure Set_XNome(Value: string);
    procedure Set_XLgr(Value: string);
    procedure Set_Nro(Value: string);
    procedure Set_XCpl(Value: string);
    procedure Set_XBairro(Value: string);
    procedure Set_CMun(Value: string);
    procedure Set_XMun(Value: string);
    procedure Set_UF(Value: string);
    procedure Set_CEP(Value: string);
    procedure Set_CPais(Value: string);
    procedure Set_XPais(Value: string);
    procedure Set_Fone(Value: string);
    procedure Set_Email(Value: string);
    procedure Set_IE(Value: string);
  end;

{ TXMLAutXML }

  TXMLAutXML = class(TXMLNode, IXMLAutXML)
  protected
    { IXMLAutXML }
    function Get_CNPJ: string;
    function Get_CPF: string;
    procedure Set_CNPJ(Value: string);
    procedure Set_CPF(Value: string);
  end;

{ TXMLAutXMLList }

  TXMLAutXMLList = class(TXMLNodeCollection, IXMLAutXMLList)
  protected
    { IXMLAutXMLList }
    function Add: IXMLAutXML;
    function Insert(const Index: Integer): IXMLAutXML;

    function Get_Item(Index: Integer): IXMLAutXML;
  end;

{ TXMLDet }

  TXMLDet = class(TXMLNode, IXMLDet)
  protected
    { IXMLDet }
    function Get_NItem: string;
    function Get_Prod: IXMLProd;
    function Get_Imposto: IXMLImposto;
    function Get_ImpostoDevol: IXMLImpostoDevol;
    function Get_InfAdProd: string;
    procedure Set_NItem(Value: string);
    procedure Set_InfAdProd(Value: string);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDetList }

  TXMLDetList = class(TXMLNodeCollection, IXMLDetList)
  protected
    { IXMLDetList }
    function Add: IXMLDet;
    function Insert(const Index: Integer): IXMLDet;

    function Get_Item(Index: Integer): IXMLDet;
  end;

{ TXMLProd }

  TXMLProd = class(TXMLNode, IXMLProd)
  private
    FNVE: IXMLNVEList;
    FDI: IXMLDIList;
    FDetExport: IXMLDetExportList;
    FRastro: IXMLRastroList;
    FArma: IXMLArmaList;
  protected
    { IXMLProd }
    function Get_CProd: string;
    function Get_CEAN: string;
    function Get_XProd: string;
    function Get_NCM: string;
    function Get_NVE: IXMLNVEList;
    function Get_CEST: string;
    function Get_IndEscala: string;
    function Get_CNPJFab: string;
    function Get_CBenef: string;
    function Get_EXTIPI: string;
    function Get_CFOP: string;
    function Get_UCom: string;
    function Get_QCom: string;
    function Get_VUnCom: string;
    function Get_VProd: string;
    function Get_CEANTrib: string;
    function Get_UTrib: string;
    function Get_QTrib: string;
    function Get_VUnTrib: string;
    function Get_VFrete: string;
    function Get_VSeg: string;
    function Get_VDesc: string;
    function Get_VOutro: string;
    function Get_IndTot: string;
    function Get_DI: IXMLDIList;
    function Get_DetExport: IXMLDetExportList;
    function Get_XPed: string;
    function Get_NItemPed: string;
    function Get_NFCI: string;
    function Get_Rastro: IXMLRastroList;
    function Get_VeicProd: IXMLVeicProd;
    function Get_Med: IXMLMed;
    function Get_Arma: IXMLArmaList;
    function Get_Comb: IXMLComb;
    function Get_NRECOPI: string;
    procedure Set_CProd(Value: string);
    procedure Set_CEAN(Value: string);
    procedure Set_XProd(Value: string);
    procedure Set_NCM(Value: string);
    procedure Set_CEST(Value: string);
    procedure Set_IndEscala(Value: string);
    procedure Set_CNPJFab(Value: string);
    procedure Set_CBenef(Value: string);
    procedure Set_EXTIPI(Value: string);
    procedure Set_CFOP(Value: string);
    procedure Set_UCom(Value: string);
    procedure Set_QCom(Value: string);
    procedure Set_VUnCom(Value: string);
    procedure Set_VProd(Value: string);
    procedure Set_CEANTrib(Value: string);
    procedure Set_UTrib(Value: string);
    procedure Set_QTrib(Value: string);
    procedure Set_VUnTrib(Value: string);
    procedure Set_VFrete(Value: string);
    procedure Set_VSeg(Value: string);
    procedure Set_VDesc(Value: string);
    procedure Set_VOutro(Value: string);
    procedure Set_IndTot(Value: string);
    procedure Set_XPed(Value: string);
    procedure Set_NItemPed(Value: string);
    procedure Set_NFCI(Value: string);
    procedure Set_NRECOPI(Value: string);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDI }

  TXMLDI = class(TXMLNode, IXMLDI)
  private
    FAdi: IXMLAdiList;
  protected
    { IXMLDI }
    function Get_NDI: string;
    function Get_DDI: string;
    function Get_XLocDesemb: string;
    function Get_UFDesemb: string;
    function Get_DDesemb: string;
    function Get_TpViaTransp: string;
    function Get_VAFRMM: string;
    function Get_TpIntermedio: string;
    function Get_CNPJ: string;
    function Get_UFTerceiro: string;
    function Get_CExportador: string;
    function Get_Adi: IXMLAdiList;
    procedure Set_NDI(Value: string);
    procedure Set_DDI(Value: string);
    procedure Set_XLocDesemb(Value: string);
    procedure Set_UFDesemb(Value: string);
    procedure Set_DDesemb(Value: string);
    procedure Set_TpViaTransp(Value: string);
    procedure Set_VAFRMM(Value: string);
    procedure Set_TpIntermedio(Value: string);
    procedure Set_CNPJ(Value: string);
    procedure Set_UFTerceiro(Value: string);
    procedure Set_CExportador(Value: string);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDIList }

  TXMLDIList = class(TXMLNodeCollection, IXMLDIList)
  protected
    { IXMLDIList }
    function Add: IXMLDI;
    function Insert(const Index: Integer): IXMLDI;

    function Get_Item(Index: Integer): IXMLDI;
  end;

{ TXMLAdi }

  TXMLAdi = class(TXMLNode, IXMLAdi)
  protected
    { IXMLAdi }
    function Get_NAdicao: string;
    function Get_NSeqAdic: string;
    function Get_CFabricante: string;
    function Get_VDescDI: string;
    function Get_NDraw: string;
    procedure Set_NAdicao(Value: string);
    procedure Set_NSeqAdic(Value: string);
    procedure Set_CFabricante(Value: string);
    procedure Set_VDescDI(Value: string);
    procedure Set_NDraw(Value: string);
  end;

{ TXMLAdiList }

  TXMLAdiList = class(TXMLNodeCollection, IXMLAdiList)
  protected
    { IXMLAdiList }
    function Add: IXMLAdi;
    function Insert(const Index: Integer): IXMLAdi;

    function Get_Item(Index: Integer): IXMLAdi;
  end;

{ TXMLDetExport }

  TXMLDetExport = class(TXMLNode, IXMLDetExport)
  protected
    { IXMLDetExport }
    function Get_NDraw: string;
    function Get_ExportInd: IXMLExportInd;
    procedure Set_NDraw(Value: string);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDetExportList }

  TXMLDetExportList = class(TXMLNodeCollection, IXMLDetExportList)
  protected
    { IXMLDetExportList }
    function Add: IXMLDetExport;
    function Insert(const Index: Integer): IXMLDetExport;

    function Get_Item(Index: Integer): IXMLDetExport;
  end;

{ TXMLExportInd }

  TXMLExportInd = class(TXMLNode, IXMLExportInd)
  protected
    { IXMLExportInd }
    function Get_NRE: string;
    function Get_ChNFe: string;
    function Get_QExport: string;
    procedure Set_NRE(Value: string);
    procedure Set_ChNFe(Value: string);
    procedure Set_QExport(Value: string);
  end;

{ TXMLRastro }

  TXMLRastro = class(TXMLNode, IXMLRastro)
  protected
    { IXMLRastro }
    function Get_NLote: string;
    function Get_QLote: string;
    function Get_DFab: string;
    function Get_DVal: string;
    function Get_CAgreg: string;
    procedure Set_NLote(Value: string);
    procedure Set_QLote(Value: string);
    procedure Set_DFab(Value: string);
    procedure Set_DVal(Value: string);
    procedure Set_CAgreg(Value: string);
  end;

{ TXMLRastroList }

  TXMLRastroList = class(TXMLNodeCollection, IXMLRastroList)
  protected
    { IXMLRastroList }
    function Add: IXMLRastro;
    function Insert(const Index: Integer): IXMLRastro;

    function Get_Item(Index: Integer): IXMLRastro;
  end;

{ TXMLVeicProd }

  TXMLVeicProd = class(TXMLNode, IXMLVeicProd)
  protected
    { IXMLVeicProd }
    function Get_TpOp: string;
    function Get_Chassi: string;
    function Get_CCor: string;
    function Get_XCor: string;
    function Get_Pot: string;
    function Get_Cilin: string;
    function Get_PesoL: string;
    function Get_PesoB: string;
    function Get_NSerie: string;
    function Get_TpComb: string;
    function Get_NMotor: string;
    function Get_CMT: string;
    function Get_Dist: string;
    function Get_AnoMod: string;
    function Get_AnoFab: string;
    function Get_TpPint: string;
    function Get_TpVeic: string;
    function Get_EspVeic: string;
    function Get_VIN: string;
    function Get_CondVeic: string;
    function Get_CMod: string;
    function Get_CCorDENATRAN: string;
    function Get_Lota: string;
    function Get_TpRest: string;
    procedure Set_TpOp(Value: string);
    procedure Set_Chassi(Value: string);
    procedure Set_CCor(Value: string);
    procedure Set_XCor(Value: string);
    procedure Set_Pot(Value: string);
    procedure Set_Cilin(Value: string);
    procedure Set_PesoL(Value: string);
    procedure Set_PesoB(Value: string);
    procedure Set_NSerie(Value: string);
    procedure Set_TpComb(Value: string);
    procedure Set_NMotor(Value: string);
    procedure Set_CMT(Value: string);
    procedure Set_Dist(Value: string);
    procedure Set_AnoMod(Value: string);
    procedure Set_AnoFab(Value: string);
    procedure Set_TpPint(Value: string);
    procedure Set_TpVeic(Value: string);
    procedure Set_EspVeic(Value: string);
    procedure Set_VIN(Value: string);
    procedure Set_CondVeic(Value: string);
    procedure Set_CMod(Value: string);
    procedure Set_CCorDENATRAN(Value: string);
    procedure Set_Lota(Value: string);
    procedure Set_TpRest(Value: string);
  end;

{ TXMLMed }

  TXMLMed = class(TXMLNode, IXMLMed)
  protected
    { IXMLMed }
    function Get_CProdANVISA: string;
    function Get_XMotivoIsencao: string;
    function Get_VPMC: string;
    procedure Set_CProdANVISA(Value: string);
    procedure Set_XMotivoIsencao(Value: string);
    procedure Set_VPMC(Value: string);
  end;

{ TXMLArma }

  TXMLArma = class(TXMLNode, IXMLArma)
  protected
    { IXMLArma }
    function Get_TpArma: string;
    function Get_NSerie: string;
    function Get_NCano: string;
    function Get_Descr: string;
    procedure Set_TpArma(Value: string);
    procedure Set_NSerie(Value: string);
    procedure Set_NCano(Value: string);
    procedure Set_Descr(Value: string);
  end;

{ TXMLArmaList }

  TXMLArmaList = class(TXMLNodeCollection, IXMLArmaList)
  protected
    { IXMLArmaList }
    function Add: IXMLArma;
    function Insert(const Index: Integer): IXMLArma;

    function Get_Item(Index: Integer): IXMLArma;
  end;

{ TXMLComb }

  TXMLComb = class(TXMLNode, IXMLComb)
  protected
    { IXMLComb }
    function Get_CProdANP: string;
    function Get_DescANP: string;
    function Get_PGLP: string;
    function Get_PGNn: string;
    function Get_PGNi: string;
    function Get_VPart: string;
    function Get_CODIF: string;
    function Get_QTemp: string;
    function Get_UFCons: string;
    function Get_CIDE: IXMLCIDE;
    function Get_Encerrante: IXMLEncerrante;
    procedure Set_CProdANP(Value: string);
    procedure Set_DescANP(Value: string);
    procedure Set_PGLP(Value: string);
    procedure Set_PGNn(Value: string);
    procedure Set_PGNi(Value: string);
    procedure Set_VPart(Value: string);
    procedure Set_CODIF(Value: string);
    procedure Set_QTemp(Value: string);
    procedure Set_UFCons(Value: string);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLCIDE }

  TXMLCIDE = class(TXMLNode, IXMLCIDE)
  protected
    { IXMLCIDE }
    function Get_QBCProd: string;
    function Get_VAliqProd: string;
    function Get_VCIDE: string;
    procedure Set_QBCProd(Value: string);
    procedure Set_VAliqProd(Value: string);
    procedure Set_VCIDE(Value: string);
  end;

{ TXMLEncerrante }

  TXMLEncerrante = class(TXMLNode, IXMLEncerrante)
  protected
    { IXMLEncerrante }
    function Get_NBico: string;
    function Get_NBomba: string;
    function Get_NTanque: string;
    function Get_VEncIni: string;
    function Get_VEncFin: string;
    procedure Set_NBico(Value: string);
    procedure Set_NBomba(Value: string);
    procedure Set_NTanque(Value: string);
    procedure Set_VEncIni(Value: string);
    procedure Set_VEncFin(Value: string);
  end;

{ TXMLImposto }

  TXMLImposto = class(TXMLNode, IXMLImposto)
  protected
    { IXMLImposto }
    function Get_VTotTrib: string;
    function Get_ICMS: IXMLICMS;
    function Get_IPI: IXMLTIpi;
    function Get_II: IXMLII;
    function Get_ISSQN: IXMLISSQN;
    function Get_PIS: IXMLPIS;
    function Get_PISST: IXMLPISST;
    function Get_COFINS: IXMLCOFINS;
    function Get_COFINSST: IXMLCOFINSST;
    function Get_ICMSUFDest: IXMLICMSUFDest;
    procedure Set_VTotTrib(Value: string);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLICMS }

  TXMLICMS = class(TXMLNode, IXMLICMS)
  protected
    { IXMLICMS }
    function Get_ICMS00: IXMLICMS00;
    function Get_ICMS10: IXMLICMS10;
    function Get_ICMS20: IXMLICMS20;
    function Get_ICMS30: IXMLICMS30;
    function Get_ICMS40: IXMLICMS40;
    function Get_ICMS51: IXMLICMS51;
    function Get_ICMS60: IXMLICMS60;
    function Get_ICMS70: IXMLICMS70;
    function Get_ICMS90: IXMLICMS90;
    function Get_ICMSPart: IXMLICMSPart;
    function Get_ICMSST: IXMLICMSST;
    function Get_ICMSSN101: IXMLICMSSN101;
    function Get_ICMSSN102: IXMLICMSSN102;
    function Get_ICMSSN201: IXMLICMSSN201;
    function Get_ICMSSN202: IXMLICMSSN202;
    function Get_ICMSSN500: IXMLICMSSN500;
    function Get_ICMSSN900: IXMLICMSSN900;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLICMS00 }

  TXMLICMS00 = class(TXMLNode, IXMLICMS00)
  protected
    { IXMLICMS00 }
    function Get_Orig: string;
    function Get_CST: string;
    function Get_ModBC: string;
    function Get_VBC: string;
    function Get_PICMS: string;
    function Get_VICMS: string;
    function Get_PFCP: string;
    function Get_VFCP: string;
    procedure Set_Orig(Value: string);
    procedure Set_CST(Value: string);
    procedure Set_ModBC(Value: string);
    procedure Set_VBC(Value: string);
    procedure Set_PICMS(Value: string);
    procedure Set_VICMS(Value: string);
    procedure Set_PFCP(Value: string);
    procedure Set_VFCP(Value: string);
  end;

{ TXMLICMS10 }

  TXMLICMS10 = class(TXMLNode, IXMLICMS10)
  protected
    { IXMLICMS10 }
    function Get_Orig: string;
    function Get_CST: string;
    function Get_ModBC: string;
    function Get_VBC: string;
    function Get_PICMS: string;
    function Get_VICMS: string;
    function Get_VBCFCP: string;
    function Get_PFCP: string;
    function Get_VFCP: string;
    function Get_ModBCST: string;
    function Get_PMVAST: string;
    function Get_PRedBCST: string;
    function Get_VBCST: string;
    function Get_PICMSST: string;
    function Get_VICMSST: string;
    function Get_VBCFCPST: string;
    function Get_PFCPST: string;
    function Get_VFCPST: string;
    procedure Set_Orig(Value: string);
    procedure Set_CST(Value: string);
    procedure Set_ModBC(Value: string);
    procedure Set_VBC(Value: string);
    procedure Set_PICMS(Value: string);
    procedure Set_VICMS(Value: string);
    procedure Set_VBCFCP(Value: string);
    procedure Set_PFCP(Value: string);
    procedure Set_VFCP(Value: string);
    procedure Set_ModBCST(Value: string);
    procedure Set_PMVAST(Value: string);
    procedure Set_PRedBCST(Value: string);
    procedure Set_VBCST(Value: string);
    procedure Set_PICMSST(Value: string);
    procedure Set_VICMSST(Value: string);
    procedure Set_VBCFCPST(Value: string);
    procedure Set_PFCPST(Value: string);
    procedure Set_VFCPST(Value: string);
  end;

{ TXMLICMS20 }

  TXMLICMS20 = class(TXMLNode, IXMLICMS20)
  protected
    { IXMLICMS20 }
    function Get_Orig: string;
    function Get_CST: string;
    function Get_ModBC: string;
    function Get_PRedBC: string;
    function Get_VBC: string;
    function Get_PICMS: string;
    function Get_VICMS: string;
    function Get_VBCFCP: string;
    function Get_PFCP: string;
    function Get_VFCP: string;
    function Get_VICMSDeson: string;
    function Get_MotDesICMS: string;
    procedure Set_Orig(Value: string);
    procedure Set_CST(Value: string);
    procedure Set_ModBC(Value: string);
    procedure Set_PRedBC(Value: string);
    procedure Set_VBC(Value: string);
    procedure Set_PICMS(Value: string);
    procedure Set_VICMS(Value: string);
    procedure Set_VBCFCP(Value: string);
    procedure Set_PFCP(Value: string);
    procedure Set_VFCP(Value: string);
    procedure Set_VICMSDeson(Value: string);
    procedure Set_MotDesICMS(Value: string);
  end;

{ TXMLICMS30 }

  TXMLICMS30 = class(TXMLNode, IXMLICMS30)
  protected
    { IXMLICMS30 }
    function Get_Orig: string;
    function Get_CST: string;
    function Get_ModBCST: string;
    function Get_PMVAST: string;
    function Get_PRedBCST: string;
    function Get_VBCST: string;
    function Get_PICMSST: string;
    function Get_VICMSST: string;
    function Get_VBCFCPST: string;
    function Get_PFCPST: string;
    function Get_VFCPST: string;
    function Get_VICMSDeson: string;
    function Get_MotDesICMS: string;
    procedure Set_Orig(Value: string);
    procedure Set_CST(Value: string);
    procedure Set_ModBCST(Value: string);
    procedure Set_PMVAST(Value: string);
    procedure Set_PRedBCST(Value: string);
    procedure Set_VBCST(Value: string);
    procedure Set_PICMSST(Value: string);
    procedure Set_VICMSST(Value: string);
    procedure Set_VBCFCPST(Value: string);
    procedure Set_PFCPST(Value: string);
    procedure Set_VFCPST(Value: string);
    procedure Set_VICMSDeson(Value: string);
    procedure Set_MotDesICMS(Value: string);
  end;

{ TXMLICMS40 }

  TXMLICMS40 = class(TXMLNode, IXMLICMS40)
  protected
    { IXMLICMS40 }
    function Get_Orig: string;
    function Get_CST: string;
    function Get_VICMSDeson: string;
    function Get_MotDesICMS: string;
    procedure Set_Orig(Value: string);
    procedure Set_CST(Value: string);
    procedure Set_VICMSDeson(Value: string);
    procedure Set_MotDesICMS(Value: string);
  end;

{ TXMLICMS51 }

  TXMLICMS51 = class(TXMLNode, IXMLICMS51)
  protected
    { IXMLICMS51 }
    function Get_Orig: string;
    function Get_CST: string;
    function Get_ModBC: string;
    function Get_PRedBC: string;
    function Get_VBC: string;
    function Get_PICMS: string;
    function Get_VICMSOp: string;
    function Get_PDif: string;
    function Get_VICMSDif: string;
    function Get_VICMS: string;
    function Get_VBCFCP: string;
    function Get_PFCP: string;
    function Get_VFCP: string;
    procedure Set_Orig(Value: string);
    procedure Set_CST(Value: string);
    procedure Set_ModBC(Value: string);
    procedure Set_PRedBC(Value: string);
    procedure Set_VBC(Value: string);
    procedure Set_PICMS(Value: string);
    procedure Set_VICMSOp(Value: string);
    procedure Set_PDif(Value: string);
    procedure Set_VICMSDif(Value: string);
    procedure Set_VICMS(Value: string);
    procedure Set_VBCFCP(Value: string);
    procedure Set_PFCP(Value: string);
    procedure Set_VFCP(Value: string);
  end;

{ TXMLICMS60 }

  TXMLICMS60 = class(TXMLNode, IXMLICMS60)
  protected
    { IXMLICMS60 }
    function Get_Orig: string;
    function Get_CST: string;
    function Get_VBCSTRet: string;
    function Get_PST: string;
    function Get_VICMSSubstituto: string;
    function Get_VICMSSTRet: string;
    function Get_VBCFCPSTRet: string;
    function Get_PFCPSTRet: string;
    function Get_VFCPSTRet: string;
    function Get_PRedBCEfet: string;
    function Get_VBCEfet: string;
    function Get_PICMSEfet: string;
    function Get_VICMSEfet: string;
    procedure Set_Orig(Value: string);
    procedure Set_CST(Value: string);
    procedure Set_VBCSTRet(Value: string);
    procedure Set_PST(Value: string);
    procedure Set_VICMSSubstituto(Value: string);
    procedure Set_VICMSSTRet(Value: string);
    procedure Set_VBCFCPSTRet(Value: string);
    procedure Set_PFCPSTRet(Value: string);
    procedure Set_VFCPSTRet(Value: string);
    procedure Set_PRedBCEfet(Value: string);
    procedure Set_VBCEfet(Value: string);
    procedure Set_PICMSEfet(Value: string);
    procedure Set_VICMSEfet(Value: string);
  end;

{ TXMLICMS70 }

  TXMLICMS70 = class(TXMLNode, IXMLICMS70)
  protected
    { IXMLICMS70 }
    function Get_Orig: string;
    function Get_CST: string;
    function Get_ModBC: string;
    function Get_PRedBC: string;
    function Get_VBC: string;
    function Get_PICMS: string;
    function Get_VICMS: string;
    function Get_VBCFCP: string;
    function Get_PFCP: string;
    function Get_VFCP: string;
    function Get_ModBCST: string;
    function Get_PMVAST: string;
    function Get_PRedBCST: string;
    function Get_VBCST: string;
    function Get_PICMSST: string;
    function Get_VICMSST: string;
    function Get_VBCFCPST: string;
    function Get_PFCPST: string;
    function Get_VFCPST: string;
    function Get_VICMSDeson: string;
    function Get_MotDesICMS: string;
    procedure Set_Orig(Value: string);
    procedure Set_CST(Value: string);
    procedure Set_ModBC(Value: string);
    procedure Set_PRedBC(Value: string);
    procedure Set_VBC(Value: string);
    procedure Set_PICMS(Value: string);
    procedure Set_VICMS(Value: string);
    procedure Set_VBCFCP(Value: string);
    procedure Set_PFCP(Value: string);
    procedure Set_VFCP(Value: string);
    procedure Set_ModBCST(Value: string);
    procedure Set_PMVAST(Value: string);
    procedure Set_PRedBCST(Value: string);
    procedure Set_VBCST(Value: string);
    procedure Set_PICMSST(Value: string);
    procedure Set_VICMSST(Value: string);
    procedure Set_VBCFCPST(Value: string);
    procedure Set_PFCPST(Value: string);
    procedure Set_VFCPST(Value: string);
    procedure Set_VICMSDeson(Value: string);
    procedure Set_MotDesICMS(Value: string);
  end;

{ TXMLICMS90 }

  TXMLICMS90 = class(TXMLNode, IXMLICMS90)
  protected
    { IXMLICMS90 }
    function Get_Orig: string;
    function Get_CST: string;
    function Get_ModBC: string;
    function Get_VBC: string;
    function Get_PRedBC: string;
    function Get_PICMS: string;
    function Get_VICMS: string;
    function Get_VBCFCP: string;
    function Get_PFCP: string;
    function Get_VFCP: string;
    function Get_ModBCST: string;
    function Get_PMVAST: string;
    function Get_PRedBCST: string;
    function Get_VBCST: string;
    function Get_PICMSST: string;
    function Get_VICMSST: string;
    function Get_VBCFCPST: string;
    function Get_PFCPST: string;
    function Get_VFCPST: string;
    function Get_VICMSDeson: string;
    function Get_MotDesICMS: string;
    procedure Set_Orig(Value: string);
    procedure Set_CST(Value: string);
    procedure Set_ModBC(Value: string);
    procedure Set_VBC(Value: string);
    procedure Set_PRedBC(Value: string);
    procedure Set_PICMS(Value: string);
    procedure Set_VICMS(Value: string);
    procedure Set_VBCFCP(Value: string);
    procedure Set_PFCP(Value: string);
    procedure Set_VFCP(Value: string);
    procedure Set_ModBCST(Value: string);
    procedure Set_PMVAST(Value: string);
    procedure Set_PRedBCST(Value: string);
    procedure Set_VBCST(Value: string);
    procedure Set_PICMSST(Value: string);
    procedure Set_VICMSST(Value: string);
    procedure Set_VBCFCPST(Value: string);
    procedure Set_PFCPST(Value: string);
    procedure Set_VFCPST(Value: string);
    procedure Set_VICMSDeson(Value: string);
    procedure Set_MotDesICMS(Value: string);
  end;

{ TXMLICMSPart }

  TXMLICMSPart = class(TXMLNode, IXMLICMSPart)
  protected
    { IXMLICMSPart }
    function Get_Orig: string;
    function Get_CST: string;
    function Get_ModBC: string;
    function Get_VBC: string;
    function Get_PRedBC: string;
    function Get_PICMS: string;
    function Get_VICMS: string;
    function Get_ModBCST: string;
    function Get_PMVAST: string;
    function Get_PRedBCST: string;
    function Get_VBCST: string;
    function Get_PICMSST: string;
    function Get_VICMSST: string;
    function Get_PBCOp: string;
    function Get_UFST: string;
    procedure Set_Orig(Value: string);
    procedure Set_CST(Value: string);
    procedure Set_ModBC(Value: string);
    procedure Set_VBC(Value: string);
    procedure Set_PRedBC(Value: string);
    procedure Set_PICMS(Value: string);
    procedure Set_VICMS(Value: string);
    procedure Set_ModBCST(Value: string);
    procedure Set_PMVAST(Value: string);
    procedure Set_PRedBCST(Value: string);
    procedure Set_VBCST(Value: string);
    procedure Set_PICMSST(Value: string);
    procedure Set_VICMSST(Value: string);
    procedure Set_PBCOp(Value: string);
    procedure Set_UFST(Value: string);
  end;

{ TXMLICMSST }

  TXMLICMSST = class(TXMLNode, IXMLICMSST)
  protected
    { IXMLICMSST }
    function Get_Orig: string;
    function Get_CST: string;
    function Get_VBCSTRet: string;
    function Get_PST: string;
    function Get_VICMSSubstituto: string;
    function Get_VICMSSTRet: string;
    function Get_VBCFCPSTRet: string;
    function Get_PFCPSTRet: string;
    function Get_VFCPSTRet: string;
    function Get_VBCSTDest: string;
    function Get_VICMSSTDest: string;
    function Get_PRedBCEfet: string;
    function Get_VBCEfet: string;
    function Get_PICMSEfet: string;
    function Get_VICMSEfet: string;
    procedure Set_Orig(Value: string);
    procedure Set_CST(Value: string);
    procedure Set_VBCSTRet(Value: string);
    procedure Set_PST(Value: string);
    procedure Set_VICMSSubstituto(Value: string);
    procedure Set_VICMSSTRet(Value: string);
    procedure Set_VBCFCPSTRet(Value: string);
    procedure Set_PFCPSTRet(Value: string);
    procedure Set_VFCPSTRet(Value: string);
    procedure Set_VBCSTDest(Value: string);
    procedure Set_VICMSSTDest(Value: string);
    procedure Set_PRedBCEfet(Value: string);
    procedure Set_VBCEfet(Value: string);
    procedure Set_PICMSEfet(Value: string);
    procedure Set_VICMSEfet(Value: string);
  end;

{ TXMLICMSSN101 }

  TXMLICMSSN101 = class(TXMLNode, IXMLICMSSN101)
  protected
    { IXMLICMSSN101 }
    function Get_Orig: string;
    function Get_CSOSN: string;
    function Get_PCredSN: string;
    function Get_VCredICMSSN: string;
    procedure Set_Orig(Value: string);
    procedure Set_CSOSN(Value: string);
    procedure Set_PCredSN(Value: string);
    procedure Set_VCredICMSSN(Value: string);
  end;

{ TXMLICMSSN102 }

  TXMLICMSSN102 = class(TXMLNode, IXMLICMSSN102)
  protected
    { IXMLICMSSN102 }
    function Get_Orig: string;
    function Get_CSOSN: string;
    procedure Set_Orig(Value: string);
    procedure Set_CSOSN(Value: string);
  end;

{ TXMLICMSSN201 }

  TXMLICMSSN201 = class(TXMLNode, IXMLICMSSN201)
  protected
    { IXMLICMSSN201 }
    function Get_Orig: string;
    function Get_CSOSN: string;
    function Get_ModBCST: string;
    function Get_PMVAST: string;
    function Get_PRedBCST: string;
    function Get_VBCST: string;
    function Get_PICMSST: string;
    function Get_VICMSST: string;
    function Get_VBCFCPST: string;
    function Get_PFCPST: string;
    function Get_VFCPST: string;
    function Get_PCredSN: string;
    function Get_VCredICMSSN: string;
    procedure Set_Orig(Value: string);
    procedure Set_CSOSN(Value: string);
    procedure Set_ModBCST(Value: string);
    procedure Set_PMVAST(Value: string);
    procedure Set_PRedBCST(Value: string);
    procedure Set_VBCST(Value: string);
    procedure Set_PICMSST(Value: string);
    procedure Set_VICMSST(Value: string);
    procedure Set_VBCFCPST(Value: string);
    procedure Set_PFCPST(Value: string);
    procedure Set_VFCPST(Value: string);
    procedure Set_PCredSN(Value: string);
    procedure Set_VCredICMSSN(Value: string);
  end;

{ TXMLICMSSN202 }

  TXMLICMSSN202 = class(TXMLNode, IXMLICMSSN202)
  protected
    { IXMLICMSSN202 }
    function Get_Orig: string;
    function Get_CSOSN: string;
    function Get_ModBCST: string;
    function Get_PMVAST: string;
    function Get_PRedBCST: string;
    function Get_VBCST: string;
    function Get_PICMSST: string;
    function Get_VICMSST: string;
    function Get_VBCFCPST: string;
    function Get_PFCPST: string;
    function Get_VFCPST: string;
    procedure Set_Orig(Value: string);
    procedure Set_CSOSN(Value: string);
    procedure Set_ModBCST(Value: string);
    procedure Set_PMVAST(Value: string);
    procedure Set_PRedBCST(Value: string);
    procedure Set_VBCST(Value: string);
    procedure Set_PICMSST(Value: string);
    procedure Set_VICMSST(Value: string);
    procedure Set_VBCFCPST(Value: string);
    procedure Set_PFCPST(Value: string);
    procedure Set_VFCPST(Value: string);
  end;

{ TXMLICMSSN500 }

  TXMLICMSSN500 = class(TXMLNode, IXMLICMSSN500)
  protected
    { IXMLICMSSN500 }
    function Get_Orig: string;
    function Get_CSOSN: string;
    function Get_VBCSTRet: string;
    function Get_PST: string;
    function Get_VICMSSubstituto: string;
    function Get_VICMSSTRet: string;
    function Get_VBCFCPSTRet: string;
    function Get_PFCPSTRet: string;
    function Get_VFCPSTRet: string;
    function Get_PRedBCEfet: string;
    function Get_VBCEfet: string;
    function Get_PICMSEfet: string;
    function Get_VICMSEfet: string;
    procedure Set_Orig(Value: string);
    procedure Set_CSOSN(Value: string);
    procedure Set_VBCSTRet(Value: string);
    procedure Set_PST(Value: string);
    procedure Set_VICMSSubstituto(Value: string);
    procedure Set_VICMSSTRet(Value: string);
    procedure Set_VBCFCPSTRet(Value: string);
    procedure Set_PFCPSTRet(Value: string);
    procedure Set_VFCPSTRet(Value: string);
    procedure Set_PRedBCEfet(Value: string);
    procedure Set_VBCEfet(Value: string);
    procedure Set_PICMSEfet(Value: string);
    procedure Set_VICMSEfet(Value: string);
  end;

{ TXMLICMSSN900 }

  TXMLICMSSN900 = class(TXMLNode, IXMLICMSSN900)
  protected
    { IXMLICMSSN900 }
    function Get_Orig: string;
    function Get_CSOSN: string;
    function Get_ModBC: string;
    function Get_VBC: string;
    function Get_PRedBC: string;
    function Get_PICMS: string;
    function Get_VICMS: string;
    function Get_ModBCST: string;
    function Get_PMVAST: string;
    function Get_PRedBCST: string;
    function Get_VBCST: string;
    function Get_PICMSST: string;
    function Get_VICMSST: string;
    function Get_VBCFCPST: string;
    function Get_PFCPST: string;
    function Get_VFCPST: string;
    function Get_PCredSN: string;
    function Get_VCredICMSSN: string;
    procedure Set_Orig(Value: string);
    procedure Set_CSOSN(Value: string);
    procedure Set_ModBC(Value: string);
    procedure Set_VBC(Value: string);
    procedure Set_PRedBC(Value: string);
    procedure Set_PICMS(Value: string);
    procedure Set_VICMS(Value: string);
    procedure Set_ModBCST(Value: string);
    procedure Set_PMVAST(Value: string);
    procedure Set_PRedBCST(Value: string);
    procedure Set_VBCST(Value: string);
    procedure Set_PICMSST(Value: string);
    procedure Set_VICMSST(Value: string);
    procedure Set_VBCFCPST(Value: string);
    procedure Set_PFCPST(Value: string);
    procedure Set_VFCPST(Value: string);
    procedure Set_PCredSN(Value: string);
    procedure Set_VCredICMSSN(Value: string);
  end;

{ TXMLTIpi }

  TXMLTIpi = class(TXMLNode, IXMLTIpi)
  protected
    { IXMLTIpi }
    function Get_CNPJProd: string;
    function Get_CSelo: string;
    function Get_QSelo: string;
    function Get_CEnq: string;
    function Get_IPITrib: IXMLIPITrib;
    function Get_IPINT: IXMLIPINT;
    procedure Set_CNPJProd(Value: string);
    procedure Set_CSelo(Value: string);
    procedure Set_QSelo(Value: string);
    procedure Set_CEnq(Value: string);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLIPITrib }

  TXMLIPITrib = class(TXMLNode, IXMLIPITrib)
  protected
    { IXMLIPITrib }
    function Get_CST: string;
    function Get_VBC: string;
    function Get_PIPI: string;
    function Get_QUnid: string;
    function Get_VUnid: string;
    function Get_VIPI: string;
    procedure Set_CST(Value: string);
    procedure Set_VBC(Value: string);
    procedure Set_PIPI(Value: string);
    procedure Set_QUnid(Value: string);
    procedure Set_VUnid(Value: string);
    procedure Set_VIPI(Value: string);
  end;

{ TXMLIPINT }

  TXMLIPINT = class(TXMLNode, IXMLIPINT)
  protected
    { IXMLIPINT }
    function Get_CST: string;
    procedure Set_CST(Value: string);
  end;

{ TXMLII }

  TXMLII = class(TXMLNode, IXMLII)
  protected
    { IXMLII }
    function Get_VBC: string;
    function Get_VDespAdu: string;
    function Get_VII: string;
    function Get_VIOF: string;
    procedure Set_VBC(Value: string);
    procedure Set_VDespAdu(Value: string);
    procedure Set_VII(Value: string);
    procedure Set_VIOF(Value: string);
  end;

{ TXMLISSQN }

  TXMLISSQN = class(TXMLNode, IXMLISSQN)
  protected
    { IXMLISSQN }
    function Get_VBC: string;
    function Get_VAliq: string;
    function Get_VISSQN: string;
    function Get_CMunFG: string;
    function Get_CListServ: string;
    function Get_VDeducao: string;
    function Get_VOutro: string;
    function Get_VDescIncond: string;
    function Get_VDescCond: string;
    function Get_VISSRet: string;
    function Get_IndISS: string;
    function Get_CServico: string;
    function Get_CMun: string;
    function Get_CPais: string;
    function Get_NProcesso: string;
    function Get_IndIncentivo: string;
    procedure Set_VBC(Value: string);
    procedure Set_VAliq(Value: string);
    procedure Set_VISSQN(Value: string);
    procedure Set_CMunFG(Value: string);
    procedure Set_CListServ(Value: string);
    procedure Set_VDeducao(Value: string);
    procedure Set_VOutro(Value: string);
    procedure Set_VDescIncond(Value: string);
    procedure Set_VDescCond(Value: string);
    procedure Set_VISSRet(Value: string);
    procedure Set_IndISS(Value: string);
    procedure Set_CServico(Value: string);
    procedure Set_CMun(Value: string);
    procedure Set_CPais(Value: string);
    procedure Set_NProcesso(Value: string);
    procedure Set_IndIncentivo(Value: string);
  end;

{ TXMLPIS }

  TXMLPIS = class(TXMLNode, IXMLPIS)
  protected
    { IXMLPIS }
    function Get_PISAliq: IXMLPISAliq;
    function Get_PISQtde: IXMLPISQtde;
    function Get_PISNT: IXMLPISNT;
    function Get_PISOutr: IXMLPISOutr;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLPISAliq }

  TXMLPISAliq = class(TXMLNode, IXMLPISAliq)
  protected
    { IXMLPISAliq }
    function Get_CST: string;
    function Get_VBC: string;
    function Get_PPIS: string;
    function Get_VPIS: string;
    procedure Set_CST(Value: string);
    procedure Set_VBC(Value: string);
    procedure Set_PPIS(Value: string);
    procedure Set_VPIS(Value: string);
  end;

{ TXMLPISQtde }

  TXMLPISQtde = class(TXMLNode, IXMLPISQtde)
  protected
    { IXMLPISQtde }
    function Get_CST: string;
    function Get_QBCProd: string;
    function Get_VAliqProd: string;
    function Get_VPIS: string;
    procedure Set_CST(Value: string);
    procedure Set_QBCProd(Value: string);
    procedure Set_VAliqProd(Value: string);
    procedure Set_VPIS(Value: string);
  end;

{ TXMLPISNT }

  TXMLPISNT = class(TXMLNode, IXMLPISNT)
  protected
    { IXMLPISNT }
    function Get_CST: string;
    procedure Set_CST(Value: string);
  end;

{ TXMLPISOutr }

  TXMLPISOutr = class(TXMLNode, IXMLPISOutr)
  protected
    { IXMLPISOutr }
    function Get_CST: string;
    function Get_VBC: string;
    function Get_PPIS: string;
    function Get_QBCProd: string;
    function Get_VAliqProd: string;
    function Get_VPIS: string;
    procedure Set_CST(Value: string);
    procedure Set_VBC(Value: string);
    procedure Set_PPIS(Value: string);
    procedure Set_QBCProd(Value: string);
    procedure Set_VAliqProd(Value: string);
    procedure Set_VPIS(Value: string);
  end;

{ TXMLPISST }

  TXMLPISST = class(TXMLNode, IXMLPISST)
  protected
    { IXMLPISST }
    function Get_VBC: string;
    function Get_PPIS: string;
    function Get_QBCProd: string;
    function Get_VAliqProd: string;
    function Get_VPIS: string;
    procedure Set_VBC(Value: string);
    procedure Set_PPIS(Value: string);
    procedure Set_QBCProd(Value: string);
    procedure Set_VAliqProd(Value: string);
    procedure Set_VPIS(Value: string);
  end;

{ TXMLCOFINS }

  TXMLCOFINS = class(TXMLNode, IXMLCOFINS)
  protected
    { IXMLCOFINS }
    function Get_COFINSAliq: IXMLCOFINSAliq;
    function Get_COFINSQtde: IXMLCOFINSQtde;
    function Get_COFINSNT: IXMLCOFINSNT;
    function Get_COFINSOutr: IXMLCOFINSOutr;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLCOFINSAliq }

  TXMLCOFINSAliq = class(TXMLNode, IXMLCOFINSAliq)
  protected
    { IXMLCOFINSAliq }
    function Get_CST: string;
    function Get_VBC: string;
    function Get_PCOFINS: string;
    function Get_VCOFINS: string;
    procedure Set_CST(Value: string);
    procedure Set_VBC(Value: string);
    procedure Set_PCOFINS(Value: string);
    procedure Set_VCOFINS(Value: string);
  end;

{ TXMLCOFINSQtde }

  TXMLCOFINSQtde = class(TXMLNode, IXMLCOFINSQtde)
  protected
    { IXMLCOFINSQtde }
    function Get_CST: string;
    function Get_QBCProd: string;
    function Get_VAliqProd: string;
    function Get_VCOFINS: string;
    procedure Set_CST(Value: string);
    procedure Set_QBCProd(Value: string);
    procedure Set_VAliqProd(Value: string);
    procedure Set_VCOFINS(Value: string);
  end;

{ TXMLCOFINSNT }

  TXMLCOFINSNT = class(TXMLNode, IXMLCOFINSNT)
  protected
    { IXMLCOFINSNT }
    function Get_CST: string;
    procedure Set_CST(Value: string);
  end;

{ TXMLCOFINSOutr }

  TXMLCOFINSOutr = class(TXMLNode, IXMLCOFINSOutr)
  protected
    { IXMLCOFINSOutr }
    function Get_CST: string;
    function Get_VBC: string;
    function Get_PCOFINS: string;
    function Get_QBCProd: string;
    function Get_VAliqProd: string;
    function Get_VCOFINS: string;
    procedure Set_CST(Value: string);
    procedure Set_VBC(Value: string);
    procedure Set_PCOFINS(Value: string);
    procedure Set_QBCProd(Value: string);
    procedure Set_VAliqProd(Value: string);
    procedure Set_VCOFINS(Value: string);
  end;

{ TXMLCOFINSST }

  TXMLCOFINSST = class(TXMLNode, IXMLCOFINSST)
  protected
    { IXMLCOFINSST }
    function Get_VBC: string;
    function Get_PCOFINS: string;
    function Get_QBCProd: string;
    function Get_VAliqProd: string;
    function Get_VCOFINS: string;
    procedure Set_VBC(Value: string);
    procedure Set_PCOFINS(Value: string);
    procedure Set_QBCProd(Value: string);
    procedure Set_VAliqProd(Value: string);
    procedure Set_VCOFINS(Value: string);
  end;

{ TXMLICMSUFDest }

  TXMLICMSUFDest = class(TXMLNode, IXMLICMSUFDest)
  protected
    { IXMLICMSUFDest }
    function Get_VBCUFDest: string;
    function Get_VBCFCPUFDest: string;
    function Get_PFCPUFDest: string;
    function Get_PICMSUFDest: string;
    function Get_PICMSInter: string;
    function Get_PICMSInterPart: string;
    function Get_VFCPUFDest: string;
    function Get_VICMSUFDest: string;
    function Get_VICMSUFRemet: string;
    procedure Set_VBCUFDest(Value: string);
    procedure Set_VBCFCPUFDest(Value: string);
    procedure Set_PFCPUFDest(Value: string);
    procedure Set_PICMSUFDest(Value: string);
    procedure Set_PICMSInter(Value: string);
    procedure Set_PICMSInterPart(Value: string);
    procedure Set_VFCPUFDest(Value: string);
    procedure Set_VICMSUFDest(Value: string);
    procedure Set_VICMSUFRemet(Value: string);
  end;

{ TXMLImpostoDevol }

  TXMLImpostoDevol = class(TXMLNode, IXMLImpostoDevol)
  protected
    { IXMLImpostoDevol }
    function Get_PDevol: string;
    function Get_IPI: IXMLIPI;
    procedure Set_PDevol(Value: string);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLIPI }

  TXMLIPI = class(TXMLNode, IXMLIPI)
  protected
    { IXMLIPI }
    function Get_VIPIDevol: string;
    procedure Set_VIPIDevol(Value: string);
  end;

{ TXMLTotal }

  TXMLTotal = class(TXMLNode, IXMLTotal)
  protected
    { IXMLTotal }
    function Get_ICMSTot: IXMLICMSTot;
    function Get_ISSQNtot: IXMLISSQNtot;
    function Get_RetTrib: IXMLRetTrib;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLICMSTot }

  TXMLICMSTot = class(TXMLNode, IXMLICMSTot)
  protected
    { IXMLICMSTot }
    function Get_VBC: string;
    function Get_VICMS: string;
    function Get_VICMSDeson: string;
    function Get_VFCPUFDest: string;
    function Get_VICMSUFDest: string;
    function Get_VICMSUFRemet: string;
    function Get_VFCP: string;
    function Get_VBCST: string;
    function Get_VST: string;
    function Get_VFCPST: string;
    function Get_VFCPSTRet: string;
    function Get_VProd: string;
    function Get_VFrete: string;
    function Get_VSeg: string;
    function Get_VDesc: string;
    function Get_VII: string;
    function Get_VIPI: string;
    function Get_VIPIDevol: string;
    function Get_VPIS: string;
    function Get_VCOFINS: string;
    function Get_VOutro: string;
    function Get_VNF: string;
    function Get_VTotTrib: string;
    procedure Set_VBC(Value: string);
    procedure Set_VICMS(Value: string);
    procedure Set_VICMSDeson(Value: string);
    procedure Set_VFCPUFDest(Value: string);
    procedure Set_VICMSUFDest(Value: string);
    procedure Set_VICMSUFRemet(Value: string);
    procedure Set_VFCP(Value: string);
    procedure Set_VBCST(Value: string);
    procedure Set_VST(Value: string);
    procedure Set_VFCPST(Value: string);
    procedure Set_VFCPSTRet(Value: string);
    procedure Set_VProd(Value: string);
    procedure Set_VFrete(Value: string);
    procedure Set_VSeg(Value: string);
    procedure Set_VDesc(Value: string);
    procedure Set_VII(Value: string);
    procedure Set_VIPI(Value: string);
    procedure Set_VIPIDevol(Value: string);
    procedure Set_VPIS(Value: string);
    procedure Set_VCOFINS(Value: string);
    procedure Set_VOutro(Value: string);
    procedure Set_VNF(Value: string);
    procedure Set_VTotTrib(Value: string);
  end;

{ TXMLISSQNtot }

  TXMLISSQNtot = class(TXMLNode, IXMLISSQNtot)
  protected
    { IXMLISSQNtot }
    function Get_VServ: string;
    function Get_VBC: string;
    function Get_VISS: string;
    function Get_VPIS: string;
    function Get_VCOFINS: string;
    function Get_DCompet: string;
    function Get_VDeducao: string;
    function Get_VOutro: string;
    function Get_VDescIncond: string;
    function Get_VDescCond: string;
    function Get_VISSRet: string;
    function Get_CRegTrib: string;
    procedure Set_VServ(Value: string);
    procedure Set_VBC(Value: string);
    procedure Set_VISS(Value: string);
    procedure Set_VPIS(Value: string);
    procedure Set_VCOFINS(Value: string);
    procedure Set_DCompet(Value: string);
    procedure Set_VDeducao(Value: string);
    procedure Set_VOutro(Value: string);
    procedure Set_VDescIncond(Value: string);
    procedure Set_VDescCond(Value: string);
    procedure Set_VISSRet(Value: string);
    procedure Set_CRegTrib(Value: string);
  end;

{ TXMLRetTrib }

  TXMLRetTrib = class(TXMLNode, IXMLRetTrib)
  protected
    { IXMLRetTrib }
    function Get_VRetPIS: string;
    function Get_VRetCOFINS: string;
    function Get_VRetCSLL: string;
    function Get_VBCIRRF: string;
    function Get_VIRRF: string;
    function Get_VBCRetPrev: string;
    function Get_VRetPrev: string;
    procedure Set_VRetPIS(Value: string);
    procedure Set_VRetCOFINS(Value: string);
    procedure Set_VRetCSLL(Value: string);
    procedure Set_VBCIRRF(Value: string);
    procedure Set_VIRRF(Value: string);
    procedure Set_VBCRetPrev(Value: string);
    procedure Set_VRetPrev(Value: string);
  end;

{ TXMLTransp }

  TXMLTransp = class(TXMLNode, IXMLTransp)
  private
    FReboque: IXMLTVeiculoList;
    FVol: IXMLVolList;
  protected
    { IXMLTransp }
    function Get_ModFrete: string;
    function Get_Transporta: IXMLTransporta;
    function Get_RetTransp: IXMLRetTransp;
    function Get_VeicTransp: IXMLTVeiculo;
    function Get_Reboque: IXMLTVeiculoList;
    function Get_Vagao: string;
    function Get_Balsa: string;
    function Get_Vol: IXMLVolList;
    procedure Set_ModFrete(Value: string);
    procedure Set_Vagao(Value: string);
    procedure Set_Balsa(Value: string);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTransporta }

  TXMLTransporta = class(TXMLNode, IXMLTransporta)
  protected
    { IXMLTransporta }
    function Get_CNPJ: string;
    function Get_CPF: string;
    function Get_XNome: string;
    function Get_IE: string;
    function Get_XEnder: string;
    function Get_XMun: string;
    function Get_UF: string;
    procedure Set_CNPJ(Value: string);
    procedure Set_CPF(Value: string);
    procedure Set_XNome(Value: string);
    procedure Set_IE(Value: string);
    procedure Set_XEnder(Value: string);
    procedure Set_XMun(Value: string);
    procedure Set_UF(Value: string);
  end;

{ TXMLRetTransp }

  TXMLRetTransp = class(TXMLNode, IXMLRetTransp)
  protected
    { IXMLRetTransp }
    function Get_VServ: string;
    function Get_VBCRet: string;
    function Get_PICMSRet: string;
    function Get_VICMSRet: string;
    function Get_CFOP: string;
    function Get_CMunFG: string;
    procedure Set_VServ(Value: string);
    procedure Set_VBCRet(Value: string);
    procedure Set_PICMSRet(Value: string);
    procedure Set_VICMSRet(Value: string);
    procedure Set_CFOP(Value: string);
    procedure Set_CMunFG(Value: string);
  end;

{ TXMLTVeiculo }

  TXMLTVeiculo = class(TXMLNode, IXMLTVeiculo)
  protected
    { IXMLTVeiculo }
    function Get_Placa: string;
    function Get_UF: string;
    function Get_RNTC: string;
    procedure Set_Placa(Value: string);
    procedure Set_UF(Value: string);
    procedure Set_RNTC(Value: string);
  end;

{ TXMLTVeiculoList }

  TXMLTVeiculoList = class(TXMLNodeCollection, IXMLTVeiculoList)
  protected
    { IXMLTVeiculoList }
    function Add: IXMLTVeiculo;
    function Insert(const Index: Integer): IXMLTVeiculo;

    function Get_Item(Index: Integer): IXMLTVeiculo;
  end;

{ TXMLVol }

  TXMLVol = class(TXMLNode, IXMLVol)
  private
    FLacres: IXMLLacresList;
  protected
    { IXMLVol }
    function Get_QVol: string;
    function Get_Esp: string;
    function Get_Marca: string;
    function Get_NVol: string;
    function Get_PesoL: string;
    function Get_PesoB: string;
    function Get_Lacres: IXMLLacresList;
    procedure Set_QVol(Value: string);
    procedure Set_Esp(Value: string);
    procedure Set_Marca(Value: string);
    procedure Set_NVol(Value: string);
    procedure Set_PesoL(Value: string);
    procedure Set_PesoB(Value: string);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLVolList }

  TXMLVolList = class(TXMLNodeCollection, IXMLVolList)
  protected
    { IXMLVolList }
    function Add: IXMLVol;
    function Insert(const Index: Integer): IXMLVol;

    function Get_Item(Index: Integer): IXMLVol;
  end;

{ TXMLLacres }

  TXMLLacres = class(TXMLNode, IXMLLacres)
  protected
    { IXMLLacres }
    function Get_NLacre: string;
    procedure Set_NLacre(Value: string);
  end;

{ TXMLLacresList }

  TXMLLacresList = class(TXMLNodeCollection, IXMLLacresList)
  protected
    { IXMLLacresList }
    function Add: IXMLLacres;
    function Insert(const Index: Integer): IXMLLacres;

    function Get_Item(Index: Integer): IXMLLacres;
  end;

{ TXMLCobr }

  TXMLCobr = class(TXMLNode, IXMLCobr)
  private
    FDup: IXMLDupList;
  protected
    { IXMLCobr }
    function Get_Fat: IXMLFat;
    function Get_Dup: IXMLDupList;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLFat }

  TXMLFat = class(TXMLNode, IXMLFat)
  protected
    { IXMLFat }
    function Get_NFat: string;
    function Get_VOrig: string;
    function Get_VDesc: string;
    function Get_VLiq: string;
    procedure Set_NFat(Value: string);
    procedure Set_VOrig(Value: string);
    procedure Set_VDesc(Value: string);
    procedure Set_VLiq(Value: string);
  end;

{ TXMLDup }

  TXMLDup = class(TXMLNode, IXMLDup)
  protected
    { IXMLDup }
    function Get_NDup: string;
    function Get_DVenc: string;
    function Get_VDup: string;
    procedure Set_NDup(Value: string);
    procedure Set_DVenc(Value: string);
    procedure Set_VDup(Value: string);
  end;

{ TXMLDupList }

  TXMLDupList = class(TXMLNodeCollection, IXMLDupList)
  protected
    { IXMLDupList }
    function Add: IXMLDup;
    function Insert(const Index: Integer): IXMLDup;

    function Get_Item(Index: Integer): IXMLDup;
  end;

{ TXMLPag }

  TXMLPag = class(TXMLNode, IXMLPag)
  private
    FDetPag: IXMLDetPagList;
  protected
    { IXMLPag }
    function Get_DetPag: IXMLDetPagList;
    function Get_VTroco: string;
    procedure Set_VTroco(Value: string);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDetPag }

  TXMLDetPag = class(TXMLNode, IXMLDetPag)
  protected
    { IXMLDetPag }
    function Get_IndPag: string;
    function Get_TPag: string;
    function Get_VPag: string;
    function Get_Card: IXMLCard;
    procedure Set_IndPag(Value: string);
    procedure Set_TPag(Value: string);
    procedure Set_VPag(Value: string);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDetPagList }

  TXMLDetPagList = class(TXMLNodeCollection, IXMLDetPagList)
  protected
    { IXMLDetPagList }
    function Add: IXMLDetPag;
    function Insert(const Index: Integer): IXMLDetPag;

    function Get_Item(Index: Integer): IXMLDetPag;
  end;

{ TXMLCard }

  TXMLCard = class(TXMLNode, IXMLCard)
  protected
    { IXMLCard }
    function Get_TpIntegra: string;
    function Get_CNPJ: string;
    function Get_TBand: string;
    function Get_CAut: string;
    procedure Set_TpIntegra(Value: string);
    procedure Set_CNPJ(Value: string);
    procedure Set_TBand(Value: string);
    procedure Set_CAut(Value: string);
  end;

{ TXMLInfIntermed }

  TXMLInfIntermed = class(TXMLNode, IXMLInfIntermed)
  protected
    { IXMLInfIntermed }
    function Get_CNPJ: string;
    function Get_IdCadIntTran: string;
    procedure Set_CNPJ(Value: string);
    procedure Set_IdCadIntTran(Value: string);
  end;

{ TXMLInfAdic }

  TXMLInfAdic = class(TXMLNode, IXMLInfAdic)
  private
    FObsCont: IXMLObsContList;
    FObsFisco: IXMLObsFiscoList;
    FProcRef: IXMLProcRefList;
  protected
    { IXMLInfAdic }
    function Get_InfAdFisco: string;
    function Get_InfCpl: string;
    function Get_ObsCont: IXMLObsContList;
    function Get_ObsFisco: IXMLObsFiscoList;
    function Get_ProcRef: IXMLProcRefList;
    procedure Set_InfAdFisco(Value: string);
    procedure Set_InfCpl(Value: string);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLObsCont }

  TXMLObsCont = class(TXMLNode, IXMLObsCont)
  protected
    { IXMLObsCont }
    function Get_XCampo: string;
    function Get_XTexto: string;
    procedure Set_XCampo(Value: string);
    procedure Set_XTexto(Value: string);
  end;

{ TXMLObsContList }

  TXMLObsContList = class(TXMLNodeCollection, IXMLObsContList)
  protected
    { IXMLObsContList }
    function Add: IXMLObsCont;
    function Insert(const Index: Integer): IXMLObsCont;

    function Get_Item(Index: Integer): IXMLObsCont;
  end;

{ TXMLObsFisco }

  TXMLObsFisco = class(TXMLNode, IXMLObsFisco)
  protected
    { IXMLObsFisco }
    function Get_XCampo: string;
    function Get_XTexto: string;
    procedure Set_XCampo(Value: string);
    procedure Set_XTexto(Value: string);
  end;

{ TXMLObsFiscoList }

  TXMLObsFiscoList = class(TXMLNodeCollection, IXMLObsFiscoList)
  protected
    { IXMLObsFiscoList }
    function Add: IXMLObsFisco;
    function Insert(const Index: Integer): IXMLObsFisco;

    function Get_Item(Index: Integer): IXMLObsFisco;
  end;

{ TXMLProcRef }

  TXMLProcRef = class(TXMLNode, IXMLProcRef)
  protected
    { IXMLProcRef }
    function Get_NProc: string;
    function Get_IndProc: string;
    procedure Set_NProc(Value: string);
    procedure Set_IndProc(Value: string);
  end;

{ TXMLProcRefList }

  TXMLProcRefList = class(TXMLNodeCollection, IXMLProcRefList)
  protected
    { IXMLProcRefList }
    function Add: IXMLProcRef;
    function Insert(const Index: Integer): IXMLProcRef;

    function Get_Item(Index: Integer): IXMLProcRef;
  end;

{ TXMLExporta }

  TXMLExporta = class(TXMLNode, IXMLExporta)
  protected
    { IXMLExporta }
    function Get_UFSaidaPais: string;
    function Get_XLocExporta: string;
    function Get_XLocDespacho: string;
    procedure Set_UFSaidaPais(Value: string);
    procedure Set_XLocExporta(Value: string);
    procedure Set_XLocDespacho(Value: string);
  end;

{ TXMLCompra }

  TXMLCompra = class(TXMLNode, IXMLCompra)
  protected
    { IXMLCompra }
    function Get_XNEmp: string;
    function Get_XPed: string;
    function Get_XCont: string;
    procedure Set_XNEmp(Value: string);
    procedure Set_XPed(Value: string);
    procedure Set_XCont(Value: string);
  end;

{ TXMLCana }

  TXMLCana = class(TXMLNode, IXMLCana)
  private
    FForDia: IXMLForDiaList;
    FDeduc: IXMLDeducList;
  protected
    { IXMLCana }
    function Get_Safra: string;
    function Get_Ref: string;
    function Get_ForDia: IXMLForDiaList;
    function Get_QTotMes: string;
    function Get_QTotAnt: string;
    function Get_QTotGer: string;
    function Get_Deduc: IXMLDeducList;
    function Get_VFor: string;
    function Get_VTotDed: string;
    function Get_VLiqFor: string;
    procedure Set_Safra(Value: string);
    procedure Set_Ref(Value: string);
    procedure Set_QTotMes(Value: string);
    procedure Set_QTotAnt(Value: string);
    procedure Set_QTotGer(Value: string);
    procedure Set_VFor(Value: string);
    procedure Set_VTotDed(Value: string);
    procedure Set_VLiqFor(Value: string);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLForDia }

  TXMLForDia = class(TXMLNode, IXMLForDia)
  protected
    { IXMLForDia }
    function Get_Dia: string;
    function Get_Qtde: string;
    procedure Set_Dia(Value: string);
    procedure Set_Qtde(Value: string);
  end;

{ TXMLForDiaList }

  TXMLForDiaList = class(TXMLNodeCollection, IXMLForDiaList)
  protected
    { IXMLForDiaList }
    function Add: IXMLForDia;
    function Insert(const Index: Integer): IXMLForDia;

    function Get_Item(Index: Integer): IXMLForDia;
  end;

{ TXMLDeduc }

  TXMLDeduc = class(TXMLNode, IXMLDeduc)
  protected
    { IXMLDeduc }
    function Get_XDed: string;
    function Get_VDed: string;
    procedure Set_XDed(Value: string);
    procedure Set_VDed(Value: string);
  end;

{ TXMLDeducList }

  TXMLDeducList = class(TXMLNodeCollection, IXMLDeducList)
  protected
    { IXMLDeducList }
    function Add: IXMLDeduc;
    function Insert(const Index: Integer): IXMLDeduc;

    function Get_Item(Index: Integer): IXMLDeduc;
  end;

{ TXMLTInfRespTec }

  TXMLTInfRespTec = class(TXMLNode, IXMLTInfRespTec)
  protected
    { IXMLTInfRespTec }
    function Get_CNPJ: string;
    function Get_XContato: string;
    function Get_Email: string;
    function Get_Fone: string;
    function Get_IdCSRT: string;
    function Get_HashCSRT: string;
    procedure Set_CNPJ(Value: string);
    procedure Set_XContato(Value: string);
    procedure Set_Email(Value: string);
    procedure Set_Fone(Value: string);
    procedure Set_IdCSRT(Value: string);
    procedure Set_HashCSRT(Value: string);
  end;

{ TXMLInfNFeSupl }

  TXMLInfNFeSupl = class(TXMLNode, IXMLInfNFeSupl)
  protected
    { IXMLInfNFeSupl }
    function Get_QrCode: string;
    function Get_UrlChave: string;
    procedure Set_QrCode(Value: string);
    procedure Set_UrlChave(Value: string);
  end;

{ TXMLSignatureType_ds }

  TXMLSignatureType_ds = class(TXMLNode, IXMLSignatureType_ds)
  protected
    { IXMLSignatureType_ds }
    function Get_Id: string;
    function Get_SignedInfo: IXMLSignedInfoType_ds;
    function Get_SignatureValue: IXMLSignatureValueType_ds;
    function Get_KeyInfo: IXMLKeyInfoType_ds;
    procedure Set_Id(Value: string);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLSignedInfoType_ds }

  TXMLSignedInfoType_ds = class(TXMLNode, IXMLSignedInfoType_ds)
  protected
    { IXMLSignedInfoType_ds }
    function Get_Id: string;
    function Get_CanonicalizationMethod: IXMLCanonicalizationMethod_ds;
    function Get_SignatureMethod: IXMLSignatureMethod_ds;
    function Get_Reference: IXMLReferenceType_ds;
    procedure Set_Id(Value: string);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLCanonicalizationMethod_ds }

  TXMLCanonicalizationMethod_ds = class(TXMLNode, IXMLCanonicalizationMethod_ds)
  protected
    { IXMLCanonicalizationMethod_ds }
    function Get_Algorithm: string;
    procedure Set_Algorithm(Value: string);
  end;

{ TXMLSignatureMethod_ds }

  TXMLSignatureMethod_ds = class(TXMLNode, IXMLSignatureMethod_ds)
  protected
    { IXMLSignatureMethod_ds }
    function Get_Algorithm: string;
    procedure Set_Algorithm(Value: string);
  end;

{ TXMLReferenceType_ds }

  TXMLReferenceType_ds = class(TXMLNode, IXMLReferenceType_ds)
  protected
    { IXMLReferenceType_ds }
    function Get_Id: string;
    function Get_URI: string;
    function Get_Type_: string;
    function Get_Transforms: IXMLTransformsType_ds;
    function Get_DigestMethod: IXMLDigestMethod_ds;
    function Get_DigestValue: string;
    procedure Set_Id(Value: string);
    procedure Set_URI(Value: string);
    procedure Set_Type_(Value: string);
    procedure Set_DigestValue(Value: string);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTransformsType_ds }

  TXMLTransformsType_ds = class(TXMLNodeCollection, IXMLTransformsType_ds)
  protected
    { IXMLTransformsType_ds }
    function Get_Transform(Index: Integer): IXMLTransformType_ds;
    function Add: IXMLTransformType_ds;
    function Insert(const Index: Integer): IXMLTransformType_ds;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTransformType_ds }

  TXMLTransformType_ds = class(TXMLNodeCollection, IXMLTransformType_ds)
  protected
    { IXMLTransformType_ds }
    function Get_Algorithm: string;
    function Get_XPath(Index: Integer): string;
    procedure Set_Algorithm(Value: string);
    function Add(const XPath: string): IXMLNode;
    function Insert(const Index: Integer; const XPath: string): IXMLNode;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDigestMethod_ds }

  TXMLDigestMethod_ds = class(TXMLNode, IXMLDigestMethod_ds)
  protected
    { IXMLDigestMethod_ds }
    function Get_Algorithm: string;
    procedure Set_Algorithm(Value: string);
  end;

{ TXMLSignatureValueType_ds }

  TXMLSignatureValueType_ds = class(TXMLNode, IXMLSignatureValueType_ds)
  protected
    { IXMLSignatureValueType_ds }
    function Get_Id: string;
    procedure Set_Id(Value: string);
  end;

{ TXMLKeyInfoType_ds }

  TXMLKeyInfoType_ds = class(TXMLNode, IXMLKeyInfoType_ds)
  protected
    { IXMLKeyInfoType_ds }
    function Get_Id: string;
    function Get_X509Data: IXMLX509DataType_ds;
    procedure Set_Id(Value: string);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLX509DataType_ds }

  TXMLX509DataType_ds = class(TXMLNode, IXMLX509DataType_ds)
  protected
    { IXMLX509DataType_ds }
    function Get_X509Certificate: string;
    procedure Set_X509Certificate(Value: string);
  end;

{ TXMLTProtNFe }

  TXMLTProtNFe = class(TXMLNode, IXMLTProtNFe)
  protected
    { IXMLTProtNFe }
    function Get_Versao: string;
    function Get_InfProt: IXMLInfProt;
    function Get_Signature: IXMLSignatureType_ds;
    procedure Set_Versao(Value: string);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTProtNFeList }

  TXMLTProtNFeList = class(TXMLNodeCollection, IXMLTProtNFeList)
  protected
    { IXMLTProtNFeList }
    function Add: IXMLTProtNFe;
    function Insert(const Index: Integer): IXMLTProtNFe;

    function Get_Item(Index: Integer): IXMLTProtNFe;
  end;

{ TXMLInfProt }

  TXMLInfProt = class(TXMLNode, IXMLInfProt)
  protected
    { IXMLInfProt }
    function Get_Id: string;
    function Get_TpAmb: string;
    function Get_VerAplic: string;
    function Get_ChNFe: string;
    function Get_DhRecbto: string;
    function Get_NProt: string;
    function Get_DigVal: string;
    function Get_CStat: string;
    function Get_XMotivo: string;
    function Get_CMsg: string;
    function Get_XMsg: string;
    procedure Set_Id(Value: string);
    procedure Set_TpAmb(Value: string);
    procedure Set_VerAplic(Value: string);
    procedure Set_ChNFe(Value: string);
    procedure Set_DhRecbto(Value: string);
    procedure Set_NProt(Value: string);
    procedure Set_DigVal(Value: string);
    procedure Set_CStat(Value: string);
    procedure Set_XMotivo(Value: string);
    procedure Set_CMsg(Value: string);
    procedure Set_XMsg(Value: string);
  end;

{ TXMLTEnviNFe }

  TXMLTEnviNFe = class(TXMLNode, IXMLTEnviNFe)
  private
    FNFe: IXMLTNFeList;
  protected
    { IXMLTEnviNFe }
    function Get_Versao: string;
    function Get_IdLote: string;
    function Get_IndSinc: string;
    function Get_NFe: IXMLTNFeList;
    procedure Set_Versao(Value: string);
    procedure Set_IdLote(Value: string);
    procedure Set_IndSinc(Value: string);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTRetEnviNFe }

  TXMLTRetEnviNFe = class(TXMLNode, IXMLTRetEnviNFe)
  protected
    { IXMLTRetEnviNFe }
    function Get_Versao: string;
    function Get_TpAmb: string;
    function Get_VerAplic: string;
    function Get_CStat: string;
    function Get_XMotivo: string;
    function Get_CUF: string;
    function Get_DhRecbto: string;
    function Get_InfRec: IXMLInfRec;
    function Get_ProtNFe: IXMLTProtNFe;
    procedure Set_Versao(Value: string);
    procedure Set_TpAmb(Value: string);
    procedure Set_VerAplic(Value: string);
    procedure Set_CStat(Value: string);
    procedure Set_XMotivo(Value: string);
    procedure Set_CUF(Value: string);
    procedure Set_DhRecbto(Value: string);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLInfRec }

  TXMLInfRec = class(TXMLNode, IXMLInfRec)
  protected
    { IXMLInfRec }
    function Get_NRec: string;
    function Get_TMed: string;
    procedure Set_NRec(Value: string);
    procedure Set_TMed(Value: string);
  end;

{ TXMLTConsReciNFe }

  TXMLTConsReciNFe = class(TXMLNode, IXMLTConsReciNFe)
  protected
    { IXMLTConsReciNFe }
    function Get_Versao: string;
    function Get_TpAmb: string;
    function Get_NRec: string;
    procedure Set_Versao(Value: string);
    procedure Set_TpAmb(Value: string);
    procedure Set_NRec(Value: string);
  end;

{ TXMLTRetConsReciNFe }

  TXMLTRetConsReciNFe = class(TXMLNode, IXMLTRetConsReciNFe)
  private
    FProtNFe: IXMLTProtNFeList;
  protected
    { IXMLTRetConsReciNFe }
    function Get_Versao: string;
    function Get_TpAmb: string;
    function Get_VerAplic: string;
    function Get_NRec: string;
    function Get_CStat: string;
    function Get_XMotivo: string;
    function Get_CUF: string;
    function Get_DhRecbto: string;
    function Get_CMsg: string;
    function Get_XMsg: string;
    function Get_ProtNFe: IXMLTProtNFeList;
    procedure Set_Versao(Value: string);
    procedure Set_TpAmb(Value: string);
    procedure Set_VerAplic(Value: string);
    procedure Set_NRec(Value: string);
    procedure Set_CStat(Value: string);
    procedure Set_XMotivo(Value: string);
    procedure Set_CUF(Value: string);
    procedure Set_DhRecbto(Value: string);
    procedure Set_CMsg(Value: string);
    procedure Set_XMsg(Value: string);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTNfeProc }

  TXMLTNfeProc = class(TXMLNode, IXMLTNfeProc)
  protected
    { IXMLTNfeProc }
    function Get_Versao: string;
    function Get_NFe: IXMLTNFe;
    function Get_ProtNFe: IXMLTProtNFe;
    procedure Set_Versao(Value: string);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLNVEList }

  TXMLNVEList = class(TXMLNodeCollection, IXMLNVEList)
  protected
    { IXMLNVEList }
    function Add(const Value: string): IXMLNode;
    function Insert(const Index: Integer; const Value: string): IXMLNode;

    function Get_Item(Index: Integer): string;
  end;

implementation

uses xmlutil;

{ TXMLTNFe }

procedure TXMLTNFe.AfterConstruction;
begin
  RegisterChildNode('infNFe', TXMLInfNFe);
  RegisterChildNode('infNFeSupl', TXMLInfNFeSupl);
  RegisterChildNode('Signature', TXMLSignatureType_ds);
  inherited;
end;

function TXMLTNFe.Get_InfNFe: IXMLInfNFe;
begin
  Result := ChildNodes['infNFe'] as IXMLInfNFe;
end;

function TXMLTNFe.Get_InfNFeSupl: IXMLInfNFeSupl;
begin
  Result := ChildNodes['infNFeSupl'] as IXMLInfNFeSupl;
end;

function TXMLTNFe.Get_Signature: IXMLSignatureType_ds;
begin
  Result := ChildNodes['Signature'] as IXMLSignatureType_ds;
end;

{ TXMLTNFeList }

function TXMLTNFeList.Add: IXMLTNFe;
begin
  Result := AddItem(-1) as IXMLTNFe;
end;

function TXMLTNFeList.Insert(const Index: Integer): IXMLTNFe;
begin
  Result := AddItem(Index) as IXMLTNFe;
end;

function TXMLTNFeList.Get_Item(Index: Integer): IXMLTNFe;
begin
  Result := List[Index] as IXMLTNFe;
end;

{ TXMLInfNFe }

procedure TXMLInfNFe.AfterConstruction;
begin
  RegisterChildNode('ide', TXMLIde);
  RegisterChildNode('emit', TXMLEmit);
  RegisterChildNode('avulsa', TXMLAvulsa);
  RegisterChildNode('dest', TXMLDest);
  RegisterChildNode('retirada', TXMLTLocal);
  RegisterChildNode('entrega', TXMLTLocal);
  RegisterChildNode('autXML', TXMLAutXML);
  RegisterChildNode('det', TXMLDet);
  RegisterChildNode('total', TXMLTotal);
  RegisterChildNode('transp', TXMLTransp);
  RegisterChildNode('cobr', TXMLCobr);
  RegisterChildNode('pag', TXMLPag);
  RegisterChildNode('infIntermed', TXMLInfIntermed);
  RegisterChildNode('infAdic', TXMLInfAdic);
  RegisterChildNode('exporta', TXMLExporta);
  RegisterChildNode('compra', TXMLCompra);
  RegisterChildNode('cana', TXMLCana);
  RegisterChildNode('infRespTec', TXMLTInfRespTec);
  FAutXML := CreateCollection(TXMLAutXMLList, IXMLAutXML, 'autXML') as IXMLAutXMLList;
  FDet := CreateCollection(TXMLDetList, IXMLDet, 'det') as IXMLDetList;
  inherited;
end;

function TXMLInfNFe.Get_Versao: string;
begin
  Result := AttributeNodes['versao'].Text;
end;

procedure TXMLInfNFe.Set_Versao(Value: string);
begin
  SetAttribute('versao', Value);
end;

function TXMLInfNFe.Get_Id: string;
begin
  Result := AttributeNodes['Id'].Text;
end;

procedure TXMLInfNFe.Set_Id(Value: string);
begin
  SetAttribute('Id', Value);
end;

function TXMLInfNFe.Get_Ide: IXMLIde;
begin
  Result := ChildNodes['ide'] as IXMLIde;
end;

function TXMLInfNFe.Get_Emit: IXMLEmit;
begin
  Result := ChildNodes['emit'] as IXMLEmit;
end;

function TXMLInfNFe.Get_Avulsa: IXMLAvulsa;
begin
  Result := ChildNodes['avulsa'] as IXMLAvulsa;
end;

function TXMLInfNFe.Get_Dest: IXMLDest;
begin
  Result := ChildNodes['dest'] as IXMLDest;
end;

function TXMLInfNFe.Get_Retirada: IXMLTLocal;
begin
  Result := ChildNodes['retirada'] as IXMLTLocal;
end;

function TXMLInfNFe.Get_Entrega: IXMLTLocal;
begin
  Result := ChildNodes['entrega'] as IXMLTLocal;
end;

function TXMLInfNFe.Get_AutXML: IXMLAutXMLList;
begin
  Result := FAutXML;
end;

function TXMLInfNFe.Get_Det: IXMLDetList;
begin
  Result := FDet;
end;

function TXMLInfNFe.Get_Total: IXMLTotal;
begin
  Result := ChildNodes['total'] as IXMLTotal;
end;

function TXMLInfNFe.Get_Transp: IXMLTransp;
begin
  Result := ChildNodes['transp'] as IXMLTransp;
end;

function TXMLInfNFe.Get_Cobr: IXMLCobr;
begin
  Result := ChildNodes['cobr'] as IXMLCobr;
end;

function TXMLInfNFe.Get_Pag: IXMLPag;
begin
  Result := ChildNodes['pag'] as IXMLPag;
end;

function TXMLInfNFe.Get_InfIntermed: IXMLInfIntermed;
begin
  Result := ChildNodes['infIntermed'] as IXMLInfIntermed;
end;

function TXMLInfNFe.Get_InfAdic: IXMLInfAdic;
begin
  Result := ChildNodes['infAdic'] as IXMLInfAdic;
end;

function TXMLInfNFe.Get_Exporta: IXMLExporta;
begin
  Result := ChildNodes['exporta'] as IXMLExporta;
end;

function TXMLInfNFe.Get_Compra: IXMLCompra;
begin
  Result := ChildNodes['compra'] as IXMLCompra;
end;

function TXMLInfNFe.Get_Cana: IXMLCana;
begin
  Result := ChildNodes['cana'] as IXMLCana;
end;

function TXMLInfNFe.Get_InfRespTec: IXMLTInfRespTec;
begin
  Result := ChildNodes['infRespTec'] as IXMLTInfRespTec;
end;

{ TXMLIde }

procedure TXMLIde.AfterConstruction;
begin
  RegisterChildNode('NFref', TXMLNFref);
  FNFref := CreateCollection(TXMLNFrefList, IXMLNFref, 'NFref') as IXMLNFrefList;
  inherited;
end;

function TXMLIde.Get_CUF: string;
begin
  Result := ChildNodes['cUF'].Text;
end;

procedure TXMLIde.Set_CUF(Value: string);
begin
  ChildNodes['cUF'].NodeValue := Value;
end;

function TXMLIde.Get_CNF: string;
begin
  Result := ChildNodes['cNF'].Text;
end;

procedure TXMLIde.Set_CNF(Value: string);
begin
  ChildNodes['cNF'].NodeValue := Value;
end;

function TXMLIde.Get_NatOp: string;
begin
  Result := ChildNodes['natOp'].Text;
end;

procedure TXMLIde.Set_NatOp(Value: string);
begin
  ChildNodes['natOp'].NodeValue := Value;
end;

function TXMLIde.Get_Mod_: string;
begin
  Result := ChildNodes['mod'].Text;
end;

procedure TXMLIde.Set_Mod_(Value: string);
begin
  ChildNodes['mod'].NodeValue := Value;
end;

function TXMLIde.Get_Serie: string;
begin
  Result := ChildNodes['serie'].Text;
end;

procedure TXMLIde.Set_Serie(Value: string);
begin
  ChildNodes['serie'].NodeValue := Value;
end;

function TXMLIde.Get_NNF: string;
begin
  Result := ChildNodes['nNF'].Text;
end;

procedure TXMLIde.Set_NNF(Value: string);
begin
  ChildNodes['nNF'].NodeValue := Value;
end;

function TXMLIde.Get_DhEmi: string;
begin
  Result := ChildNodes['dhEmi'].Text;
end;

procedure TXMLIde.Set_DhEmi(Value: string);
begin
  ChildNodes['dhEmi'].NodeValue := Value;
end;

function TXMLIde.Get_DhSaiEnt: string;
begin
  Result := ChildNodes['dhSaiEnt'].Text;
end;

procedure TXMLIde.Set_DhSaiEnt(Value: string);
begin
  ChildNodes['dhSaiEnt'].NodeValue := Value;
end;

function TXMLIde.Get_TpNF: string;
begin
  Result := ChildNodes['tpNF'].Text;
end;

procedure TXMLIde.Set_TpNF(Value: string);
begin
  ChildNodes['tpNF'].NodeValue := Value;
end;

function TXMLIde.Get_IdDest: string;
begin
  Result := ChildNodes['idDest'].Text;
end;

procedure TXMLIde.Set_IdDest(Value: string);
begin
  ChildNodes['idDest'].NodeValue := Value;
end;

function TXMLIde.Get_CMunFG: string;
begin
  Result := ChildNodes['cMunFG'].Text;
end;

procedure TXMLIde.Set_CMunFG(Value: string);
begin
  ChildNodes['cMunFG'].NodeValue := Value;
end;

function TXMLIde.Get_TpImp: string;
begin
  Result := ChildNodes['tpImp'].Text;
end;

procedure TXMLIde.Set_TpImp(Value: string);
begin
  ChildNodes['tpImp'].NodeValue := Value;
end;

function TXMLIde.Get_TpEmis: string;
begin
  Result := ChildNodes['tpEmis'].Text;
end;

procedure TXMLIde.Set_TpEmis(Value: string);
begin
  ChildNodes['tpEmis'].NodeValue := Value;
end;

function TXMLIde.Get_CDV: string;
begin
  Result := ChildNodes['cDV'].Text;
end;

procedure TXMLIde.Set_CDV(Value: string);
begin
  ChildNodes['cDV'].NodeValue := Value;
end;

function TXMLIde.Get_TpAmb: string;
begin
  Result := ChildNodes['tpAmb'].Text;
end;

procedure TXMLIde.Set_TpAmb(Value: string);
begin
  ChildNodes['tpAmb'].NodeValue := Value;
end;

function TXMLIde.Get_FinNFe: string;
begin
  Result := ChildNodes['finNFe'].Text;
end;

procedure TXMLIde.Set_FinNFe(Value: string);
begin
  ChildNodes['finNFe'].NodeValue := Value;
end;

function TXMLIde.Get_IndFinal: string;
begin
  Result := ChildNodes['indFinal'].Text;
end;

procedure TXMLIde.Set_IndFinal(Value: string);
begin
  ChildNodes['indFinal'].NodeValue := Value;
end;

function TXMLIde.Get_IndPres: string;
begin
  Result := ChildNodes['indPres'].Text;
end;

procedure TXMLIde.Set_IndPres(Value: string);
begin
  ChildNodes['indPres'].NodeValue := Value;
end;

function TXMLIde.Get_IndIntermed: string;
begin
  Result := ChildNodes['indIntermed'].Text;
end;

procedure TXMLIde.Set_IndIntermed(Value: string);
begin
  ChildNodes['indIntermed'].NodeValue := Value;
end;

function TXMLIde.Get_ProcEmi: string;
begin
  Result := ChildNodes['procEmi'].Text;
end;

procedure TXMLIde.Set_ProcEmi(Value: string);
begin
  ChildNodes['procEmi'].NodeValue := Value;
end;

function TXMLIde.Get_VerProc: string;
begin
  Result := ChildNodes['verProc'].Text;
end;

procedure TXMLIde.Set_VerProc(Value: string);
begin
  ChildNodes['verProc'].NodeValue := Value;
end;

function TXMLIde.Get_DhCont: string;
begin
  Result := ChildNodes['dhCont'].Text;
end;

procedure TXMLIde.Set_DhCont(Value: string);
begin
  ChildNodes['dhCont'].NodeValue := Value;
end;

function TXMLIde.Get_XJust: string;
begin
  Result := ChildNodes['xJust'].Text;
end;

procedure TXMLIde.Set_XJust(Value: string);
begin
  ChildNodes['xJust'].NodeValue := Value;
end;

function TXMLIde.Get_NFref: IXMLNFrefList;
begin
  Result := FNFref;
end;

{ TXMLNFref }

procedure TXMLNFref.AfterConstruction;
begin
  RegisterChildNode('refNF', TXMLRefNF);
  RegisterChildNode('refNFP', TXMLRefNFP);
  RegisterChildNode('refECF', TXMLRefECF);
  inherited;
end;

function TXMLNFref.Get_RefNFe: string;
begin
  Result := ChildNodes['refNFe'].Text;
end;

procedure TXMLNFref.Set_RefNFe(Value: string);
begin
  ChildNodes['refNFe'].NodeValue := Value;
end;

function TXMLNFref.Get_RefNF: IXMLRefNF;
begin
  Result := ChildNodes['refNF'] as IXMLRefNF;
end;

function TXMLNFref.Get_RefNFP: IXMLRefNFP;
begin
  Result := ChildNodes['refNFP'] as IXMLRefNFP;
end;

function TXMLNFref.Get_RefCTe: string;
begin
  Result := ChildNodes['refCTe'].Text;
end;

procedure TXMLNFref.Set_RefCTe(Value: string);
begin
  ChildNodes['refCTe'].NodeValue := Value;
end;

function TXMLNFref.Get_RefECF: IXMLRefECF;
begin
  Result := ChildNodes['refECF'] as IXMLRefECF;
end;

{ TXMLNFrefList }

function TXMLNFrefList.Add: IXMLNFref;
begin
  Result := AddItem(-1) as IXMLNFref;
end;

function TXMLNFrefList.Insert(const Index: Integer): IXMLNFref;
begin
  Result := AddItem(Index) as IXMLNFref;
end;

function TXMLNFrefList.Get_Item(Index: Integer): IXMLNFref;
begin
  Result := List[Index] as IXMLNFref;
end;

{ TXMLRefNF }

function TXMLRefNF.Get_CUF: string;
begin
  Result := ChildNodes['cUF'].Text;
end;

procedure TXMLRefNF.Set_CUF(Value: string);
begin
  ChildNodes['cUF'].NodeValue := Value;
end;

function TXMLRefNF.Get_AAMM: string;
begin
  Result := ChildNodes['AAMM'].Text;
end;

procedure TXMLRefNF.Set_AAMM(Value: string);
begin
  ChildNodes['AAMM'].NodeValue := Value;
end;

function TXMLRefNF.Get_CNPJ: string;
begin
  Result := ChildNodes['CNPJ'].Text;
end;

procedure TXMLRefNF.Set_CNPJ(Value: string);
begin
  ChildNodes['CNPJ'].NodeValue := Value;
end;

function TXMLRefNF.Get_Mod_: string;
begin
  Result := ChildNodes['mod'].Text;
end;

procedure TXMLRefNF.Set_Mod_(Value: string);
begin
  ChildNodes['mod'].NodeValue := Value;
end;

function TXMLRefNF.Get_Serie: string;
begin
  Result := ChildNodes['serie'].Text;
end;

procedure TXMLRefNF.Set_Serie(Value: string);
begin
  ChildNodes['serie'].NodeValue := Value;
end;

function TXMLRefNF.Get_NNF: string;
begin
  Result := ChildNodes['nNF'].Text;
end;

procedure TXMLRefNF.Set_NNF(Value: string);
begin
  ChildNodes['nNF'].NodeValue := Value;
end;

{ TXMLRefNFP }

function TXMLRefNFP.Get_CUF: string;
begin
  Result := ChildNodes['cUF'].Text;
end;

procedure TXMLRefNFP.Set_CUF(Value: string);
begin
  ChildNodes['cUF'].NodeValue := Value;
end;

function TXMLRefNFP.Get_AAMM: string;
begin
  Result := ChildNodes['AAMM'].Text;
end;

procedure TXMLRefNFP.Set_AAMM(Value: string);
begin
  ChildNodes['AAMM'].NodeValue := Value;
end;

function TXMLRefNFP.Get_CNPJ: string;
begin
  Result := ChildNodes['CNPJ'].Text;
end;

procedure TXMLRefNFP.Set_CNPJ(Value: string);
begin
  ChildNodes['CNPJ'].NodeValue := Value;
end;

function TXMLRefNFP.Get_CPF: string;
begin
  Result := ChildNodes['CPF'].Text;
end;

procedure TXMLRefNFP.Set_CPF(Value: string);
begin
  ChildNodes['CPF'].NodeValue := Value;
end;

function TXMLRefNFP.Get_IE: string;
begin
  Result := ChildNodes['IE'].Text;
end;

procedure TXMLRefNFP.Set_IE(Value: string);
begin
  ChildNodes['IE'].NodeValue := Value;
end;

function TXMLRefNFP.Get_Mod_: string;
begin
  Result := ChildNodes['mod'].Text;
end;

procedure TXMLRefNFP.Set_Mod_(Value: string);
begin
  ChildNodes['mod'].NodeValue := Value;
end;

function TXMLRefNFP.Get_Serie: string;
begin
  Result := ChildNodes['serie'].Text;
end;

procedure TXMLRefNFP.Set_Serie(Value: string);
begin
  ChildNodes['serie'].NodeValue := Value;
end;

function TXMLRefNFP.Get_NNF: string;
begin
  Result := ChildNodes['nNF'].Text;
end;

procedure TXMLRefNFP.Set_NNF(Value: string);
begin
  ChildNodes['nNF'].NodeValue := Value;
end;

{ TXMLRefECF }

function TXMLRefECF.Get_Mod_: string;
begin
  Result := ChildNodes['mod'].Text;
end;

procedure TXMLRefECF.Set_Mod_(Value: string);
begin
  ChildNodes['mod'].NodeValue := Value;
end;

function TXMLRefECF.Get_NECF: string;
begin
  Result := ChildNodes['nECF'].Text;
end;

procedure TXMLRefECF.Set_NECF(Value: string);
begin
  ChildNodes['nECF'].NodeValue := Value;
end;

function TXMLRefECF.Get_NCOO: string;
begin
  Result := ChildNodes['nCOO'].Text;
end;

procedure TXMLRefECF.Set_NCOO(Value: string);
begin
  ChildNodes['nCOO'].NodeValue := Value;
end;

{ TXMLEmit }

procedure TXMLEmit.AfterConstruction;
begin
  RegisterChildNode('enderEmit', TXMLTEnderEmi);
  inherited;
end;

function TXMLEmit.Get_CNPJ: string;
begin
  Result := ChildNodes['CNPJ'].Text;
end;

procedure TXMLEmit.Set_CNPJ(Value: string);
begin
  ChildNodes['CNPJ'].NodeValue := Value;
end;

function TXMLEmit.Get_CPF: string;
begin
  Result := ChildNodes['CPF'].Text;
end;

procedure TXMLEmit.Set_CPF(Value: string);
begin
  ChildNodes['CPF'].NodeValue := Value;
end;

function TXMLEmit.Get_XNome: string;
begin
  Result := ChildNodes['xNome'].Text;
end;

procedure TXMLEmit.Set_XNome(Value: string);
begin
  ChildNodes['xNome'].NodeValue := Value;
end;

function TXMLEmit.Get_XFant: string;
begin
  Result := ChildNodes['xFant'].Text;
end;

procedure TXMLEmit.Set_XFant(Value: string);
begin
  ChildNodes['xFant'].NodeValue := Value;
end;

function TXMLEmit.Get_EnderEmit: IXMLTEnderEmi;
begin
  Result := ChildNodes['enderEmit'] as IXMLTEnderEmi;
end;

function TXMLEmit.Get_IE: string;
begin
  Result := ChildNodes['IE'].Text;
end;

procedure TXMLEmit.Set_IE(Value: string);
begin
  ChildNodes['IE'].NodeValue := Value;
end;

function TXMLEmit.Get_IEST: string;
begin
  Result := ChildNodes['IEST'].Text;
end;

procedure TXMLEmit.Set_IEST(Value: string);
begin
  ChildNodes['IEST'].NodeValue := Value;
end;

function TXMLEmit.Get_IM: string;
begin
  Result := ChildNodes['IM'].Text;
end;

procedure TXMLEmit.Set_IM(Value: string);
begin
  ChildNodes['IM'].NodeValue := Value;
end;

function TXMLEmit.Get_CNAE: string;
begin
  Result := ChildNodes['CNAE'].Text;
end;

procedure TXMLEmit.Set_CNAE(Value: string);
begin
  ChildNodes['CNAE'].NodeValue := Value;
end;

function TXMLEmit.Get_CRT: string;
begin
  Result := ChildNodes['CRT'].Text;
end;

procedure TXMLEmit.Set_CRT(Value: string);
begin
  ChildNodes['CRT'].NodeValue := Value;
end;

{ TXMLTEnderEmi }

function TXMLTEnderEmi.Get_XLgr: string;
begin
  Result := ChildNodes['xLgr'].Text;
end;

procedure TXMLTEnderEmi.Set_XLgr(Value: string);
begin
  ChildNodes['xLgr'].NodeValue := Value;
end;

function TXMLTEnderEmi.Get_Nro: string;
begin
  Result := ChildNodes['nro'].Text;
end;

procedure TXMLTEnderEmi.Set_Nro(Value: string);
begin
  ChildNodes['nro'].NodeValue := Value;
end;

function TXMLTEnderEmi.Get_XCpl: string;
begin
  Result := ChildNodes['xCpl'].Text;
end;

procedure TXMLTEnderEmi.Set_XCpl(Value: string);
begin
  ChildNodes['xCpl'].NodeValue := Value;
end;

function TXMLTEnderEmi.Get_XBairro: string;
begin
  Result := ChildNodes['xBairro'].Text;
end;

procedure TXMLTEnderEmi.Set_XBairro(Value: string);
begin
  ChildNodes['xBairro'].NodeValue := Value;
end;

function TXMLTEnderEmi.Get_CMun: string;
begin
  Result := ChildNodes['cMun'].Text;
end;

procedure TXMLTEnderEmi.Set_CMun(Value: string);
begin
  ChildNodes['cMun'].NodeValue := Value;
end;

function TXMLTEnderEmi.Get_XMun: string;
begin
  Result := ChildNodes['xMun'].Text;
end;

procedure TXMLTEnderEmi.Set_XMun(Value: string);
begin
  ChildNodes['xMun'].NodeValue := Value;
end;

function TXMLTEnderEmi.Get_UF: string;
begin
  Result := ChildNodes['UF'].Text;
end;

procedure TXMLTEnderEmi.Set_UF(Value: string);
begin
  ChildNodes['UF'].NodeValue := Value;
end;

function TXMLTEnderEmi.Get_CEP: string;
begin
  Result := ChildNodes['CEP'].Text;
end;

procedure TXMLTEnderEmi.Set_CEP(Value: string);
begin
  ChildNodes['CEP'].NodeValue := Value;
end;

function TXMLTEnderEmi.Get_CPais: string;
begin
  Result := ChildNodes['cPais'].Text;
end;

procedure TXMLTEnderEmi.Set_CPais(Value: string);
begin
  ChildNodes['cPais'].NodeValue := Value;
end;

function TXMLTEnderEmi.Get_XPais: string;
begin
  Result := ChildNodes['xPais'].Text;
end;

procedure TXMLTEnderEmi.Set_XPais(Value: string);
begin
  ChildNodes['xPais'].NodeValue := Value;
end;

function TXMLTEnderEmi.Get_Fone: string;
begin
  Result := ChildNodes['fone'].Text;
end;

procedure TXMLTEnderEmi.Set_Fone(Value: string);
begin
  ChildNodes['fone'].NodeValue := Value;
end;

{ TXMLAvulsa }

function TXMLAvulsa.Get_CNPJ: string;
begin
  Result := ChildNodes['CNPJ'].Text;
end;

procedure TXMLAvulsa.Set_CNPJ(Value: string);
begin
  ChildNodes['CNPJ'].NodeValue := Value;
end;

function TXMLAvulsa.Get_XOrgao: string;
begin
  Result := ChildNodes['xOrgao'].Text;
end;

procedure TXMLAvulsa.Set_XOrgao(Value: string);
begin
  ChildNodes['xOrgao'].NodeValue := Value;
end;

function TXMLAvulsa.Get_Matr: string;
begin
  Result := ChildNodes['matr'].Text;
end;

procedure TXMLAvulsa.Set_Matr(Value: string);
begin
  ChildNodes['matr'].NodeValue := Value;
end;

function TXMLAvulsa.Get_XAgente: string;
begin
  Result := ChildNodes['xAgente'].Text;
end;

procedure TXMLAvulsa.Set_XAgente(Value: string);
begin
  ChildNodes['xAgente'].NodeValue := Value;
end;

function TXMLAvulsa.Get_Fone: string;
begin
  Result := ChildNodes['fone'].Text;
end;

procedure TXMLAvulsa.Set_Fone(Value: string);
begin
  ChildNodes['fone'].NodeValue := Value;
end;

function TXMLAvulsa.Get_UF: string;
begin
  Result := ChildNodes['UF'].Text;
end;

procedure TXMLAvulsa.Set_UF(Value: string);
begin
  ChildNodes['UF'].NodeValue := Value;
end;

function TXMLAvulsa.Get_NDAR: string;
begin
  Result := ChildNodes['nDAR'].Text;
end;

procedure TXMLAvulsa.Set_NDAR(Value: string);
begin
  ChildNodes['nDAR'].NodeValue := Value;
end;

function TXMLAvulsa.Get_DEmi: string;
begin
  Result := ChildNodes['dEmi'].Text;
end;

procedure TXMLAvulsa.Set_DEmi(Value: string);
begin
  ChildNodes['dEmi'].NodeValue := Value;
end;

function TXMLAvulsa.Get_VDAR: string;
begin
  Result := ChildNodes['vDAR'].Text;
end;

procedure TXMLAvulsa.Set_VDAR(Value: string);
begin
  ChildNodes['vDAR'].NodeValue := Value;
end;

function TXMLAvulsa.Get_RepEmi: string;
begin
  Result := ChildNodes['repEmi'].Text;
end;

procedure TXMLAvulsa.Set_RepEmi(Value: string);
begin
  ChildNodes['repEmi'].NodeValue := Value;
end;

function TXMLAvulsa.Get_DPag: string;
begin
  Result := ChildNodes['dPag'].Text;
end;

procedure TXMLAvulsa.Set_DPag(Value: string);
begin
  ChildNodes['dPag'].NodeValue := Value;
end;

{ TXMLDest }

procedure TXMLDest.AfterConstruction;
begin
  RegisterChildNode('enderDest', TXMLTEndereco);
  inherited;
end;

function TXMLDest.Get_CNPJ: string;
begin
  Result := ChildNodes['CNPJ'].Text;
end;

procedure TXMLDest.Set_CNPJ(Value: string);
begin
  ChildNodes['CNPJ'].NodeValue := Value;
end;

function TXMLDest.Get_CPF: string;
begin
  Result := ChildNodes['CPF'].Text;
end;

procedure TXMLDest.Set_CPF(Value: string);
begin
  ChildNodes['CPF'].NodeValue := Value;
end;

function TXMLDest.Get_IdEstrangeiro: string;
begin
  Result := ChildNodes['idEstrangeiro'].Text;
end;

procedure TXMLDest.Set_IdEstrangeiro(Value: string);
begin
  ChildNodes['idEstrangeiro'].NodeValue := Value;
end;

function TXMLDest.Get_XNome: string;
begin
  Result := ChildNodes['xNome'].Text;
end;

procedure TXMLDest.Set_XNome(Value: string);
begin
  ChildNodes['xNome'].NodeValue := Value;
end;

function TXMLDest.Get_EnderDest: IXMLTEndereco;
begin
  Result := ChildNodes['enderDest'] as IXMLTEndereco;
end;

function TXMLDest.Get_IndIEDest: string;
begin
  Result := ChildNodes['indIEDest'].Text;
end;

procedure TXMLDest.Set_IndIEDest(Value: string);
begin
  ChildNodes['indIEDest'].NodeValue := Value;
end;

function TXMLDest.Get_IE: string;
begin
  Result := ChildNodes['IE'].Text;
end;

procedure TXMLDest.Set_IE(Value: string);
begin
  ChildNodes['IE'].NodeValue := Value;
end;

function TXMLDest.Get_ISUF: string;
begin
  Result := ChildNodes['ISUF'].Text;
end;

procedure TXMLDest.Set_ISUF(Value: string);
begin
  ChildNodes['ISUF'].NodeValue := Value;
end;

function TXMLDest.Get_IM: string;
begin
  Result := ChildNodes['IM'].Text;
end;

procedure TXMLDest.Set_IM(Value: string);
begin
  ChildNodes['IM'].NodeValue := Value;
end;

function TXMLDest.Get_Email: string;
begin
  Result := ChildNodes['email'].Text;
end;

procedure TXMLDest.Set_Email(Value: string);
begin
  ChildNodes['email'].NodeValue := Value;
end;

{ TXMLTEndereco }

function TXMLTEndereco.Get_XLgr: string;
begin
  Result := ChildNodes['xLgr'].Text;
end;

procedure TXMLTEndereco.Set_XLgr(Value: string);
begin
  ChildNodes['xLgr'].NodeValue := Value;
end;

function TXMLTEndereco.Get_Nro: string;
begin
  Result := ChildNodes['nro'].Text;
end;

procedure TXMLTEndereco.Set_Nro(Value: string);
begin
  ChildNodes['nro'].NodeValue := Value;
end;

function TXMLTEndereco.Get_XCpl: string;
begin
  Result := ChildNodes['xCpl'].Text;
end;

procedure TXMLTEndereco.Set_XCpl(Value: string);
begin
  ChildNodes['xCpl'].NodeValue := Value;
end;

function TXMLTEndereco.Get_XBairro: string;
begin
  Result := ChildNodes['xBairro'].Text;
end;

procedure TXMLTEndereco.Set_XBairro(Value: string);
begin
  ChildNodes['xBairro'].NodeValue := Value;
end;

function TXMLTEndereco.Get_CMun: string;
begin
  Result := ChildNodes['cMun'].Text;
end;

procedure TXMLTEndereco.Set_CMun(Value: string);
begin
  ChildNodes['cMun'].NodeValue := Value;
end;

function TXMLTEndereco.Get_XMun: string;
begin
  Result := ChildNodes['xMun'].Text;
end;

procedure TXMLTEndereco.Set_XMun(Value: string);
begin
  ChildNodes['xMun'].NodeValue := Value;
end;

function TXMLTEndereco.Get_UF: string;
begin
  Result := ChildNodes['UF'].Text;
end;

procedure TXMLTEndereco.Set_UF(Value: string);
begin
  ChildNodes['UF'].NodeValue := Value;
end;

function TXMLTEndereco.Get_CEP: string;
begin
  Result := ChildNodes['CEP'].Text;
end;

procedure TXMLTEndereco.Set_CEP(Value: string);
begin
  ChildNodes['CEP'].NodeValue := Value;
end;

function TXMLTEndereco.Get_CPais: string;
begin
  Result := ChildNodes['cPais'].Text;
end;

procedure TXMLTEndereco.Set_CPais(Value: string);
begin
  ChildNodes['cPais'].NodeValue := Value;
end;

function TXMLTEndereco.Get_XPais: string;
begin
  Result := ChildNodes['xPais'].Text;
end;

procedure TXMLTEndereco.Set_XPais(Value: string);
begin
  ChildNodes['xPais'].NodeValue := Value;
end;

function TXMLTEndereco.Get_Fone: string;
begin
  Result := ChildNodes['fone'].Text;
end;

procedure TXMLTEndereco.Set_Fone(Value: string);
begin
  ChildNodes['fone'].NodeValue := Value;
end;

{ TXMLTLocal }

function TXMLTLocal.Get_CNPJ: string;
begin
  Result := ChildNodes['CNPJ'].Text;
end;

procedure TXMLTLocal.Set_CNPJ(Value: string);
begin
  ChildNodes['CNPJ'].NodeValue := Value;
end;

function TXMLTLocal.Get_CPF: string;
begin
  Result := ChildNodes['CPF'].Text;
end;

procedure TXMLTLocal.Set_CPF(Value: string);
begin
  ChildNodes['CPF'].NodeValue := Value;
end;

function TXMLTLocal.Get_XNome: string;
begin
  Result := ChildNodes['xNome'].Text;
end;

procedure TXMLTLocal.Set_XNome(Value: string);
begin
  ChildNodes['xNome'].NodeValue := Value;
end;

function TXMLTLocal.Get_XLgr: string;
begin
  Result := ChildNodes['xLgr'].Text;
end;

procedure TXMLTLocal.Set_XLgr(Value: string);
begin
  ChildNodes['xLgr'].NodeValue := Value;
end;

function TXMLTLocal.Get_Nro: string;
begin
  Result := ChildNodes['nro'].Text;
end;

procedure TXMLTLocal.Set_Nro(Value: string);
begin
  ChildNodes['nro'].NodeValue := Value;
end;

function TXMLTLocal.Get_XCpl: string;
begin
  Result := ChildNodes['xCpl'].Text;
end;

procedure TXMLTLocal.Set_XCpl(Value: string);
begin
  ChildNodes['xCpl'].NodeValue := Value;
end;

function TXMLTLocal.Get_XBairro: string;
begin
  Result := ChildNodes['xBairro'].Text;
end;

procedure TXMLTLocal.Set_XBairro(Value: string);
begin
  ChildNodes['xBairro'].NodeValue := Value;
end;

function TXMLTLocal.Get_CMun: string;
begin
  Result := ChildNodes['cMun'].Text;
end;

procedure TXMLTLocal.Set_CMun(Value: string);
begin
  ChildNodes['cMun'].NodeValue := Value;
end;

function TXMLTLocal.Get_XMun: string;
begin
  Result := ChildNodes['xMun'].Text;
end;

procedure TXMLTLocal.Set_XMun(Value: string);
begin
  ChildNodes['xMun'].NodeValue := Value;
end;

function TXMLTLocal.Get_UF: string;
begin
  Result := ChildNodes['UF'].Text;
end;

procedure TXMLTLocal.Set_UF(Value: string);
begin
  ChildNodes['UF'].NodeValue := Value;
end;

function TXMLTLocal.Get_CEP: string;
begin
  Result := ChildNodes['CEP'].Text;
end;

procedure TXMLTLocal.Set_CEP(Value: string);
begin
  ChildNodes['CEP'].NodeValue := Value;
end;

function TXMLTLocal.Get_CPais: string;
begin
  Result := ChildNodes['cPais'].Text;
end;

procedure TXMLTLocal.Set_CPais(Value: string);
begin
  ChildNodes['cPais'].NodeValue := Value;
end;

function TXMLTLocal.Get_XPais: string;
begin
  Result := ChildNodes['xPais'].Text;
end;

procedure TXMLTLocal.Set_XPais(Value: string);
begin
  ChildNodes['xPais'].NodeValue := Value;
end;

function TXMLTLocal.Get_Fone: string;
begin
  Result := ChildNodes['fone'].Text;
end;

procedure TXMLTLocal.Set_Fone(Value: string);
begin
  ChildNodes['fone'].NodeValue := Value;
end;

function TXMLTLocal.Get_Email: string;
begin
  Result := ChildNodes['email'].Text;
end;

procedure TXMLTLocal.Set_Email(Value: string);
begin
  ChildNodes['email'].NodeValue := Value;
end;

function TXMLTLocal.Get_IE: string;
begin
  Result := ChildNodes['IE'].Text;
end;

procedure TXMLTLocal.Set_IE(Value: string);
begin
  ChildNodes['IE'].NodeValue := Value;
end;

{ TXMLAutXML }

function TXMLAutXML.Get_CNPJ: string;
begin
  Result := ChildNodes['CNPJ'].Text;
end;

procedure TXMLAutXML.Set_CNPJ(Value: string);
begin
  ChildNodes['CNPJ'].NodeValue := Value;
end;

function TXMLAutXML.Get_CPF: string;
begin
  Result := ChildNodes['CPF'].Text;
end;

procedure TXMLAutXML.Set_CPF(Value: string);
begin
  ChildNodes['CPF'].NodeValue := Value;
end;

{ TXMLAutXMLList }

function TXMLAutXMLList.Add: IXMLAutXML;
begin
  Result := AddItem(-1) as IXMLAutXML;
end;

function TXMLAutXMLList.Insert(const Index: Integer): IXMLAutXML;
begin
  Result := AddItem(Index) as IXMLAutXML;
end;

function TXMLAutXMLList.Get_Item(Index: Integer): IXMLAutXML;
begin
  Result := List[Index] as IXMLAutXML;
end;

{ TXMLDet }

procedure TXMLDet.AfterConstruction;
begin
  RegisterChildNode('prod', TXMLProd);
  RegisterChildNode('imposto', TXMLImposto);
  RegisterChildNode('impostoDevol', TXMLImpostoDevol);
  inherited;
end;

function TXMLDet.Get_NItem: string;
begin
  Result := AttributeNodes['nItem'].Text;
end;

procedure TXMLDet.Set_NItem(Value: string);
begin
  SetAttribute('nItem', Value);
end;

function TXMLDet.Get_Prod: IXMLProd;
begin
  Result := ChildNodes['prod'] as IXMLProd;
end;

function TXMLDet.Get_Imposto: IXMLImposto;
begin
  Result := ChildNodes['imposto'] as IXMLImposto;
end;

function TXMLDet.Get_ImpostoDevol: IXMLImpostoDevol;
begin
  Result := ChildNodes['impostoDevol'] as IXMLImpostoDevol;
end;

function TXMLDet.Get_InfAdProd: string;
begin
  Result := ChildNodes['infAdProd'].Text;
end;

procedure TXMLDet.Set_InfAdProd(Value: string);
begin
  ChildNodes['infAdProd'].NodeValue := Value;
end;

{ TXMLDetList }

function TXMLDetList.Add: IXMLDet;
begin
  Result := AddItem(-1) as IXMLDet;
end;

function TXMLDetList.Insert(const Index: Integer): IXMLDet;
begin
  Result := AddItem(Index) as IXMLDet;
end;

function TXMLDetList.Get_Item(Index: Integer): IXMLDet;
begin
  Result := List[Index] as IXMLDet;
end;

{ TXMLProd }

procedure TXMLProd.AfterConstruction;
begin
  RegisterChildNode('DI', TXMLDI);
  RegisterChildNode('detExport', TXMLDetExport);
  RegisterChildNode('rastro', TXMLRastro);
  RegisterChildNode('veicProd', TXMLVeicProd);
  RegisterChildNode('med', TXMLMed);
  RegisterChildNode('arma', TXMLArma);
  RegisterChildNode('comb', TXMLComb);
  FNVE := CreateCollection(TXMLNVEList, IXMLNode, 'NVE') as IXMLNVEList;
  FDI := CreateCollection(TXMLDIList, IXMLDI, 'DI') as IXMLDIList;
  FDetExport := CreateCollection(TXMLDetExportList, IXMLDetExport, 'detExport') as IXMLDetExportList;
  FRastro := CreateCollection(TXMLRastroList, IXMLRastro, 'rastro') as IXMLRastroList;
  FArma := CreateCollection(TXMLArmaList, IXMLArma, 'arma') as IXMLArmaList;
  inherited;
end;

function TXMLProd.Get_CProd: string;
begin
  Result := ChildNodes['cProd'].Text;
end;

procedure TXMLProd.Set_CProd(Value: string);
begin
  ChildNodes['cProd'].NodeValue := Value;
end;

function TXMLProd.Get_CEAN: string;
begin
  Result := ChildNodes['cEAN'].Text;
end;

procedure TXMLProd.Set_CEAN(Value: string);
begin
  ChildNodes['cEAN'].NodeValue := Value;
end;

function TXMLProd.Get_XProd: string;
begin
  Result := ChildNodes['xProd'].Text;
end;

procedure TXMLProd.Set_XProd(Value: string);
begin
  ChildNodes['xProd'].NodeValue := Value;
end;

function TXMLProd.Get_NCM: string;
begin
  Result := ChildNodes['NCM'].Text;
end;

procedure TXMLProd.Set_NCM(Value: string);
begin
  ChildNodes['NCM'].NodeValue := Value;
end;

function TXMLProd.Get_NVE: IXMLNVEList;
begin
  Result := FNVE;
end;

function TXMLProd.Get_CEST: string;
begin
  Result := ChildNodes['CEST'].Text;
end;

procedure TXMLProd.Set_CEST(Value: string);
begin
  ChildNodes['CEST'].NodeValue := Value;
end;

function TXMLProd.Get_IndEscala: string;
begin
  Result := ChildNodes['indEscala'].Text;
end;

procedure TXMLProd.Set_IndEscala(Value: string);
begin
  ChildNodes['indEscala'].NodeValue := Value;
end;

function TXMLProd.Get_CNPJFab: string;
begin
  Result := ChildNodes['CNPJFab'].Text;
end;

procedure TXMLProd.Set_CNPJFab(Value: string);
begin
  ChildNodes['CNPJFab'].NodeValue := Value;
end;

function TXMLProd.Get_CBenef: string;
begin
  Result := ChildNodes['cBenef'].Text;
end;

procedure TXMLProd.Set_CBenef(Value: string);
begin
  ChildNodes['cBenef'].NodeValue := Value;
end;

function TXMLProd.Get_EXTIPI: string;
begin
  Result := ChildNodes['EXTIPI'].Text;
end;

procedure TXMLProd.Set_EXTIPI(Value: string);
begin
  ChildNodes['EXTIPI'].NodeValue := Value;
end;

function TXMLProd.Get_CFOP: string;
begin
  Result := ChildNodes['CFOP'].Text;
end;

procedure TXMLProd.Set_CFOP(Value: string);
begin
  ChildNodes['CFOP'].NodeValue := Value;
end;

function TXMLProd.Get_UCom: string;
begin
  Result := ChildNodes['uCom'].Text;
end;

procedure TXMLProd.Set_UCom(Value: string);
begin
  ChildNodes['uCom'].NodeValue := Value;
end;

function TXMLProd.Get_QCom: string;
begin
  Result := ChildNodes['qCom'].Text;
end;

procedure TXMLProd.Set_QCom(Value: string);
begin
  ChildNodes['qCom'].NodeValue := Value;
end;

function TXMLProd.Get_VUnCom: string;
begin
  Result := ChildNodes['vUnCom'].Text;
end;

procedure TXMLProd.Set_VUnCom(Value: string);
begin
  ChildNodes['vUnCom'].NodeValue := Value;
end;

function TXMLProd.Get_VProd: string;
begin
  Result := ChildNodes['vProd'].Text;
end;

procedure TXMLProd.Set_VProd(Value: string);
begin
  ChildNodes['vProd'].NodeValue := Value;
end;

function TXMLProd.Get_CEANTrib: string;
begin
  Result := ChildNodes['cEANTrib'].Text;
end;

procedure TXMLProd.Set_CEANTrib(Value: string);
begin
  ChildNodes['cEANTrib'].NodeValue := Value;
end;

function TXMLProd.Get_UTrib: string;
begin
  Result := ChildNodes['uTrib'].Text;
end;

procedure TXMLProd.Set_UTrib(Value: string);
begin
  ChildNodes['uTrib'].NodeValue := Value;
end;

function TXMLProd.Get_QTrib: string;
begin
  Result := ChildNodes['qTrib'].Text;
end;

procedure TXMLProd.Set_QTrib(Value: string);
begin
  ChildNodes['qTrib'].NodeValue := Value;
end;

function TXMLProd.Get_VUnTrib: string;
begin
  Result := ChildNodes['vUnTrib'].Text;
end;

procedure TXMLProd.Set_VUnTrib(Value: string);
begin
  ChildNodes['vUnTrib'].NodeValue := Value;
end;

function TXMLProd.Get_VFrete: string;
begin
  Result := ChildNodes['vFrete'].Text;
end;

procedure TXMLProd.Set_VFrete(Value: string);
begin
  ChildNodes['vFrete'].NodeValue := Value;
end;

function TXMLProd.Get_VSeg: string;
begin
  Result := ChildNodes['vSeg'].Text;
end;

procedure TXMLProd.Set_VSeg(Value: string);
begin
  ChildNodes['vSeg'].NodeValue := Value;
end;

function TXMLProd.Get_VDesc: string;
begin
  Result := ChildNodes['vDesc'].Text;
end;

procedure TXMLProd.Set_VDesc(Value: string);
begin
  ChildNodes['vDesc'].NodeValue := Value;
end;

function TXMLProd.Get_VOutro: string;
begin
  Result := ChildNodes['vOutro'].Text;
end;

procedure TXMLProd.Set_VOutro(Value: string);
begin
  ChildNodes['vOutro'].NodeValue := Value;
end;

function TXMLProd.Get_IndTot: string;
begin
  Result := ChildNodes['indTot'].Text;
end;

procedure TXMLProd.Set_IndTot(Value: string);
begin
  ChildNodes['indTot'].NodeValue := Value;
end;

function TXMLProd.Get_DI: IXMLDIList;
begin
  Result := FDI;
end;

function TXMLProd.Get_DetExport: IXMLDetExportList;
begin
  Result := FDetExport;
end;

function TXMLProd.Get_XPed: string;
begin
  Result := ChildNodes['xPed'].Text;
end;

procedure TXMLProd.Set_XPed(Value: string);
begin
  ChildNodes['xPed'].NodeValue := Value;
end;

function TXMLProd.Get_NItemPed: string;
begin
  Result := ChildNodes['nItemPed'].Text;
end;

procedure TXMLProd.Set_NItemPed(Value: string);
begin
  ChildNodes['nItemPed'].NodeValue := Value;
end;

function TXMLProd.Get_NFCI: string;
begin
  Result := ChildNodes['nFCI'].Text;
end;

procedure TXMLProd.Set_NFCI(Value: string);
begin
  ChildNodes['nFCI'].NodeValue := Value;
end;

function TXMLProd.Get_Rastro: IXMLRastroList;
begin
  Result := FRastro;
end;

function TXMLProd.Get_VeicProd: IXMLVeicProd;
begin
  Result := ChildNodes['veicProd'] as IXMLVeicProd;
end;

function TXMLProd.Get_Med: IXMLMed;
begin
  Result := ChildNodes['med'] as IXMLMed;
end;

function TXMLProd.Get_Arma: IXMLArmaList;
begin
  Result := FArma;
end;

function TXMLProd.Get_Comb: IXMLComb;
begin
  Result := ChildNodes['comb'] as IXMLComb;
end;

function TXMLProd.Get_NRECOPI: string;
begin
  Result := ChildNodes['nRECOPI'].Text;
end;

procedure TXMLProd.Set_NRECOPI(Value: string);
begin
  ChildNodes['nRECOPI'].NodeValue := Value;
end;

{ TXMLDI }

procedure TXMLDI.AfterConstruction;
begin
  RegisterChildNode('adi', TXMLAdi);
  FAdi := CreateCollection(TXMLAdiList, IXMLAdi, 'adi') as IXMLAdiList;
  inherited;
end;

function TXMLDI.Get_NDI: string;
begin
  Result := ChildNodes['nDI'].Text;
end;

procedure TXMLDI.Set_NDI(Value: string);
begin
  ChildNodes['nDI'].NodeValue := Value;
end;

function TXMLDI.Get_DDI: string;
begin
  Result := ChildNodes['dDI'].Text;
end;

procedure TXMLDI.Set_DDI(Value: string);
begin
  ChildNodes['dDI'].NodeValue := Value;
end;

function TXMLDI.Get_XLocDesemb: string;
begin
  Result := ChildNodes['xLocDesemb'].Text;
end;

procedure TXMLDI.Set_XLocDesemb(Value: string);
begin
  ChildNodes['xLocDesemb'].NodeValue := Value;
end;

function TXMLDI.Get_UFDesemb: string;
begin
  Result := ChildNodes['UFDesemb'].Text;
end;

procedure TXMLDI.Set_UFDesemb(Value: string);
begin
  ChildNodes['UFDesemb'].NodeValue := Value;
end;

function TXMLDI.Get_DDesemb: string;
begin
  Result := ChildNodes['dDesemb'].Text;
end;

procedure TXMLDI.Set_DDesemb(Value: string);
begin
  ChildNodes['dDesemb'].NodeValue := Value;
end;

function TXMLDI.Get_TpViaTransp: string;
begin
  Result := ChildNodes['tpViaTransp'].Text;
end;

procedure TXMLDI.Set_TpViaTransp(Value: string);
begin
  ChildNodes['tpViaTransp'].NodeValue := Value;
end;

function TXMLDI.Get_VAFRMM: string;
begin
  Result := ChildNodes['vAFRMM'].Text;
end;

procedure TXMLDI.Set_VAFRMM(Value: string);
begin
  ChildNodes['vAFRMM'].NodeValue := Value;
end;

function TXMLDI.Get_TpIntermedio: string;
begin
  Result := ChildNodes['tpIntermedio'].Text;
end;

procedure TXMLDI.Set_TpIntermedio(Value: string);
begin
  ChildNodes['tpIntermedio'].NodeValue := Value;
end;

function TXMLDI.Get_CNPJ: string;
begin
  Result := ChildNodes['CNPJ'].Text;
end;

procedure TXMLDI.Set_CNPJ(Value: string);
begin
  ChildNodes['CNPJ'].NodeValue := Value;
end;

function TXMLDI.Get_UFTerceiro: string;
begin
  Result := ChildNodes['UFTerceiro'].Text;
end;

procedure TXMLDI.Set_UFTerceiro(Value: string);
begin
  ChildNodes['UFTerceiro'].NodeValue := Value;
end;

function TXMLDI.Get_CExportador: string;
begin
  Result := ChildNodes['cExportador'].Text;
end;

procedure TXMLDI.Set_CExportador(Value: string);
begin
  ChildNodes['cExportador'].NodeValue := Value;
end;

function TXMLDI.Get_Adi: IXMLAdiList;
begin
  Result := FAdi;
end;

{ TXMLDIList }

function TXMLDIList.Add: IXMLDI;
begin
  Result := AddItem(-1) as IXMLDI;
end;

function TXMLDIList.Insert(const Index: Integer): IXMLDI;
begin
  Result := AddItem(Index) as IXMLDI;
end;

function TXMLDIList.Get_Item(Index: Integer): IXMLDI;
begin
  Result := List[Index] as IXMLDI;
end;

{ TXMLAdi }

function TXMLAdi.Get_NAdicao: string;
begin
  Result := ChildNodes['nAdicao'].Text;
end;

procedure TXMLAdi.Set_NAdicao(Value: string);
begin
  ChildNodes['nAdicao'].NodeValue := Value;
end;

function TXMLAdi.Get_NSeqAdic: string;
begin
  Result := ChildNodes['nSeqAdic'].Text;
end;

procedure TXMLAdi.Set_NSeqAdic(Value: string);
begin
  ChildNodes['nSeqAdic'].NodeValue := Value;
end;

function TXMLAdi.Get_CFabricante: string;
begin
  Result := ChildNodes['cFabricante'].Text;
end;

procedure TXMLAdi.Set_CFabricante(Value: string);
begin
  ChildNodes['cFabricante'].NodeValue := Value;
end;

function TXMLAdi.Get_VDescDI: string;
begin
  Result := ChildNodes['vDescDI'].Text;
end;

procedure TXMLAdi.Set_VDescDI(Value: string);
begin
  ChildNodes['vDescDI'].NodeValue := Value;
end;

function TXMLAdi.Get_NDraw: string;
begin
  Result := ChildNodes['nDraw'].Text;
end;

procedure TXMLAdi.Set_NDraw(Value: string);
begin
  ChildNodes['nDraw'].NodeValue := Value;
end;

{ TXMLAdiList }

function TXMLAdiList.Add: IXMLAdi;
begin
  Result := AddItem(-1) as IXMLAdi;
end;

function TXMLAdiList.Insert(const Index: Integer): IXMLAdi;
begin
  Result := AddItem(Index) as IXMLAdi;
end;

function TXMLAdiList.Get_Item(Index: Integer): IXMLAdi;
begin
  Result := List[Index] as IXMLAdi;
end;

{ TXMLDetExport }

procedure TXMLDetExport.AfterConstruction;
begin
  RegisterChildNode('exportInd', TXMLExportInd);
  inherited;
end;

function TXMLDetExport.Get_NDraw: string;
begin
  Result := ChildNodes['nDraw'].Text;
end;

procedure TXMLDetExport.Set_NDraw(Value: string);
begin
  ChildNodes['nDraw'].NodeValue := Value;
end;

function TXMLDetExport.Get_ExportInd: IXMLExportInd;
begin
  Result := ChildNodes['exportInd'] as IXMLExportInd;
end;

{ TXMLDetExportList }

function TXMLDetExportList.Add: IXMLDetExport;
begin
  Result := AddItem(-1) as IXMLDetExport;
end;

function TXMLDetExportList.Insert(const Index: Integer): IXMLDetExport;
begin
  Result := AddItem(Index) as IXMLDetExport;
end;

function TXMLDetExportList.Get_Item(Index: Integer): IXMLDetExport;
begin
  Result := List[Index] as IXMLDetExport;
end;

{ TXMLExportInd }

function TXMLExportInd.Get_NRE: string;
begin
  Result := ChildNodes['nRE'].Text;
end;

procedure TXMLExportInd.Set_NRE(Value: string);
begin
  ChildNodes['nRE'].NodeValue := Value;
end;

function TXMLExportInd.Get_ChNFe: string;
begin
  Result := ChildNodes['chNFe'].Text;
end;

procedure TXMLExportInd.Set_ChNFe(Value: string);
begin
  ChildNodes['chNFe'].NodeValue := Value;
end;

function TXMLExportInd.Get_QExport: string;
begin
  Result := ChildNodes['qExport'].Text;
end;

procedure TXMLExportInd.Set_QExport(Value: string);
begin
  ChildNodes['qExport'].NodeValue := Value;
end;

{ TXMLRastro }

function TXMLRastro.Get_NLote: string;
begin
  Result := ChildNodes['nLote'].Text;
end;

procedure TXMLRastro.Set_NLote(Value: string);
begin
  ChildNodes['nLote'].NodeValue := Value;
end;

function TXMLRastro.Get_QLote: string;
begin
  Result := ChildNodes['qLote'].Text;
end;

procedure TXMLRastro.Set_QLote(Value: string);
begin
  ChildNodes['qLote'].NodeValue := Value;
end;

function TXMLRastro.Get_DFab: string;
begin
  Result := ChildNodes['dFab'].Text;
end;

procedure TXMLRastro.Set_DFab(Value: string);
begin
  ChildNodes['dFab'].NodeValue := Value;
end;

function TXMLRastro.Get_DVal: string;
begin
  Result := ChildNodes['dVal'].Text;
end;

procedure TXMLRastro.Set_DVal(Value: string);
begin
  ChildNodes['dVal'].NodeValue := Value;
end;

function TXMLRastro.Get_CAgreg: string;
begin
  Result := ChildNodes['cAgreg'].Text;
end;

procedure TXMLRastro.Set_CAgreg(Value: string);
begin
  ChildNodes['cAgreg'].NodeValue := Value;
end;

{ TXMLRastroList }

function TXMLRastroList.Add: IXMLRastro;
begin
  Result := AddItem(-1) as IXMLRastro;
end;

function TXMLRastroList.Insert(const Index: Integer): IXMLRastro;
begin
  Result := AddItem(Index) as IXMLRastro;
end;

function TXMLRastroList.Get_Item(Index: Integer): IXMLRastro;
begin
  Result := List[Index] as IXMLRastro;
end;

{ TXMLVeicProd }

function TXMLVeicProd.Get_TpOp: string;
begin
  Result := ChildNodes['tpOp'].Text;
end;

procedure TXMLVeicProd.Set_TpOp(Value: string);
begin
  ChildNodes['tpOp'].NodeValue := Value;
end;

function TXMLVeicProd.Get_Chassi: string;
begin
  Result := ChildNodes['chassi'].Text;
end;

procedure TXMLVeicProd.Set_Chassi(Value: string);
begin
  ChildNodes['chassi'].NodeValue := Value;
end;

function TXMLVeicProd.Get_CCor: string;
begin
  Result := ChildNodes['cCor'].Text;
end;

procedure TXMLVeicProd.Set_CCor(Value: string);
begin
  ChildNodes['cCor'].NodeValue := Value;
end;

function TXMLVeicProd.Get_XCor: string;
begin
  Result := ChildNodes['xCor'].Text;
end;

procedure TXMLVeicProd.Set_XCor(Value: string);
begin
  ChildNodes['xCor'].NodeValue := Value;
end;

function TXMLVeicProd.Get_Pot: string;
begin
  Result := ChildNodes['pot'].Text;
end;

procedure TXMLVeicProd.Set_Pot(Value: string);
begin
  ChildNodes['pot'].NodeValue := Value;
end;

function TXMLVeicProd.Get_Cilin: string;
begin
  Result := ChildNodes['cilin'].Text;
end;

procedure TXMLVeicProd.Set_Cilin(Value: string);
begin
  ChildNodes['cilin'].NodeValue := Value;
end;

function TXMLVeicProd.Get_PesoL: string;
begin
  Result := ChildNodes['pesoL'].Text;
end;

procedure TXMLVeicProd.Set_PesoL(Value: string);
begin
  ChildNodes['pesoL'].NodeValue := Value;
end;

function TXMLVeicProd.Get_PesoB: string;
begin
  Result := ChildNodes['pesoB'].Text;
end;

procedure TXMLVeicProd.Set_PesoB(Value: string);
begin
  ChildNodes['pesoB'].NodeValue := Value;
end;

function TXMLVeicProd.Get_NSerie: string;
begin
  Result := ChildNodes['nSerie'].Text;
end;

procedure TXMLVeicProd.Set_NSerie(Value: string);
begin
  ChildNodes['nSerie'].NodeValue := Value;
end;

function TXMLVeicProd.Get_TpComb: string;
begin
  Result := ChildNodes['tpComb'].Text;
end;

procedure TXMLVeicProd.Set_TpComb(Value: string);
begin
  ChildNodes['tpComb'].NodeValue := Value;
end;

function TXMLVeicProd.Get_NMotor: string;
begin
  Result := ChildNodes['nMotor'].Text;
end;

procedure TXMLVeicProd.Set_NMotor(Value: string);
begin
  ChildNodes['nMotor'].NodeValue := Value;
end;

function TXMLVeicProd.Get_CMT: string;
begin
  Result := ChildNodes['CMT'].Text;
end;

procedure TXMLVeicProd.Set_CMT(Value: string);
begin
  ChildNodes['CMT'].NodeValue := Value;
end;

function TXMLVeicProd.Get_Dist: string;
begin
  Result := ChildNodes['dist'].Text;
end;

procedure TXMLVeicProd.Set_Dist(Value: string);
begin
  ChildNodes['dist'].NodeValue := Value;
end;

function TXMLVeicProd.Get_AnoMod: string;
begin
  Result := ChildNodes['anoMod'].Text;
end;

procedure TXMLVeicProd.Set_AnoMod(Value: string);
begin
  ChildNodes['anoMod'].NodeValue := Value;
end;

function TXMLVeicProd.Get_AnoFab: string;
begin
  Result := ChildNodes['anoFab'].Text;
end;

procedure TXMLVeicProd.Set_AnoFab(Value: string);
begin
  ChildNodes['anoFab'].NodeValue := Value;
end;

function TXMLVeicProd.Get_TpPint: string;
begin
  Result := ChildNodes['tpPint'].Text;
end;

procedure TXMLVeicProd.Set_TpPint(Value: string);
begin
  ChildNodes['tpPint'].NodeValue := Value;
end;

function TXMLVeicProd.Get_TpVeic: string;
begin
  Result := ChildNodes['tpVeic'].Text;
end;

procedure TXMLVeicProd.Set_TpVeic(Value: string);
begin
  ChildNodes['tpVeic'].NodeValue := Value;
end;

function TXMLVeicProd.Get_EspVeic: string;
begin
  Result := ChildNodes['espVeic'].Text;
end;

procedure TXMLVeicProd.Set_EspVeic(Value: string);
begin
  ChildNodes['espVeic'].NodeValue := Value;
end;

function TXMLVeicProd.Get_VIN: string;
begin
  Result := ChildNodes['VIN'].Text;
end;

procedure TXMLVeicProd.Set_VIN(Value: string);
begin
  ChildNodes['VIN'].NodeValue := Value;
end;

function TXMLVeicProd.Get_CondVeic: string;
begin
  Result := ChildNodes['condVeic'].Text;
end;

procedure TXMLVeicProd.Set_CondVeic(Value: string);
begin
  ChildNodes['condVeic'].NodeValue := Value;
end;

function TXMLVeicProd.Get_CMod: string;
begin
  Result := ChildNodes['cMod'].Text;
end;

procedure TXMLVeicProd.Set_CMod(Value: string);
begin
  ChildNodes['cMod'].NodeValue := Value;
end;

function TXMLVeicProd.Get_CCorDENATRAN: string;
begin
  Result := ChildNodes['cCorDENATRAN'].Text;
end;

procedure TXMLVeicProd.Set_CCorDENATRAN(Value: string);
begin
  ChildNodes['cCorDENATRAN'].NodeValue := Value;
end;

function TXMLVeicProd.Get_Lota: string;
begin
  Result := ChildNodes['lota'].Text;
end;

procedure TXMLVeicProd.Set_Lota(Value: string);
begin
  ChildNodes['lota'].NodeValue := Value;
end;

function TXMLVeicProd.Get_TpRest: string;
begin
  Result := ChildNodes['tpRest'].Text;
end;

procedure TXMLVeicProd.Set_TpRest(Value: string);
begin
  ChildNodes['tpRest'].NodeValue := Value;
end;

{ TXMLMed }

function TXMLMed.Get_CProdANVISA: string;
begin
  Result := ChildNodes['cProdANVISA'].Text;
end;

procedure TXMLMed.Set_CProdANVISA(Value: string);
begin
  ChildNodes['cProdANVISA'].NodeValue := Value;
end;

function TXMLMed.Get_XMotivoIsencao: string;
begin
  Result := ChildNodes['xMotivoIsencao'].Text;
end;

procedure TXMLMed.Set_XMotivoIsencao(Value: string);
begin
  ChildNodes['xMotivoIsencao'].NodeValue := Value;
end;

function TXMLMed.Get_VPMC: string;
begin
  Result := ChildNodes['vPMC'].Text;
end;

procedure TXMLMed.Set_VPMC(Value: string);
begin
  ChildNodes['vPMC'].NodeValue := Value;
end;

{ TXMLArma }

function TXMLArma.Get_TpArma: string;
begin
  Result := ChildNodes['tpArma'].Text;
end;

procedure TXMLArma.Set_TpArma(Value: string);
begin
  ChildNodes['tpArma'].NodeValue := Value;
end;

function TXMLArma.Get_NSerie: string;
begin
  Result := ChildNodes['nSerie'].Text;
end;

procedure TXMLArma.Set_NSerie(Value: string);
begin
  ChildNodes['nSerie'].NodeValue := Value;
end;

function TXMLArma.Get_NCano: string;
begin
  Result := ChildNodes['nCano'].Text;
end;

procedure TXMLArma.Set_NCano(Value: string);
begin
  ChildNodes['nCano'].NodeValue := Value;
end;

function TXMLArma.Get_Descr: string;
begin
  Result := ChildNodes['descr'].Text;
end;

procedure TXMLArma.Set_Descr(Value: string);
begin
  ChildNodes['descr'].NodeValue := Value;
end;

{ TXMLArmaList }

function TXMLArmaList.Add: IXMLArma;
begin
  Result := AddItem(-1) as IXMLArma;
end;

function TXMLArmaList.Insert(const Index: Integer): IXMLArma;
begin
  Result := AddItem(Index) as IXMLArma;
end;

function TXMLArmaList.Get_Item(Index: Integer): IXMLArma;
begin
  Result := List[Index] as IXMLArma;
end;

{ TXMLComb }

procedure TXMLComb.AfterConstruction;
begin
  RegisterChildNode('CIDE', TXMLCIDE);
  RegisterChildNode('encerrante', TXMLEncerrante);
  inherited;
end;

function TXMLComb.Get_CProdANP: string;
begin
  Result := ChildNodes['cProdANP'].Text;
end;

procedure TXMLComb.Set_CProdANP(Value: string);
begin
  ChildNodes['cProdANP'].NodeValue := Value;
end;

function TXMLComb.Get_DescANP: string;
begin
  Result := ChildNodes['descANP'].Text;
end;

procedure TXMLComb.Set_DescANP(Value: string);
begin
  ChildNodes['descANP'].NodeValue := Value;
end;

function TXMLComb.Get_PGLP: string;
begin
  Result := ChildNodes['pGLP'].Text;
end;

procedure TXMLComb.Set_PGLP(Value: string);
begin
  ChildNodes['pGLP'].NodeValue := Value;
end;

function TXMLComb.Get_PGNn: string;
begin
  Result := ChildNodes['pGNn'].Text;
end;

procedure TXMLComb.Set_PGNn(Value: string);
begin
  ChildNodes['pGNn'].NodeValue := Value;
end;

function TXMLComb.Get_PGNi: string;
begin
  Result := ChildNodes['pGNi'].Text;
end;

procedure TXMLComb.Set_PGNi(Value: string);
begin
  ChildNodes['pGNi'].NodeValue := Value;
end;

function TXMLComb.Get_VPart: string;
begin
  Result := ChildNodes['vPart'].Text;
end;

procedure TXMLComb.Set_VPart(Value: string);
begin
  ChildNodes['vPart'].NodeValue := Value;
end;

function TXMLComb.Get_CODIF: string;
begin
  Result := ChildNodes['CODIF'].Text;
end;

procedure TXMLComb.Set_CODIF(Value: string);
begin
  ChildNodes['CODIF'].NodeValue := Value;
end;

function TXMLComb.Get_QTemp: string;
begin
  Result := ChildNodes['qTemp'].Text;
end;

procedure TXMLComb.Set_QTemp(Value: string);
begin
  ChildNodes['qTemp'].NodeValue := Value;
end;

function TXMLComb.Get_UFCons: string;
begin
  Result := ChildNodes['UFCons'].Text;
end;

procedure TXMLComb.Set_UFCons(Value: string);
begin
  ChildNodes['UFCons'].NodeValue := Value;
end;

function TXMLComb.Get_CIDE: IXMLCIDE;
begin
  Result := ChildNodes['CIDE'] as IXMLCIDE;
end;

function TXMLComb.Get_Encerrante: IXMLEncerrante;
begin
  Result := ChildNodes['encerrante'] as IXMLEncerrante;
end;

{ TXMLCIDE }

function TXMLCIDE.Get_QBCProd: string;
begin
  Result := ChildNodes['qBCProd'].Text;
end;

procedure TXMLCIDE.Set_QBCProd(Value: string);
begin
  ChildNodes['qBCProd'].NodeValue := Value;
end;

function TXMLCIDE.Get_VAliqProd: string;
begin
  Result := ChildNodes['vAliqProd'].Text;
end;

procedure TXMLCIDE.Set_VAliqProd(Value: string);
begin
  ChildNodes['vAliqProd'].NodeValue := Value;
end;

function TXMLCIDE.Get_VCIDE: string;
begin
  Result := ChildNodes['vCIDE'].Text;
end;

procedure TXMLCIDE.Set_VCIDE(Value: string);
begin
  ChildNodes['vCIDE'].NodeValue := Value;
end;

{ TXMLEncerrante }

function TXMLEncerrante.Get_NBico: string;
begin
  Result := ChildNodes['nBico'].Text;
end;

procedure TXMLEncerrante.Set_NBico(Value: string);
begin
  ChildNodes['nBico'].NodeValue := Value;
end;

function TXMLEncerrante.Get_NBomba: string;
begin
  Result := ChildNodes['nBomba'].Text;
end;

procedure TXMLEncerrante.Set_NBomba(Value: string);
begin
  ChildNodes['nBomba'].NodeValue := Value;
end;

function TXMLEncerrante.Get_NTanque: string;
begin
  Result := ChildNodes['nTanque'].Text;
end;

procedure TXMLEncerrante.Set_NTanque(Value: string);
begin
  ChildNodes['nTanque'].NodeValue := Value;
end;

function TXMLEncerrante.Get_VEncIni: string;
begin
  Result := ChildNodes['vEncIni'].Text;
end;

procedure TXMLEncerrante.Set_VEncIni(Value: string);
begin
  ChildNodes['vEncIni'].NodeValue := Value;
end;

function TXMLEncerrante.Get_VEncFin: string;
begin
  Result := ChildNodes['vEncFin'].Text;
end;

procedure TXMLEncerrante.Set_VEncFin(Value: string);
begin
  ChildNodes['vEncFin'].NodeValue := Value;
end;

{ TXMLImposto }

procedure TXMLImposto.AfterConstruction;
begin
  RegisterChildNode('ICMS', TXMLICMS);
  RegisterChildNode('IPI', TXMLTIpi);
  RegisterChildNode('II', TXMLII);
  RegisterChildNode('ISSQN', TXMLISSQN);
  RegisterChildNode('PIS', TXMLPIS);
  RegisterChildNode('PISST', TXMLPISST);
  RegisterChildNode('COFINS', TXMLCOFINS);
  RegisterChildNode('COFINSST', TXMLCOFINSST);
  RegisterChildNode('ICMSUFDest', TXMLICMSUFDest);
  inherited;
end;

function TXMLImposto.Get_VTotTrib: string;
begin
  Result := ChildNodes['vTotTrib'].Text;
end;

procedure TXMLImposto.Set_VTotTrib(Value: string);
begin
  ChildNodes['vTotTrib'].NodeValue := Value;
end;

function TXMLImposto.Get_ICMS: IXMLICMS;
begin
  Result := ChildNodes['ICMS'] as IXMLICMS;
end;

function TXMLImposto.Get_IPI: IXMLTIpi;
begin
  Result := ChildNodes['IPI'] as IXMLTIpi;
end;

function TXMLImposto.Get_II: IXMLII;
begin
  Result := ChildNodes['II'] as IXMLII;
end;

function TXMLImposto.Get_ISSQN: IXMLISSQN;
begin
  Result := ChildNodes['ISSQN'] as IXMLISSQN;
end;

function TXMLImposto.Get_PIS: IXMLPIS;
begin
  Result := ChildNodes['PIS'] as IXMLPIS;
end;

function TXMLImposto.Get_PISST: IXMLPISST;
begin
  Result := ChildNodes['PISST'] as IXMLPISST;
end;

function TXMLImposto.Get_COFINS: IXMLCOFINS;
begin
  Result := ChildNodes['COFINS'] as IXMLCOFINS;
end;

function TXMLImposto.Get_COFINSST: IXMLCOFINSST;
begin
  Result := ChildNodes['COFINSST'] as IXMLCOFINSST;
end;

function TXMLImposto.Get_ICMSUFDest: IXMLICMSUFDest;
begin
  Result := ChildNodes['ICMSUFDest'] as IXMLICMSUFDest;
end;

{ TXMLICMS }

procedure TXMLICMS.AfterConstruction;
begin
  RegisterChildNode('ICMS00', TXMLICMS00);
  RegisterChildNode('ICMS10', TXMLICMS10);
  RegisterChildNode('ICMS20', TXMLICMS20);
  RegisterChildNode('ICMS30', TXMLICMS30);
  RegisterChildNode('ICMS40', TXMLICMS40);
  RegisterChildNode('ICMS51', TXMLICMS51);
  RegisterChildNode('ICMS60', TXMLICMS60);
  RegisterChildNode('ICMS70', TXMLICMS70);
  RegisterChildNode('ICMS90', TXMLICMS90);
  RegisterChildNode('ICMSPart', TXMLICMSPart);
  RegisterChildNode('ICMSST', TXMLICMSST);
  RegisterChildNode('ICMSSN101', TXMLICMSSN101);
  RegisterChildNode('ICMSSN102', TXMLICMSSN102);
  RegisterChildNode('ICMSSN201', TXMLICMSSN201);
  RegisterChildNode('ICMSSN202', TXMLICMSSN202);
  RegisterChildNode('ICMSSN500', TXMLICMSSN500);
  RegisterChildNode('ICMSSN900', TXMLICMSSN900);
  inherited;
end;

function TXMLICMS.Get_ICMS00: IXMLICMS00;
begin
  Result := ChildNodes['ICMS00'] as IXMLICMS00;
end;

function TXMLICMS.Get_ICMS10: IXMLICMS10;
begin
  Result := ChildNodes['ICMS10'] as IXMLICMS10;
end;

function TXMLICMS.Get_ICMS20: IXMLICMS20;
begin
  Result := ChildNodes['ICMS20'] as IXMLICMS20;
end;

function TXMLICMS.Get_ICMS30: IXMLICMS30;
begin
  Result := ChildNodes['ICMS30'] as IXMLICMS30;
end;

function TXMLICMS.Get_ICMS40: IXMLICMS40;
begin
  Result := ChildNodes['ICMS40'] as IXMLICMS40;
end;

function TXMLICMS.Get_ICMS51: IXMLICMS51;
begin
  Result := ChildNodes['ICMS51'] as IXMLICMS51;
end;

function TXMLICMS.Get_ICMS60: IXMLICMS60;
begin
  Result := ChildNodes['ICMS60'] as IXMLICMS60;
end;

function TXMLICMS.Get_ICMS70: IXMLICMS70;
begin
  Result := ChildNodes['ICMS70'] as IXMLICMS70;
end;

function TXMLICMS.Get_ICMS90: IXMLICMS90;
begin
  Result := ChildNodes['ICMS90'] as IXMLICMS90;
end;

function TXMLICMS.Get_ICMSPart: IXMLICMSPart;
begin
  Result := ChildNodes['ICMSPart'] as IXMLICMSPart;
end;

function TXMLICMS.Get_ICMSST: IXMLICMSST;
begin
  Result := ChildNodes['ICMSST'] as IXMLICMSST;
end;

function TXMLICMS.Get_ICMSSN101: IXMLICMSSN101;
begin
  Result := ChildNodes['ICMSSN101'] as IXMLICMSSN101;
end;

function TXMLICMS.Get_ICMSSN102: IXMLICMSSN102;
begin
  Result := ChildNodes['ICMSSN102'] as IXMLICMSSN102;
end;

function TXMLICMS.Get_ICMSSN201: IXMLICMSSN201;
begin
  Result := ChildNodes['ICMSSN201'] as IXMLICMSSN201;
end;

function TXMLICMS.Get_ICMSSN202: IXMLICMSSN202;
begin
  Result := ChildNodes['ICMSSN202'] as IXMLICMSSN202;
end;

function TXMLICMS.Get_ICMSSN500: IXMLICMSSN500;
begin
  Result := ChildNodes['ICMSSN500'] as IXMLICMSSN500;
end;

function TXMLICMS.Get_ICMSSN900: IXMLICMSSN900;
begin
  Result := ChildNodes['ICMSSN900'] as IXMLICMSSN900;
end;

{ TXMLICMS00 }

function TXMLICMS00.Get_Orig: string;
begin
  Result := ChildNodes['orig'].Text;
end;

procedure TXMLICMS00.Set_Orig(Value: string);
begin
  ChildNodes['orig'].NodeValue := Value;
end;

function TXMLICMS00.Get_CST: string;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLICMS00.Set_CST(Value: string);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLICMS00.Get_ModBC: string;
begin
  Result := ChildNodes['modBC'].Text;
end;

procedure TXMLICMS00.Set_ModBC(Value: string);
begin
  ChildNodes['modBC'].NodeValue := Value;
end;

function TXMLICMS00.Get_VBC: string;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLICMS00.Set_VBC(Value: string);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLICMS00.Get_PICMS: string;
begin
  Result := ChildNodes['pICMS'].Text;
end;

procedure TXMLICMS00.Set_PICMS(Value: string);
begin
  ChildNodes['pICMS'].NodeValue := Value;
end;

function TXMLICMS00.Get_VICMS: string;
begin
  Result := ChildNodes['vICMS'].Text;
end;

procedure TXMLICMS00.Set_VICMS(Value: string);
begin
  ChildNodes['vICMS'].NodeValue := Value;
end;

function TXMLICMS00.Get_PFCP: string;
begin
  Result := ChildNodes['pFCP'].Text;
end;

procedure TXMLICMS00.Set_PFCP(Value: string);
begin
  ChildNodes['pFCP'].NodeValue := Value;
end;

function TXMLICMS00.Get_VFCP: string;
begin
  Result := ChildNodes['vFCP'].Text;
end;

procedure TXMLICMS00.Set_VFCP(Value: string);
begin
  ChildNodes['vFCP'].NodeValue := Value;
end;

{ TXMLICMS10 }

function TXMLICMS10.Get_Orig: string;
begin
  Result := ChildNodes['orig'].Text;
end;

procedure TXMLICMS10.Set_Orig(Value: string);
begin
  ChildNodes['orig'].NodeValue := Value;
end;

function TXMLICMS10.Get_CST: string;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLICMS10.Set_CST(Value: string);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLICMS10.Get_ModBC: string;
begin
  Result := ChildNodes['modBC'].Text;
end;

procedure TXMLICMS10.Set_ModBC(Value: string);
begin
  ChildNodes['modBC'].NodeValue := Value;
end;

function TXMLICMS10.Get_VBC: string;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLICMS10.Set_VBC(Value: string);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLICMS10.Get_PICMS: string;
begin
  Result := ChildNodes['pICMS'].Text;
end;

procedure TXMLICMS10.Set_PICMS(Value: string);
begin
  ChildNodes['pICMS'].NodeValue := Value;
end;

function TXMLICMS10.Get_VICMS: string;
begin
  Result := ChildNodes['vICMS'].Text;
end;

procedure TXMLICMS10.Set_VICMS(Value: string);
begin
  ChildNodes['vICMS'].NodeValue := Value;
end;

function TXMLICMS10.Get_VBCFCP: string;
begin
  Result := ChildNodes['vBCFCP'].Text;
end;

procedure TXMLICMS10.Set_VBCFCP(Value: string);
begin
  ChildNodes['vBCFCP'].NodeValue := Value;
end;

function TXMLICMS10.Get_PFCP: string;
begin
  Result := ChildNodes['pFCP'].Text;
end;

procedure TXMLICMS10.Set_PFCP(Value: string);
begin
  ChildNodes['pFCP'].NodeValue := Value;
end;

function TXMLICMS10.Get_VFCP: string;
begin
  Result := ChildNodes['vFCP'].Text;
end;

procedure TXMLICMS10.Set_VFCP(Value: string);
begin
  ChildNodes['vFCP'].NodeValue := Value;
end;

function TXMLICMS10.Get_ModBCST: string;
begin
  Result := ChildNodes['modBCST'].Text;
end;

procedure TXMLICMS10.Set_ModBCST(Value: string);
begin
  ChildNodes['modBCST'].NodeValue := Value;
end;

function TXMLICMS10.Get_PMVAST: string;
begin
  Result := ChildNodes['pMVAST'].Text;
end;

procedure TXMLICMS10.Set_PMVAST(Value: string);
begin
  ChildNodes['pMVAST'].NodeValue := Value;
end;

function TXMLICMS10.Get_PRedBCST: string;
begin
  Result := ChildNodes['pRedBCST'].Text;
end;

procedure TXMLICMS10.Set_PRedBCST(Value: string);
begin
  ChildNodes['pRedBCST'].NodeValue := Value;
end;

function TXMLICMS10.Get_VBCST: string;
begin
  Result := ChildNodes['vBCST'].Text;
end;

procedure TXMLICMS10.Set_VBCST(Value: string);
begin
  ChildNodes['vBCST'].NodeValue := Value;
end;

function TXMLICMS10.Get_PICMSST: string;
begin
  Result := ChildNodes['pICMSST'].Text;
end;

procedure TXMLICMS10.Set_PICMSST(Value: string);
begin
  ChildNodes['pICMSST'].NodeValue := Value;
end;

function TXMLICMS10.Get_VICMSST: string;
begin
  Result := ChildNodes['vICMSST'].Text;
end;

procedure TXMLICMS10.Set_VICMSST(Value: string);
begin
  ChildNodes['vICMSST'].NodeValue := Value;
end;

function TXMLICMS10.Get_VBCFCPST: string;
begin
  Result := ChildNodes['vBCFCPST'].Text;
end;

procedure TXMLICMS10.Set_VBCFCPST(Value: string);
begin
  ChildNodes['vBCFCPST'].NodeValue := Value;
end;

function TXMLICMS10.Get_PFCPST: string;
begin
  Result := ChildNodes['pFCPST'].Text;
end;

procedure TXMLICMS10.Set_PFCPST(Value: string);
begin
  ChildNodes['pFCPST'].NodeValue := Value;
end;

function TXMLICMS10.Get_VFCPST: string;
begin
  Result := ChildNodes['vFCPST'].Text;
end;

procedure TXMLICMS10.Set_VFCPST(Value: string);
begin
  ChildNodes['vFCPST'].NodeValue := Value;
end;

{ TXMLICMS20 }

function TXMLICMS20.Get_Orig: string;
begin
  Result := ChildNodes['orig'].Text;
end;

procedure TXMLICMS20.Set_Orig(Value: string);
begin
  ChildNodes['orig'].NodeValue := Value;
end;

function TXMLICMS20.Get_CST: string;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLICMS20.Set_CST(Value: string);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLICMS20.Get_ModBC: string;
begin
  Result := ChildNodes['modBC'].Text;
end;

procedure TXMLICMS20.Set_ModBC(Value: string);
begin
  ChildNodes['modBC'].NodeValue := Value;
end;

function TXMLICMS20.Get_PRedBC: string;
begin
  Result := ChildNodes['pRedBC'].Text;
end;

procedure TXMLICMS20.Set_PRedBC(Value: string);
begin
  ChildNodes['pRedBC'].NodeValue := Value;
end;

function TXMLICMS20.Get_VBC: string;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLICMS20.Set_VBC(Value: string);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLICMS20.Get_PICMS: string;
begin
  Result := ChildNodes['pICMS'].Text;
end;

procedure TXMLICMS20.Set_PICMS(Value: string);
begin
  ChildNodes['pICMS'].NodeValue := Value;
end;

function TXMLICMS20.Get_VICMS: string;
begin
  Result := ChildNodes['vICMS'].Text;
end;

procedure TXMLICMS20.Set_VICMS(Value: string);
begin
  ChildNodes['vICMS'].NodeValue := Value;
end;

function TXMLICMS20.Get_VBCFCP: string;
begin
  Result := ChildNodes['vBCFCP'].Text;
end;

procedure TXMLICMS20.Set_VBCFCP(Value: string);
begin
  ChildNodes['vBCFCP'].NodeValue := Value;
end;

function TXMLICMS20.Get_PFCP: string;
begin
  Result := ChildNodes['pFCP'].Text;
end;

procedure TXMLICMS20.Set_PFCP(Value: string);
begin
  ChildNodes['pFCP'].NodeValue := Value;
end;

function TXMLICMS20.Get_VFCP: string;
begin
  Result := ChildNodes['vFCP'].Text;
end;

procedure TXMLICMS20.Set_VFCP(Value: string);
begin
  ChildNodes['vFCP'].NodeValue := Value;
end;

function TXMLICMS20.Get_VICMSDeson: string;
begin
  Result := ChildNodes['vICMSDeson'].Text;
end;

procedure TXMLICMS20.Set_VICMSDeson(Value: string);
begin
  ChildNodes['vICMSDeson'].NodeValue := Value;
end;

function TXMLICMS20.Get_MotDesICMS: string;
begin
  Result := ChildNodes['motDesICMS'].Text;
end;

procedure TXMLICMS20.Set_MotDesICMS(Value: string);
begin
  ChildNodes['motDesICMS'].NodeValue := Value;
end;

{ TXMLICMS30 }

function TXMLICMS30.Get_Orig: string;
begin
  Result := ChildNodes['orig'].Text;
end;

procedure TXMLICMS30.Set_Orig(Value: string);
begin
  ChildNodes['orig'].NodeValue := Value;
end;

function TXMLICMS30.Get_CST: string;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLICMS30.Set_CST(Value: string);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLICMS30.Get_ModBCST: string;
begin
  Result := ChildNodes['modBCST'].Text;
end;

procedure TXMLICMS30.Set_ModBCST(Value: string);
begin
  ChildNodes['modBCST'].NodeValue := Value;
end;

function TXMLICMS30.Get_PMVAST: string;
begin
  Result := ChildNodes['pMVAST'].Text;
end;

procedure TXMLICMS30.Set_PMVAST(Value: string);
begin
  ChildNodes['pMVAST'].NodeValue := Value;
end;

function TXMLICMS30.Get_PRedBCST: string;
begin
  Result := ChildNodes['pRedBCST'].Text;
end;

procedure TXMLICMS30.Set_PRedBCST(Value: string);
begin
  ChildNodes['pRedBCST'].NodeValue := Value;
end;

function TXMLICMS30.Get_VBCST: string;
begin
  Result := ChildNodes['vBCST'].Text;
end;

procedure TXMLICMS30.Set_VBCST(Value: string);
begin
  ChildNodes['vBCST'].NodeValue := Value;
end;

function TXMLICMS30.Get_PICMSST: string;
begin
  Result := ChildNodes['pICMSST'].Text;
end;

procedure TXMLICMS30.Set_PICMSST(Value: string);
begin
  ChildNodes['pICMSST'].NodeValue := Value;
end;

function TXMLICMS30.Get_VICMSST: string;
begin
  Result := ChildNodes['vICMSST'].Text;
end;

procedure TXMLICMS30.Set_VICMSST(Value: string);
begin
  ChildNodes['vICMSST'].NodeValue := Value;
end;

function TXMLICMS30.Get_VBCFCPST: string;
begin
  Result := ChildNodes['vBCFCPST'].Text;
end;

procedure TXMLICMS30.Set_VBCFCPST(Value: string);
begin
  ChildNodes['vBCFCPST'].NodeValue := Value;
end;

function TXMLICMS30.Get_PFCPST: string;
begin
  Result := ChildNodes['pFCPST'].Text;
end;

procedure TXMLICMS30.Set_PFCPST(Value: string);
begin
  ChildNodes['pFCPST'].NodeValue := Value;
end;

function TXMLICMS30.Get_VFCPST: string;
begin
  Result := ChildNodes['vFCPST'].Text;
end;

procedure TXMLICMS30.Set_VFCPST(Value: string);
begin
  ChildNodes['vFCPST'].NodeValue := Value;
end;

function TXMLICMS30.Get_VICMSDeson: string;
begin
  Result := ChildNodes['vICMSDeson'].Text;
end;

procedure TXMLICMS30.Set_VICMSDeson(Value: string);
begin
  ChildNodes['vICMSDeson'].NodeValue := Value;
end;

function TXMLICMS30.Get_MotDesICMS: string;
begin
  Result := ChildNodes['motDesICMS'].Text;
end;

procedure TXMLICMS30.Set_MotDesICMS(Value: string);
begin
  ChildNodes['motDesICMS'].NodeValue := Value;
end;

{ TXMLICMS40 }

function TXMLICMS40.Get_Orig: string;
begin
  Result := ChildNodes['orig'].Text;
end;

procedure TXMLICMS40.Set_Orig(Value: string);
begin
  ChildNodes['orig'].NodeValue := Value;
end;

function TXMLICMS40.Get_CST: string;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLICMS40.Set_CST(Value: string);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLICMS40.Get_VICMSDeson: string;
begin
  Result := ChildNodes['vICMSDeson'].Text;
end;

procedure TXMLICMS40.Set_VICMSDeson(Value: string);
begin
  ChildNodes['vICMSDeson'].NodeValue := Value;
end;

function TXMLICMS40.Get_MotDesICMS: string;
begin
  Result := ChildNodes['motDesICMS'].Text;
end;

procedure TXMLICMS40.Set_MotDesICMS(Value: string);
begin
  ChildNodes['motDesICMS'].NodeValue := Value;
end;

{ TXMLICMS51 }

function TXMLICMS51.Get_Orig: string;
begin
  Result := ChildNodes['orig'].Text;
end;

procedure TXMLICMS51.Set_Orig(Value: string);
begin
  ChildNodes['orig'].NodeValue := Value;
end;

function TXMLICMS51.Get_CST: string;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLICMS51.Set_CST(Value: string);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLICMS51.Get_ModBC: string;
begin
  Result := ChildNodes['modBC'].Text;
end;

procedure TXMLICMS51.Set_ModBC(Value: string);
begin
  ChildNodes['modBC'].NodeValue := Value;
end;

function TXMLICMS51.Get_PRedBC: string;
begin
  Result := ChildNodes['pRedBC'].Text;
end;

procedure TXMLICMS51.Set_PRedBC(Value: string);
begin
  ChildNodes['pRedBC'].NodeValue := Value;
end;

function TXMLICMS51.Get_VBC: string;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLICMS51.Set_VBC(Value: string);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLICMS51.Get_PICMS: string;
begin
  Result := ChildNodes['pICMS'].Text;
end;

procedure TXMLICMS51.Set_PICMS(Value: string);
begin
  ChildNodes['pICMS'].NodeValue := Value;
end;

function TXMLICMS51.Get_VICMSOp: string;
begin
  Result := ChildNodes['vICMSOp'].Text;
end;

procedure TXMLICMS51.Set_VICMSOp(Value: string);
begin
  ChildNodes['vICMSOp'].NodeValue := Value;
end;

function TXMLICMS51.Get_PDif: string;
begin
  Result := ChildNodes['pDif'].Text;
end;

procedure TXMLICMS51.Set_PDif(Value: string);
begin
  ChildNodes['pDif'].NodeValue := Value;
end;

function TXMLICMS51.Get_VICMSDif: string;
begin
  Result := ChildNodes['vICMSDif'].Text;
end;

procedure TXMLICMS51.Set_VICMSDif(Value: string);
begin
  ChildNodes['vICMSDif'].NodeValue := Value;
end;

function TXMLICMS51.Get_VICMS: string;
begin
  Result := ChildNodes['vICMS'].Text;
end;

procedure TXMLICMS51.Set_VICMS(Value: string);
begin
  ChildNodes['vICMS'].NodeValue := Value;
end;

function TXMLICMS51.Get_VBCFCP: string;
begin
  Result := ChildNodes['vBCFCP'].Text;
end;

procedure TXMLICMS51.Set_VBCFCP(Value: string);
begin
  ChildNodes['vBCFCP'].NodeValue := Value;
end;

function TXMLICMS51.Get_PFCP: string;
begin
  Result := ChildNodes['pFCP'].Text;
end;

procedure TXMLICMS51.Set_PFCP(Value: string);
begin
  ChildNodes['pFCP'].NodeValue := Value;
end;

function TXMLICMS51.Get_VFCP: string;
begin
  Result := ChildNodes['vFCP'].Text;
end;

procedure TXMLICMS51.Set_VFCP(Value: string);
begin
  ChildNodes['vFCP'].NodeValue := Value;
end;

{ TXMLICMS60 }

function TXMLICMS60.Get_Orig: string;
begin
  Result := ChildNodes['orig'].Text;
end;

procedure TXMLICMS60.Set_Orig(Value: string);
begin
  ChildNodes['orig'].NodeValue := Value;
end;

function TXMLICMS60.Get_CST: string;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLICMS60.Set_CST(Value: string);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLICMS60.Get_VBCSTRet: string;
begin
  Result := ChildNodes['vBCSTRet'].Text;
end;

procedure TXMLICMS60.Set_VBCSTRet(Value: string);
begin
  ChildNodes['vBCSTRet'].NodeValue := Value;
end;

function TXMLICMS60.Get_PST: string;
begin
  Result := ChildNodes['pST'].Text;
end;

procedure TXMLICMS60.Set_PST(Value: string);
begin
  ChildNodes['pST'].NodeValue := Value;
end;

function TXMLICMS60.Get_VICMSSubstituto: string;
begin
  Result := ChildNodes['vICMSSubstituto'].Text;
end;

procedure TXMLICMS60.Set_VICMSSubstituto(Value: string);
begin
  ChildNodes['vICMSSubstituto'].NodeValue := Value;
end;

function TXMLICMS60.Get_VICMSSTRet: string;
begin
  Result := ChildNodes['vICMSSTRet'].Text;
end;

procedure TXMLICMS60.Set_VICMSSTRet(Value: string);
begin
  ChildNodes['vICMSSTRet'].NodeValue := Value;
end;

function TXMLICMS60.Get_VBCFCPSTRet: string;
begin
  Result := ChildNodes['vBCFCPSTRet'].Text;
end;

procedure TXMLICMS60.Set_VBCFCPSTRet(Value: string);
begin
  ChildNodes['vBCFCPSTRet'].NodeValue := Value;
end;

function TXMLICMS60.Get_PFCPSTRet: string;
begin
  Result := ChildNodes['pFCPSTRet'].Text;
end;

procedure TXMLICMS60.Set_PFCPSTRet(Value: string);
begin
  ChildNodes['pFCPSTRet'].NodeValue := Value;
end;

function TXMLICMS60.Get_VFCPSTRet: string;
begin
  Result := ChildNodes['vFCPSTRet'].Text;
end;

procedure TXMLICMS60.Set_VFCPSTRet(Value: string);
begin
  ChildNodes['vFCPSTRet'].NodeValue := Value;
end;

function TXMLICMS60.Get_PRedBCEfet: string;
begin
  Result := ChildNodes['pRedBCEfet'].Text;
end;

procedure TXMLICMS60.Set_PRedBCEfet(Value: string);
begin
  ChildNodes['pRedBCEfet'].NodeValue := Value;
end;

function TXMLICMS60.Get_VBCEfet: string;
begin
  Result := ChildNodes['vBCEfet'].Text;
end;

procedure TXMLICMS60.Set_VBCEfet(Value: string);
begin
  ChildNodes['vBCEfet'].NodeValue := Value;
end;

function TXMLICMS60.Get_PICMSEfet: string;
begin
  Result := ChildNodes['pICMSEfet'].Text;
end;

procedure TXMLICMS60.Set_PICMSEfet(Value: string);
begin
  ChildNodes['pICMSEfet'].NodeValue := Value;
end;

function TXMLICMS60.Get_VICMSEfet: string;
begin
  Result := ChildNodes['vICMSEfet'].Text;
end;

procedure TXMLICMS60.Set_VICMSEfet(Value: string);
begin
  ChildNodes['vICMSEfet'].NodeValue := Value;
end;

{ TXMLICMS70 }

function TXMLICMS70.Get_Orig: string;
begin
  Result := ChildNodes['orig'].Text;
end;

procedure TXMLICMS70.Set_Orig(Value: string);
begin
  ChildNodes['orig'].NodeValue := Value;
end;

function TXMLICMS70.Get_CST: string;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLICMS70.Set_CST(Value: string);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLICMS70.Get_ModBC: string;
begin
  Result := ChildNodes['modBC'].Text;
end;

procedure TXMLICMS70.Set_ModBC(Value: string);
begin
  ChildNodes['modBC'].NodeValue := Value;
end;

function TXMLICMS70.Get_PRedBC: string;
begin
  Result := ChildNodes['pRedBC'].Text;
end;

procedure TXMLICMS70.Set_PRedBC(Value: string);
begin
  ChildNodes['pRedBC'].NodeValue := Value;
end;

function TXMLICMS70.Get_VBC: string;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLICMS70.Set_VBC(Value: string);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLICMS70.Get_PICMS: string;
begin
  Result := ChildNodes['pICMS'].Text;
end;

procedure TXMLICMS70.Set_PICMS(Value: string);
begin
  ChildNodes['pICMS'].NodeValue := Value;
end;

function TXMLICMS70.Get_VICMS: string;
begin
  Result := ChildNodes['vICMS'].Text;
end;

procedure TXMLICMS70.Set_VICMS(Value: string);
begin
  ChildNodes['vICMS'].NodeValue := Value;
end;

function TXMLICMS70.Get_VBCFCP: string;
begin
  Result := ChildNodes['vBCFCP'].Text;
end;

procedure TXMLICMS70.Set_VBCFCP(Value: string);
begin
  ChildNodes['vBCFCP'].NodeValue := Value;
end;

function TXMLICMS70.Get_PFCP: string;
begin
  Result := ChildNodes['pFCP'].Text;
end;

procedure TXMLICMS70.Set_PFCP(Value: string);
begin
  ChildNodes['pFCP'].NodeValue := Value;
end;

function TXMLICMS70.Get_VFCP: string;
begin
  Result := ChildNodes['vFCP'].Text;
end;

procedure TXMLICMS70.Set_VFCP(Value: string);
begin
  ChildNodes['vFCP'].NodeValue := Value;
end;

function TXMLICMS70.Get_ModBCST: string;
begin
  Result := ChildNodes['modBCST'].Text;
end;

procedure TXMLICMS70.Set_ModBCST(Value: string);
begin
  ChildNodes['modBCST'].NodeValue := Value;
end;

function TXMLICMS70.Get_PMVAST: string;
begin
  Result := ChildNodes['pMVAST'].Text;
end;

procedure TXMLICMS70.Set_PMVAST(Value: string);
begin
  ChildNodes['pMVAST'].NodeValue := Value;
end;

function TXMLICMS70.Get_PRedBCST: string;
begin
  Result := ChildNodes['pRedBCST'].Text;
end;

procedure TXMLICMS70.Set_PRedBCST(Value: string);
begin
  ChildNodes['pRedBCST'].NodeValue := Value;
end;

function TXMLICMS70.Get_VBCST: string;
begin
  Result := ChildNodes['vBCST'].Text;
end;

procedure TXMLICMS70.Set_VBCST(Value: string);
begin
  ChildNodes['vBCST'].NodeValue := Value;
end;

function TXMLICMS70.Get_PICMSST: string;
begin
  Result := ChildNodes['pICMSST'].Text;
end;

procedure TXMLICMS70.Set_PICMSST(Value: string);
begin
  ChildNodes['pICMSST'].NodeValue := Value;
end;

function TXMLICMS70.Get_VICMSST: string;
begin
  Result := ChildNodes['vICMSST'].Text;
end;

procedure TXMLICMS70.Set_VICMSST(Value: string);
begin
  ChildNodes['vICMSST'].NodeValue := Value;
end;

function TXMLICMS70.Get_VBCFCPST: string;
begin
  Result := ChildNodes['vBCFCPST'].Text;
end;

procedure TXMLICMS70.Set_VBCFCPST(Value: string);
begin
  ChildNodes['vBCFCPST'].NodeValue := Value;
end;

function TXMLICMS70.Get_PFCPST: string;
begin
  Result := ChildNodes['pFCPST'].Text;
end;

procedure TXMLICMS70.Set_PFCPST(Value: string);
begin
  ChildNodes['pFCPST'].NodeValue := Value;
end;

function TXMLICMS70.Get_VFCPST: string;
begin
  Result := ChildNodes['vFCPST'].Text;
end;

procedure TXMLICMS70.Set_VFCPST(Value: string);
begin
  ChildNodes['vFCPST'].NodeValue := Value;
end;

function TXMLICMS70.Get_VICMSDeson: string;
begin
  Result := ChildNodes['vICMSDeson'].Text;
end;

procedure TXMLICMS70.Set_VICMSDeson(Value: string);
begin
  ChildNodes['vICMSDeson'].NodeValue := Value;
end;

function TXMLICMS70.Get_MotDesICMS: string;
begin
  Result := ChildNodes['motDesICMS'].Text;
end;

procedure TXMLICMS70.Set_MotDesICMS(Value: string);
begin
  ChildNodes['motDesICMS'].NodeValue := Value;
end;

{ TXMLICMS90 }

function TXMLICMS90.Get_Orig: string;
begin
  Result := ChildNodes['orig'].Text;
end;

procedure TXMLICMS90.Set_Orig(Value: string);
begin
  ChildNodes['orig'].NodeValue := Value;
end;

function TXMLICMS90.Get_CST: string;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLICMS90.Set_CST(Value: string);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLICMS90.Get_ModBC: string;
begin
  Result := ChildNodes['modBC'].Text;
end;

procedure TXMLICMS90.Set_ModBC(Value: string);
begin
  ChildNodes['modBC'].NodeValue := Value;
end;

function TXMLICMS90.Get_VBC: string;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLICMS90.Set_VBC(Value: string);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLICMS90.Get_PRedBC: string;
begin
  Result := ChildNodes['pRedBC'].Text;
end;

procedure TXMLICMS90.Set_PRedBC(Value: string);
begin
  ChildNodes['pRedBC'].NodeValue := Value;
end;

function TXMLICMS90.Get_PICMS: string;
begin
  Result := ChildNodes['pICMS'].Text;
end;

procedure TXMLICMS90.Set_PICMS(Value: string);
begin
  ChildNodes['pICMS'].NodeValue := Value;
end;

function TXMLICMS90.Get_VICMS: string;
begin
  Result := ChildNodes['vICMS'].Text;
end;

procedure TXMLICMS90.Set_VICMS(Value: string);
begin
  ChildNodes['vICMS'].NodeValue := Value;
end;

function TXMLICMS90.Get_VBCFCP: string;
begin
  Result := ChildNodes['vBCFCP'].Text;
end;

procedure TXMLICMS90.Set_VBCFCP(Value: string);
begin
  ChildNodes['vBCFCP'].NodeValue := Value;
end;

function TXMLICMS90.Get_PFCP: string;
begin
  Result := ChildNodes['pFCP'].Text;
end;

procedure TXMLICMS90.Set_PFCP(Value: string);
begin
  ChildNodes['pFCP'].NodeValue := Value;
end;

function TXMLICMS90.Get_VFCP: string;
begin
  Result := ChildNodes['vFCP'].Text;
end;

procedure TXMLICMS90.Set_VFCP(Value: string);
begin
  ChildNodes['vFCP'].NodeValue := Value;
end;

function TXMLICMS90.Get_ModBCST: string;
begin
  Result := ChildNodes['modBCST'].Text;
end;

procedure TXMLICMS90.Set_ModBCST(Value: string);
begin
  ChildNodes['modBCST'].NodeValue := Value;
end;

function TXMLICMS90.Get_PMVAST: string;
begin
  Result := ChildNodes['pMVAST'].Text;
end;

procedure TXMLICMS90.Set_PMVAST(Value: string);
begin
  ChildNodes['pMVAST'].NodeValue := Value;
end;

function TXMLICMS90.Get_PRedBCST: string;
begin
  Result := ChildNodes['pRedBCST'].Text;
end;

procedure TXMLICMS90.Set_PRedBCST(Value: string);
begin
  ChildNodes['pRedBCST'].NodeValue := Value;
end;

function TXMLICMS90.Get_VBCST: string;
begin
  Result := ChildNodes['vBCST'].Text;
end;

procedure TXMLICMS90.Set_VBCST(Value: string);
begin
  ChildNodes['vBCST'].NodeValue := Value;
end;

function TXMLICMS90.Get_PICMSST: string;
begin
  Result := ChildNodes['pICMSST'].Text;
end;

procedure TXMLICMS90.Set_PICMSST(Value: string);
begin
  ChildNodes['pICMSST'].NodeValue := Value;
end;

function TXMLICMS90.Get_VICMSST: string;
begin
  Result := ChildNodes['vICMSST'].Text;
end;

procedure TXMLICMS90.Set_VICMSST(Value: string);
begin
  ChildNodes['vICMSST'].NodeValue := Value;
end;

function TXMLICMS90.Get_VBCFCPST: string;
begin
  Result := ChildNodes['vBCFCPST'].Text;
end;

procedure TXMLICMS90.Set_VBCFCPST(Value: string);
begin
  ChildNodes['vBCFCPST'].NodeValue := Value;
end;

function TXMLICMS90.Get_PFCPST: string;
begin
  Result := ChildNodes['pFCPST'].Text;
end;

procedure TXMLICMS90.Set_PFCPST(Value: string);
begin
  ChildNodes['pFCPST'].NodeValue := Value;
end;

function TXMLICMS90.Get_VFCPST: string;
begin
  Result := ChildNodes['vFCPST'].Text;
end;

procedure TXMLICMS90.Set_VFCPST(Value: string);
begin
  ChildNodes['vFCPST'].NodeValue := Value;
end;

function TXMLICMS90.Get_VICMSDeson: string;
begin
  Result := ChildNodes['vICMSDeson'].Text;
end;

procedure TXMLICMS90.Set_VICMSDeson(Value: string);
begin
  ChildNodes['vICMSDeson'].NodeValue := Value;
end;

function TXMLICMS90.Get_MotDesICMS: string;
begin
  Result := ChildNodes['motDesICMS'].Text;
end;

procedure TXMLICMS90.Set_MotDesICMS(Value: string);
begin
  ChildNodes['motDesICMS'].NodeValue := Value;
end;

{ TXMLICMSPart }

function TXMLICMSPart.Get_Orig: string;
begin
  Result := ChildNodes['orig'].Text;
end;

procedure TXMLICMSPart.Set_Orig(Value: string);
begin
  ChildNodes['orig'].NodeValue := Value;
end;

function TXMLICMSPart.Get_CST: string;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLICMSPart.Set_CST(Value: string);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLICMSPart.Get_ModBC: string;
begin
  Result := ChildNodes['modBC'].Text;
end;

procedure TXMLICMSPart.Set_ModBC(Value: string);
begin
  ChildNodes['modBC'].NodeValue := Value;
end;

function TXMLICMSPart.Get_VBC: string;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLICMSPart.Set_VBC(Value: string);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLICMSPart.Get_PRedBC: string;
begin
  Result := ChildNodes['pRedBC'].Text;
end;

procedure TXMLICMSPart.Set_PRedBC(Value: string);
begin
  ChildNodes['pRedBC'].NodeValue := Value;
end;

function TXMLICMSPart.Get_PICMS: string;
begin
  Result := ChildNodes['pICMS'].Text;
end;

procedure TXMLICMSPart.Set_PICMS(Value: string);
begin
  ChildNodes['pICMS'].NodeValue := Value;
end;

function TXMLICMSPart.Get_VICMS: string;
begin
  Result := ChildNodes['vICMS'].Text;
end;

procedure TXMLICMSPart.Set_VICMS(Value: string);
begin
  ChildNodes['vICMS'].NodeValue := Value;
end;

function TXMLICMSPart.Get_ModBCST: string;
begin
  Result := ChildNodes['modBCST'].Text;
end;

procedure TXMLICMSPart.Set_ModBCST(Value: string);
begin
  ChildNodes['modBCST'].NodeValue := Value;
end;

function TXMLICMSPart.Get_PMVAST: string;
begin
  Result := ChildNodes['pMVAST'].Text;
end;

procedure TXMLICMSPart.Set_PMVAST(Value: string);
begin
  ChildNodes['pMVAST'].NodeValue := Value;
end;

function TXMLICMSPart.Get_PRedBCST: string;
begin
  Result := ChildNodes['pRedBCST'].Text;
end;

procedure TXMLICMSPart.Set_PRedBCST(Value: string);
begin
  ChildNodes['pRedBCST'].NodeValue := Value;
end;

function TXMLICMSPart.Get_VBCST: string;
begin
  Result := ChildNodes['vBCST'].Text;
end;

procedure TXMLICMSPart.Set_VBCST(Value: string);
begin
  ChildNodes['vBCST'].NodeValue := Value;
end;

function TXMLICMSPart.Get_PICMSST: string;
begin
  Result := ChildNodes['pICMSST'].Text;
end;

procedure TXMLICMSPart.Set_PICMSST(Value: string);
begin
  ChildNodes['pICMSST'].NodeValue := Value;
end;

function TXMLICMSPart.Get_VICMSST: string;
begin
  Result := ChildNodes['vICMSST'].Text;
end;

procedure TXMLICMSPart.Set_VICMSST(Value: string);
begin
  ChildNodes['vICMSST'].NodeValue := Value;
end;

function TXMLICMSPart.Get_PBCOp: string;
begin
  Result := ChildNodes['pBCOp'].Text;
end;

procedure TXMLICMSPart.Set_PBCOp(Value: string);
begin
  ChildNodes['pBCOp'].NodeValue := Value;
end;

function TXMLICMSPart.Get_UFST: string;
begin
  Result := ChildNodes['UFST'].Text;
end;

procedure TXMLICMSPart.Set_UFST(Value: string);
begin
  ChildNodes['UFST'].NodeValue := Value;
end;

{ TXMLICMSST }

function TXMLICMSST.Get_Orig: string;
begin
  Result := ChildNodes['orig'].Text;
end;

procedure TXMLICMSST.Set_Orig(Value: string);
begin
  ChildNodes['orig'].NodeValue := Value;
end;

function TXMLICMSST.Get_CST: string;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLICMSST.Set_CST(Value: string);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLICMSST.Get_VBCSTRet: string;
begin
  Result := ChildNodes['vBCSTRet'].Text;
end;

procedure TXMLICMSST.Set_VBCSTRet(Value: string);
begin
  ChildNodes['vBCSTRet'].NodeValue := Value;
end;

function TXMLICMSST.Get_PST: string;
begin
  Result := ChildNodes['pST'].Text;
end;

procedure TXMLICMSST.Set_PST(Value: string);
begin
  ChildNodes['pST'].NodeValue := Value;
end;

function TXMLICMSST.Get_VICMSSubstituto: string;
begin
  Result := ChildNodes['vICMSSubstituto'].Text;
end;

procedure TXMLICMSST.Set_VICMSSubstituto(Value: string);
begin
  ChildNodes['vICMSSubstituto'].NodeValue := Value;
end;

function TXMLICMSST.Get_VICMSSTRet: string;
begin
  Result := ChildNodes['vICMSSTRet'].Text;
end;

procedure TXMLICMSST.Set_VICMSSTRet(Value: string);
begin
  ChildNodes['vICMSSTRet'].NodeValue := Value;
end;

function TXMLICMSST.Get_VBCFCPSTRet: string;
begin
  Result := ChildNodes['vBCFCPSTRet'].Text;
end;

procedure TXMLICMSST.Set_VBCFCPSTRet(Value: string);
begin
  ChildNodes['vBCFCPSTRet'].NodeValue := Value;
end;

function TXMLICMSST.Get_PFCPSTRet: string;
begin
  Result := ChildNodes['pFCPSTRet'].Text;
end;

procedure TXMLICMSST.Set_PFCPSTRet(Value: string);
begin
  ChildNodes['pFCPSTRet'].NodeValue := Value;
end;

function TXMLICMSST.Get_VFCPSTRet: string;
begin
  Result := ChildNodes['vFCPSTRet'].Text;
end;

procedure TXMLICMSST.Set_VFCPSTRet(Value: string);
begin
  ChildNodes['vFCPSTRet'].NodeValue := Value;
end;

function TXMLICMSST.Get_VBCSTDest: string;
begin
  Result := ChildNodes['vBCSTDest'].Text;
end;

procedure TXMLICMSST.Set_VBCSTDest(Value: string);
begin
  ChildNodes['vBCSTDest'].NodeValue := Value;
end;

function TXMLICMSST.Get_VICMSSTDest: string;
begin
  Result := ChildNodes['vICMSSTDest'].Text;
end;

procedure TXMLICMSST.Set_VICMSSTDest(Value: string);
begin
  ChildNodes['vICMSSTDest'].NodeValue := Value;
end;

function TXMLICMSST.Get_PRedBCEfet: string;
begin
  Result := ChildNodes['pRedBCEfet'].Text;
end;

procedure TXMLICMSST.Set_PRedBCEfet(Value: string);
begin
  ChildNodes['pRedBCEfet'].NodeValue := Value;
end;

function TXMLICMSST.Get_VBCEfet: string;
begin
  Result := ChildNodes['vBCEfet'].Text;
end;

procedure TXMLICMSST.Set_VBCEfet(Value: string);
begin
  ChildNodes['vBCEfet'].NodeValue := Value;
end;

function TXMLICMSST.Get_PICMSEfet: string;
begin
  Result := ChildNodes['pICMSEfet'].Text;
end;

procedure TXMLICMSST.Set_PICMSEfet(Value: string);
begin
  ChildNodes['pICMSEfet'].NodeValue := Value;
end;

function TXMLICMSST.Get_VICMSEfet: string;
begin
  Result := ChildNodes['vICMSEfet'].Text;
end;

procedure TXMLICMSST.Set_VICMSEfet(Value: string);
begin
  ChildNodes['vICMSEfet'].NodeValue := Value;
end;

{ TXMLICMSSN101 }

function TXMLICMSSN101.Get_Orig: string;
begin
  Result := ChildNodes['orig'].Text;
end;

procedure TXMLICMSSN101.Set_Orig(Value: string);
begin
  ChildNodes['orig'].NodeValue := Value;
end;

function TXMLICMSSN101.Get_CSOSN: string;
begin
  Result := ChildNodes['CSOSN'].Text;
end;

procedure TXMLICMSSN101.Set_CSOSN(Value: string);
begin
  ChildNodes['CSOSN'].NodeValue := Value;
end;

function TXMLICMSSN101.Get_PCredSN: string;
begin
  Result := ChildNodes['pCredSN'].Text;
end;

procedure TXMLICMSSN101.Set_PCredSN(Value: string);
begin
  ChildNodes['pCredSN'].NodeValue := Value;
end;

function TXMLICMSSN101.Get_VCredICMSSN: string;
begin
  Result := ChildNodes['vCredICMSSN'].Text;
end;

procedure TXMLICMSSN101.Set_VCredICMSSN(Value: string);
begin
  ChildNodes['vCredICMSSN'].NodeValue := Value;
end;

{ TXMLICMSSN102 }

function TXMLICMSSN102.Get_Orig: string;
begin
  Result := ChildNodes['orig'].Text;
end;

procedure TXMLICMSSN102.Set_Orig(Value: string);
begin
  ChildNodes['orig'].NodeValue := Value;
end;

function TXMLICMSSN102.Get_CSOSN: string;
begin
  Result := ChildNodes['CSOSN'].Text;
end;

procedure TXMLICMSSN102.Set_CSOSN(Value: string);
begin
  ChildNodes['CSOSN'].NodeValue := Value;
end;

{ TXMLICMSSN201 }

function TXMLICMSSN201.Get_Orig: string;
begin
  Result := ChildNodes['orig'].Text;
end;

procedure TXMLICMSSN201.Set_Orig(Value: string);
begin
  ChildNodes['orig'].NodeValue := Value;
end;

function TXMLICMSSN201.Get_CSOSN: string;
begin
  Result := ChildNodes['CSOSN'].Text;
end;

procedure TXMLICMSSN201.Set_CSOSN(Value: string);
begin
  ChildNodes['CSOSN'].NodeValue := Value;
end;

function TXMLICMSSN201.Get_ModBCST: string;
begin
  Result := ChildNodes['modBCST'].Text;
end;

procedure TXMLICMSSN201.Set_ModBCST(Value: string);
begin
  ChildNodes['modBCST'].NodeValue := Value;
end;

function TXMLICMSSN201.Get_PMVAST: string;
begin
  Result := ChildNodes['pMVAST'].Text;
end;

procedure TXMLICMSSN201.Set_PMVAST(Value: string);
begin
  ChildNodes['pMVAST'].NodeValue := Value;
end;

function TXMLICMSSN201.Get_PRedBCST: string;
begin
  Result := ChildNodes['pRedBCST'].Text;
end;

procedure TXMLICMSSN201.Set_PRedBCST(Value: string);
begin
  ChildNodes['pRedBCST'].NodeValue := Value;
end;

function TXMLICMSSN201.Get_VBCST: string;
begin
  Result := ChildNodes['vBCST'].Text;
end;

procedure TXMLICMSSN201.Set_VBCST(Value: string);
begin
  ChildNodes['vBCST'].NodeValue := Value;
end;

function TXMLICMSSN201.Get_PICMSST: string;
begin
  Result := ChildNodes['pICMSST'].Text;
end;

procedure TXMLICMSSN201.Set_PICMSST(Value: string);
begin
  ChildNodes['pICMSST'].NodeValue := Value;
end;

function TXMLICMSSN201.Get_VICMSST: string;
begin
  Result := ChildNodes['vICMSST'].Text;
end;

procedure TXMLICMSSN201.Set_VICMSST(Value: string);
begin
  ChildNodes['vICMSST'].NodeValue := Value;
end;

function TXMLICMSSN201.Get_VBCFCPST: string;
begin
  Result := ChildNodes['vBCFCPST'].Text;
end;

procedure TXMLICMSSN201.Set_VBCFCPST(Value: string);
begin
  ChildNodes['vBCFCPST'].NodeValue := Value;
end;

function TXMLICMSSN201.Get_PFCPST: string;
begin
  Result := ChildNodes['pFCPST'].Text;
end;

procedure TXMLICMSSN201.Set_PFCPST(Value: string);
begin
  ChildNodes['pFCPST'].NodeValue := Value;
end;

function TXMLICMSSN201.Get_VFCPST: string;
begin
  Result := ChildNodes['vFCPST'].Text;
end;

procedure TXMLICMSSN201.Set_VFCPST(Value: string);
begin
  ChildNodes['vFCPST'].NodeValue := Value;
end;

function TXMLICMSSN201.Get_PCredSN: string;
begin
  Result := ChildNodes['pCredSN'].Text;
end;

procedure TXMLICMSSN201.Set_PCredSN(Value: string);
begin
  ChildNodes['pCredSN'].NodeValue := Value;
end;

function TXMLICMSSN201.Get_VCredICMSSN: string;
begin
  Result := ChildNodes['vCredICMSSN'].Text;
end;

procedure TXMLICMSSN201.Set_VCredICMSSN(Value: string);
begin
  ChildNodes['vCredICMSSN'].NodeValue := Value;
end;

{ TXMLICMSSN202 }

function TXMLICMSSN202.Get_Orig: string;
begin
  Result := ChildNodes['orig'].Text;
end;

procedure TXMLICMSSN202.Set_Orig(Value: string);
begin
  ChildNodes['orig'].NodeValue := Value;
end;

function TXMLICMSSN202.Get_CSOSN: string;
begin
  Result := ChildNodes['CSOSN'].Text;
end;

procedure TXMLICMSSN202.Set_CSOSN(Value: string);
begin
  ChildNodes['CSOSN'].NodeValue := Value;
end;

function TXMLICMSSN202.Get_ModBCST: string;
begin
  Result := ChildNodes['modBCST'].Text;
end;

procedure TXMLICMSSN202.Set_ModBCST(Value: string);
begin
  ChildNodes['modBCST'].NodeValue := Value;
end;

function TXMLICMSSN202.Get_PMVAST: string;
begin
  Result := ChildNodes['pMVAST'].Text;
end;

procedure TXMLICMSSN202.Set_PMVAST(Value: string);
begin
  ChildNodes['pMVAST'].NodeValue := Value;
end;

function TXMLICMSSN202.Get_PRedBCST: string;
begin
  Result := ChildNodes['pRedBCST'].Text;
end;

procedure TXMLICMSSN202.Set_PRedBCST(Value: string);
begin
  ChildNodes['pRedBCST'].NodeValue := Value;
end;

function TXMLICMSSN202.Get_VBCST: string;
begin
  Result := ChildNodes['vBCST'].Text;
end;

procedure TXMLICMSSN202.Set_VBCST(Value: string);
begin
  ChildNodes['vBCST'].NodeValue := Value;
end;

function TXMLICMSSN202.Get_PICMSST: string;
begin
  Result := ChildNodes['pICMSST'].Text;
end;

procedure TXMLICMSSN202.Set_PICMSST(Value: string);
begin
  ChildNodes['pICMSST'].NodeValue := Value;
end;

function TXMLICMSSN202.Get_VICMSST: string;
begin
  Result := ChildNodes['vICMSST'].Text;
end;

procedure TXMLICMSSN202.Set_VICMSST(Value: string);
begin
  ChildNodes['vICMSST'].NodeValue := Value;
end;

function TXMLICMSSN202.Get_VBCFCPST: string;
begin
  Result := ChildNodes['vBCFCPST'].Text;
end;

procedure TXMLICMSSN202.Set_VBCFCPST(Value: string);
begin
  ChildNodes['vBCFCPST'].NodeValue := Value;
end;

function TXMLICMSSN202.Get_PFCPST: string;
begin
  Result := ChildNodes['pFCPST'].Text;
end;

procedure TXMLICMSSN202.Set_PFCPST(Value: string);
begin
  ChildNodes['pFCPST'].NodeValue := Value;
end;

function TXMLICMSSN202.Get_VFCPST: string;
begin
  Result := ChildNodes['vFCPST'].Text;
end;

procedure TXMLICMSSN202.Set_VFCPST(Value: string);
begin
  ChildNodes['vFCPST'].NodeValue := Value;
end;

{ TXMLICMSSN500 }

function TXMLICMSSN500.Get_Orig: string;
begin
  Result := ChildNodes['orig'].Text;
end;

procedure TXMLICMSSN500.Set_Orig(Value: string);
begin
  ChildNodes['orig'].NodeValue := Value;
end;

function TXMLICMSSN500.Get_CSOSN: string;
begin
  Result := ChildNodes['CSOSN'].Text;
end;

procedure TXMLICMSSN500.Set_CSOSN(Value: string);
begin
  ChildNodes['CSOSN'].NodeValue := Value;
end;

function TXMLICMSSN500.Get_VBCSTRet: string;
begin
  Result := ChildNodes['vBCSTRet'].Text;
end;

procedure TXMLICMSSN500.Set_VBCSTRet(Value: string);
begin
  ChildNodes['vBCSTRet'].NodeValue := Value;
end;

function TXMLICMSSN500.Get_PST: string;
begin
  Result := ChildNodes['pST'].Text;
end;

procedure TXMLICMSSN500.Set_PST(Value: string);
begin
  ChildNodes['pST'].NodeValue := Value;
end;

function TXMLICMSSN500.Get_VICMSSubstituto: string;
begin
  Result := ChildNodes['vICMSSubstituto'].Text;
end;

procedure TXMLICMSSN500.Set_VICMSSubstituto(Value: string);
begin
  ChildNodes['vICMSSubstituto'].NodeValue := Value;
end;

function TXMLICMSSN500.Get_VICMSSTRet: string;
begin
  Result := ChildNodes['vICMSSTRet'].Text;
end;

procedure TXMLICMSSN500.Set_VICMSSTRet(Value: string);
begin
  ChildNodes['vICMSSTRet'].NodeValue := Value;
end;

function TXMLICMSSN500.Get_VBCFCPSTRet: string;
begin
  Result := ChildNodes['vBCFCPSTRet'].Text;
end;

procedure TXMLICMSSN500.Set_VBCFCPSTRet(Value: string);
begin
  ChildNodes['vBCFCPSTRet'].NodeValue := Value;
end;

function TXMLICMSSN500.Get_PFCPSTRet: string;
begin
  Result := ChildNodes['pFCPSTRet'].Text;
end;

procedure TXMLICMSSN500.Set_PFCPSTRet(Value: string);
begin
  ChildNodes['pFCPSTRet'].NodeValue := Value;
end;

function TXMLICMSSN500.Get_VFCPSTRet: string;
begin
  Result := ChildNodes['vFCPSTRet'].Text;
end;

procedure TXMLICMSSN500.Set_VFCPSTRet(Value: string);
begin
  ChildNodes['vFCPSTRet'].NodeValue := Value;
end;

function TXMLICMSSN500.Get_PRedBCEfet: string;
begin
  Result := ChildNodes['pRedBCEfet'].Text;
end;

procedure TXMLICMSSN500.Set_PRedBCEfet(Value: string);
begin
  ChildNodes['pRedBCEfet'].NodeValue := Value;
end;

function TXMLICMSSN500.Get_VBCEfet: string;
begin
  Result := ChildNodes['vBCEfet'].Text;
end;

procedure TXMLICMSSN500.Set_VBCEfet(Value: string);
begin
  ChildNodes['vBCEfet'].NodeValue := Value;
end;

function TXMLICMSSN500.Get_PICMSEfet: string;
begin
  Result := ChildNodes['pICMSEfet'].Text;
end;

procedure TXMLICMSSN500.Set_PICMSEfet(Value: string);
begin
  ChildNodes['pICMSEfet'].NodeValue := Value;
end;

function TXMLICMSSN500.Get_VICMSEfet: string;
begin
  Result := ChildNodes['vICMSEfet'].Text;
end;

procedure TXMLICMSSN500.Set_VICMSEfet(Value: string);
begin
  ChildNodes['vICMSEfet'].NodeValue := Value;
end;

{ TXMLICMSSN900 }

function TXMLICMSSN900.Get_Orig: string;
begin
  Result := ChildNodes['orig'].Text;
end;

procedure TXMLICMSSN900.Set_Orig(Value: string);
begin
  ChildNodes['orig'].NodeValue := Value;
end;

function TXMLICMSSN900.Get_CSOSN: string;
begin
  Result := ChildNodes['CSOSN'].Text;
end;

procedure TXMLICMSSN900.Set_CSOSN(Value: string);
begin
  ChildNodes['CSOSN'].NodeValue := Value;
end;

function TXMLICMSSN900.Get_ModBC: string;
begin
  Result := ChildNodes['modBC'].Text;
end;

procedure TXMLICMSSN900.Set_ModBC(Value: string);
begin
  ChildNodes['modBC'].NodeValue := Value;
end;

function TXMLICMSSN900.Get_VBC: string;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLICMSSN900.Set_VBC(Value: string);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLICMSSN900.Get_PRedBC: string;
begin
  Result := ChildNodes['pRedBC'].Text;
end;

procedure TXMLICMSSN900.Set_PRedBC(Value: string);
begin
  ChildNodes['pRedBC'].NodeValue := Value;
end;

function TXMLICMSSN900.Get_PICMS: string;
begin
  Result := ChildNodes['pICMS'].Text;
end;

procedure TXMLICMSSN900.Set_PICMS(Value: string);
begin
  ChildNodes['pICMS'].NodeValue := Value;
end;

function TXMLICMSSN900.Get_VICMS: string;
begin
  Result := ChildNodes['vICMS'].Text;
end;

procedure TXMLICMSSN900.Set_VICMS(Value: string);
begin
  ChildNodes['vICMS'].NodeValue := Value;
end;

function TXMLICMSSN900.Get_ModBCST: string;
begin
  Result := ChildNodes['modBCST'].Text;
end;

procedure TXMLICMSSN900.Set_ModBCST(Value: string);
begin
  ChildNodes['modBCST'].NodeValue := Value;
end;

function TXMLICMSSN900.Get_PMVAST: string;
begin
  Result := ChildNodes['pMVAST'].Text;
end;

procedure TXMLICMSSN900.Set_PMVAST(Value: string);
begin
  ChildNodes['pMVAST'].NodeValue := Value;
end;

function TXMLICMSSN900.Get_PRedBCST: string;
begin
  Result := ChildNodes['pRedBCST'].Text;
end;

procedure TXMLICMSSN900.Set_PRedBCST(Value: string);
begin
  ChildNodes['pRedBCST'].NodeValue := Value;
end;

function TXMLICMSSN900.Get_VBCST: string;
begin
  Result := ChildNodes['vBCST'].Text;
end;

procedure TXMLICMSSN900.Set_VBCST(Value: string);
begin
  ChildNodes['vBCST'].NodeValue := Value;
end;

function TXMLICMSSN900.Get_PICMSST: string;
begin
  Result := ChildNodes['pICMSST'].Text;
end;

procedure TXMLICMSSN900.Set_PICMSST(Value: string);
begin
  ChildNodes['pICMSST'].NodeValue := Value;
end;

function TXMLICMSSN900.Get_VICMSST: string;
begin
  Result := ChildNodes['vICMSST'].Text;
end;

procedure TXMLICMSSN900.Set_VICMSST(Value: string);
begin
  ChildNodes['vICMSST'].NodeValue := Value;
end;

function TXMLICMSSN900.Get_VBCFCPST: string;
begin
  Result := ChildNodes['vBCFCPST'].Text;
end;

procedure TXMLICMSSN900.Set_VBCFCPST(Value: string);
begin
  ChildNodes['vBCFCPST'].NodeValue := Value;
end;

function TXMLICMSSN900.Get_PFCPST: string;
begin
  Result := ChildNodes['pFCPST'].Text;
end;

procedure TXMLICMSSN900.Set_PFCPST(Value: string);
begin
  ChildNodes['pFCPST'].NodeValue := Value;
end;

function TXMLICMSSN900.Get_VFCPST: string;
begin
  Result := ChildNodes['vFCPST'].Text;
end;

procedure TXMLICMSSN900.Set_VFCPST(Value: string);
begin
  ChildNodes['vFCPST'].NodeValue := Value;
end;

function TXMLICMSSN900.Get_PCredSN: string;
begin
  Result := ChildNodes['pCredSN'].Text;
end;

procedure TXMLICMSSN900.Set_PCredSN(Value: string);
begin
  ChildNodes['pCredSN'].NodeValue := Value;
end;

function TXMLICMSSN900.Get_VCredICMSSN: string;
begin
  Result := ChildNodes['vCredICMSSN'].Text;
end;

procedure TXMLICMSSN900.Set_VCredICMSSN(Value: string);
begin
  ChildNodes['vCredICMSSN'].NodeValue := Value;
end;

{ TXMLTIpi }

procedure TXMLTIpi.AfterConstruction;
begin
  RegisterChildNode('IPITrib', TXMLIPITrib);
  RegisterChildNode('IPINT', TXMLIPINT);
  inherited;
end;

function TXMLTIpi.Get_CNPJProd: string;
begin
  Result := ChildNodes['CNPJProd'].Text;
end;

procedure TXMLTIpi.Set_CNPJProd(Value: string);
begin
  ChildNodes['CNPJProd'].NodeValue := Value;
end;

function TXMLTIpi.Get_CSelo: string;
begin
  Result := ChildNodes['cSelo'].Text;
end;

procedure TXMLTIpi.Set_CSelo(Value: string);
begin
  ChildNodes['cSelo'].NodeValue := Value;
end;

function TXMLTIpi.Get_QSelo: string;
begin
  Result := ChildNodes['qSelo'].Text;
end;

procedure TXMLTIpi.Set_QSelo(Value: string);
begin
  ChildNodes['qSelo'].NodeValue := Value;
end;

function TXMLTIpi.Get_CEnq: string;
begin
  Result := ChildNodes['cEnq'].Text;
end;

procedure TXMLTIpi.Set_CEnq(Value: string);
begin
  ChildNodes['cEnq'].NodeValue := Value;
end;

function TXMLTIpi.Get_IPITrib: IXMLIPITrib;
begin
  Result := ChildNodes['IPITrib'] as IXMLIPITrib;
end;

function TXMLTIpi.Get_IPINT: IXMLIPINT;
begin
  Result := ChildNodes['IPINT'] as IXMLIPINT;
end;

{ TXMLIPITrib }

function TXMLIPITrib.Get_CST: string;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLIPITrib.Set_CST(Value: string);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLIPITrib.Get_VBC: string;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLIPITrib.Set_VBC(Value: string);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLIPITrib.Get_PIPI: string;
begin
  Result := ChildNodes['pIPI'].Text;
end;

procedure TXMLIPITrib.Set_PIPI(Value: string);
begin
  ChildNodes['pIPI'].NodeValue := Value;
end;

function TXMLIPITrib.Get_QUnid: string;
begin
  Result := ChildNodes['qUnid'].Text;
end;

procedure TXMLIPITrib.Set_QUnid(Value: string);
begin
  ChildNodes['qUnid'].NodeValue := Value;
end;

function TXMLIPITrib.Get_VUnid: string;
begin
  Result := ChildNodes['vUnid'].Text;
end;

procedure TXMLIPITrib.Set_VUnid(Value: string);
begin
  ChildNodes['vUnid'].NodeValue := Value;
end;

function TXMLIPITrib.Get_VIPI: string;
begin
  Result := ChildNodes['vIPI'].Text;
end;

procedure TXMLIPITrib.Set_VIPI(Value: string);
begin
  ChildNodes['vIPI'].NodeValue := Value;
end;

{ TXMLIPINT }

function TXMLIPINT.Get_CST: string;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLIPINT.Set_CST(Value: string);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

{ TXMLII }

function TXMLII.Get_VBC: string;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLII.Set_VBC(Value: string);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLII.Get_VDespAdu: string;
begin
  Result := ChildNodes['vDespAdu'].Text;
end;

procedure TXMLII.Set_VDespAdu(Value: string);
begin
  ChildNodes['vDespAdu'].NodeValue := Value;
end;

function TXMLII.Get_VII: string;
begin
  Result := ChildNodes['vII'].Text;
end;

procedure TXMLII.Set_VII(Value: string);
begin
  ChildNodes['vII'].NodeValue := Value;
end;

function TXMLII.Get_VIOF: string;
begin
  Result := ChildNodes['vIOF'].Text;
end;

procedure TXMLII.Set_VIOF(Value: string);
begin
  ChildNodes['vIOF'].NodeValue := Value;
end;

{ TXMLISSQN }

function TXMLISSQN.Get_VBC: string;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLISSQN.Set_VBC(Value: string);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLISSQN.Get_VAliq: string;
begin
  Result := ChildNodes['vAliq'].Text;
end;

procedure TXMLISSQN.Set_VAliq(Value: string);
begin
  ChildNodes['vAliq'].NodeValue := Value;
end;

function TXMLISSQN.Get_VISSQN: string;
begin
  Result := ChildNodes['vISSQN'].Text;
end;

procedure TXMLISSQN.Set_VISSQN(Value: string);
begin
  ChildNodes['vISSQN'].NodeValue := Value;
end;

function TXMLISSQN.Get_CMunFG: string;
begin
  Result := ChildNodes['cMunFG'].Text;
end;

procedure TXMLISSQN.Set_CMunFG(Value: string);
begin
  ChildNodes['cMunFG'].NodeValue := Value;
end;

function TXMLISSQN.Get_CListServ: string;
begin
  Result := ChildNodes['cListServ'].Text;
end;

procedure TXMLISSQN.Set_CListServ(Value: string);
begin
  ChildNodes['cListServ'].NodeValue := Value;
end;

function TXMLISSQN.Get_VDeducao: string;
begin
  Result := ChildNodes['vDeducao'].Text;
end;

procedure TXMLISSQN.Set_VDeducao(Value: string);
begin
  ChildNodes['vDeducao'].NodeValue := Value;
end;

function TXMLISSQN.Get_VOutro: string;
begin
  Result := ChildNodes['vOutro'].Text;
end;

procedure TXMLISSQN.Set_VOutro(Value: string);
begin
  ChildNodes['vOutro'].NodeValue := Value;
end;

function TXMLISSQN.Get_VDescIncond: string;
begin
  Result := ChildNodes['vDescIncond'].Text;
end;

procedure TXMLISSQN.Set_VDescIncond(Value: string);
begin
  ChildNodes['vDescIncond'].NodeValue := Value;
end;

function TXMLISSQN.Get_VDescCond: string;
begin
  Result := ChildNodes['vDescCond'].Text;
end;

procedure TXMLISSQN.Set_VDescCond(Value: string);
begin
  ChildNodes['vDescCond'].NodeValue := Value;
end;

function TXMLISSQN.Get_VISSRet: string;
begin
  Result := ChildNodes['vISSRet'].Text;
end;

procedure TXMLISSQN.Set_VISSRet(Value: string);
begin
  ChildNodes['vISSRet'].NodeValue := Value;
end;

function TXMLISSQN.Get_IndISS: string;
begin
  Result := ChildNodes['indISS'].Text;
end;

procedure TXMLISSQN.Set_IndISS(Value: string);
begin
  ChildNodes['indISS'].NodeValue := Value;
end;

function TXMLISSQN.Get_CServico: string;
begin
  Result := ChildNodes['cServico'].Text;
end;

procedure TXMLISSQN.Set_CServico(Value: string);
begin
  ChildNodes['cServico'].NodeValue := Value;
end;

function TXMLISSQN.Get_CMun: string;
begin
  Result := ChildNodes['cMun'].Text;
end;

procedure TXMLISSQN.Set_CMun(Value: string);
begin
  ChildNodes['cMun'].NodeValue := Value;
end;

function TXMLISSQN.Get_CPais: string;
begin
  Result := ChildNodes['cPais'].Text;
end;

procedure TXMLISSQN.Set_CPais(Value: string);
begin
  ChildNodes['cPais'].NodeValue := Value;
end;

function TXMLISSQN.Get_NProcesso: string;
begin
  Result := ChildNodes['nProcesso'].Text;
end;

procedure TXMLISSQN.Set_NProcesso(Value: string);
begin
  ChildNodes['nProcesso'].NodeValue := Value;
end;

function TXMLISSQN.Get_IndIncentivo: string;
begin
  Result := ChildNodes['indIncentivo'].Text;
end;

procedure TXMLISSQN.Set_IndIncentivo(Value: string);
begin
  ChildNodes['indIncentivo'].NodeValue := Value;
end;

{ TXMLPIS }

procedure TXMLPIS.AfterConstruction;
begin
  RegisterChildNode('PISAliq', TXMLPISAliq);
  RegisterChildNode('PISQtde', TXMLPISQtde);
  RegisterChildNode('PISNT', TXMLPISNT);
  RegisterChildNode('PISOutr', TXMLPISOutr);
  inherited;
end;

function TXMLPIS.Get_PISAliq: IXMLPISAliq;
begin
  Result := ChildNodes['PISAliq'] as IXMLPISAliq;
end;

function TXMLPIS.Get_PISQtde: IXMLPISQtde;
begin
  Result := ChildNodes['PISQtde'] as IXMLPISQtde;
end;

function TXMLPIS.Get_PISNT: IXMLPISNT;
begin
  Result := ChildNodes['PISNT'] as IXMLPISNT;
end;

function TXMLPIS.Get_PISOutr: IXMLPISOutr;
begin
  Result := ChildNodes['PISOutr'] as IXMLPISOutr;
end;

{ TXMLPISAliq }

function TXMLPISAliq.Get_CST: string;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLPISAliq.Set_CST(Value: string);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLPISAliq.Get_VBC: string;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLPISAliq.Set_VBC(Value: string);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLPISAliq.Get_PPIS: string;
begin
  Result := ChildNodes['pPIS'].Text;
end;

procedure TXMLPISAliq.Set_PPIS(Value: string);
begin
  ChildNodes['pPIS'].NodeValue := Value;
end;

function TXMLPISAliq.Get_VPIS: string;
begin
  Result := ChildNodes['vPIS'].Text;
end;

procedure TXMLPISAliq.Set_VPIS(Value: string);
begin
  ChildNodes['vPIS'].NodeValue := Value;
end;

{ TXMLPISQtde }

function TXMLPISQtde.Get_CST: string;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLPISQtde.Set_CST(Value: string);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLPISQtde.Get_QBCProd: string;
begin
  Result := ChildNodes['qBCProd'].Text;
end;

procedure TXMLPISQtde.Set_QBCProd(Value: string);
begin
  ChildNodes['qBCProd'].NodeValue := Value;
end;

function TXMLPISQtde.Get_VAliqProd: string;
begin
  Result := ChildNodes['vAliqProd'].Text;
end;

procedure TXMLPISQtde.Set_VAliqProd(Value: string);
begin
  ChildNodes['vAliqProd'].NodeValue := Value;
end;

function TXMLPISQtde.Get_VPIS: string;
begin
  Result := ChildNodes['vPIS'].Text;
end;

procedure TXMLPISQtde.Set_VPIS(Value: string);
begin
  ChildNodes['vPIS'].NodeValue := Value;
end;

{ TXMLPISNT }

function TXMLPISNT.Get_CST: string;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLPISNT.Set_CST(Value: string);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

{ TXMLPISOutr }

function TXMLPISOutr.Get_CST: string;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLPISOutr.Set_CST(Value: string);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLPISOutr.Get_VBC: string;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLPISOutr.Set_VBC(Value: string);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLPISOutr.Get_PPIS: string;
begin
  Result := ChildNodes['pPIS'].Text;
end;

procedure TXMLPISOutr.Set_PPIS(Value: string);
begin
  ChildNodes['pPIS'].NodeValue := Value;
end;

function TXMLPISOutr.Get_QBCProd: string;
begin
  Result := ChildNodes['qBCProd'].Text;
end;

procedure TXMLPISOutr.Set_QBCProd(Value: string);
begin
  ChildNodes['qBCProd'].NodeValue := Value;
end;

function TXMLPISOutr.Get_VAliqProd: string;
begin
  Result := ChildNodes['vAliqProd'].Text;
end;

procedure TXMLPISOutr.Set_VAliqProd(Value: string);
begin
  ChildNodes['vAliqProd'].NodeValue := Value;
end;

function TXMLPISOutr.Get_VPIS: string;
begin
  Result := ChildNodes['vPIS'].Text;
end;

procedure TXMLPISOutr.Set_VPIS(Value: string);
begin
  ChildNodes['vPIS'].NodeValue := Value;
end;

{ TXMLPISST }

function TXMLPISST.Get_VBC: string;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLPISST.Set_VBC(Value: string);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLPISST.Get_PPIS: string;
begin
  Result := ChildNodes['pPIS'].Text;
end;

procedure TXMLPISST.Set_PPIS(Value: string);
begin
  ChildNodes['pPIS'].NodeValue := Value;
end;

function TXMLPISST.Get_QBCProd: string;
begin
  Result := ChildNodes['qBCProd'].Text;
end;

procedure TXMLPISST.Set_QBCProd(Value: string);
begin
  ChildNodes['qBCProd'].NodeValue := Value;
end;

function TXMLPISST.Get_VAliqProd: string;
begin
  Result := ChildNodes['vAliqProd'].Text;
end;

procedure TXMLPISST.Set_VAliqProd(Value: string);
begin
  ChildNodes['vAliqProd'].NodeValue := Value;
end;

function TXMLPISST.Get_VPIS: string;
begin
  Result := ChildNodes['vPIS'].Text;
end;

procedure TXMLPISST.Set_VPIS(Value: string);
begin
  ChildNodes['vPIS'].NodeValue := Value;
end;

{ TXMLCOFINS }

procedure TXMLCOFINS.AfterConstruction;
begin
  RegisterChildNode('COFINSAliq', TXMLCOFINSAliq);
  RegisterChildNode('COFINSQtde', TXMLCOFINSQtde);
  RegisterChildNode('COFINSNT', TXMLCOFINSNT);
  RegisterChildNode('COFINSOutr', TXMLCOFINSOutr);
  inherited;
end;

function TXMLCOFINS.Get_COFINSAliq: IXMLCOFINSAliq;
begin
  Result := ChildNodes['COFINSAliq'] as IXMLCOFINSAliq;
end;

function TXMLCOFINS.Get_COFINSQtde: IXMLCOFINSQtde;
begin
  Result := ChildNodes['COFINSQtde'] as IXMLCOFINSQtde;
end;

function TXMLCOFINS.Get_COFINSNT: IXMLCOFINSNT;
begin
  Result := ChildNodes['COFINSNT'] as IXMLCOFINSNT;
end;

function TXMLCOFINS.Get_COFINSOutr: IXMLCOFINSOutr;
begin
  Result := ChildNodes['COFINSOutr'] as IXMLCOFINSOutr;
end;

{ TXMLCOFINSAliq }

function TXMLCOFINSAliq.Get_CST: string;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLCOFINSAliq.Set_CST(Value: string);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLCOFINSAliq.Get_VBC: string;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLCOFINSAliq.Set_VBC(Value: string);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLCOFINSAliq.Get_PCOFINS: string;
begin
  Result := ChildNodes['pCOFINS'].Text;
end;

procedure TXMLCOFINSAliq.Set_PCOFINS(Value: string);
begin
  ChildNodes['pCOFINS'].NodeValue := Value;
end;

function TXMLCOFINSAliq.Get_VCOFINS: string;
begin
  Result := ChildNodes['vCOFINS'].Text;
end;

procedure TXMLCOFINSAliq.Set_VCOFINS(Value: string);
begin
  ChildNodes['vCOFINS'].NodeValue := Value;
end;

{ TXMLCOFINSQtde }

function TXMLCOFINSQtde.Get_CST: string;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLCOFINSQtde.Set_CST(Value: string);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLCOFINSQtde.Get_QBCProd: string;
begin
  Result := ChildNodes['qBCProd'].Text;
end;

procedure TXMLCOFINSQtde.Set_QBCProd(Value: string);
begin
  ChildNodes['qBCProd'].NodeValue := Value;
end;

function TXMLCOFINSQtde.Get_VAliqProd: string;
begin
  Result := ChildNodes['vAliqProd'].Text;
end;

procedure TXMLCOFINSQtde.Set_VAliqProd(Value: string);
begin
  ChildNodes['vAliqProd'].NodeValue := Value;
end;

function TXMLCOFINSQtde.Get_VCOFINS: string;
begin
  Result := ChildNodes['vCOFINS'].Text;
end;

procedure TXMLCOFINSQtde.Set_VCOFINS(Value: string);
begin
  ChildNodes['vCOFINS'].NodeValue := Value;
end;

{ TXMLCOFINSNT }

function TXMLCOFINSNT.Get_CST: string;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLCOFINSNT.Set_CST(Value: string);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

{ TXMLCOFINSOutr }

function TXMLCOFINSOutr.Get_CST: string;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLCOFINSOutr.Set_CST(Value: string);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLCOFINSOutr.Get_VBC: string;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLCOFINSOutr.Set_VBC(Value: string);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLCOFINSOutr.Get_PCOFINS: string;
begin
  Result := ChildNodes['pCOFINS'].Text;
end;

procedure TXMLCOFINSOutr.Set_PCOFINS(Value: string);
begin
  ChildNodes['pCOFINS'].NodeValue := Value;
end;

function TXMLCOFINSOutr.Get_QBCProd: string;
begin
  Result := ChildNodes['qBCProd'].Text;
end;

procedure TXMLCOFINSOutr.Set_QBCProd(Value: string);
begin
  ChildNodes['qBCProd'].NodeValue := Value;
end;

function TXMLCOFINSOutr.Get_VAliqProd: string;
begin
  Result := ChildNodes['vAliqProd'].Text;
end;

procedure TXMLCOFINSOutr.Set_VAliqProd(Value: string);
begin
  ChildNodes['vAliqProd'].NodeValue := Value;
end;

function TXMLCOFINSOutr.Get_VCOFINS: string;
begin
  Result := ChildNodes['vCOFINS'].Text;
end;

procedure TXMLCOFINSOutr.Set_VCOFINS(Value: string);
begin
  ChildNodes['vCOFINS'].NodeValue := Value;
end;

{ TXMLCOFINSST }

function TXMLCOFINSST.Get_VBC: string;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLCOFINSST.Set_VBC(Value: string);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLCOFINSST.Get_PCOFINS: string;
begin
  Result := ChildNodes['pCOFINS'].Text;
end;

procedure TXMLCOFINSST.Set_PCOFINS(Value: string);
begin
  ChildNodes['pCOFINS'].NodeValue := Value;
end;

function TXMLCOFINSST.Get_QBCProd: string;
begin
  Result := ChildNodes['qBCProd'].Text;
end;

procedure TXMLCOFINSST.Set_QBCProd(Value: string);
begin
  ChildNodes['qBCProd'].NodeValue := Value;
end;

function TXMLCOFINSST.Get_VAliqProd: string;
begin
  Result := ChildNodes['vAliqProd'].Text;
end;

procedure TXMLCOFINSST.Set_VAliqProd(Value: string);
begin
  ChildNodes['vAliqProd'].NodeValue := Value;
end;

function TXMLCOFINSST.Get_VCOFINS: string;
begin
  Result := ChildNodes['vCOFINS'].Text;
end;

procedure TXMLCOFINSST.Set_VCOFINS(Value: string);
begin
  ChildNodes['vCOFINS'].NodeValue := Value;
end;

{ TXMLICMSUFDest }

function TXMLICMSUFDest.Get_VBCUFDest: string;
begin
  Result := ChildNodes['vBCUFDest'].Text;
end;

procedure TXMLICMSUFDest.Set_VBCUFDest(Value: string);
begin
  ChildNodes['vBCUFDest'].NodeValue := Value;
end;

function TXMLICMSUFDest.Get_VBCFCPUFDest: string;
begin
  Result := ChildNodes['vBCFCPUFDest'].Text;
end;

procedure TXMLICMSUFDest.Set_VBCFCPUFDest(Value: string);
begin
  ChildNodes['vBCFCPUFDest'].NodeValue := Value;
end;

function TXMLICMSUFDest.Get_PFCPUFDest: string;
begin
  Result := ChildNodes['pFCPUFDest'].Text;
end;

procedure TXMLICMSUFDest.Set_PFCPUFDest(Value: string);
begin
  ChildNodes['pFCPUFDest'].NodeValue := Value;
end;

function TXMLICMSUFDest.Get_PICMSUFDest: string;
begin
  Result := ChildNodes['pICMSUFDest'].Text;
end;

procedure TXMLICMSUFDest.Set_PICMSUFDest(Value: string);
begin
  ChildNodes['pICMSUFDest'].NodeValue := Value;
end;

function TXMLICMSUFDest.Get_PICMSInter: string;
begin
  Result := ChildNodes['pICMSInter'].Text;
end;

procedure TXMLICMSUFDest.Set_PICMSInter(Value: string);
begin
  ChildNodes['pICMSInter'].NodeValue := Value;
end;

function TXMLICMSUFDest.Get_PICMSInterPart: string;
begin
  Result := ChildNodes['pICMSInterPart'].Text;
end;

procedure TXMLICMSUFDest.Set_PICMSInterPart(Value: string);
begin
  ChildNodes['pICMSInterPart'].NodeValue := Value;
end;

function TXMLICMSUFDest.Get_VFCPUFDest: string;
begin
  Result := ChildNodes['vFCPUFDest'].Text;
end;

procedure TXMLICMSUFDest.Set_VFCPUFDest(Value: string);
begin
  ChildNodes['vFCPUFDest'].NodeValue := Value;
end;

function TXMLICMSUFDest.Get_VICMSUFDest: string;
begin
  Result := ChildNodes['vICMSUFDest'].Text;
end;

procedure TXMLICMSUFDest.Set_VICMSUFDest(Value: string);
begin
  ChildNodes['vICMSUFDest'].NodeValue := Value;
end;

function TXMLICMSUFDest.Get_VICMSUFRemet: string;
begin
  Result := ChildNodes['vICMSUFRemet'].Text;
end;

procedure TXMLICMSUFDest.Set_VICMSUFRemet(Value: string);
begin
  ChildNodes['vICMSUFRemet'].NodeValue := Value;
end;

{ TXMLImpostoDevol }

procedure TXMLImpostoDevol.AfterConstruction;
begin
  RegisterChildNode('IPI', TXMLIPI);
  inherited;
end;

function TXMLImpostoDevol.Get_PDevol: string;
begin
  Result := ChildNodes['pDevol'].Text;
end;

procedure TXMLImpostoDevol.Set_PDevol(Value: string);
begin
  ChildNodes['pDevol'].NodeValue := Value;
end;

function TXMLImpostoDevol.Get_IPI: IXMLIPI;
begin
  Result := ChildNodes['IPI'] as IXMLIPI;
end;

{ TXMLIPI }

function TXMLIPI.Get_VIPIDevol: string;
begin
  Result := ChildNodes['vIPIDevol'].Text;
end;

procedure TXMLIPI.Set_VIPIDevol(Value: string);
begin
  ChildNodes['vIPIDevol'].NodeValue := Value;
end;

{ TXMLTotal }

procedure TXMLTotal.AfterConstruction;
begin
  RegisterChildNode('ICMSTot', TXMLICMSTot);
  RegisterChildNode('ISSQNtot', TXMLISSQNtot);
  RegisterChildNode('retTrib', TXMLRetTrib);
  inherited;
end;

function TXMLTotal.Get_ICMSTot: IXMLICMSTot;
begin
  Result := ChildNodes['ICMSTot'] as IXMLICMSTot;
end;

function TXMLTotal.Get_ISSQNtot: IXMLISSQNtot;
begin
  Result := ChildNodes['ISSQNtot'] as IXMLISSQNtot;
end;

function TXMLTotal.Get_RetTrib: IXMLRetTrib;
begin
  Result := ChildNodes['retTrib'] as IXMLRetTrib;
end;

{ TXMLICMSTot }

function TXMLICMSTot.Get_VBC: string;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLICMSTot.Set_VBC(Value: string);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLICMSTot.Get_VICMS: string;
begin
  Result := ChildNodes['vICMS'].Text;
end;

procedure TXMLICMSTot.Set_VICMS(Value: string);
begin
  ChildNodes['vICMS'].NodeValue := Value;
end;

function TXMLICMSTot.Get_VICMSDeson: string;
begin
  Result := ChildNodes['vICMSDeson'].Text;
end;

procedure TXMLICMSTot.Set_VICMSDeson(Value: string);
begin
  ChildNodes['vICMSDeson'].NodeValue := Value;
end;

function TXMLICMSTot.Get_VFCPUFDest: string;
begin
  Result := ChildNodes['vFCPUFDest'].Text;
end;

procedure TXMLICMSTot.Set_VFCPUFDest(Value: string);
begin
  ChildNodes['vFCPUFDest'].NodeValue := Value;
end;

function TXMLICMSTot.Get_VICMSUFDest: string;
begin
  Result := ChildNodes['vICMSUFDest'].Text;
end;

procedure TXMLICMSTot.Set_VICMSUFDest(Value: string);
begin
  ChildNodes['vICMSUFDest'].NodeValue := Value;
end;

function TXMLICMSTot.Get_VICMSUFRemet: string;
begin
  Result := ChildNodes['vICMSUFRemet'].Text;
end;

procedure TXMLICMSTot.Set_VICMSUFRemet(Value: string);
begin
  ChildNodes['vICMSUFRemet'].NodeValue := Value;
end;

function TXMLICMSTot.Get_VFCP: string;
begin
  Result := ChildNodes['vFCP'].Text;
end;

procedure TXMLICMSTot.Set_VFCP(Value: string);
begin
  ChildNodes['vFCP'].NodeValue := Value;
end;

function TXMLICMSTot.Get_VBCST: string;
begin
  Result := ChildNodes['vBCST'].Text;
end;

procedure TXMLICMSTot.Set_VBCST(Value: string);
begin
  ChildNodes['vBCST'].NodeValue := Value;
end;

function TXMLICMSTot.Get_VST: string;
begin
  Result := ChildNodes['vST'].Text;
end;

procedure TXMLICMSTot.Set_VST(Value: string);
begin
  ChildNodes['vST'].NodeValue := Value;
end;

function TXMLICMSTot.Get_VFCPST: string;
begin
  Result := ChildNodes['vFCPST'].Text;
end;

procedure TXMLICMSTot.Set_VFCPST(Value: string);
begin
  ChildNodes['vFCPST'].NodeValue := Value;
end;

function TXMLICMSTot.Get_VFCPSTRet: string;
begin
  Result := ChildNodes['vFCPSTRet'].Text;
end;

procedure TXMLICMSTot.Set_VFCPSTRet(Value: string);
begin
  ChildNodes['vFCPSTRet'].NodeValue := Value;
end;

function TXMLICMSTot.Get_VProd: string;
begin
  Result := ChildNodes['vProd'].Text;
end;

procedure TXMLICMSTot.Set_VProd(Value: string);
begin
  ChildNodes['vProd'].NodeValue := Value;
end;

function TXMLICMSTot.Get_VFrete: string;
begin
  Result := ChildNodes['vFrete'].Text;
end;

procedure TXMLICMSTot.Set_VFrete(Value: string);
begin
  ChildNodes['vFrete'].NodeValue := Value;
end;

function TXMLICMSTot.Get_VSeg: string;
begin
  Result := ChildNodes['vSeg'].Text;
end;

procedure TXMLICMSTot.Set_VSeg(Value: string);
begin
  ChildNodes['vSeg'].NodeValue := Value;
end;

function TXMLICMSTot.Get_VDesc: string;
begin
  Result := ChildNodes['vDesc'].Text;
end;

procedure TXMLICMSTot.Set_VDesc(Value: string);
begin
  ChildNodes['vDesc'].NodeValue := Value;
end;

function TXMLICMSTot.Get_VII: string;
begin
  Result := ChildNodes['vII'].Text;
end;

procedure TXMLICMSTot.Set_VII(Value: string);
begin
  ChildNodes['vII'].NodeValue := Value;
end;

function TXMLICMSTot.Get_VIPI: string;
begin
  Result := ChildNodes['vIPI'].Text;
end;

procedure TXMLICMSTot.Set_VIPI(Value: string);
begin
  ChildNodes['vIPI'].NodeValue := Value;
end;

function TXMLICMSTot.Get_VIPIDevol: string;
begin
  Result := ChildNodes['vIPIDevol'].Text;
end;

procedure TXMLICMSTot.Set_VIPIDevol(Value: string);
begin
  ChildNodes['vIPIDevol'].NodeValue := Value;
end;

function TXMLICMSTot.Get_VPIS: string;
begin
  Result := ChildNodes['vPIS'].Text;
end;

procedure TXMLICMSTot.Set_VPIS(Value: string);
begin
  ChildNodes['vPIS'].NodeValue := Value;
end;

function TXMLICMSTot.Get_VCOFINS: string;
begin
  Result := ChildNodes['vCOFINS'].Text;
end;

procedure TXMLICMSTot.Set_VCOFINS(Value: string);
begin
  ChildNodes['vCOFINS'].NodeValue := Value;
end;

function TXMLICMSTot.Get_VOutro: string;
begin
  Result := ChildNodes['vOutro'].Text;
end;

procedure TXMLICMSTot.Set_VOutro(Value: string);
begin
  ChildNodes['vOutro'].NodeValue := Value;
end;

function TXMLICMSTot.Get_VNF: string;
begin
  Result := ChildNodes['vNF'].Text;
end;

procedure TXMLICMSTot.Set_VNF(Value: string);
begin
  ChildNodes['vNF'].NodeValue := Value;
end;

function TXMLICMSTot.Get_VTotTrib: string;
begin
  Result := ChildNodes['vTotTrib'].Text;
end;

procedure TXMLICMSTot.Set_VTotTrib(Value: string);
begin
  ChildNodes['vTotTrib'].NodeValue := Value;
end;

{ TXMLISSQNtot }

function TXMLISSQNtot.Get_VServ: string;
begin
  Result := ChildNodes['vServ'].Text;
end;

procedure TXMLISSQNtot.Set_VServ(Value: string);
begin
  ChildNodes['vServ'].NodeValue := Value;
end;

function TXMLISSQNtot.Get_VBC: string;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLISSQNtot.Set_VBC(Value: string);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLISSQNtot.Get_VISS: string;
begin
  Result := ChildNodes['vISS'].Text;
end;

procedure TXMLISSQNtot.Set_VISS(Value: string);
begin
  ChildNodes['vISS'].NodeValue := Value;
end;

function TXMLISSQNtot.Get_VPIS: string;
begin
  Result := ChildNodes['vPIS'].Text;
end;

procedure TXMLISSQNtot.Set_VPIS(Value: string);
begin
  ChildNodes['vPIS'].NodeValue := Value;
end;

function TXMLISSQNtot.Get_VCOFINS: string;
begin
  Result := ChildNodes['vCOFINS'].Text;
end;

procedure TXMLISSQNtot.Set_VCOFINS(Value: string);
begin
  ChildNodes['vCOFINS'].NodeValue := Value;
end;

function TXMLISSQNtot.Get_DCompet: string;
begin
  Result := ChildNodes['dCompet'].Text;
end;

procedure TXMLISSQNtot.Set_DCompet(Value: string);
begin
  ChildNodes['dCompet'].NodeValue := Value;
end;

function TXMLISSQNtot.Get_VDeducao: string;
begin
  Result := ChildNodes['vDeducao'].Text;
end;

procedure TXMLISSQNtot.Set_VDeducao(Value: string);
begin
  ChildNodes['vDeducao'].NodeValue := Value;
end;

function TXMLISSQNtot.Get_VOutro: string;
begin
  Result := ChildNodes['vOutro'].Text;
end;

procedure TXMLISSQNtot.Set_VOutro(Value: string);
begin
  ChildNodes['vOutro'].NodeValue := Value;
end;

function TXMLISSQNtot.Get_VDescIncond: string;
begin
  Result := ChildNodes['vDescIncond'].Text;
end;

procedure TXMLISSQNtot.Set_VDescIncond(Value: string);
begin
  ChildNodes['vDescIncond'].NodeValue := Value;
end;

function TXMLISSQNtot.Get_VDescCond: string;
begin
  Result := ChildNodes['vDescCond'].Text;
end;

procedure TXMLISSQNtot.Set_VDescCond(Value: string);
begin
  ChildNodes['vDescCond'].NodeValue := Value;
end;

function TXMLISSQNtot.Get_VISSRet: string;
begin
  Result := ChildNodes['vISSRet'].Text;
end;

procedure TXMLISSQNtot.Set_VISSRet(Value: string);
begin
  ChildNodes['vISSRet'].NodeValue := Value;
end;

function TXMLISSQNtot.Get_CRegTrib: string;
begin
  Result := ChildNodes['cRegTrib'].Text;
end;

procedure TXMLISSQNtot.Set_CRegTrib(Value: string);
begin
  ChildNodes['cRegTrib'].NodeValue := Value;
end;

{ TXMLRetTrib }

function TXMLRetTrib.Get_VRetPIS: string;
begin
  Result := ChildNodes['vRetPIS'].Text;
end;

procedure TXMLRetTrib.Set_VRetPIS(Value: string);
begin
  ChildNodes['vRetPIS'].NodeValue := Value;
end;

function TXMLRetTrib.Get_VRetCOFINS: string;
begin
  Result := ChildNodes['vRetCOFINS'].Text;
end;

procedure TXMLRetTrib.Set_VRetCOFINS(Value: string);
begin
  ChildNodes['vRetCOFINS'].NodeValue := Value;
end;

function TXMLRetTrib.Get_VRetCSLL: string;
begin
  Result := ChildNodes['vRetCSLL'].Text;
end;

procedure TXMLRetTrib.Set_VRetCSLL(Value: string);
begin
  ChildNodes['vRetCSLL'].NodeValue := Value;
end;

function TXMLRetTrib.Get_VBCIRRF: string;
begin
  Result := ChildNodes['vBCIRRF'].Text;
end;

procedure TXMLRetTrib.Set_VBCIRRF(Value: string);
begin
  ChildNodes['vBCIRRF'].NodeValue := Value;
end;

function TXMLRetTrib.Get_VIRRF: string;
begin
  Result := ChildNodes['vIRRF'].Text;
end;

procedure TXMLRetTrib.Set_VIRRF(Value: string);
begin
  ChildNodes['vIRRF'].NodeValue := Value;
end;

function TXMLRetTrib.Get_VBCRetPrev: string;
begin
  Result := ChildNodes['vBCRetPrev'].Text;
end;

procedure TXMLRetTrib.Set_VBCRetPrev(Value: string);
begin
  ChildNodes['vBCRetPrev'].NodeValue := Value;
end;

function TXMLRetTrib.Get_VRetPrev: string;
begin
  Result := ChildNodes['vRetPrev'].Text;
end;

procedure TXMLRetTrib.Set_VRetPrev(Value: string);
begin
  ChildNodes['vRetPrev'].NodeValue := Value;
end;

{ TXMLTransp }

procedure TXMLTransp.AfterConstruction;
begin
  RegisterChildNode('transporta', TXMLTransporta);
  RegisterChildNode('retTransp', TXMLRetTransp);
  RegisterChildNode('veicTransp', TXMLTVeiculo);
  RegisterChildNode('reboque', TXMLTVeiculo);
  RegisterChildNode('vol', TXMLVol);
  FReboque := CreateCollection(TXMLTVeiculoList, IXMLTVeiculo, 'reboque') as IXMLTVeiculoList;
  FVol := CreateCollection(TXMLVolList, IXMLVol, 'vol') as IXMLVolList;
  inherited;
end;

function TXMLTransp.Get_ModFrete: string;
begin
  Result := ChildNodes['modFrete'].Text;
end;

procedure TXMLTransp.Set_ModFrete(Value: string);
begin
  ChildNodes['modFrete'].NodeValue := Value;
end;

function TXMLTransp.Get_Transporta: IXMLTransporta;
begin
  Result := ChildNodes['transporta'] as IXMLTransporta;
end;

function TXMLTransp.Get_RetTransp: IXMLRetTransp;
begin
  Result := ChildNodes['retTransp'] as IXMLRetTransp;
end;

function TXMLTransp.Get_VeicTransp: IXMLTVeiculo;
begin
  Result := ChildNodes['veicTransp'] as IXMLTVeiculo;
end;

function TXMLTransp.Get_Reboque: IXMLTVeiculoList;
begin
  Result := FReboque;
end;

function TXMLTransp.Get_Vagao: string;
begin
  Result := ChildNodes['vagao'].Text;
end;

procedure TXMLTransp.Set_Vagao(Value: string);
begin
  ChildNodes['vagao'].NodeValue := Value;
end;

function TXMLTransp.Get_Balsa: string;
begin
  Result := ChildNodes['balsa'].Text;
end;

procedure TXMLTransp.Set_Balsa(Value: string);
begin
  ChildNodes['balsa'].NodeValue := Value;
end;

function TXMLTransp.Get_Vol: IXMLVolList;
begin
  Result := FVol;
end;

{ TXMLTransporta }

function TXMLTransporta.Get_CNPJ: string;
begin
  Result := ChildNodes['CNPJ'].Text;
end;

procedure TXMLTransporta.Set_CNPJ(Value: string);
begin
  ChildNodes['CNPJ'].NodeValue := Value;
end;

function TXMLTransporta.Get_CPF: string;
begin
  Result := ChildNodes['CPF'].Text;
end;

procedure TXMLTransporta.Set_CPF(Value: string);
begin
  ChildNodes['CPF'].NodeValue := Value;
end;

function TXMLTransporta.Get_XNome: string;
begin
  Result := ChildNodes['xNome'].Text;
end;

procedure TXMLTransporta.Set_XNome(Value: string);
begin
  ChildNodes['xNome'].NodeValue := Value;
end;

function TXMLTransporta.Get_IE: string;
begin
  Result := ChildNodes['IE'].Text;
end;

procedure TXMLTransporta.Set_IE(Value: string);
begin
  ChildNodes['IE'].NodeValue := Value;
end;

function TXMLTransporta.Get_XEnder: string;
begin
  Result := ChildNodes['xEnder'].Text;
end;

procedure TXMLTransporta.Set_XEnder(Value: string);
begin
  ChildNodes['xEnder'].NodeValue := Value;
end;

function TXMLTransporta.Get_XMun: string;
begin
  Result := ChildNodes['xMun'].Text;
end;

procedure TXMLTransporta.Set_XMun(Value: string);
begin
  ChildNodes['xMun'].NodeValue := Value;
end;

function TXMLTransporta.Get_UF: string;
begin
  Result := ChildNodes['UF'].Text;
end;

procedure TXMLTransporta.Set_UF(Value: string);
begin
  ChildNodes['UF'].NodeValue := Value;
end;

{ TXMLRetTransp }

function TXMLRetTransp.Get_VServ: string;
begin
  Result := ChildNodes['vServ'].Text;
end;

procedure TXMLRetTransp.Set_VServ(Value: string);
begin
  ChildNodes['vServ'].NodeValue := Value;
end;

function TXMLRetTransp.Get_VBCRet: string;
begin
  Result := ChildNodes['vBCRet'].Text;
end;

procedure TXMLRetTransp.Set_VBCRet(Value: string);
begin
  ChildNodes['vBCRet'].NodeValue := Value;
end;

function TXMLRetTransp.Get_PICMSRet: string;
begin
  Result := ChildNodes['pICMSRet'].Text;
end;

procedure TXMLRetTransp.Set_PICMSRet(Value: string);
begin
  ChildNodes['pICMSRet'].NodeValue := Value;
end;

function TXMLRetTransp.Get_VICMSRet: string;
begin
  Result := ChildNodes['vICMSRet'].Text;
end;

procedure TXMLRetTransp.Set_VICMSRet(Value: string);
begin
  ChildNodes['vICMSRet'].NodeValue := Value;
end;

function TXMLRetTransp.Get_CFOP: string;
begin
  Result := ChildNodes['CFOP'].Text;
end;

procedure TXMLRetTransp.Set_CFOP(Value: string);
begin
  ChildNodes['CFOP'].NodeValue := Value;
end;

function TXMLRetTransp.Get_CMunFG: string;
begin
  Result := ChildNodes['cMunFG'].Text;
end;

procedure TXMLRetTransp.Set_CMunFG(Value: string);
begin
  ChildNodes['cMunFG'].NodeValue := Value;
end;

{ TXMLTVeiculo }

function TXMLTVeiculo.Get_Placa: string;
begin
  Result := ChildNodes['placa'].Text;
end;

procedure TXMLTVeiculo.Set_Placa(Value: string);
begin
  ChildNodes['placa'].NodeValue := Value;
end;

function TXMLTVeiculo.Get_UF: string;
begin
  Result := ChildNodes['UF'].Text;
end;

procedure TXMLTVeiculo.Set_UF(Value: string);
begin
  ChildNodes['UF'].NodeValue := Value;
end;

function TXMLTVeiculo.Get_RNTC: string;
begin
  Result := ChildNodes['RNTC'].Text;
end;

procedure TXMLTVeiculo.Set_RNTC(Value: string);
begin
  ChildNodes['RNTC'].NodeValue := Value;
end;

{ TXMLTVeiculoList }

function TXMLTVeiculoList.Add: IXMLTVeiculo;
begin
  Result := AddItem(-1) as IXMLTVeiculo;
end;

function TXMLTVeiculoList.Insert(const Index: Integer): IXMLTVeiculo;
begin
  Result := AddItem(Index) as IXMLTVeiculo;
end;

function TXMLTVeiculoList.Get_Item(Index: Integer): IXMLTVeiculo;
begin
  Result := List[Index] as IXMLTVeiculo;
end;

{ TXMLVol }

procedure TXMLVol.AfterConstruction;
begin
  RegisterChildNode('lacres', TXMLLacres);
  FLacres := CreateCollection(TXMLLacresList, IXMLLacres, 'lacres') as IXMLLacresList;
  inherited;
end;

function TXMLVol.Get_QVol: string;
begin
  Result := ChildNodes['qVol'].Text;
end;

procedure TXMLVol.Set_QVol(Value: string);
begin
  ChildNodes['qVol'].NodeValue := Value;
end;

function TXMLVol.Get_Esp: string;
begin
  Result := ChildNodes['esp'].Text;
end;

procedure TXMLVol.Set_Esp(Value: string);
begin
  ChildNodes['esp'].NodeValue := Value;
end;

function TXMLVol.Get_Marca: string;
begin
  Result := ChildNodes['marca'].Text;
end;

procedure TXMLVol.Set_Marca(Value: string);
begin
  ChildNodes['marca'].NodeValue := Value;
end;

function TXMLVol.Get_NVol: string;
begin
  Result := ChildNodes['nVol'].Text;
end;

procedure TXMLVol.Set_NVol(Value: string);
begin
  ChildNodes['nVol'].NodeValue := Value;
end;

function TXMLVol.Get_PesoL: string;
begin
  Result := ChildNodes['pesoL'].Text;
end;

procedure TXMLVol.Set_PesoL(Value: string);
begin
  ChildNodes['pesoL'].NodeValue := Value;
end;

function TXMLVol.Get_PesoB: string;
begin
  Result := ChildNodes['pesoB'].Text;
end;

procedure TXMLVol.Set_PesoB(Value: string);
begin
  ChildNodes['pesoB'].NodeValue := Value;
end;

function TXMLVol.Get_Lacres: IXMLLacresList;
begin
  Result := FLacres;
end;

{ TXMLVolList }

function TXMLVolList.Add: IXMLVol;
begin
  Result := AddItem(-1) as IXMLVol;
end;

function TXMLVolList.Insert(const Index: Integer): IXMLVol;
begin
  Result := AddItem(Index) as IXMLVol;
end;

function TXMLVolList.Get_Item(Index: Integer): IXMLVol;
begin
  Result := List[Index] as IXMLVol;
end;

{ TXMLLacres }

function TXMLLacres.Get_NLacre: string;
begin
  Result := ChildNodes['nLacre'].Text;
end;

procedure TXMLLacres.Set_NLacre(Value: string);
begin
  ChildNodes['nLacre'].NodeValue := Value;
end;

{ TXMLLacresList }

function TXMLLacresList.Add: IXMLLacres;
begin
  Result := AddItem(-1) as IXMLLacres;
end;

function TXMLLacresList.Insert(const Index: Integer): IXMLLacres;
begin
  Result := AddItem(Index) as IXMLLacres;
end;

function TXMLLacresList.Get_Item(Index: Integer): IXMLLacres;
begin
  Result := List[Index] as IXMLLacres;
end;

{ TXMLCobr }

procedure TXMLCobr.AfterConstruction;
begin
  RegisterChildNode('fat', TXMLFat);
  RegisterChildNode('dup', TXMLDup);
  FDup := CreateCollection(TXMLDupList, IXMLDup, 'dup') as IXMLDupList;
  inherited;
end;

function TXMLCobr.Get_Fat: IXMLFat;
begin
  Result := ChildNodes['fat'] as IXMLFat;
end;

function TXMLCobr.Get_Dup: IXMLDupList;
begin
  Result := FDup;
end;

{ TXMLFat }

function TXMLFat.Get_NFat: string;
begin
  Result := ChildNodes['nFat'].Text;
end;

procedure TXMLFat.Set_NFat(Value: string);
begin
  ChildNodes['nFat'].NodeValue := Value;
end;

function TXMLFat.Get_VOrig: string;
begin
  Result := ChildNodes['vOrig'].Text;
end;

procedure TXMLFat.Set_VOrig(Value: string);
begin
  ChildNodes['vOrig'].NodeValue := Value;
end;

function TXMLFat.Get_VDesc: string;
begin
  Result := ChildNodes['vDesc'].Text;
end;

procedure TXMLFat.Set_VDesc(Value: string);
begin
  ChildNodes['vDesc'].NodeValue := Value;
end;

function TXMLFat.Get_VLiq: string;
begin
  Result := ChildNodes['vLiq'].Text;
end;

procedure TXMLFat.Set_VLiq(Value: string);
begin
  ChildNodes['vLiq'].NodeValue := Value;
end;

{ TXMLDup }

function TXMLDup.Get_NDup: string;
begin
  Result := ChildNodes['nDup'].Text;
end;

procedure TXMLDup.Set_NDup(Value: string);
begin
  ChildNodes['nDup'].NodeValue := Value;
end;

function TXMLDup.Get_DVenc: string;
begin
  Result := ChildNodes['dVenc'].Text;
end;

procedure TXMLDup.Set_DVenc(Value: string);
begin
  ChildNodes['dVenc'].NodeValue := Value;
end;

function TXMLDup.Get_VDup: string;
begin
  Result := ChildNodes['vDup'].Text;
end;

procedure TXMLDup.Set_VDup(Value: string);
begin
  ChildNodes['vDup'].NodeValue := Value;
end;

{ TXMLDupList }

function TXMLDupList.Add: IXMLDup;
begin
  Result := AddItem(-1) as IXMLDup;
end;

function TXMLDupList.Insert(const Index: Integer): IXMLDup;
begin
  Result := AddItem(Index) as IXMLDup;
end;

function TXMLDupList.Get_Item(Index: Integer): IXMLDup;
begin
  Result := List[Index] as IXMLDup;
end;

{ TXMLPag }

procedure TXMLPag.AfterConstruction;
begin
  RegisterChildNode('detPag', TXMLDetPag);
  FDetPag := CreateCollection(TXMLDetPagList, IXMLDetPag, 'detPag') as IXMLDetPagList;
  inherited;
end;

function TXMLPag.Get_DetPag: IXMLDetPagList;
begin
  Result := FDetPag;
end;

function TXMLPag.Get_VTroco: string;
begin
  Result := ChildNodes['vTroco'].Text;
end;

procedure TXMLPag.Set_VTroco(Value: string);
begin
  ChildNodes['vTroco'].NodeValue := Value;
end;

{ TXMLDetPag }

procedure TXMLDetPag.AfterConstruction;
begin
  RegisterChildNode('card', TXMLCard);
  inherited;
end;

function TXMLDetPag.Get_IndPag: string;
begin
  Result := ChildNodes['indPag'].Text;
end;

procedure TXMLDetPag.Set_IndPag(Value: string);
begin
  ChildNodes['indPag'].NodeValue := Value;
end;

function TXMLDetPag.Get_TPag: string;
begin
  Result := ChildNodes['tPag'].Text;
end;

procedure TXMLDetPag.Set_TPag(Value: string);
begin
  ChildNodes['tPag'].NodeValue := Value;
end;

function TXMLDetPag.Get_VPag: string;
begin
  Result := ChildNodes['vPag'].Text;
end;

procedure TXMLDetPag.Set_VPag(Value: string);
begin
  ChildNodes['vPag'].NodeValue := Value;
end;

function TXMLDetPag.Get_Card: IXMLCard;
begin
  Result := ChildNodes['card'] as IXMLCard;
end;

{ TXMLDetPagList }

function TXMLDetPagList.Add: IXMLDetPag;
begin
  Result := AddItem(-1) as IXMLDetPag;
end;

function TXMLDetPagList.Insert(const Index: Integer): IXMLDetPag;
begin
  Result := AddItem(Index) as IXMLDetPag;
end;

function TXMLDetPagList.Get_Item(Index: Integer): IXMLDetPag;
begin
  Result := List[Index] as IXMLDetPag;
end;

{ TXMLCard }

function TXMLCard.Get_TpIntegra: string;
begin
  Result := ChildNodes['tpIntegra'].Text;
end;

procedure TXMLCard.Set_TpIntegra(Value: string);
begin
  ChildNodes['tpIntegra'].NodeValue := Value;
end;

function TXMLCard.Get_CNPJ: string;
begin
  Result := ChildNodes['CNPJ'].Text;
end;

procedure TXMLCard.Set_CNPJ(Value: string);
begin
  ChildNodes['CNPJ'].NodeValue := Value;
end;

function TXMLCard.Get_TBand: string;
begin
  Result := ChildNodes['tBand'].Text;
end;

procedure TXMLCard.Set_TBand(Value: string);
begin
  ChildNodes['tBand'].NodeValue := Value;
end;

function TXMLCard.Get_CAut: string;
begin
  Result := ChildNodes['cAut'].Text;
end;

procedure TXMLCard.Set_CAut(Value: string);
begin
  ChildNodes['cAut'].NodeValue := Value;
end;

{ TXMLInfIntermed }

function TXMLInfIntermed.Get_CNPJ: string;
begin
  Result := ChildNodes['CNPJ'].Text;
end;

procedure TXMLInfIntermed.Set_CNPJ(Value: string);
begin
  ChildNodes['CNPJ'].NodeValue := Value;
end;

function TXMLInfIntermed.Get_IdCadIntTran: string;
begin
  Result := ChildNodes['idCadIntTran'].Text;
end;

procedure TXMLInfIntermed.Set_IdCadIntTran(Value: string);
begin
  ChildNodes['idCadIntTran'].NodeValue := Value;
end;

{ TXMLInfAdic }

procedure TXMLInfAdic.AfterConstruction;
begin
  RegisterChildNode('obsCont', TXMLObsCont);
  RegisterChildNode('obsFisco', TXMLObsFisco);
  RegisterChildNode('procRef', TXMLProcRef);
  FObsCont := CreateCollection(TXMLObsContList, IXMLObsCont, 'obsCont') as IXMLObsContList;
  FObsFisco := CreateCollection(TXMLObsFiscoList, IXMLObsFisco, 'obsFisco') as IXMLObsFiscoList;
  FProcRef := CreateCollection(TXMLProcRefList, IXMLProcRef, 'procRef') as IXMLProcRefList;
  inherited;
end;

function TXMLInfAdic.Get_InfAdFisco: string;
begin
  Result := ChildNodes['infAdFisco'].Text;
end;

procedure TXMLInfAdic.Set_InfAdFisco(Value: string);
begin
  ChildNodes['infAdFisco'].NodeValue := Value;
end;

function TXMLInfAdic.Get_InfCpl: string;
begin
  Result := ChildNodes['infCpl'].Text;
end;

procedure TXMLInfAdic.Set_InfCpl(Value: string);
begin
  ChildNodes['infCpl'].NodeValue := Value;
end;

function TXMLInfAdic.Get_ObsCont: IXMLObsContList;
begin
  Result := FObsCont;
end;

function TXMLInfAdic.Get_ObsFisco: IXMLObsFiscoList;
begin
  Result := FObsFisco;
end;

function TXMLInfAdic.Get_ProcRef: IXMLProcRefList;
begin
  Result := FProcRef;
end;

{ TXMLObsCont }

function TXMLObsCont.Get_XCampo: string;
begin
  Result := AttributeNodes['xCampo'].Text;
end;

procedure TXMLObsCont.Set_XCampo(Value: string);
begin
  SetAttribute('xCampo', Value);
end;

function TXMLObsCont.Get_XTexto: string;
begin
  Result := ChildNodes['xTexto'].Text;
end;

procedure TXMLObsCont.Set_XTexto(Value: string);
begin
  ChildNodes['xTexto'].NodeValue := Value;
end;

{ TXMLObsContList }

function TXMLObsContList.Add: IXMLObsCont;
begin
  Result := AddItem(-1) as IXMLObsCont;
end;

function TXMLObsContList.Insert(const Index: Integer): IXMLObsCont;
begin
  Result := AddItem(Index) as IXMLObsCont;
end;

function TXMLObsContList.Get_Item(Index: Integer): IXMLObsCont;
begin
  Result := List[Index] as IXMLObsCont;
end;

{ TXMLObsFisco }

function TXMLObsFisco.Get_XCampo: string;
begin
  Result := AttributeNodes['xCampo'].Text;
end;

procedure TXMLObsFisco.Set_XCampo(Value: string);
begin
  SetAttribute('xCampo', Value);
end;

function TXMLObsFisco.Get_XTexto: string;
begin
  Result := ChildNodes['xTexto'].Text;
end;

procedure TXMLObsFisco.Set_XTexto(Value: string);
begin
  ChildNodes['xTexto'].NodeValue := Value;
end;

{ TXMLObsFiscoList }

function TXMLObsFiscoList.Add: IXMLObsFisco;
begin
  Result := AddItem(-1) as IXMLObsFisco;
end;

function TXMLObsFiscoList.Insert(const Index: Integer): IXMLObsFisco;
begin
  Result := AddItem(Index) as IXMLObsFisco;
end;

function TXMLObsFiscoList.Get_Item(Index: Integer): IXMLObsFisco;
begin
  Result := List[Index] as IXMLObsFisco;
end;

{ TXMLProcRef }

function TXMLProcRef.Get_NProc: string;
begin
  Result := ChildNodes['nProc'].Text;
end;

procedure TXMLProcRef.Set_NProc(Value: string);
begin
  ChildNodes['nProc'].NodeValue := Value;
end;

function TXMLProcRef.Get_IndProc: string;
begin
  Result := ChildNodes['indProc'].Text;
end;

procedure TXMLProcRef.Set_IndProc(Value: string);
begin
  ChildNodes['indProc'].NodeValue := Value;
end;

{ TXMLProcRefList }

function TXMLProcRefList.Add: IXMLProcRef;
begin
  Result := AddItem(-1) as IXMLProcRef;
end;

function TXMLProcRefList.Insert(const Index: Integer): IXMLProcRef;
begin
  Result := AddItem(Index) as IXMLProcRef;
end;

function TXMLProcRefList.Get_Item(Index: Integer): IXMLProcRef;
begin
  Result := List[Index] as IXMLProcRef;
end;

{ TXMLExporta }

function TXMLExporta.Get_UFSaidaPais: string;
begin
  Result := ChildNodes['UFSaidaPais'].Text;
end;

procedure TXMLExporta.Set_UFSaidaPais(Value: string);
begin
  ChildNodes['UFSaidaPais'].NodeValue := Value;
end;

function TXMLExporta.Get_XLocExporta: string;
begin
  Result := ChildNodes['xLocExporta'].Text;
end;

procedure TXMLExporta.Set_XLocExporta(Value: string);
begin
  ChildNodes['xLocExporta'].NodeValue := Value;
end;

function TXMLExporta.Get_XLocDespacho: string;
begin
  Result := ChildNodes['xLocDespacho'].Text;
end;

procedure TXMLExporta.Set_XLocDespacho(Value: string);
begin
  ChildNodes['xLocDespacho'].NodeValue := Value;
end;

{ TXMLCompra }

function TXMLCompra.Get_XNEmp: string;
begin
  Result := ChildNodes['xNEmp'].Text;
end;

procedure TXMLCompra.Set_XNEmp(Value: string);
begin
  ChildNodes['xNEmp'].NodeValue := Value;
end;

function TXMLCompra.Get_XPed: string;
begin
  Result := ChildNodes['xPed'].Text;
end;

procedure TXMLCompra.Set_XPed(Value: string);
begin
  ChildNodes['xPed'].NodeValue := Value;
end;

function TXMLCompra.Get_XCont: string;
begin
  Result := ChildNodes['xCont'].Text;
end;

procedure TXMLCompra.Set_XCont(Value: string);
begin
  ChildNodes['xCont'].NodeValue := Value;
end;

{ TXMLCana }

procedure TXMLCana.AfterConstruction;
begin
  RegisterChildNode('forDia', TXMLForDia);
  RegisterChildNode('deduc', TXMLDeduc);
  FForDia := CreateCollection(TXMLForDiaList, IXMLForDia, 'forDia') as IXMLForDiaList;
  FDeduc := CreateCollection(TXMLDeducList, IXMLDeduc, 'deduc') as IXMLDeducList;
  inherited;
end;

function TXMLCana.Get_Safra: string;
begin
  Result := ChildNodes['safra'].Text;
end;

procedure TXMLCana.Set_Safra(Value: string);
begin
  ChildNodes['safra'].NodeValue := Value;
end;

function TXMLCana.Get_Ref: string;
begin
  Result := ChildNodes['ref'].Text;
end;

procedure TXMLCana.Set_Ref(Value: string);
begin
  ChildNodes['ref'].NodeValue := Value;
end;

function TXMLCana.Get_ForDia: IXMLForDiaList;
begin
  Result := FForDia;
end;

function TXMLCana.Get_QTotMes: string;
begin
  Result := ChildNodes['qTotMes'].Text;
end;

procedure TXMLCana.Set_QTotMes(Value: string);
begin
  ChildNodes['qTotMes'].NodeValue := Value;
end;

function TXMLCana.Get_QTotAnt: string;
begin
  Result := ChildNodes['qTotAnt'].Text;
end;

procedure TXMLCana.Set_QTotAnt(Value: string);
begin
  ChildNodes['qTotAnt'].NodeValue := Value;
end;

function TXMLCana.Get_QTotGer: string;
begin
  Result := ChildNodes['qTotGer'].Text;
end;

procedure TXMLCana.Set_QTotGer(Value: string);
begin
  ChildNodes['qTotGer'].NodeValue := Value;
end;

function TXMLCana.Get_Deduc: IXMLDeducList;
begin
  Result := FDeduc;
end;

function TXMLCana.Get_VFor: string;
begin
  Result := ChildNodes['vFor'].Text;
end;

procedure TXMLCana.Set_VFor(Value: string);
begin
  ChildNodes['vFor'].NodeValue := Value;
end;

function TXMLCana.Get_VTotDed: string;
begin
  Result := ChildNodes['vTotDed'].Text;
end;

procedure TXMLCana.Set_VTotDed(Value: string);
begin
  ChildNodes['vTotDed'].NodeValue := Value;
end;

function TXMLCana.Get_VLiqFor: string;
begin
  Result := ChildNodes['vLiqFor'].Text;
end;

procedure TXMLCana.Set_VLiqFor(Value: string);
begin
  ChildNodes['vLiqFor'].NodeValue := Value;
end;

{ TXMLForDia }

function TXMLForDia.Get_Dia: string;
begin
  Result := AttributeNodes['dia'].Text;
end;

procedure TXMLForDia.Set_Dia(Value: string);
begin
  SetAttribute('dia', Value);
end;

function TXMLForDia.Get_Qtde: string;
begin
  Result := ChildNodes['qtde'].Text;
end;

procedure TXMLForDia.Set_Qtde(Value: string);
begin
  ChildNodes['qtde'].NodeValue := Value;
end;

{ TXMLForDiaList }

function TXMLForDiaList.Add: IXMLForDia;
begin
  Result := AddItem(-1) as IXMLForDia;
end;

function TXMLForDiaList.Insert(const Index: Integer): IXMLForDia;
begin
  Result := AddItem(Index) as IXMLForDia;
end;

function TXMLForDiaList.Get_Item(Index: Integer): IXMLForDia;
begin
  Result := List[Index] as IXMLForDia;
end;

{ TXMLDeduc }

function TXMLDeduc.Get_XDed: string;
begin
  Result := ChildNodes['xDed'].Text;
end;

procedure TXMLDeduc.Set_XDed(Value: string);
begin
  ChildNodes['xDed'].NodeValue := Value;
end;

function TXMLDeduc.Get_VDed: string;
begin
  Result := ChildNodes['vDed'].Text;
end;

procedure TXMLDeduc.Set_VDed(Value: string);
begin
  ChildNodes['vDed'].NodeValue := Value;
end;

{ TXMLDeducList }

function TXMLDeducList.Add: IXMLDeduc;
begin
  Result := AddItem(-1) as IXMLDeduc;
end;

function TXMLDeducList.Insert(const Index: Integer): IXMLDeduc;
begin
  Result := AddItem(Index) as IXMLDeduc;
end;

function TXMLDeducList.Get_Item(Index: Integer): IXMLDeduc;
begin
  Result := List[Index] as IXMLDeduc;
end;

{ TXMLTInfRespTec }

function TXMLTInfRespTec.Get_CNPJ: string;
begin
  Result := ChildNodes['CNPJ'].Text;
end;

procedure TXMLTInfRespTec.Set_CNPJ(Value: string);
begin
  ChildNodes['CNPJ'].NodeValue := Value;
end;

function TXMLTInfRespTec.Get_XContato: string;
begin
  Result := ChildNodes['xContato'].Text;
end;

procedure TXMLTInfRespTec.Set_XContato(Value: string);
begin
  ChildNodes['xContato'].NodeValue := Value;
end;

function TXMLTInfRespTec.Get_Email: string;
begin
  Result := ChildNodes['email'].Text;
end;

procedure TXMLTInfRespTec.Set_Email(Value: string);
begin
  ChildNodes['email'].NodeValue := Value;
end;

function TXMLTInfRespTec.Get_Fone: string;
begin
  Result := ChildNodes['fone'].Text;
end;

procedure TXMLTInfRespTec.Set_Fone(Value: string);
begin
  ChildNodes['fone'].NodeValue := Value;
end;

function TXMLTInfRespTec.Get_IdCSRT: string;
begin
  Result := ChildNodes['idCSRT'].Text;
end;

procedure TXMLTInfRespTec.Set_IdCSRT(Value: string);
begin
  ChildNodes['idCSRT'].NodeValue := Value;
end;

function TXMLTInfRespTec.Get_HashCSRT: string;
begin
  Result := ChildNodes['hashCSRT'].Text;
end;

procedure TXMLTInfRespTec.Set_HashCSRT(Value: string);
begin
  ChildNodes['hashCSRT'].NodeValue := Value;
end;

{ TXMLInfNFeSupl }

function TXMLInfNFeSupl.Get_QrCode: string;
begin
  Result := ChildNodes['qrCode'].Text;
end;

procedure TXMLInfNFeSupl.Set_QrCode(Value: string);
begin
  ChildNodes['qrCode'].NodeValue := Value;
end;

function TXMLInfNFeSupl.Get_UrlChave: string;
begin
  Result := ChildNodes['urlChave'].Text;
end;

procedure TXMLInfNFeSupl.Set_UrlChave(Value: string);
begin
  ChildNodes['urlChave'].NodeValue := Value;
end;

{ TXMLSignatureType_ds }

procedure TXMLSignatureType_ds.AfterConstruction;
begin
  RegisterChildNode('SignedInfo', TXMLSignedInfoType_ds);
  RegisterChildNode('SignatureValue', TXMLSignatureValueType_ds);
  RegisterChildNode('KeyInfo', TXMLKeyInfoType_ds);
  inherited;
end;

function TXMLSignatureType_ds.Get_Id: string;
begin
  Result := AttributeNodes['Id'].Text;
end;

procedure TXMLSignatureType_ds.Set_Id(Value: string);
begin
  SetAttribute('Id', Value);
end;

function TXMLSignatureType_ds.Get_SignedInfo: IXMLSignedInfoType_ds;
begin
  Result := ChildNodes['SignedInfo'] as IXMLSignedInfoType_ds;
end;

function TXMLSignatureType_ds.Get_SignatureValue: IXMLSignatureValueType_ds;
begin
  Result := ChildNodes['SignatureValue'] as IXMLSignatureValueType_ds;
end;

function TXMLSignatureType_ds.Get_KeyInfo: IXMLKeyInfoType_ds;
begin
  Result := ChildNodes['KeyInfo'] as IXMLKeyInfoType_ds;
end;

{ TXMLSignedInfoType_ds }

procedure TXMLSignedInfoType_ds.AfterConstruction;
begin
  RegisterChildNode('CanonicalizationMethod', TXMLCanonicalizationMethod_ds);
  RegisterChildNode('SignatureMethod', TXMLSignatureMethod_ds);
  RegisterChildNode('Reference', TXMLReferenceType_ds);
  inherited;
end;

function TXMLSignedInfoType_ds.Get_Id: string;
begin
  Result := AttributeNodes['Id'].Text;
end;

procedure TXMLSignedInfoType_ds.Set_Id(Value: string);
begin
  SetAttribute('Id', Value);
end;

function TXMLSignedInfoType_ds.Get_CanonicalizationMethod: IXMLCanonicalizationMethod_ds;
begin
  Result := ChildNodes['CanonicalizationMethod'] as IXMLCanonicalizationMethod_ds;
end;

function TXMLSignedInfoType_ds.Get_SignatureMethod: IXMLSignatureMethod_ds;
begin
  Result := ChildNodes['SignatureMethod'] as IXMLSignatureMethod_ds;
end;

function TXMLSignedInfoType_ds.Get_Reference: IXMLReferenceType_ds;
begin
  Result := ChildNodes['Reference'] as IXMLReferenceType_ds;
end;

{ TXMLCanonicalizationMethod_ds }

function TXMLCanonicalizationMethod_ds.Get_Algorithm: string;
begin
  Result := AttributeNodes['Algorithm'].Text;
end;

procedure TXMLCanonicalizationMethod_ds.Set_Algorithm(Value: string);
begin
  SetAttribute('Algorithm', Value);
end;

{ TXMLSignatureMethod_ds }

function TXMLSignatureMethod_ds.Get_Algorithm: string;
begin
  Result := AttributeNodes['Algorithm'].Text;
end;

procedure TXMLSignatureMethod_ds.Set_Algorithm(Value: string);
begin
  SetAttribute('Algorithm', Value);
end;

{ TXMLReferenceType_ds }

procedure TXMLReferenceType_ds.AfterConstruction;
begin
  RegisterChildNode('Transforms', TXMLTransformsType_ds);
  RegisterChildNode('DigestMethod', TXMLDigestMethod_ds);
  inherited;
end;

function TXMLReferenceType_ds.Get_Id: string;
begin
  Result := AttributeNodes['Id'].Text;
end;

procedure TXMLReferenceType_ds.Set_Id(Value: string);
begin
  SetAttribute('Id', Value);
end;

function TXMLReferenceType_ds.Get_URI: string;
begin
  Result := AttributeNodes['URI'].Text;
end;

procedure TXMLReferenceType_ds.Set_URI(Value: string);
begin
  SetAttribute('URI', Value);
end;

function TXMLReferenceType_ds.Get_Type_: string;
begin
  Result := AttributeNodes['Type'].Text;
end;

procedure TXMLReferenceType_ds.Set_Type_(Value: string);
begin
  SetAttribute('Type', Value);
end;

function TXMLReferenceType_ds.Get_Transforms: IXMLTransformsType_ds;
begin
  Result := ChildNodes['Transforms'] as IXMLTransformsType_ds;
end;

function TXMLReferenceType_ds.Get_DigestMethod: IXMLDigestMethod_ds;
begin
  Result := ChildNodes['DigestMethod'] as IXMLDigestMethod_ds;
end;

function TXMLReferenceType_ds.Get_DigestValue: string;
begin
  Result := ChildNodes['DigestValue'].Text;
end;

procedure TXMLReferenceType_ds.Set_DigestValue(Value: string);
begin
  ChildNodes['DigestValue'].NodeValue := Value;
end;

{ TXMLTransformsType_ds }

procedure TXMLTransformsType_ds.AfterConstruction;
begin
  RegisterChildNode('Transform', TXMLTransformType_ds);
  ItemTag := 'Transform';
  ItemInterface := IXMLTransformType_ds;
  inherited;
end;

function TXMLTransformsType_ds.Get_Transform(Index: Integer): IXMLTransformType_ds;
begin
  Result := List[Index] as IXMLTransformType_ds;
end;

function TXMLTransformsType_ds.Add: IXMLTransformType_ds;
begin
  Result := AddItem(-1) as IXMLTransformType_ds;
end;

function TXMLTransformsType_ds.Insert(const Index: Integer): IXMLTransformType_ds;
begin
  Result := AddItem(Index) as IXMLTransformType_ds;
end;

{ TXMLTransformType_ds }

procedure TXMLTransformType_ds.AfterConstruction;
begin
  ItemTag := 'XPath';
  ItemInterface := IXMLNode;
  inherited;
end;

function TXMLTransformType_ds.Get_Algorithm: string;
begin
  Result := AttributeNodes['Algorithm'].Text;
end;

procedure TXMLTransformType_ds.Set_Algorithm(Value: string);
begin
  SetAttribute('Algorithm', Value);
end;

function TXMLTransformType_ds.Get_XPath(Index: Integer): string;
begin
  Result := List[Index].Text;
end;

function TXMLTransformType_ds.Add(const XPath: string): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := XPath;
end;

function TXMLTransformType_ds.Insert(const Index: Integer; const XPath: string): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := XPath;
end;

{ TXMLDigestMethod_ds }

function TXMLDigestMethod_ds.Get_Algorithm: string;
begin
  Result := AttributeNodes['Algorithm'].Text;
end;

procedure TXMLDigestMethod_ds.Set_Algorithm(Value: string);
begin
  SetAttribute('Algorithm', Value);
end;

{ TXMLSignatureValueType_ds }

function TXMLSignatureValueType_ds.Get_Id: string;
begin
  Result := AttributeNodes['Id'].Text;
end;

procedure TXMLSignatureValueType_ds.Set_Id(Value: string);
begin
  SetAttribute('Id', Value);
end;

{ TXMLKeyInfoType_ds }

procedure TXMLKeyInfoType_ds.AfterConstruction;
begin
  RegisterChildNode('X509Data', TXMLX509DataType_ds);
  inherited;
end;

function TXMLKeyInfoType_ds.Get_Id: string;
begin
  Result := AttributeNodes['Id'].Text;
end;

procedure TXMLKeyInfoType_ds.Set_Id(Value: string);
begin
  SetAttribute('Id', Value);
end;

function TXMLKeyInfoType_ds.Get_X509Data: IXMLX509DataType_ds;
begin
  Result := ChildNodes['X509Data'] as IXMLX509DataType_ds;
end;

{ TXMLX509DataType_ds }

function TXMLX509DataType_ds.Get_X509Certificate: string;
begin
  Result := ChildNodes['X509Certificate'].Text;
end;

procedure TXMLX509DataType_ds.Set_X509Certificate(Value: string);
begin
  ChildNodes['X509Certificate'].NodeValue := Value;
end;

{ TXMLTProtNFe }

procedure TXMLTProtNFe.AfterConstruction;
begin
  RegisterChildNode('infProt', TXMLInfProt);
  RegisterChildNode('Signature', TXMLSignatureType_ds);
  inherited;
end;

function TXMLTProtNFe.Get_Versao: string;
begin
  Result := AttributeNodes['versao'].Text;
end;

procedure TXMLTProtNFe.Set_Versao(Value: string);
begin
  SetAttribute('versao', Value);
end;

function TXMLTProtNFe.Get_InfProt: IXMLInfProt;
begin
  Result := ChildNodes['infProt'] as IXMLInfProt;
end;

function TXMLTProtNFe.Get_Signature: IXMLSignatureType_ds;
begin
  Result := ChildNodes['Signature'] as IXMLSignatureType_ds;
end;

{ TXMLTProtNFeList }

function TXMLTProtNFeList.Add: IXMLTProtNFe;
begin
  Result := AddItem(-1) as IXMLTProtNFe;
end;

function TXMLTProtNFeList.Insert(const Index: Integer): IXMLTProtNFe;
begin
  Result := AddItem(Index) as IXMLTProtNFe;
end;

function TXMLTProtNFeList.Get_Item(Index: Integer): IXMLTProtNFe;
begin
  Result := List[Index] as IXMLTProtNFe;
end;

{ TXMLInfProt }

function TXMLInfProt.Get_Id: string;
begin
  Result := AttributeNodes['Id'].Text;
end;

procedure TXMLInfProt.Set_Id(Value: string);
begin
  SetAttribute('Id', Value);
end;

function TXMLInfProt.Get_TpAmb: string;
begin
  Result := ChildNodes['tpAmb'].Text;
end;

procedure TXMLInfProt.Set_TpAmb(Value: string);
begin
  ChildNodes['tpAmb'].NodeValue := Value;
end;

function TXMLInfProt.Get_VerAplic: string;
begin
  Result := ChildNodes['verAplic'].Text;
end;

procedure TXMLInfProt.Set_VerAplic(Value: string);
begin
  ChildNodes['verAplic'].NodeValue := Value;
end;

function TXMLInfProt.Get_ChNFe: string;
begin
  Result := ChildNodes['chNFe'].Text;
end;

procedure TXMLInfProt.Set_ChNFe(Value: string);
begin
  ChildNodes['chNFe'].NodeValue := Value;
end;

function TXMLInfProt.Get_DhRecbto: string;
begin
  Result := ChildNodes['dhRecbto'].Text;
end;

procedure TXMLInfProt.Set_DhRecbto(Value: string);
begin
  ChildNodes['dhRecbto'].NodeValue := Value;
end;

function TXMLInfProt.Get_NProt: string;
begin
  Result := ChildNodes['nProt'].Text;
end;

procedure TXMLInfProt.Set_NProt(Value: string);
begin
  ChildNodes['nProt'].NodeValue := Value;
end;

function TXMLInfProt.Get_DigVal: string;
begin
  Result := ChildNodes['digVal'].Text;
end;

procedure TXMLInfProt.Set_DigVal(Value: string);
begin
  ChildNodes['digVal'].NodeValue := Value;
end;

function TXMLInfProt.Get_CStat: string;
begin
  Result := ChildNodes['cStat'].Text;
end;

procedure TXMLInfProt.Set_CStat(Value: string);
begin
  ChildNodes['cStat'].NodeValue := Value;
end;

function TXMLInfProt.Get_XMotivo: string;
begin
  Result := ChildNodes['xMotivo'].Text;
end;

procedure TXMLInfProt.Set_XMotivo(Value: string);
begin
  ChildNodes['xMotivo'].NodeValue := Value;
end;

function TXMLInfProt.Get_CMsg: string;
begin
  Result := ChildNodes['cMsg'].Text;
end;

procedure TXMLInfProt.Set_CMsg(Value: string);
begin
  ChildNodes['cMsg'].NodeValue := Value;
end;

function TXMLInfProt.Get_XMsg: string;
begin
  Result := ChildNodes['xMsg'].Text;
end;

procedure TXMLInfProt.Set_XMsg(Value: string);
begin
  ChildNodes['xMsg'].NodeValue := Value;
end;

{ TXMLTEnviNFe }

procedure TXMLTEnviNFe.AfterConstruction;
begin
  RegisterChildNode('NFe', TXMLTNFe);
  FNFe := CreateCollection(TXMLTNFeList, IXMLTNFe, 'NFe') as IXMLTNFeList;
  inherited;
end;

function TXMLTEnviNFe.Get_Versao: string;
begin
  Result := AttributeNodes['versao'].Text;
end;

procedure TXMLTEnviNFe.Set_Versao(Value: string);
begin
  SetAttribute('versao', Value);
end;

function TXMLTEnviNFe.Get_IdLote: string;
begin
  Result := ChildNodes['idLote'].Text;
end;

procedure TXMLTEnviNFe.Set_IdLote(Value: string);
begin
  ChildNodes['idLote'].NodeValue := Value;
end;

function TXMLTEnviNFe.Get_IndSinc: string;
begin
  Result := ChildNodes['indSinc'].Text;
end;

procedure TXMLTEnviNFe.Set_IndSinc(Value: string);
begin
  ChildNodes['indSinc'].NodeValue := Value;
end;

function TXMLTEnviNFe.Get_NFe: IXMLTNFeList;
begin
  Result := FNFe;
end;

{ TXMLTRetEnviNFe }

procedure TXMLTRetEnviNFe.AfterConstruction;
begin
  RegisterChildNode('infRec', TXMLInfRec);
  RegisterChildNode('protNFe', TXMLTProtNFe);
  inherited;
end;

function TXMLTRetEnviNFe.Get_Versao: string;
begin
  Result := AttributeNodes['versao'].Text;
end;

procedure TXMLTRetEnviNFe.Set_Versao(Value: string);
begin
  SetAttribute('versao', Value);
end;

function TXMLTRetEnviNFe.Get_TpAmb: string;
begin
  Result := ChildNodes['tpAmb'].Text;
end;

procedure TXMLTRetEnviNFe.Set_TpAmb(Value: string);
begin
  ChildNodes['tpAmb'].NodeValue := Value;
end;

function TXMLTRetEnviNFe.Get_VerAplic: string;
begin
  Result := ChildNodes['verAplic'].Text;
end;

procedure TXMLTRetEnviNFe.Set_VerAplic(Value: string);
begin
  ChildNodes['verAplic'].NodeValue := Value;
end;

function TXMLTRetEnviNFe.Get_CStat: string;
begin
  Result := ChildNodes['cStat'].Text;
end;

procedure TXMLTRetEnviNFe.Set_CStat(Value: string);
begin
  ChildNodes['cStat'].NodeValue := Value;
end;

function TXMLTRetEnviNFe.Get_XMotivo: string;
begin
  Result := ChildNodes['xMotivo'].Text;
end;

procedure TXMLTRetEnviNFe.Set_XMotivo(Value: string);
begin
  ChildNodes['xMotivo'].NodeValue := Value;
end;

function TXMLTRetEnviNFe.Get_CUF: string;
begin
  Result := ChildNodes['cUF'].Text;
end;

procedure TXMLTRetEnviNFe.Set_CUF(Value: string);
begin
  ChildNodes['cUF'].NodeValue := Value;
end;

function TXMLTRetEnviNFe.Get_DhRecbto: string;
begin
  Result := ChildNodes['dhRecbto'].Text;
end;

procedure TXMLTRetEnviNFe.Set_DhRecbto(Value: string);
begin
  ChildNodes['dhRecbto'].NodeValue := Value;
end;

function TXMLTRetEnviNFe.Get_InfRec: IXMLInfRec;
begin
  Result := ChildNodes['infRec'] as IXMLInfRec;
end;

function TXMLTRetEnviNFe.Get_ProtNFe: IXMLTProtNFe;
begin
  Result := ChildNodes['protNFe'] as IXMLTProtNFe;
end;

{ TXMLInfRec }

function TXMLInfRec.Get_NRec: string;
begin
  Result := ChildNodes['nRec'].Text;
end;

procedure TXMLInfRec.Set_NRec(Value: string);
begin
  ChildNodes['nRec'].NodeValue := Value;
end;

function TXMLInfRec.Get_TMed: string;
begin
  Result := ChildNodes['tMed'].Text;
end;

procedure TXMLInfRec.Set_TMed(Value: string);
begin
  ChildNodes['tMed'].NodeValue := Value;
end;

{ TXMLTConsReciNFe }

function TXMLTConsReciNFe.Get_Versao: string;
begin
  Result := AttributeNodes['versao'].Text;
end;

procedure TXMLTConsReciNFe.Set_Versao(Value: string);
begin
  SetAttribute('versao', Value);
end;

function TXMLTConsReciNFe.Get_TpAmb: string;
begin
  Result := ChildNodes['tpAmb'].Text;
end;

procedure TXMLTConsReciNFe.Set_TpAmb(Value: string);
begin
  ChildNodes['tpAmb'].NodeValue := Value;
end;

function TXMLTConsReciNFe.Get_NRec: string;
begin
  Result := ChildNodes['nRec'].Text;
end;

procedure TXMLTConsReciNFe.Set_NRec(Value: string);
begin
  ChildNodes['nRec'].NodeValue := Value;
end;

{ TXMLTRetConsReciNFe }

procedure TXMLTRetConsReciNFe.AfterConstruction;
begin
  RegisterChildNode('protNFe', TXMLTProtNFe);
  FProtNFe := CreateCollection(TXMLTProtNFeList, IXMLTProtNFe, 'protNFe') as IXMLTProtNFeList;
  inherited;
end;

function TXMLTRetConsReciNFe.Get_Versao: string;
begin
  Result := AttributeNodes['versao'].Text;
end;

procedure TXMLTRetConsReciNFe.Set_Versao(Value: string);
begin
  SetAttribute('versao', Value);
end;

function TXMLTRetConsReciNFe.Get_TpAmb: string;
begin
  Result := ChildNodes['tpAmb'].Text;
end;

procedure TXMLTRetConsReciNFe.Set_TpAmb(Value: string);
begin
  ChildNodes['tpAmb'].NodeValue := Value;
end;

function TXMLTRetConsReciNFe.Get_VerAplic: string;
begin
  Result := ChildNodes['verAplic'].Text;
end;

procedure TXMLTRetConsReciNFe.Set_VerAplic(Value: string);
begin
  ChildNodes['verAplic'].NodeValue := Value;
end;

function TXMLTRetConsReciNFe.Get_NRec: string;
begin
  Result := ChildNodes['nRec'].Text;
end;

procedure TXMLTRetConsReciNFe.Set_NRec(Value: string);
begin
  ChildNodes['nRec'].NodeValue := Value;
end;

function TXMLTRetConsReciNFe.Get_CStat: string;
begin
  Result := ChildNodes['cStat'].Text;
end;

procedure TXMLTRetConsReciNFe.Set_CStat(Value: string);
begin
  ChildNodes['cStat'].NodeValue := Value;
end;

function TXMLTRetConsReciNFe.Get_XMotivo: string;
begin
  Result := ChildNodes['xMotivo'].Text;
end;

procedure TXMLTRetConsReciNFe.Set_XMotivo(Value: string);
begin
  ChildNodes['xMotivo'].NodeValue := Value;
end;

function TXMLTRetConsReciNFe.Get_CUF: string;
begin
  Result := ChildNodes['cUF'].Text;
end;

procedure TXMLTRetConsReciNFe.Set_CUF(Value: string);
begin
  ChildNodes['cUF'].NodeValue := Value;
end;

function TXMLTRetConsReciNFe.Get_DhRecbto: string;
begin
  Result := ChildNodes['dhRecbto'].Text;
end;

procedure TXMLTRetConsReciNFe.Set_DhRecbto(Value: string);
begin
  ChildNodes['dhRecbto'].NodeValue := Value;
end;

function TXMLTRetConsReciNFe.Get_CMsg: string;
begin
  Result := ChildNodes['cMsg'].Text;
end;

procedure TXMLTRetConsReciNFe.Set_CMsg(Value: string);
begin
  ChildNodes['cMsg'].NodeValue := Value;
end;

function TXMLTRetConsReciNFe.Get_XMsg: string;
begin
  Result := ChildNodes['xMsg'].Text;
end;

procedure TXMLTRetConsReciNFe.Set_XMsg(Value: string);
begin
  ChildNodes['xMsg'].NodeValue := Value;
end;

function TXMLTRetConsReciNFe.Get_ProtNFe: IXMLTProtNFeList;
begin
  Result := FProtNFe;
end;

{ TXMLTNfeProc }

procedure TXMLTNfeProc.AfterConstruction;
begin
  RegisterChildNode('NFe', TXMLTNFe);
  RegisterChildNode('protNFe', TXMLTProtNFe);
  inherited;
end;

function TXMLTNfeProc.Get_Versao: string;
begin
  Result := AttributeNodes['versao'].Text;
end;

procedure TXMLTNfeProc.Set_Versao(Value: string);
begin
  SetAttribute('versao', Value);
end;

function TXMLTNfeProc.Get_NFe: IXMLTNFe;
begin
  Result := ChildNodes['NFe'] as IXMLTNFe;
end;

function TXMLTNfeProc.Get_ProtNFe: IXMLTProtNFe;
begin
  Result := ChildNodes['protNFe'] as IXMLTProtNFe;
end;

{ TXMLNVEList }

function TXMLNVEList.Add(const Value: string): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLNVEList.Insert(const Index: Integer; const Value: string): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLNVEList.Get_Item(Index: Integer): string;
begin
  Result := List[Index].NodeValue;
end;

end.
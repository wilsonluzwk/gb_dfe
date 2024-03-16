
{************************************************************************************************}
{                                                                                                }
{                                        XML Data Binding                                        }
{                                                                                                }
{         Generated on: 06/05/2016 14:29:54                                                      }
{         Generated from: cte_v2.00.xsd   by santaluz }
{                                                                                                }
{************************************************************************************************}

unit dfe.module.databinding.schema.cte;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLCteProc = interface;
  IXMLTCTe = interface;
  IXMLInfCte = interface;
  IXMLIde = interface;
  IXMLToma03 = interface;
  IXMLToma4 = interface;
  IXMLTEndereco = interface;
  IXMLCompl = interface;
  IXMLFluxo = interface;
  IXMLPass = interface;
  IXMLPassList = interface;
  IXMLEntrega = interface;
  IXMLSemData = interface;
  IXMLComData = interface;
  IXMLNoPeriodo = interface;
  IXMLSemHora = interface;
  IXMLComHora = interface;
  IXMLNoInter = interface;
  IXMLObsCont = interface;
  IXMLObsFisco = interface;
  IXMLEmit = interface;
  IXMLTEndeEmi = interface;
  IXMLRem = interface;
  IXMLExped = interface;
  IXMLReceb = interface;
  IXMLDest = interface;
  IXMLVPrest = interface;
  IXMLComp = interface;
  IXMLCompList = interface;
  IXMLImp = interface;
  IXMLTImp = interface;
  IXMLICMS00 = interface;
  IXMLICMS20 = interface;
  IXMLICMS45 = interface;
  IXMLICMS60 = interface;
  IXMLICMS90 = interface;
  IXMLICMSOutraUF = interface;
  IXMLICMSSN = interface;
  IXMLICMSUFFim = interface;
  IXMLInfCTeNorm = interface;
  IXMLInfCarga = interface;
  IXMLInfQ = interface;
  IXMLInfQList = interface;
  IXMLInfDoc = interface;
  IXMLInfNF = interface;
  IXMLInfNFList = interface;
  IXMLTUnidadeTransp = interface;
  IXMLTUnidadeTranspList = interface;
  IXMLLacUnidTransp = interface;
  IXMLLacUnidTranspList = interface;
  IXMLTUnidCarga = interface;
  IXMLTUnidCargaList = interface;
  IXMLLacUnidCarga = interface;
  IXMLLacUnidCargaList = interface;
  IXMLInfNFe = interface;
  IXMLInfNFeList = interface;
  IXMLInfOutros = interface;
  IXMLInfOutrosList = interface;
  IXMLDocAnt = interface;
  IXMLEmiDocAnt = interface;
  IXMLIdDocAnt = interface;
  IXMLIdDocAntList = interface;
  IXMLIdDocAntPap = interface;
  IXMLIdDocAntPapList = interface;
  IXMLIdDocAntEle = interface;
  IXMLIdDocAntEleList = interface;
  IXMLSeg = interface;
  IXMLSegList = interface;
  IXMLInfModal = interface;
  IXMLPeri = interface;
  IXMLPeriList = interface;
  IXMLVeicNovos = interface;
  IXMLVeicNovosList = interface;
  IXMLCobr = interface;
  IXMLFat = interface;
  IXMLDup = interface;
  IXMLDupList = interface;
  IXMLInfCteSub = interface;
  IXMLTomaICMS = interface;
  IXMLRefNF = interface;
  IXMLTomaNaoICMS = interface;
  IXMLInfCteComp = interface;
  IXMLInfCteAnu = interface;
  IXMLAutXML = interface;
  IXMLSignatureType = interface;
  IXMLSignedInfoType = interface;
  IXMLCanonicalizationMethod = interface;
  IXMLSignatureMethod = interface;
  IXMLReferenceType = interface;
  IXMLTransformsType = interface;
  IXMLTransformType = interface;
  IXMLDigestMethod = interface;
  IXMLSignatureValueType = interface;
  IXMLKeyInfoType = interface;
  IXMLX509DataType = interface;
  IXMLTProtCTe = interface;
  IXMLInfProt = interface;

{ IXMLCteProc }

  IXMLCteProc = interface(IXMLNode)
    ['{77372726-0FF0-4133-B963-74A75032E97E}']
    { Property Accessors }
    function Get_Versao: WideString;
    function Get_CTe: IXMLTCTe;
    function Get_ProtCTe: IXMLTProtCTe;
    procedure Set_Versao(Value: WideString);
    { Methods & Properties }
    property Versao: WideString read Get_Versao write Set_Versao;
    property CTe: IXMLTCTe read Get_CTe;
    property ProtCTe: IXMLTProtCTe read Get_ProtCTe;
  end;

{ IXMLTCTe }

  IXMLTCTe = interface(IXMLNode)
    ['{22D0BEE6-49D5-4CEC-B5FE-475B711FD18B}']
    { Property Accessors }
    function Get_InfCte: IXMLInfCte;
    function Get_Signature: IXMLSignatureType;
    { Methods & Properties }
    property InfCte: IXMLInfCte read Get_InfCte;
    property Signature: IXMLSignatureType read Get_Signature;
  end;

{ IXMLInfCte }

  IXMLInfCte = interface(IXMLNode)
    ['{D9408884-7D1E-40F8-9589-B37B6BD2E0F1}']
    { Property Accessors }
    function Get_Versao: WideString;
    function Get_Id: WideString;
    function Get_Ide: IXMLIde;
    function Get_Compl: IXMLCompl;
    function Get_Emit: IXMLEmit;
    function Get_Rem: IXMLRem;
    function Get_Exped: IXMLExped;
    function Get_Receb: IXMLReceb;
    function Get_Dest: IXMLDest;
    function Get_VPrest: IXMLVPrest;
    function Get_Imp: IXMLImp;
    function Get_InfCTeNorm: IXMLInfCTeNorm;
    function Get_InfCteComp: IXMLInfCteComp;
    function Get_InfCteAnu: IXMLInfCteAnu;
    function Get_AutXML: IXMLAutXML;
    procedure Set_Versao(Value: WideString);
    procedure Set_Id(Value: WideString);
    { Methods & Properties }
    property Versao: WideString read Get_Versao write Set_Versao;
    property Id: WideString read Get_Id write Set_Id;
    property Ide: IXMLIde read Get_Ide;
    property Compl: IXMLCompl read Get_Compl;
    property Emit: IXMLEmit read Get_Emit;
    property Rem: IXMLRem read Get_Rem;
    property Exped: IXMLExped read Get_Exped;
    property Receb: IXMLReceb read Get_Receb;
    property Dest: IXMLDest read Get_Dest;
    property VPrest: IXMLVPrest read Get_VPrest;
    property Imp: IXMLImp read Get_Imp;
    property InfCTeNorm: IXMLInfCTeNorm read Get_InfCTeNorm;
    property InfCteComp: IXMLInfCteComp read Get_InfCteComp;
    property InfCteAnu: IXMLInfCteAnu read Get_InfCteAnu;
    property AutXML: IXMLAutXML read Get_AutXML;
  end;

{ IXMLIde }

  IXMLIde = interface(IXMLNode)
    ['{361772DA-2D24-456F-944F-003A181D8D15}']
    { Property Accessors }
    function Get_CUF: WideString;
    function Get_CCT: WideString;
    function Get_CFOP: WideString;
    function Get_NatOp: WideString;
    function Get_ForPag: WideString;
    function Get_Mod_: WideString;
    function Get_Serie: WideString;
    function Get_NCT: WideString;
    function Get_DhEmi: WideString;
    function Get_TpImp: WideString;
    function Get_TpEmis: WideString;
    function Get_CDV: WideString;
    function Get_TpAmb: WideString;
    function Get_TpCTe: WideString;
    function Get_ProcEmi: WideString;
    function Get_VerProc: WideString;
    function Get_RefCTE: WideString;
    function Get_CMunEnv: WideString;
    function Get_XMunEnv: WideString;
    function Get_UFEnv: WideString;
    function Get_Modal: WideString;
    function Get_TpServ: WideString;
    function Get_CMunIni: WideString;
    function Get_XMunIni: WideString;
    function Get_UFIni: WideString;
    function Get_CMunFim: WideString;
    function Get_XMunFim: WideString;
    function Get_UFFim: WideString;
    function Get_Retira: WideString;
    function Get_XDetRetira: WideString;
    function Get_Toma03: IXMLToma03;
    function Get_Toma4: IXMLToma4;
    function Get_DhCont: WideString;
    function Get_XJust: WideString;
    procedure Set_CUF(Value: WideString);
    procedure Set_CCT(Value: WideString);
    procedure Set_CFOP(Value: WideString);
    procedure Set_NatOp(Value: WideString);
    procedure Set_ForPag(Value: WideString);
    procedure Set_Mod_(Value: WideString);
    procedure Set_Serie(Value: WideString);
    procedure Set_NCT(Value: WideString);
    procedure Set_DhEmi(Value: WideString);
    procedure Set_TpImp(Value: WideString);
    procedure Set_TpEmis(Value: WideString);
    procedure Set_CDV(Value: WideString);
    procedure Set_TpAmb(Value: WideString);
    procedure Set_TpCTe(Value: WideString);
    procedure Set_ProcEmi(Value: WideString);
    procedure Set_VerProc(Value: WideString);
    procedure Set_RefCTE(Value: WideString);
    procedure Set_CMunEnv(Value: WideString);
    procedure Set_XMunEnv(Value: WideString);
    procedure Set_UFEnv(Value: WideString);
    procedure Set_Modal(Value: WideString);
    procedure Set_TpServ(Value: WideString);
    procedure Set_CMunIni(Value: WideString);
    procedure Set_XMunIni(Value: WideString);
    procedure Set_UFIni(Value: WideString);
    procedure Set_CMunFim(Value: WideString);
    procedure Set_XMunFim(Value: WideString);
    procedure Set_UFFim(Value: WideString);
    procedure Set_Retira(Value: WideString);
    procedure Set_XDetRetira(Value: WideString);
    procedure Set_DhCont(Value: WideString);
    procedure Set_XJust(Value: WideString);
    { Methods & Properties }
    property CUF: WideString read Get_CUF write Set_CUF;
    property CCT: WideString read Get_CCT write Set_CCT;
    property CFOP: WideString read Get_CFOP write Set_CFOP;
    property NatOp: WideString read Get_NatOp write Set_NatOp;
    property ForPag: WideString read Get_ForPag write Set_ForPag;
    property Mod_: WideString read Get_Mod_ write Set_Mod_;
    property Serie: WideString read Get_Serie write Set_Serie;
    property NCT: WideString read Get_NCT write Set_NCT;
    property DhEmi: WideString read Get_DhEmi write Set_DhEmi;
    property TpImp: WideString read Get_TpImp write Set_TpImp;
    property TpEmis: WideString read Get_TpEmis write Set_TpEmis;
    property CDV: WideString read Get_CDV write Set_CDV;
    property TpAmb: WideString read Get_TpAmb write Set_TpAmb;
    property TpCTe: WideString read Get_TpCTe write Set_TpCTe;
    property ProcEmi: WideString read Get_ProcEmi write Set_ProcEmi;
    property VerProc: WideString read Get_VerProc write Set_VerProc;
    property RefCTE: WideString read Get_RefCTE write Set_RefCTE;
    property CMunEnv: WideString read Get_CMunEnv write Set_CMunEnv;
    property XMunEnv: WideString read Get_XMunEnv write Set_XMunEnv;
    property UFEnv: WideString read Get_UFEnv write Set_UFEnv;
    property Modal: WideString read Get_Modal write Set_Modal;
    property TpServ: WideString read Get_TpServ write Set_TpServ;
    property CMunIni: WideString read Get_CMunIni write Set_CMunIni;
    property XMunIni: WideString read Get_XMunIni write Set_XMunIni;
    property UFIni: WideString read Get_UFIni write Set_UFIni;
    property CMunFim: WideString read Get_CMunFim write Set_CMunFim;
    property XMunFim: WideString read Get_XMunFim write Set_XMunFim;
    property UFFim: WideString read Get_UFFim write Set_UFFim;
    property Retira: WideString read Get_Retira write Set_Retira;
    property XDetRetira: WideString read Get_XDetRetira write Set_XDetRetira;
    property Toma03: IXMLToma03 read Get_Toma03;
    property Toma4: IXMLToma4 read Get_Toma4;
    property DhCont: WideString read Get_DhCont write Set_DhCont;
    property XJust: WideString read Get_XJust write Set_XJust;
  end;

{ IXMLToma03 }

  IXMLToma03 = interface(IXMLNode)
    ['{5F832943-C2A2-4767-81CA-5EC682338697}']
    { Property Accessors }
    function Get_Toma: WideString;
    procedure Set_Toma(Value: WideString);
    { Methods & Properties }
    property Toma: WideString read Get_Toma write Set_Toma;
  end;

{ IXMLToma4 }

  IXMLToma4 = interface(IXMLNode)
    ['{D09F63C0-F174-4AC2-9C39-8FAFF2810ADE}']
    { Property Accessors }
    function Get_Toma: WideString;
    function Get_CNPJ: WideString;
    function Get_CPF: WideString;
    function Get_IE: WideString;
    function Get_XNome: WideString;
    function Get_XFant: WideString;
    function Get_Fone: WideString;
    function Get_EnderToma: IXMLTEndereco;
    function Get_Email: WideString;
    procedure Set_Toma(Value: WideString);
    procedure Set_CNPJ(Value: WideString);
    procedure Set_CPF(Value: WideString);
    procedure Set_IE(Value: WideString);
    procedure Set_XNome(Value: WideString);
    procedure Set_XFant(Value: WideString);
    procedure Set_Fone(Value: WideString);
    procedure Set_Email(Value: WideString);
    { Methods & Properties }
    property Toma: WideString read Get_Toma write Set_Toma;
    property CNPJ: WideString read Get_CNPJ write Set_CNPJ;
    property CPF: WideString read Get_CPF write Set_CPF;
    property IE: WideString read Get_IE write Set_IE;
    property XNome: WideString read Get_XNome write Set_XNome;
    property XFant: WideString read Get_XFant write Set_XFant;
    property Fone: WideString read Get_Fone write Set_Fone;
    property EnderToma: IXMLTEndereco read Get_EnderToma;
    property Email: WideString read Get_Email write Set_Email;
  end;

{ IXMLTEndereco }

  IXMLTEndereco = interface(IXMLNode)
    ['{3E2142EF-9654-424E-9F69-C6401C3A9946}']
    { Property Accessors }
    function Get_XLgr: WideString;
    function Get_Nro: WideString;
    function Get_XCpl: WideString;
    function Get_XBairro: WideString;
    function Get_CMun: WideString;
    function Get_XMun: WideString;
    function Get_CEP: WideString;
    function Get_UF: WideString;
    function Get_CPais: WideString;
    function Get_XPais: WideString;
    procedure Set_XLgr(Value: WideString);
    procedure Set_Nro(Value: WideString);
    procedure Set_XCpl(Value: WideString);
    procedure Set_XBairro(Value: WideString);
    procedure Set_CMun(Value: WideString);
    procedure Set_XMun(Value: WideString);
    procedure Set_CEP(Value: WideString);
    procedure Set_UF(Value: WideString);
    procedure Set_CPais(Value: WideString);
    procedure Set_XPais(Value: WideString);
    { Methods & Properties }
    property XLgr: WideString read Get_XLgr write Set_XLgr;
    property Nro: WideString read Get_Nro write Set_Nro;
    property XCpl: WideString read Get_XCpl write Set_XCpl;
    property XBairro: WideString read Get_XBairro write Set_XBairro;
    property CMun: WideString read Get_CMun write Set_CMun;
    property XMun: WideString read Get_XMun write Set_XMun;
    property CEP: WideString read Get_CEP write Set_CEP;
    property UF: WideString read Get_UF write Set_UF;
    property CPais: WideString read Get_CPais write Set_CPais;
    property XPais: WideString read Get_XPais write Set_XPais;
  end;

{ IXMLCompl }

  IXMLCompl = interface(IXMLNode)
    ['{1E9F1B6A-D7AD-437F-805E-BA6E3913C9BC}']
    { Property Accessors }
    function Get_XCaracAd: WideString;
    function Get_XCaracSer: WideString;
    function Get_XEmi: WideString;
    function Get_Fluxo: IXMLFluxo;
    function Get_Entrega: IXMLEntrega;
    function Get_OrigCalc: WideString;
    function Get_DestCalc: WideString;
    function Get_XObs: WideString;
    function Get_ObsCont: IXMLObsCont;
    function Get_ObsFisco: IXMLObsFisco;
    procedure Set_XCaracAd(Value: WideString);
    procedure Set_XCaracSer(Value: WideString);
    procedure Set_XEmi(Value: WideString);
    procedure Set_OrigCalc(Value: WideString);
    procedure Set_DestCalc(Value: WideString);
    procedure Set_XObs(Value: WideString);
    { Methods & Properties }
    property XCaracAd: WideString read Get_XCaracAd write Set_XCaracAd;
    property XCaracSer: WideString read Get_XCaracSer write Set_XCaracSer;
    property XEmi: WideString read Get_XEmi write Set_XEmi;
    property Fluxo: IXMLFluxo read Get_Fluxo;
    property Entrega: IXMLEntrega read Get_Entrega;
    property OrigCalc: WideString read Get_OrigCalc write Set_OrigCalc;
    property DestCalc: WideString read Get_DestCalc write Set_DestCalc;
    property XObs: WideString read Get_XObs write Set_XObs;
    property ObsCont: IXMLObsCont read Get_ObsCont;
    property ObsFisco: IXMLObsFisco read Get_ObsFisco;
  end;

{ IXMLFluxo }

  IXMLFluxo = interface(IXMLNode)
    ['{44FF690D-2059-4660-9770-620979AC36C8}']
    { Property Accessors }
    function Get_XOrig: WideString;
    function Get_Pass: IXMLPassList;
    function Get_XDest: WideString;
    function Get_XRota: WideString;
    procedure Set_XOrig(Value: WideString);
    procedure Set_XDest(Value: WideString);
    procedure Set_XRota(Value: WideString);
    { Methods & Properties }
    property XOrig: WideString read Get_XOrig write Set_XOrig;
    property Pass: IXMLPassList read Get_Pass;
    property XDest: WideString read Get_XDest write Set_XDest;
    property XRota: WideString read Get_XRota write Set_XRota;
  end;

{ IXMLPass }

  IXMLPass = interface(IXMLNode)
    ['{9AFCB3FF-42DC-4263-B044-74B12FC62D25}']
    { Property Accessors }
    function Get_XPass: WideString;
    procedure Set_XPass(Value: WideString);
    { Methods & Properties }
    property XPass: WideString read Get_XPass write Set_XPass;
  end;

{ IXMLPassList }

  IXMLPassList = interface(IXMLNodeCollection)
    ['{71120823-DB57-4412-AE07-5C102BF20450}']
    { Methods & Properties }
    function Add: IXMLPass;
    function Insert(const Index: Integer): IXMLPass;
    function Get_Item(Index: Integer): IXMLPass;
    property Items[Index: Integer]: IXMLPass read Get_Item; default;
  end;

{ IXMLEntrega }

  IXMLEntrega = interface(IXMLNode)
    ['{794F5DE2-B3AD-4A51-B9AA-BF859423087E}']
    { Property Accessors }
    function Get_SemData: IXMLSemData;
    function Get_ComData: IXMLComData;
    function Get_NoPeriodo: IXMLNoPeriodo;
    function Get_SemHora: IXMLSemHora;
    function Get_ComHora: IXMLComHora;
    function Get_NoInter: IXMLNoInter;
    { Methods & Properties }
    property SemData: IXMLSemData read Get_SemData;
    property ComData: IXMLComData read Get_ComData;
    property NoPeriodo: IXMLNoPeriodo read Get_NoPeriodo;
    property SemHora: IXMLSemHora read Get_SemHora;
    property ComHora: IXMLComHora read Get_ComHora;
    property NoInter: IXMLNoInter read Get_NoInter;
  end;

{ IXMLSemData }

  IXMLSemData = interface(IXMLNode)
    ['{E003C3E4-EFE4-455A-B6C3-0F40160F83FC}']
    { Property Accessors }
    function Get_TpPer: WideString;
    procedure Set_TpPer(Value: WideString);
    { Methods & Properties }
    property TpPer: WideString read Get_TpPer write Set_TpPer;
  end;

{ IXMLComData }

  IXMLComData = interface(IXMLNode)
    ['{ED853E9C-AF09-4563-A8D6-0FB7AE7EFE9B}']
    { Property Accessors }
    function Get_TpPer: WideString;
    function Get_DProg: WideString;
    procedure Set_TpPer(Value: WideString);
    procedure Set_DProg(Value: WideString);
    { Methods & Properties }
    property TpPer: WideString read Get_TpPer write Set_TpPer;
    property DProg: WideString read Get_DProg write Set_DProg;
  end;

{ IXMLNoPeriodo }

  IXMLNoPeriodo = interface(IXMLNode)
    ['{C5865C6C-183B-4A01-8245-BAB24752CA82}']
    { Property Accessors }
    function Get_TpPer: WideString;
    function Get_DIni: WideString;
    function Get_DFim: WideString;
    procedure Set_TpPer(Value: WideString);
    procedure Set_DIni(Value: WideString);
    procedure Set_DFim(Value: WideString);
    { Methods & Properties }
    property TpPer: WideString read Get_TpPer write Set_TpPer;
    property DIni: WideString read Get_DIni write Set_DIni;
    property DFim: WideString read Get_DFim write Set_DFim;
  end;

{ IXMLSemHora }

  IXMLSemHora = interface(IXMLNode)
    ['{870EB840-31B4-4A38-8FA8-800B9F7A0D24}']
    { Property Accessors }
    function Get_TpHor: WideString;
    procedure Set_TpHor(Value: WideString);
    { Methods & Properties }
    property TpHor: WideString read Get_TpHor write Set_TpHor;
  end;

{ IXMLComHora }

  IXMLComHora = interface(IXMLNode)
    ['{A1BFF59F-4784-45BC-B510-F49C744AE15E}']
    { Property Accessors }
    function Get_TpHor: WideString;
    function Get_HProg: WideString;
    procedure Set_TpHor(Value: WideString);
    procedure Set_HProg(Value: WideString);
    { Methods & Properties }
    property TpHor: WideString read Get_TpHor write Set_TpHor;
    property HProg: WideString read Get_HProg write Set_HProg;
  end;

{ IXMLNoInter }

  IXMLNoInter = interface(IXMLNode)
    ['{72826FA6-D81A-435E-9ECE-EFC761C12943}']
    { Property Accessors }
    function Get_TpHor: WideString;
    function Get_HIni: WideString;
    function Get_HFim: WideString;
    procedure Set_TpHor(Value: WideString);
    procedure Set_HIni(Value: WideString);
    procedure Set_HFim(Value: WideString);
    { Methods & Properties }
    property TpHor: WideString read Get_TpHor write Set_TpHor;
    property HIni: WideString read Get_HIni write Set_HIni;
    property HFim: WideString read Get_HFim write Set_HFim;
  end;

{ IXMLObsCont }

  IXMLObsCont = interface(IXMLNode)
    ['{F5546589-17C1-414B-AF75-B109A94F6B2C}']
    { Property Accessors }
    function Get_XCampo: WideString;
    function Get_XTexto: WideString;
    procedure Set_XCampo(Value: WideString);
    procedure Set_XTexto(Value: WideString);
    { Methods & Properties }
    property XCampo: WideString read Get_XCampo write Set_XCampo;
    property XTexto: WideString read Get_XTexto write Set_XTexto;
  end;

{ IXMLObsFisco }

  IXMLObsFisco = interface(IXMLNode)
    ['{E216E712-C228-406C-B992-56B4B9C146BA}']
    { Property Accessors }
    function Get_XCampo: WideString;
    function Get_XTexto: WideString;
    procedure Set_XCampo(Value: WideString);
    procedure Set_XTexto(Value: WideString);
    { Methods & Properties }
    property XCampo: WideString read Get_XCampo write Set_XCampo;
    property XTexto: WideString read Get_XTexto write Set_XTexto;
  end;

{ IXMLEmit }

  IXMLEmit = interface(IXMLNode)
    ['{BF1F8EA5-1574-4A61-AF53-5E1A8065D9F3}']
    { Property Accessors }
    function Get_CNPJ: WideString;
    function Get_IE: WideString;
    function Get_XNome: WideString;
    function Get_XFant: WideString;
    function Get_EnderEmit: IXMLTEndeEmi;
    procedure Set_CNPJ(Value: WideString);
    procedure Set_IE(Value: WideString);
    procedure Set_XNome(Value: WideString);
    procedure Set_XFant(Value: WideString);
    { Methods & Properties }
    property CNPJ: WideString read Get_CNPJ write Set_CNPJ;
    property IE: WideString read Get_IE write Set_IE;
    property XNome: WideString read Get_XNome write Set_XNome;
    property XFant: WideString read Get_XFant write Set_XFant;
    property EnderEmit: IXMLTEndeEmi read Get_EnderEmit;
  end;

{ IXMLTEndeEmi }

  IXMLTEndeEmi = interface(IXMLNode)
    ['{01C7D97C-3CCA-4D26-AA1C-1BC506A5A44B}']
    { Property Accessors }
    function Get_XLgr: WideString;
    function Get_Nro: WideString;
    function Get_XCpl: WideString;
    function Get_XBairro: WideString;
    function Get_CMun: WideString;
    function Get_XMun: WideString;
    function Get_CEP: WideString;
    function Get_UF: WideString;
    function Get_Fone: WideString;
    procedure Set_XLgr(Value: WideString);
    procedure Set_Nro(Value: WideString);
    procedure Set_XCpl(Value: WideString);
    procedure Set_XBairro(Value: WideString);
    procedure Set_CMun(Value: WideString);
    procedure Set_XMun(Value: WideString);
    procedure Set_CEP(Value: WideString);
    procedure Set_UF(Value: WideString);
    procedure Set_Fone(Value: WideString);
    { Methods & Properties }
    property XLgr: WideString read Get_XLgr write Set_XLgr;
    property Nro: WideString read Get_Nro write Set_Nro;
    property XCpl: WideString read Get_XCpl write Set_XCpl;
    property XBairro: WideString read Get_XBairro write Set_XBairro;
    property CMun: WideString read Get_CMun write Set_CMun;
    property XMun: WideString read Get_XMun write Set_XMun;
    property CEP: WideString read Get_CEP write Set_CEP;
    property UF: WideString read Get_UF write Set_UF;
    property Fone: WideString read Get_Fone write Set_Fone;
  end;

{ IXMLRem }

  IXMLRem = interface(IXMLNode)
    ['{769830AE-E812-4798-9028-79151D38948B}']
    { Property Accessors }
    function Get_CNPJ: WideString;
    function Get_CPF: WideString;
    function Get_IE: WideString;
    function Get_XNome: WideString;
    function Get_XFant: WideString;
    function Get_Fone: WideString;
    function Get_EnderReme: IXMLTEndereco;
    function Get_Email: WideString;
    procedure Set_CNPJ(Value: WideString);
    procedure Set_CPF(Value: WideString);
    procedure Set_IE(Value: WideString);
    procedure Set_XNome(Value: WideString);
    procedure Set_XFant(Value: WideString);
    procedure Set_Fone(Value: WideString);
    procedure Set_Email(Value: WideString);
    { Methods & Properties }
    property CNPJ: WideString read Get_CNPJ write Set_CNPJ;
    property CPF: WideString read Get_CPF write Set_CPF;
    property IE: WideString read Get_IE write Set_IE;
    property XNome: WideString read Get_XNome write Set_XNome;
    property XFant: WideString read Get_XFant write Set_XFant;
    property Fone: WideString read Get_Fone write Set_Fone;
    property EnderReme: IXMLTEndereco read Get_EnderReme;
    property Email: WideString read Get_Email write Set_Email;
  end;

{ IXMLExped }

  IXMLExped = interface(IXMLNode)
    ['{0803EDA3-2638-456E-89F6-335B8C87728D}']
    { Property Accessors }
    function Get_CNPJ: WideString;
    function Get_CPF: WideString;
    function Get_IE: WideString;
    function Get_XNome: WideString;
    function Get_Fone: WideString;
    function Get_EnderExped: IXMLTEndereco;
    function Get_Email: WideString;
    procedure Set_CNPJ(Value: WideString);
    procedure Set_CPF(Value: WideString);
    procedure Set_IE(Value: WideString);
    procedure Set_XNome(Value: WideString);
    procedure Set_Fone(Value: WideString);
    procedure Set_Email(Value: WideString);
    { Methods & Properties }
    property CNPJ: WideString read Get_CNPJ write Set_CNPJ;
    property CPF: WideString read Get_CPF write Set_CPF;
    property IE: WideString read Get_IE write Set_IE;
    property XNome: WideString read Get_XNome write Set_XNome;
    property Fone: WideString read Get_Fone write Set_Fone;
    property EnderExped: IXMLTEndereco read Get_EnderExped;
    property Email: WideString read Get_Email write Set_Email;
  end;

{ IXMLReceb }

  IXMLReceb = interface(IXMLNode)
    ['{75A24FA8-7E85-4FEE-AB1B-5A8158CD517D}']
    { Property Accessors }
    function Get_CNPJ: WideString;
    function Get_CPF: WideString;
    function Get_IE: WideString;
    function Get_XNome: WideString;
    function Get_Fone: WideString;
    function Get_EnderReceb: IXMLTEndereco;
    function Get_Email: WideString;
    procedure Set_CNPJ(Value: WideString);
    procedure Set_CPF(Value: WideString);
    procedure Set_IE(Value: WideString);
    procedure Set_XNome(Value: WideString);
    procedure Set_Fone(Value: WideString);
    procedure Set_Email(Value: WideString);
    { Methods & Properties }
    property CNPJ: WideString read Get_CNPJ write Set_CNPJ;
    property CPF: WideString read Get_CPF write Set_CPF;
    property IE: WideString read Get_IE write Set_IE;
    property XNome: WideString read Get_XNome write Set_XNome;
    property Fone: WideString read Get_Fone write Set_Fone;
    property EnderReceb: IXMLTEndereco read Get_EnderReceb;
    property Email: WideString read Get_Email write Set_Email;
  end;

{ IXMLDest }

  IXMLDest = interface(IXMLNode)
    ['{4657D859-7C3D-46F9-AAA6-713065B1AAA6}']
    { Property Accessors }
    function Get_CNPJ: WideString;
    function Get_CPF: WideString;
    function Get_IE: WideString;
    function Get_XNome: WideString;
    function Get_Fone: WideString;
    function Get_ISUF: WideString;
    function Get_EnderDest: IXMLTEndereco;
    function Get_Email: WideString;
    procedure Set_CNPJ(Value: WideString);
    procedure Set_CPF(Value: WideString);
    procedure Set_IE(Value: WideString);
    procedure Set_XNome(Value: WideString);
    procedure Set_Fone(Value: WideString);
    procedure Set_ISUF(Value: WideString);
    procedure Set_Email(Value: WideString);
    { Methods & Properties }
    property CNPJ: WideString read Get_CNPJ write Set_CNPJ;
    property CPF: WideString read Get_CPF write Set_CPF;
    property IE: WideString read Get_IE write Set_IE;
    property XNome: WideString read Get_XNome write Set_XNome;
    property Fone: WideString read Get_Fone write Set_Fone;
    property ISUF: WideString read Get_ISUF write Set_ISUF;
    property EnderDest: IXMLTEndereco read Get_EnderDest;
    property Email: WideString read Get_Email write Set_Email;
  end;

{ IXMLVPrest }

  IXMLVPrest = interface(IXMLNode)
    ['{C884A2F2-95F0-407E-AFC4-0E77693AA73D}']
    { Property Accessors }
    function Get_VTPrest: WideString;
    function Get_VRec: WideString;
    function Get_Comp: IXMLCompList;
    procedure Set_VTPrest(Value: WideString);
    procedure Set_VRec(Value: WideString);
    { Methods & Properties }
    property VTPrest: WideString read Get_VTPrest write Set_VTPrest;
    property VRec: WideString read Get_VRec write Set_VRec;
    property Comp: IXMLCompList read Get_Comp;
  end;

{ IXMLComp }

  IXMLComp = interface(IXMLNode)
    ['{273A633A-9B5A-4237-B19A-D9CA82180B50}']
    { Property Accessors }
    function Get_XNome: WideString;
    function Get_VComp: WideString;
    procedure Set_XNome(Value: WideString);
    procedure Set_VComp(Value: WideString);
    { Methods & Properties }
    property XNome: WideString read Get_XNome write Set_XNome;
    property VComp: WideString read Get_VComp write Set_VComp;
  end;

{ IXMLCompList }

  IXMLCompList = interface(IXMLNodeCollection)
    ['{C7BF938A-8842-4F25-8CAC-281757BEF8B6}']
    { Methods & Properties }
    function Add: IXMLComp;
    function Insert(const Index: Integer): IXMLComp;
    function Get_Item(Index: Integer): IXMLComp;
    property Items[Index: Integer]: IXMLComp read Get_Item; default;
  end;

{ IXMLImp }

  IXMLImp = interface(IXMLNode)
    ['{60CE5994-15E3-4399-B4D2-82AD8D537099}']
    { Property Accessors }
    function Get_ICMS: IXMLTImp;
    function Get_VTotTrib: WideString;
    function Get_InfAdFisco: WideString;
    function Get_ICMSUFFim: IXMLICMSUFFim;
    procedure Set_VTotTrib(Value: WideString);
    procedure Set_InfAdFisco(Value: WideString);
    { Methods & Properties }
    property ICMS: IXMLTImp read Get_ICMS;
    property VTotTrib: WideString read Get_VTotTrib write Set_VTotTrib;
    property InfAdFisco: WideString read Get_InfAdFisco write Set_InfAdFisco;
    property ICMSUFFim: IXMLICMSUFFim read Get_ICMSUFFim;
  end;

{ IXMLTImp }

  IXMLTImp = interface(IXMLNode)
    ['{65BDE222-A96E-463E-96D4-372D13A9CBDA}']
    { Property Accessors }
    function Get_ICMS00: IXMLICMS00;
    function Get_ICMS20: IXMLICMS20;
    function Get_ICMS45: IXMLICMS45;
    function Get_ICMS60: IXMLICMS60;
    function Get_ICMS90: IXMLICMS90;
    function Get_ICMSOutraUF: IXMLICMSOutraUF;
    function Get_ICMSSN: IXMLICMSSN;
    { Methods & Properties }
    property ICMS00: IXMLICMS00 read Get_ICMS00;
    property ICMS20: IXMLICMS20 read Get_ICMS20;
    property ICMS45: IXMLICMS45 read Get_ICMS45;
    property ICMS60: IXMLICMS60 read Get_ICMS60;
    property ICMS90: IXMLICMS90 read Get_ICMS90;
    property ICMSOutraUF: IXMLICMSOutraUF read Get_ICMSOutraUF;
    property ICMSSN: IXMLICMSSN read Get_ICMSSN;
  end;

{ IXMLICMS00 }

  IXMLICMS00 = interface(IXMLNode)
    ['{0FC361A2-BA7F-4D41-BF6C-9B3EC0A259A2}']
    { Property Accessors }
    function Get_CST: WideString;
    function Get_VBC: WideString;
    function Get_PICMS: WideString;
    function Get_VICMS: WideString;
    procedure Set_CST(Value: WideString);
    procedure Set_VBC(Value: WideString);
    procedure Set_PICMS(Value: WideString);
    procedure Set_VICMS(Value: WideString);
    { Methods & Properties }
    property CST: WideString read Get_CST write Set_CST;
    property VBC: WideString read Get_VBC write Set_VBC;
    property PICMS: WideString read Get_PICMS write Set_PICMS;
    property VICMS: WideString read Get_VICMS write Set_VICMS;
  end;

{ IXMLICMS20 }

  IXMLICMS20 = interface(IXMLNode)
    ['{FB9A7098-9673-4EFA-878F-83C4F947A4CE}']
    { Property Accessors }
    function Get_CST: WideString;
    function Get_PRedBC: WideString;
    function Get_VBC: WideString;
    function Get_PICMS: WideString;
    function Get_VICMS: WideString;
    procedure Set_CST(Value: WideString);
    procedure Set_PRedBC(Value: WideString);
    procedure Set_VBC(Value: WideString);
    procedure Set_PICMS(Value: WideString);
    procedure Set_VICMS(Value: WideString);
    { Methods & Properties }
    property CST: WideString read Get_CST write Set_CST;
    property PRedBC: WideString read Get_PRedBC write Set_PRedBC;
    property VBC: WideString read Get_VBC write Set_VBC;
    property PICMS: WideString read Get_PICMS write Set_PICMS;
    property VICMS: WideString read Get_VICMS write Set_VICMS;
  end;

{ IXMLICMS45 }

  IXMLICMS45 = interface(IXMLNode)
    ['{B611FF99-EED8-4856-817B-8FFD6DC90189}']
    { Property Accessors }
    function Get_CST: WideString;
    procedure Set_CST(Value: WideString);
    { Methods & Properties }
    property CST: WideString read Get_CST write Set_CST;
  end;

{ IXMLICMS60 }

  IXMLICMS60 = interface(IXMLNode)
    ['{7FEC4D18-181F-4323-ACB1-B20759585665}']
    { Property Accessors }
    function Get_CST: WideString;
    function Get_VBCSTRet: WideString;
    function Get_VICMSSTRet: WideString;
    function Get_PICMSSTRet: WideString;
    function Get_VCred: WideString;
    procedure Set_CST(Value: WideString);
    procedure Set_VBCSTRet(Value: WideString);
    procedure Set_VICMSSTRet(Value: WideString);
    procedure Set_PICMSSTRet(Value: WideString);
    procedure Set_VCred(Value: WideString);
    { Methods & Properties }
    property CST: WideString read Get_CST write Set_CST;
    property VBCSTRet: WideString read Get_VBCSTRet write Set_VBCSTRet;
    property VICMSSTRet: WideString read Get_VICMSSTRet write Set_VICMSSTRet;
    property PICMSSTRet: WideString read Get_PICMSSTRet write Set_PICMSSTRet;
    property VCred: WideString read Get_VCred write Set_VCred;
  end;

{ IXMLICMS90 }

  IXMLICMS90 = interface(IXMLNode)
    ['{18B233E0-A56F-42E8-B1B8-D2F7856B12C0}']
    { Property Accessors }
    function Get_CST: WideString;
    function Get_PRedBC: WideString;
    function Get_VBC: WideString;
    function Get_PICMS: WideString;
    function Get_VICMS: WideString;
    function Get_VCred: WideString;
    procedure Set_CST(Value: WideString);
    procedure Set_PRedBC(Value: WideString);
    procedure Set_VBC(Value: WideString);
    procedure Set_PICMS(Value: WideString);
    procedure Set_VICMS(Value: WideString);
    procedure Set_VCred(Value: WideString);
    { Methods & Properties }
    property CST: WideString read Get_CST write Set_CST;
    property PRedBC: WideString read Get_PRedBC write Set_PRedBC;
    property VBC: WideString read Get_VBC write Set_VBC;
    property PICMS: WideString read Get_PICMS write Set_PICMS;
    property VICMS: WideString read Get_VICMS write Set_VICMS;
    property VCred: WideString read Get_VCred write Set_VCred;
  end;

{ IXMLICMSOutraUF }

  IXMLICMSOutraUF = interface(IXMLNode)
    ['{7DAB4551-E68E-47EE-8E5F-D7E54193217E}']
    { Property Accessors }
    function Get_CST: WideString;
    function Get_PRedBCOutraUF: WideString;
    function Get_VBCOutraUF: WideString;
    function Get_PICMSOutraUF: WideString;
    function Get_VICMSOutraUF: WideString;
    procedure Set_CST(Value: WideString);
    procedure Set_PRedBCOutraUF(Value: WideString);
    procedure Set_VBCOutraUF(Value: WideString);
    procedure Set_PICMSOutraUF(Value: WideString);
    procedure Set_VICMSOutraUF(Value: WideString);
    { Methods & Properties }
    property CST: WideString read Get_CST write Set_CST;
    property PRedBCOutraUF: WideString read Get_PRedBCOutraUF write Set_PRedBCOutraUF;
    property VBCOutraUF: WideString read Get_VBCOutraUF write Set_VBCOutraUF;
    property PICMSOutraUF: WideString read Get_PICMSOutraUF write Set_PICMSOutraUF;
    property VICMSOutraUF: WideString read Get_VICMSOutraUF write Set_VICMSOutraUF;
  end;

{ IXMLICMSSN }

  IXMLICMSSN = interface(IXMLNode)
    ['{5B9B33CC-45C9-4528-A799-528AE4AB974E}']
    { Property Accessors }
    function Get_IndSN: WideString;
    procedure Set_IndSN(Value: WideString);
    { Methods & Properties }
    property IndSN: WideString read Get_IndSN write Set_IndSN;
  end;

{ IXMLICMSUFFim }

  IXMLICMSUFFim = interface(IXMLNode)
    ['{25292562-5B43-456C-9854-635120C50FFB}']
    { Property Accessors }
    function Get_VBCUFFim: WideString;
    function Get_PFCPUFFim: WideString;
    function Get_PICMSUFFim: WideString;
    function Get_PICMSInter: WideString;
    function Get_PICMSInterPart: WideString;
    function Get_VFCPUFFim: WideString;
    function Get_VICMSUFFim: WideString;
    function Get_VICMSUFIni: WideString;
    procedure Set_VBCUFFim(Value: WideString);
    procedure Set_PFCPUFFim(Value: WideString);
    procedure Set_PICMSUFFim(Value: WideString);
    procedure Set_PICMSInter(Value: WideString);
    procedure Set_PICMSInterPart(Value: WideString);
    procedure Set_VFCPUFFim(Value: WideString);
    procedure Set_VICMSUFFim(Value: WideString);
    procedure Set_VICMSUFIni(Value: WideString);
    { Methods & Properties }
    property VBCUFFim: WideString read Get_VBCUFFim write Set_VBCUFFim;
    property PFCPUFFim: WideString read Get_PFCPUFFim write Set_PFCPUFFim;
    property PICMSUFFim: WideString read Get_PICMSUFFim write Set_PICMSUFFim;
    property PICMSInter: WideString read Get_PICMSInter write Set_PICMSInter;
    property PICMSInterPart: WideString read Get_PICMSInterPart write Set_PICMSInterPart;
    property VFCPUFFim: WideString read Get_VFCPUFFim write Set_VFCPUFFim;
    property VICMSUFFim: WideString read Get_VICMSUFFim write Set_VICMSUFFim;
    property VICMSUFIni: WideString read Get_VICMSUFIni write Set_VICMSUFIni;
  end;

{ IXMLInfCTeNorm }

  IXMLInfCTeNorm = interface(IXMLNode)
    ['{5AE052A7-B164-4464-B09B-CA97BD88C30C}']
    { Property Accessors }
    function Get_InfCarga: IXMLInfCarga;
    function Get_InfDoc: IXMLInfDoc;
    function Get_DocAnt: IXMLDocAnt;
    function Get_Seg: IXMLSegList;
    function Get_InfModal: IXMLInfModal;
    function Get_Peri: IXMLPeriList;
    function Get_VeicNovos: IXMLVeicNovosList;
    function Get_Cobr: IXMLCobr;
    function Get_InfCteSub: IXMLInfCteSub;
    { Methods & Properties }
    property InfCarga: IXMLInfCarga read Get_InfCarga;
    property InfDoc: IXMLInfDoc read Get_InfDoc;
    property DocAnt: IXMLDocAnt read Get_DocAnt;
    property Seg: IXMLSegList read Get_Seg;
    property InfModal: IXMLInfModal read Get_InfModal;
    property Peri: IXMLPeriList read Get_Peri;
    property VeicNovos: IXMLVeicNovosList read Get_VeicNovos;
    property Cobr: IXMLCobr read Get_Cobr;
    property InfCteSub: IXMLInfCteSub read Get_InfCteSub;
  end;

{ IXMLInfCarga }

  IXMLInfCarga = interface(IXMLNode)
    ['{CF7C23E8-C600-4B43-8B87-A5EB5053A2C5}']
    { Property Accessors }
    function Get_VCarga: WideString;
    function Get_ProPred: WideString;
    function Get_XOutCat: WideString;
    function Get_InfQ: IXMLInfQList;
    procedure Set_VCarga(Value: WideString);
    procedure Set_ProPred(Value: WideString);
    procedure Set_XOutCat(Value: WideString);
    { Methods & Properties }
    property VCarga: WideString read Get_VCarga write Set_VCarga;
    property ProPred: WideString read Get_ProPred write Set_ProPred;
    property XOutCat: WideString read Get_XOutCat write Set_XOutCat;
    property InfQ: IXMLInfQList read Get_InfQ;
  end;

{ IXMLInfQ }

  IXMLInfQ = interface(IXMLNode)
    ['{6A8A1E2B-BDA4-4CBD-AEC9-87B90010895F}']
    { Property Accessors }
    function Get_CUnid: WideString;
    function Get_TpMed: WideString;
    function Get_QCarga: WideString;
    procedure Set_CUnid(Value: WideString);
    procedure Set_TpMed(Value: WideString);
    procedure Set_QCarga(Value: WideString);
    { Methods & Properties }
    property CUnid: WideString read Get_CUnid write Set_CUnid;
    property TpMed: WideString read Get_TpMed write Set_TpMed;
    property QCarga: WideString read Get_QCarga write Set_QCarga;
  end;

{ IXMLInfQList }

  IXMLInfQList = interface(IXMLNodeCollection)
    ['{5869ABB0-9CF8-41A1-A386-E5C8AB934898}']
    { Methods & Properties }
    function Add: IXMLInfQ;
    function Insert(const Index: Integer): IXMLInfQ;
    function Get_Item(Index: Integer): IXMLInfQ;
    property Items[Index: Integer]: IXMLInfQ read Get_Item; default;
  end;

{ IXMLInfDoc }

  IXMLInfDoc = interface(IXMLNode)
    ['{C7FD3FFE-94C7-46A3-9984-E20D052B790C}']
    { Property Accessors }
    function Get_InfNF: IXMLInfNFList;
    function Get_InfNFe: IXMLInfNFeList;
    function Get_InfOutros: IXMLInfOutrosList;
    { Methods & Properties }
    property InfNF: IXMLInfNFList read Get_InfNF;
    property InfNFe: IXMLInfNFeList read Get_InfNFe;
    property InfOutros: IXMLInfOutrosList read Get_InfOutros;
  end;

{ IXMLInfNF }

  IXMLInfNF = interface(IXMLNode)
    ['{2A43F929-6674-49AA-B429-1BC770FC94E2}']
    { Property Accessors }
    function Get_NRoma: WideString;
    function Get_NPed: WideString;
    function Get_Mod_: WideString;
    function Get_Serie: WideString;
    function Get_NDoc: WideString;
    function Get_DEmi: WideString;
    function Get_VBC: WideString;
    function Get_VICMS: WideString;
    function Get_VBCST: WideString;
    function Get_VST: WideString;
    function Get_VProd: WideString;
    function Get_VNF: WideString;
    function Get_NCFOP: WideString;
    function Get_NPeso: WideString;
    function Get_PIN: WideString;
    function Get_DPrev: WideString;
    function Get_InfUnidTransp: IXMLTUnidadeTranspList;
    function Get_InfUnidCarga: IXMLTUnidCargaList;
    procedure Set_NRoma(Value: WideString);
    procedure Set_NPed(Value: WideString);
    procedure Set_Mod_(Value: WideString);
    procedure Set_Serie(Value: WideString);
    procedure Set_NDoc(Value: WideString);
    procedure Set_DEmi(Value: WideString);
    procedure Set_VBC(Value: WideString);
    procedure Set_VICMS(Value: WideString);
    procedure Set_VBCST(Value: WideString);
    procedure Set_VST(Value: WideString);
    procedure Set_VProd(Value: WideString);
    procedure Set_VNF(Value: WideString);
    procedure Set_NCFOP(Value: WideString);
    procedure Set_NPeso(Value: WideString);
    procedure Set_PIN(Value: WideString);
    procedure Set_DPrev(Value: WideString);
    { Methods & Properties }
    property NRoma: WideString read Get_NRoma write Set_NRoma;
    property NPed: WideString read Get_NPed write Set_NPed;
    property Mod_: WideString read Get_Mod_ write Set_Mod_;
    property Serie: WideString read Get_Serie write Set_Serie;
    property NDoc: WideString read Get_NDoc write Set_NDoc;
    property DEmi: WideString read Get_DEmi write Set_DEmi;
    property VBC: WideString read Get_VBC write Set_VBC;
    property VICMS: WideString read Get_VICMS write Set_VICMS;
    property VBCST: WideString read Get_VBCST write Set_VBCST;
    property VST: WideString read Get_VST write Set_VST;
    property VProd: WideString read Get_VProd write Set_VProd;
    property VNF: WideString read Get_VNF write Set_VNF;
    property NCFOP: WideString read Get_NCFOP write Set_NCFOP;
    property NPeso: WideString read Get_NPeso write Set_NPeso;
    property PIN: WideString read Get_PIN write Set_PIN;
    property DPrev: WideString read Get_DPrev write Set_DPrev;
    property InfUnidTransp: IXMLTUnidadeTranspList read Get_InfUnidTransp;
    property InfUnidCarga: IXMLTUnidCargaList read Get_InfUnidCarga;
  end;

{ IXMLInfNFList }

  IXMLInfNFList = interface(IXMLNodeCollection)
    ['{716ED481-0D5F-4DE3-8535-4F7529C6126A}']
    { Methods & Properties }
    function Add: IXMLInfNF;
    function Insert(const Index: Integer): IXMLInfNF;
    function Get_Item(Index: Integer): IXMLInfNF;
    property Items[Index: Integer]: IXMLInfNF read Get_Item; default;
  end;

{ IXMLTUnidadeTransp }

  IXMLTUnidadeTransp = interface(IXMLNode)
    ['{C97FF841-BF13-4FD3-939A-639A3FA4C2EB}']
    { Property Accessors }
    function Get_TpUnidTransp: WideString;
    function Get_IdUnidTransp: WideString;
    function Get_LacUnidTransp: IXMLLacUnidTranspList;
    function Get_InfUnidCarga: IXMLTUnidCargaList;
    function Get_QtdRat: WideString;
    procedure Set_TpUnidTransp(Value: WideString);
    procedure Set_IdUnidTransp(Value: WideString);
    procedure Set_QtdRat(Value: WideString);
    { Methods & Properties }
    property TpUnidTransp: WideString read Get_TpUnidTransp write Set_TpUnidTransp;
    property IdUnidTransp: WideString read Get_IdUnidTransp write Set_IdUnidTransp;
    property LacUnidTransp: IXMLLacUnidTranspList read Get_LacUnidTransp;
    property InfUnidCarga: IXMLTUnidCargaList read Get_InfUnidCarga;
    property QtdRat: WideString read Get_QtdRat write Set_QtdRat;
  end;

{ IXMLTUnidadeTranspList }

  IXMLTUnidadeTranspList = interface(IXMLNodeCollection)
    ['{E9FF24E8-4339-40F0-BC11-6D49400120CD}']
    { Methods & Properties }
    function Add: IXMLTUnidadeTransp;
    function Insert(const Index: Integer): IXMLTUnidadeTransp;
    function Get_Item(Index: Integer): IXMLTUnidadeTransp;
    property Items[Index: Integer]: IXMLTUnidadeTransp read Get_Item; default;
  end;

{ IXMLLacUnidTransp }

  IXMLLacUnidTransp = interface(IXMLNode)
    ['{55F62DD8-B4EC-453C-8B6E-2B662E0AE0E3}']
    { Property Accessors }
    function Get_NLacre: WideString;
    procedure Set_NLacre(Value: WideString);
    { Methods & Properties }
    property NLacre: WideString read Get_NLacre write Set_NLacre;
  end;

{ IXMLLacUnidTranspList }

  IXMLLacUnidTranspList = interface(IXMLNodeCollection)
    ['{3ABCE669-2986-4F8F-AD70-CF37538AE145}']
    { Methods & Properties }
    function Add: IXMLLacUnidTransp;
    function Insert(const Index: Integer): IXMLLacUnidTransp;
    function Get_Item(Index: Integer): IXMLLacUnidTransp;
    property Items[Index: Integer]: IXMLLacUnidTransp read Get_Item; default;
  end;

{ IXMLTUnidCarga }

  IXMLTUnidCarga = interface(IXMLNode)
    ['{0935FBE2-831A-4A79-BEE1-0AE0AD47EFC4}']
    { Property Accessors }
    function Get_TpUnidCarga: WideString;
    function Get_IdUnidCarga: WideString;
    function Get_LacUnidCarga: IXMLLacUnidCargaList;
    function Get_QtdRat: WideString;
    procedure Set_TpUnidCarga(Value: WideString);
    procedure Set_IdUnidCarga(Value: WideString);
    procedure Set_QtdRat(Value: WideString);
    { Methods & Properties }
    property TpUnidCarga: WideString read Get_TpUnidCarga write Set_TpUnidCarga;
    property IdUnidCarga: WideString read Get_IdUnidCarga write Set_IdUnidCarga;
    property LacUnidCarga: IXMLLacUnidCargaList read Get_LacUnidCarga;
    property QtdRat: WideString read Get_QtdRat write Set_QtdRat;
  end;

{ IXMLTUnidCargaList }

  IXMLTUnidCargaList = interface(IXMLNodeCollection)
    ['{2FBBD945-CD4C-4639-993F-1167F7D37FFA}']
    { Methods & Properties }
    function Add: IXMLTUnidCarga;
    function Insert(const Index: Integer): IXMLTUnidCarga;
    function Get_Item(Index: Integer): IXMLTUnidCarga;
    property Items[Index: Integer]: IXMLTUnidCarga read Get_Item; default;
  end;

{ IXMLLacUnidCarga }

  IXMLLacUnidCarga = interface(IXMLNode)
    ['{FC5D1972-6596-4F94-AFDB-3BD85BFEFAD9}']
    { Property Accessors }
    function Get_NLacre: WideString;
    procedure Set_NLacre(Value: WideString);
    { Methods & Properties }
    property NLacre: WideString read Get_NLacre write Set_NLacre;
  end;

{ IXMLLacUnidCargaList }

  IXMLLacUnidCargaList = interface(IXMLNodeCollection)
    ['{3A2A62FE-9ECF-4A50-992E-2080A07EBEE6}']
    { Methods & Properties }
    function Add: IXMLLacUnidCarga;
    function Insert(const Index: Integer): IXMLLacUnidCarga;
    function Get_Item(Index: Integer): IXMLLacUnidCarga;
    property Items[Index: Integer]: IXMLLacUnidCarga read Get_Item; default;
  end;

{ IXMLInfNFe }

  IXMLInfNFe = interface(IXMLNode)
    ['{377CDEC1-8627-404E-97CD-D539A97B9566}']
    { Property Accessors }
    function Get_Chave: WideString;
    function Get_PIN: WideString;
    function Get_DPrev: WideString;
    function Get_InfUnidTransp: IXMLTUnidadeTranspList;
    function Get_InfUnidCarga: IXMLTUnidCargaList;
    procedure Set_Chave(Value: WideString);
    procedure Set_PIN(Value: WideString);
    procedure Set_DPrev(Value: WideString);
    { Methods & Properties }
    property Chave: WideString read Get_Chave write Set_Chave;
    property PIN: WideString read Get_PIN write Set_PIN;
    property DPrev: WideString read Get_DPrev write Set_DPrev;
    property InfUnidTransp: IXMLTUnidadeTranspList read Get_InfUnidTransp;
    property InfUnidCarga: IXMLTUnidCargaList read Get_InfUnidCarga;
  end;

{ IXMLInfNFeList }

  IXMLInfNFeList = interface(IXMLNodeCollection)
    ['{45883C74-D18B-413E-94A1-6852FAB2DE70}']
    { Methods & Properties }
    function Add: IXMLInfNFe;
    function Insert(const Index: Integer): IXMLInfNFe;
    function Get_Item(Index: Integer): IXMLInfNFe;
    property Items[Index: Integer]: IXMLInfNFe read Get_Item; default;
  end;

{ IXMLInfOutros }

  IXMLInfOutros = interface(IXMLNode)
    ['{CB224E6D-67B1-4010-9549-25E294C328C6}']
    { Property Accessors }
    function Get_TpDoc: WideString;
    function Get_DescOutros: WideString;
    function Get_NDoc: WideString;
    function Get_DEmi: WideString;
    function Get_VDocFisc: WideString;
    function Get_DPrev: WideString;
    function Get_InfUnidTransp: IXMLTUnidadeTranspList;
    function Get_InfUnidCarga: IXMLTUnidCargaList;
    procedure Set_TpDoc(Value: WideString);
    procedure Set_DescOutros(Value: WideString);
    procedure Set_NDoc(Value: WideString);
    procedure Set_DEmi(Value: WideString);
    procedure Set_VDocFisc(Value: WideString);
    procedure Set_DPrev(Value: WideString);
    { Methods & Properties }
    property TpDoc: WideString read Get_TpDoc write Set_TpDoc;
    property DescOutros: WideString read Get_DescOutros write Set_DescOutros;
    property NDoc: WideString read Get_NDoc write Set_NDoc;
    property DEmi: WideString read Get_DEmi write Set_DEmi;
    property VDocFisc: WideString read Get_VDocFisc write Set_VDocFisc;
    property DPrev: WideString read Get_DPrev write Set_DPrev;
    property InfUnidTransp: IXMLTUnidadeTranspList read Get_InfUnidTransp;
    property InfUnidCarga: IXMLTUnidCargaList read Get_InfUnidCarga;
  end;

{ IXMLInfOutrosList }

  IXMLInfOutrosList = interface(IXMLNodeCollection)
    ['{45916388-F2B9-4DCC-AAC9-30F0113343E8}']
    { Methods & Properties }
    function Add: IXMLInfOutros;
    function Insert(const Index: Integer): IXMLInfOutros;
    function Get_Item(Index: Integer): IXMLInfOutros;
    property Items[Index: Integer]: IXMLInfOutros read Get_Item; default;
  end;

{ IXMLDocAnt }

  IXMLDocAnt = interface(IXMLNodeCollection)
    ['{A0ABE381-329C-40DB-837F-EC9E69D9375E}']
    { Property Accessors }
    function Get_EmiDocAnt(Index: Integer): IXMLEmiDocAnt;
    { Methods & Properties }
    function Add: IXMLEmiDocAnt;
    function Insert(const Index: Integer): IXMLEmiDocAnt;
    property EmiDocAnt[Index: Integer]: IXMLEmiDocAnt read Get_EmiDocAnt; default;
  end;

{ IXMLEmiDocAnt }

  IXMLEmiDocAnt = interface(IXMLNode)
    ['{FE7E44C0-FE73-4D06-8B79-9CAAF2BCA114}']
    { Property Accessors }
    function Get_CNPJ: WideString;
    function Get_CPF: WideString;
    function Get_IE: WideString;
    function Get_UF: WideString;
    function Get_XNome: WideString;
    function Get_IdDocAnt: IXMLIdDocAntList;
    procedure Set_CNPJ(Value: WideString);
    procedure Set_CPF(Value: WideString);
    procedure Set_IE(Value: WideString);
    procedure Set_UF(Value: WideString);
    procedure Set_XNome(Value: WideString);
    { Methods & Properties }
    property CNPJ: WideString read Get_CNPJ write Set_CNPJ;
    property CPF: WideString read Get_CPF write Set_CPF;
    property IE: WideString read Get_IE write Set_IE;
    property UF: WideString read Get_UF write Set_UF;
    property XNome: WideString read Get_XNome write Set_XNome;
    property IdDocAnt: IXMLIdDocAntList read Get_IdDocAnt;
  end;

{ IXMLIdDocAnt }

  IXMLIdDocAnt = interface(IXMLNode)
    ['{8470EEAC-EF79-466A-B629-0B6183743456}']
    { Property Accessors }
    function Get_IdDocAntPap: IXMLIdDocAntPapList;
    function Get_IdDocAntEle: IXMLIdDocAntEleList;
    { Methods & Properties }
    property IdDocAntPap: IXMLIdDocAntPapList read Get_IdDocAntPap;
    property IdDocAntEle: IXMLIdDocAntEleList read Get_IdDocAntEle;
  end;

{ IXMLIdDocAntList }

  IXMLIdDocAntList = interface(IXMLNodeCollection)
    ['{C3A034C3-E5FF-4884-8814-B7B8B490C16D}']
    { Methods & Properties }
    function Add: IXMLIdDocAnt;
    function Insert(const Index: Integer): IXMLIdDocAnt;
    function Get_Item(Index: Integer): IXMLIdDocAnt;
    property Items[Index: Integer]: IXMLIdDocAnt read Get_Item; default;
  end;

{ IXMLIdDocAntPap }

  IXMLIdDocAntPap = interface(IXMLNode)
    ['{78B4771E-F29C-4194-9AB4-1C95797D867F}']
    { Property Accessors }
    function Get_TpDoc: WideString;
    function Get_Serie: WideString;
    function Get_Subser: WideString;
    function Get_NDoc: WideString;
    function Get_DEmi: WideString;
    procedure Set_TpDoc(Value: WideString);
    procedure Set_Serie(Value: WideString);
    procedure Set_Subser(Value: WideString);
    procedure Set_NDoc(Value: WideString);
    procedure Set_DEmi(Value: WideString);
    { Methods & Properties }
    property TpDoc: WideString read Get_TpDoc write Set_TpDoc;
    property Serie: WideString read Get_Serie write Set_Serie;
    property Subser: WideString read Get_Subser write Set_Subser;
    property NDoc: WideString read Get_NDoc write Set_NDoc;
    property DEmi: WideString read Get_DEmi write Set_DEmi;
  end;

{ IXMLIdDocAntPapList }

  IXMLIdDocAntPapList = interface(IXMLNodeCollection)
    ['{56BCFEC2-03B3-4FBA-B35E-81D432DE4522}']
    { Methods & Properties }
    function Add: IXMLIdDocAntPap;
    function Insert(const Index: Integer): IXMLIdDocAntPap;
    function Get_Item(Index: Integer): IXMLIdDocAntPap;
    property Items[Index: Integer]: IXMLIdDocAntPap read Get_Item; default;
  end;

{ IXMLIdDocAntEle }

  IXMLIdDocAntEle = interface(IXMLNode)
    ['{C34890E8-D8D8-4D90-A786-4618D91183D5}']
    { Property Accessors }
    function Get_Chave: WideString;
    procedure Set_Chave(Value: WideString);
    { Methods & Properties }
    property Chave: WideString read Get_Chave write Set_Chave;
  end;

{ IXMLIdDocAntEleList }

  IXMLIdDocAntEleList = interface(IXMLNodeCollection)
    ['{ED64321F-32E6-4264-BB6E-D762C3BFFD6A}']
    { Methods & Properties }
    function Add: IXMLIdDocAntEle;
    function Insert(const Index: Integer): IXMLIdDocAntEle;
    function Get_Item(Index: Integer): IXMLIdDocAntEle;
    property Items[Index: Integer]: IXMLIdDocAntEle read Get_Item; default;
  end;

{ IXMLSeg }

  IXMLSeg = interface(IXMLNode)
    ['{5B025FD0-112B-4ECF-8B04-4703E39790DA}']
    { Property Accessors }
    function Get_RespSeg: WideString;
    function Get_XSeg: WideString;
    function Get_NApol: WideString;
    function Get_NAver: WideString;
    function Get_VCarga: WideString;
    procedure Set_RespSeg(Value: WideString);
    procedure Set_XSeg(Value: WideString);
    procedure Set_NApol(Value: WideString);
    procedure Set_NAver(Value: WideString);
    procedure Set_VCarga(Value: WideString);
    { Methods & Properties }
    property RespSeg: WideString read Get_RespSeg write Set_RespSeg;
    property XSeg: WideString read Get_XSeg write Set_XSeg;
    property NApol: WideString read Get_NApol write Set_NApol;
    property NAver: WideString read Get_NAver write Set_NAver;
    property VCarga: WideString read Get_VCarga write Set_VCarga;
  end;

{ IXMLSegList }

  IXMLSegList = interface(IXMLNodeCollection)
    ['{45B1653A-B4D8-4FD8-9980-C4CE9880EE15}']
    { Methods & Properties }
    function Add: IXMLSeg;
    function Insert(const Index: Integer): IXMLSeg;
    function Get_Item(Index: Integer): IXMLSeg;
    property Items[Index: Integer]: IXMLSeg read Get_Item; default;
  end;

{ IXMLInfModal }

  IXMLInfModal = interface(IXMLNode)
    ['{8945E5CF-2C98-4196-B866-5C2E3889FE67}']
    { Property Accessors }
    function Get_VersaoModal: WideString;
    procedure Set_VersaoModal(Value: WideString);
    { Methods & Properties }
    property VersaoModal: WideString read Get_VersaoModal write Set_VersaoModal;
  end;

{ IXMLPeri }

  IXMLPeri = interface(IXMLNode)
    ['{715B1557-C774-47EC-A050-610390E941CA}']
    { Property Accessors }
    function Get_NONU: WideString;
    function Get_XNomeAE: WideString;
    function Get_XClaRisco: WideString;
    function Get_GrEmb: WideString;
    function Get_QTotProd: WideString;
    function Get_QVolTipo: WideString;
    function Get_PontoFulgor: WideString;
    procedure Set_NONU(Value: WideString);
    procedure Set_XNomeAE(Value: WideString);
    procedure Set_XClaRisco(Value: WideString);
    procedure Set_GrEmb(Value: WideString);
    procedure Set_QTotProd(Value: WideString);
    procedure Set_QVolTipo(Value: WideString);
    procedure Set_PontoFulgor(Value: WideString);
    { Methods & Properties }
    property NONU: WideString read Get_NONU write Set_NONU;
    property XNomeAE: WideString read Get_XNomeAE write Set_XNomeAE;
    property XClaRisco: WideString read Get_XClaRisco write Set_XClaRisco;
    property GrEmb: WideString read Get_GrEmb write Set_GrEmb;
    property QTotProd: WideString read Get_QTotProd write Set_QTotProd;
    property QVolTipo: WideString read Get_QVolTipo write Set_QVolTipo;
    property PontoFulgor: WideString read Get_PontoFulgor write Set_PontoFulgor;
  end;

{ IXMLPeriList }

  IXMLPeriList = interface(IXMLNodeCollection)
    ['{D84BEDDB-03F9-4A82-BB90-FFB80F30ECEC}']
    { Methods & Properties }
    function Add: IXMLPeri;
    function Insert(const Index: Integer): IXMLPeri;
    function Get_Item(Index: Integer): IXMLPeri;
    property Items[Index: Integer]: IXMLPeri read Get_Item; default;
  end;

{ IXMLVeicNovos }

  IXMLVeicNovos = interface(IXMLNode)
    ['{0B8C40C3-6606-4025-8EE0-01BB948B0F0F}']
    { Property Accessors }
    function Get_Chassi: WideString;
    function Get_CCor: WideString;
    function Get_XCor: WideString;
    function Get_CMod: WideString;
    function Get_VUnit: WideString;
    function Get_VFrete: WideString;
    procedure Set_Chassi(Value: WideString);
    procedure Set_CCor(Value: WideString);
    procedure Set_XCor(Value: WideString);
    procedure Set_CMod(Value: WideString);
    procedure Set_VUnit(Value: WideString);
    procedure Set_VFrete(Value: WideString);
    { Methods & Properties }
    property Chassi: WideString read Get_Chassi write Set_Chassi;
    property CCor: WideString read Get_CCor write Set_CCor;
    property XCor: WideString read Get_XCor write Set_XCor;
    property CMod: WideString read Get_CMod write Set_CMod;
    property VUnit: WideString read Get_VUnit write Set_VUnit;
    property VFrete: WideString read Get_VFrete write Set_VFrete;
  end;

{ IXMLVeicNovosList }

  IXMLVeicNovosList = interface(IXMLNodeCollection)
    ['{793A3377-14D1-4EF1-9952-519D9FC94651}']
    { Methods & Properties }
    function Add: IXMLVeicNovos;
    function Insert(const Index: Integer): IXMLVeicNovos;
    function Get_Item(Index: Integer): IXMLVeicNovos;
    property Items[Index: Integer]: IXMLVeicNovos read Get_Item; default;
  end;

{ IXMLCobr }

  IXMLCobr = interface(IXMLNode)
    ['{BEC083E0-5363-4B61-B941-0E165A768464}']
    { Property Accessors }
    function Get_Fat: IXMLFat;
    function Get_Dup: IXMLDupList;
    { Methods & Properties }
    property Fat: IXMLFat read Get_Fat;
    property Dup: IXMLDupList read Get_Dup;
  end;

{ IXMLFat }

  IXMLFat = interface(IXMLNode)
    ['{A05DC853-6D8D-4E2B-B7A6-A07EB12AE79D}']
    { Property Accessors }
    function Get_NFat: WideString;
    function Get_VOrig: WideString;
    function Get_VDesc: WideString;
    function Get_VLiq: WideString;
    procedure Set_NFat(Value: WideString);
    procedure Set_VOrig(Value: WideString);
    procedure Set_VDesc(Value: WideString);
    procedure Set_VLiq(Value: WideString);
    { Methods & Properties }
    property NFat: WideString read Get_NFat write Set_NFat;
    property VOrig: WideString read Get_VOrig write Set_VOrig;
    property VDesc: WideString read Get_VDesc write Set_VDesc;
    property VLiq: WideString read Get_VLiq write Set_VLiq;
  end;

{ IXMLDup }

  IXMLDup = interface(IXMLNode)
    ['{E50A6C72-BD8A-4D8D-9ADE-17EF04F2D5B6}']
    { Property Accessors }
    function Get_NDup: WideString;
    function Get_DVenc: WideString;
    function Get_VDup: WideString;
    procedure Set_NDup(Value: WideString);
    procedure Set_DVenc(Value: WideString);
    procedure Set_VDup(Value: WideString);
    { Methods & Properties }
    property NDup: WideString read Get_NDup write Set_NDup;
    property DVenc: WideString read Get_DVenc write Set_DVenc;
    property VDup: WideString read Get_VDup write Set_VDup;
  end;

{ IXMLDupList }

  IXMLDupList = interface(IXMLNodeCollection)
    ['{F48484A4-25E4-4CD1-9A9B-E05523E12A7E}']
    { Methods & Properties }
    function Add: IXMLDup;
    function Insert(const Index: Integer): IXMLDup;
    function Get_Item(Index: Integer): IXMLDup;
    property Items[Index: Integer]: IXMLDup read Get_Item; default;
  end;

{ IXMLInfCteSub }

  IXMLInfCteSub = interface(IXMLNode)
    ['{5C7872E1-EE55-40DB-A5E4-B12D59B27B20}']
    { Property Accessors }
    function Get_ChCte: WideString;
    function Get_TomaICMS: IXMLTomaICMS;
    function Get_TomaNaoICMS: IXMLTomaNaoICMS;
    procedure Set_ChCte(Value: WideString);
    { Methods & Properties }
    property ChCte: WideString read Get_ChCte write Set_ChCte;
    property TomaICMS: IXMLTomaICMS read Get_TomaICMS;
    property TomaNaoICMS: IXMLTomaNaoICMS read Get_TomaNaoICMS;
  end;

{ IXMLTomaICMS }

  IXMLTomaICMS = interface(IXMLNode)
    ['{6320A490-F935-498E-A728-CA28F58C909A}']
    { Property Accessors }
    function Get_RefNFe: WideString;
    function Get_RefNF: IXMLRefNF;
    function Get_RefCte: WideString;
    procedure Set_RefNFe(Value: WideString);
    procedure Set_RefCte(Value: WideString);
    { Methods & Properties }
    property RefNFe: WideString read Get_RefNFe write Set_RefNFe;
    property RefNF: IXMLRefNF read Get_RefNF;
    property RefCte: WideString read Get_RefCte write Set_RefCte;
  end;

{ IXMLRefNF }

  IXMLRefNF = interface(IXMLNode)
    ['{461B15B2-2377-468A-8529-762249E0ECBA}']
    { Property Accessors }
    function Get_CNPJ: WideString;
    function Get_CPF: WideString;
    function Get_Mod_: WideString;
    function Get_Serie: WideString;
    function Get_Subserie: WideString;
    function Get_Nro: WideString;
    function Get_Valor: WideString;
    function Get_DEmi: WideString;
    procedure Set_CNPJ(Value: WideString);
    procedure Set_CPF(Value: WideString);
    procedure Set_Mod_(Value: WideString);
    procedure Set_Serie(Value: WideString);
    procedure Set_Subserie(Value: WideString);
    procedure Set_Nro(Value: WideString);
    procedure Set_Valor(Value: WideString);
    procedure Set_DEmi(Value: WideString);
    { Methods & Properties }
    property CNPJ: WideString read Get_CNPJ write Set_CNPJ;
    property CPF: WideString read Get_CPF write Set_CPF;
    property Mod_: WideString read Get_Mod_ write Set_Mod_;
    property Serie: WideString read Get_Serie write Set_Serie;
    property Subserie: WideString read Get_Subserie write Set_Subserie;
    property Nro: WideString read Get_Nro write Set_Nro;
    property Valor: WideString read Get_Valor write Set_Valor;
    property DEmi: WideString read Get_DEmi write Set_DEmi;
  end;

{ IXMLTomaNaoICMS }

  IXMLTomaNaoICMS = interface(IXMLNode)
    ['{4CD23410-38A4-452F-BC8C-7870B5E93ECA}']
    { Property Accessors }
    function Get_RefCteAnu: WideString;
    procedure Set_RefCteAnu(Value: WideString);
    { Methods & Properties }
    property RefCteAnu: WideString read Get_RefCteAnu write Set_RefCteAnu;
  end;

{ IXMLInfCteComp }

  IXMLInfCteComp = interface(IXMLNode)
    ['{70F0092B-5FC3-4BB6-8F13-A40F64380026}']
    { Property Accessors }
    function Get_Chave: WideString;
    procedure Set_Chave(Value: WideString);
    { Methods & Properties }
    property Chave: WideString read Get_Chave write Set_Chave;
  end;

{ IXMLInfCteAnu }

  IXMLInfCteAnu = interface(IXMLNode)
    ['{8C4F11F3-2C09-40BB-8F71-BBE402963FF8}']
    { Property Accessors }
    function Get_ChCte: WideString;
    function Get_DEmi: WideString;
    procedure Set_ChCte(Value: WideString);
    procedure Set_DEmi(Value: WideString);
    { Methods & Properties }
    property ChCte: WideString read Get_ChCte write Set_ChCte;
    property DEmi: WideString read Get_DEmi write Set_DEmi;
  end;

{ IXMLAutXML }

  IXMLAutXML = interface(IXMLNode)
    ['{617817CB-F396-4DFE-B7CE-E73D3D253CAF}']
    { Property Accessors }
    function Get_CNPJ: WideString;
    function Get_CPF: WideString;
    procedure Set_CNPJ(Value: WideString);
    procedure Set_CPF(Value: WideString);
    { Methods & Properties }
    property CNPJ: WideString read Get_CNPJ write Set_CNPJ;
    property CPF: WideString read Get_CPF write Set_CPF;
  end;

{ IXMLSignatureType }

  IXMLSignatureType = interface(IXMLNode)
    ['{C6844F9F-53ED-46AE-9624-C368DA12EB1C}']
    { Property Accessors }
    function Get_Id: WideString;
    function Get_SignedInfo: IXMLSignedInfoType;
    function Get_SignatureValue: IXMLSignatureValueType;
    function Get_KeyInfo: IXMLKeyInfoType;
    procedure Set_Id(Value: WideString);
    { Methods & Properties }
    property Id: WideString read Get_Id write Set_Id;
    property SignedInfo: IXMLSignedInfoType read Get_SignedInfo;
    property SignatureValue: IXMLSignatureValueType read Get_SignatureValue;
    property KeyInfo: IXMLKeyInfoType read Get_KeyInfo;
  end;

{ IXMLSignedInfoType }

  IXMLSignedInfoType = interface(IXMLNode)
    ['{2034A0AA-8CFF-4F2A-9A78-A37C938DF5E9}']
    { Property Accessors }
    function Get_Id: WideString;
    function Get_CanonicalizationMethod: IXMLCanonicalizationMethod;
    function Get_SignatureMethod: IXMLSignatureMethod;
    function Get_Reference: IXMLReferenceType;
    procedure Set_Id(Value: WideString);
    { Methods & Properties }
    property Id: WideString read Get_Id write Set_Id;
    property CanonicalizationMethod: IXMLCanonicalizationMethod read Get_CanonicalizationMethod;
    property SignatureMethod: IXMLSignatureMethod read Get_SignatureMethod;
    property Reference: IXMLReferenceType read Get_Reference;
  end;

{ IXMLCanonicalizationMethod }

  IXMLCanonicalizationMethod = interface(IXMLNode)
    ['{07E1D439-6158-488E-833A-E87898C63A2B}']
    { Property Accessors }
    function Get_Algorithm: WideString;
    procedure Set_Algorithm(Value: WideString);
    { Methods & Properties }
    property Algorithm: WideString read Get_Algorithm write Set_Algorithm;
  end;

{ IXMLSignatureMethod }

  IXMLSignatureMethod = interface(IXMLNode)
    ['{348681B5-BDD7-43BE-90C7-303FA0A84E6E}']
    { Property Accessors }
    function Get_Algorithm: WideString;
    procedure Set_Algorithm(Value: WideString);
    { Methods & Properties }
    property Algorithm: WideString read Get_Algorithm write Set_Algorithm;
  end;

{ IXMLReferenceType }

  IXMLReferenceType = interface(IXMLNode)
    ['{204AC67C-6A68-4BF5-9E2D-7FDC41DC6D4B}']
    { Property Accessors }
    function Get_Id: WideString;
    function Get_URI: WideString;
    function Get_Type_: WideString;
    function Get_Transforms: IXMLTransformsType;
    function Get_DigestMethod: IXMLDigestMethod;
    function Get_DigestValue: WideString;
    procedure Set_Id(Value: WideString);
    procedure Set_URI(Value: WideString);
    procedure Set_Type_(Value: WideString);
    procedure Set_DigestValue(Value: WideString);
    { Methods & Properties }
    property Id: WideString read Get_Id write Set_Id;
    property URI: WideString read Get_URI write Set_URI;
    property Type_: WideString read Get_Type_ write Set_Type_;
    property Transforms: IXMLTransformsType read Get_Transforms;
    property DigestMethod: IXMLDigestMethod read Get_DigestMethod;
    property DigestValue: WideString read Get_DigestValue write Set_DigestValue;
  end;

{ IXMLTransformsType }

  IXMLTransformsType = interface(IXMLNodeCollection)
    ['{1664DA00-8C30-44BB-A311-C2D2FAF104A9}']
    { Property Accessors }
    function Get_Transform(Index: Integer): IXMLTransformType;
    { Methods & Properties }
    function Add: IXMLTransformType;
    function Insert(const Index: Integer): IXMLTransformType;
    property Transform[Index: Integer]: IXMLTransformType read Get_Transform; default;
  end;

{ IXMLTransformType }

  IXMLTransformType = interface(IXMLNodeCollection)
    ['{6FE42168-56C8-4F9F-907E-3F80ABC4F4E0}']
    { Property Accessors }
    function Get_Algorithm: WideString;
    function Get_XPath(Index: Integer): WideString;
    procedure Set_Algorithm(Value: WideString);
    { Methods & Properties }
    function Add(const XPath: WideString): IXMLNode;
    function Insert(const Index: Integer; const XPath: WideString): IXMLNode;
    property Algorithm: WideString read Get_Algorithm write Set_Algorithm;
    property XPath[Index: Integer]: WideString read Get_XPath; default;
  end;

{ IXMLDigestMethod }

  IXMLDigestMethod = interface(IXMLNode)
    ['{A8B085FE-C4F8-4E43-9EAA-D113984C60A6}']
    { Property Accessors }
    function Get_Algorithm: WideString;
    procedure Set_Algorithm(Value: WideString);
    { Methods & Properties }
    property Algorithm: WideString read Get_Algorithm write Set_Algorithm;
  end;

{ IXMLSignatureValueType }

  IXMLSignatureValueType = interface(IXMLNode)
    ['{3476279B-665E-4EC1-8C9E-2EAD55FBBD2A}']
    { Property Accessors }
    function Get_Id: WideString;
    procedure Set_Id(Value: WideString);
    { Methods & Properties }
    property Id: WideString read Get_Id write Set_Id;
  end;

{ IXMLKeyInfoType }

  IXMLKeyInfoType = interface(IXMLNode)
    ['{51C7D5A4-FD06-45DA-ABC9-C7542B66C3A9}']
    { Property Accessors }
    function Get_Id: WideString;
    function Get_X509Data: IXMLX509DataType;
    procedure Set_Id(Value: WideString);
    { Methods & Properties }
    property Id: WideString read Get_Id write Set_Id;
    property X509Data: IXMLX509DataType read Get_X509Data;
  end;

{ IXMLX509DataType }

  IXMLX509DataType = interface(IXMLNode)
    ['{621FE2FF-D6DC-4714-903A-C4151CB3A314}']
    { Property Accessors }
    function Get_X509Certificate: WideString;
    procedure Set_X509Certificate(Value: WideString);
    { Methods & Properties }
    property X509Certificate: WideString read Get_X509Certificate write Set_X509Certificate;
  end;

{ IXMLTProtCTe }

  IXMLTProtCTe = interface(IXMLNode)
    ['{F38960B3-3B18-4368-A368-B571ADA583D5}']
    { Property Accessors }
    function Get_Versao: WideString;
    function Get_InfProt: IXMLInfProt;
    procedure Set_Versao(Value: WideString);
    { Methods & Properties }
    property Versao: WideString read Get_Versao write Set_Versao;
    property InfProt: IXMLInfProt read Get_InfProt;
  end;

{ IXMLInfProt }

  IXMLInfProt = interface(IXMLNode)
    ['{3B9891E7-D01E-4F5D-8FB9-AC7C0B3B8138}']
    { Property Accessors }
    function Get_Id: WideString;
    function Get_TpAmb: WideString;
    function Get_VerAplic: WideString;
    function Get_ChCTe: WideString;
    function Get_DhRecbto: WideString;
    function Get_NProt: WideString;
    function Get_DigVal: WideString;
    function Get_CStat: WideString;
    function Get_XMotivo: WideString;
    procedure Set_Id(Value: WideString);
    procedure Set_TpAmb(Value: WideString);
    procedure Set_VerAplic(Value: WideString);
    procedure Set_ChCTe(Value: WideString);
    procedure Set_DhRecbto(Value: WideString);
    procedure Set_NProt(Value: WideString);
    procedure Set_DigVal(Value: WideString);
    procedure Set_CStat(Value: WideString);
    procedure Set_XMotivo(Value: WideString);
    { Methods & Properties }
    property Id: WideString read Get_Id write Set_Id;
    property TpAmb: WideString read Get_TpAmb write Set_TpAmb;
    property VerAplic: WideString read Get_VerAplic write Set_VerAplic;
    property ChCTe: WideString read Get_ChCTe write Set_ChCTe;
    property DhRecbto: WideString read Get_DhRecbto write Set_DhRecbto;
    property NProt: WideString read Get_NProt write Set_NProt;
    property DigVal: WideString read Get_DigVal write Set_DigVal;
    property CStat: WideString read Get_CStat write Set_CStat;
    property XMotivo: WideString read Get_XMotivo write Set_XMotivo;
  end;

{ Forward Decls }

  TXMLCteProc = class;
  TXMLTCTe = class;
  TXMLInfCte = class;
  TXMLIde = class;
  TXMLToma03 = class;
  TXMLToma4 = class;
  TXMLTEndereco = class;
  TXMLCompl = class;
  TXMLFluxo = class;
  TXMLPass = class;
  TXMLPassList = class;
  TXMLEntrega = class;
  TXMLSemData = class;
  TXMLComData = class;
  TXMLNoPeriodo = class;
  TXMLSemHora = class;
  TXMLComHora = class;
  TXMLNoInter = class;
  TXMLObsCont = class;
  TXMLObsFisco = class;
  TXMLEmit = class;
  TXMLTEndeEmi = class;
  TXMLRem = class;
  TXMLExped = class;
  TXMLReceb = class;
  TXMLDest = class;
  TXMLVPrest = class;
  TXMLComp = class;
  TXMLCompList = class;
  TXMLImp = class;
  TXMLTImp = class;
  TXMLICMS00 = class;
  TXMLICMS20 = class;
  TXMLICMS45 = class;
  TXMLICMS60 = class;
  TXMLICMS90 = class;
  TXMLICMSOutraUF = class;
  TXMLICMSSN = class;
  TXMLICMSUFFim = class;
  TXMLInfCTeNorm = class;
  TXMLInfCarga = class;
  TXMLInfQ = class;
  TXMLInfQList = class;
  TXMLInfDoc = class;
  TXMLInfNF = class;
  TXMLInfNFList = class;
  TXMLTUnidadeTransp = class;
  TXMLTUnidadeTranspList = class;
  TXMLLacUnidTransp = class;
  TXMLLacUnidTranspList = class;
  TXMLTUnidCarga = class;
  TXMLTUnidCargaList = class;
  TXMLLacUnidCarga = class;
  TXMLLacUnidCargaList = class;
  TXMLInfNFe = class;
  TXMLInfNFeList = class;
  TXMLInfOutros = class;
  TXMLInfOutrosList = class;
  TXMLDocAnt = class;
  TXMLEmiDocAnt = class;
  TXMLIdDocAnt = class;
  TXMLIdDocAntList = class;
  TXMLIdDocAntPap = class;
  TXMLIdDocAntPapList = class;
  TXMLIdDocAntEle = class;
  TXMLIdDocAntEleList = class;
  TXMLSeg = class;
  TXMLSegList = class;
  TXMLInfModal = class;
  TXMLPeri = class;
  TXMLPeriList = class;
  TXMLVeicNovos = class;
  TXMLVeicNovosList = class;
  TXMLCobr = class;
  TXMLFat = class;
  TXMLDup = class;
  TXMLDupList = class;
  TXMLInfCteSub = class;
  TXMLTomaICMS = class;
  TXMLRefNF = class;
  TXMLTomaNaoICMS = class;
  TXMLInfCteComp = class;
  TXMLInfCteAnu = class;
  TXMLAutXML = class;
  TXMLSignatureType = class;
  TXMLSignedInfoType = class;
  TXMLCanonicalizationMethod = class;
  TXMLSignatureMethod = class;
  TXMLReferenceType = class;
  TXMLTransformsType = class;
  TXMLTransformType = class;
  TXMLDigestMethod = class;
  TXMLSignatureValueType = class;
  TXMLKeyInfoType = class;
  TXMLX509DataType = class;
  TXMLTProtCTe = class;
  TXMLInfProt = class;

{ TXMLCteProc }

  TXMLCteProc = class(TXMLNode, IXMLCteProc)
  protected
    { IXMLCteProc }
    function Get_Versao: WideString;
    function Get_CTe: IXMLTCTe;
    function Get_ProtCTe: IXMLTProtCTe;
    procedure Set_Versao(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTCTe }

  TXMLTCTe = class(TXMLNode, IXMLTCTe)
  protected
    { IXMLTCTe }
    function Get_InfCte: IXMLInfCte;
    function Get_Signature: IXMLSignatureType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLInfCte }

  TXMLInfCte = class(TXMLNode, IXMLInfCte)
  protected
    { IXMLInfCte }
    function Get_Versao: WideString;
    function Get_Id: WideString;
    function Get_Ide: IXMLIde;
    function Get_Compl: IXMLCompl;
    function Get_Emit: IXMLEmit;
    function Get_Rem: IXMLRem;
    function Get_Exped: IXMLExped;
    function Get_Receb: IXMLReceb;
    function Get_Dest: IXMLDest;
    function Get_VPrest: IXMLVPrest;
    function Get_Imp: IXMLImp;
    function Get_InfCTeNorm: IXMLInfCTeNorm;
    function Get_InfCteComp: IXMLInfCteComp;
    function Get_InfCteAnu: IXMLInfCteAnu;
    function Get_AutXML: IXMLAutXML;
    procedure Set_Versao(Value: WideString);
    procedure Set_Id(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLIde }

  TXMLIde = class(TXMLNode, IXMLIde)
  protected
    { IXMLIde }
    function Get_CUF: WideString;
    function Get_CCT: WideString;
    function Get_CFOP: WideString;
    function Get_NatOp: WideString;
    function Get_ForPag: WideString;
    function Get_Mod_: WideString;
    function Get_Serie: WideString;
    function Get_NCT: WideString;
    function Get_DhEmi: WideString;
    function Get_TpImp: WideString;
    function Get_TpEmis: WideString;
    function Get_CDV: WideString;
    function Get_TpAmb: WideString;
    function Get_TpCTe: WideString;
    function Get_ProcEmi: WideString;
    function Get_VerProc: WideString;
    function Get_RefCTE: WideString;
    function Get_CMunEnv: WideString;
    function Get_XMunEnv: WideString;
    function Get_UFEnv: WideString;
    function Get_Modal: WideString;
    function Get_TpServ: WideString;
    function Get_CMunIni: WideString;
    function Get_XMunIni: WideString;
    function Get_UFIni: WideString;
    function Get_CMunFim: WideString;
    function Get_XMunFim: WideString;
    function Get_UFFim: WideString;
    function Get_Retira: WideString;
    function Get_XDetRetira: WideString;
    function Get_Toma03: IXMLToma03;
    function Get_Toma4: IXMLToma4;
    function Get_DhCont: WideString;
    function Get_XJust: WideString;
    procedure Set_CUF(Value: WideString);
    procedure Set_CCT(Value: WideString);
    procedure Set_CFOP(Value: WideString);
    procedure Set_NatOp(Value: WideString);
    procedure Set_ForPag(Value: WideString);
    procedure Set_Mod_(Value: WideString);
    procedure Set_Serie(Value: WideString);
    procedure Set_NCT(Value: WideString);
    procedure Set_DhEmi(Value: WideString);
    procedure Set_TpImp(Value: WideString);
    procedure Set_TpEmis(Value: WideString);
    procedure Set_CDV(Value: WideString);
    procedure Set_TpAmb(Value: WideString);
    procedure Set_TpCTe(Value: WideString);
    procedure Set_ProcEmi(Value: WideString);
    procedure Set_VerProc(Value: WideString);
    procedure Set_RefCTE(Value: WideString);
    procedure Set_CMunEnv(Value: WideString);
    procedure Set_XMunEnv(Value: WideString);
    procedure Set_UFEnv(Value: WideString);
    procedure Set_Modal(Value: WideString);
    procedure Set_TpServ(Value: WideString);
    procedure Set_CMunIni(Value: WideString);
    procedure Set_XMunIni(Value: WideString);
    procedure Set_UFIni(Value: WideString);
    procedure Set_CMunFim(Value: WideString);
    procedure Set_XMunFim(Value: WideString);
    procedure Set_UFFim(Value: WideString);
    procedure Set_Retira(Value: WideString);
    procedure Set_XDetRetira(Value: WideString);
    procedure Set_DhCont(Value: WideString);
    procedure Set_XJust(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLToma03 }

  TXMLToma03 = class(TXMLNode, IXMLToma03)
  protected
    { IXMLToma03 }
    function Get_Toma: WideString;
    procedure Set_Toma(Value: WideString);
  end;

{ TXMLToma4 }

  TXMLToma4 = class(TXMLNode, IXMLToma4)
  protected
    { IXMLToma4 }
    function Get_Toma: WideString;
    function Get_CNPJ: WideString;
    function Get_CPF: WideString;
    function Get_IE: WideString;
    function Get_XNome: WideString;
    function Get_XFant: WideString;
    function Get_Fone: WideString;
    function Get_EnderToma: IXMLTEndereco;
    function Get_Email: WideString;
    procedure Set_Toma(Value: WideString);
    procedure Set_CNPJ(Value: WideString);
    procedure Set_CPF(Value: WideString);
    procedure Set_IE(Value: WideString);
    procedure Set_XNome(Value: WideString);
    procedure Set_XFant(Value: WideString);
    procedure Set_Fone(Value: WideString);
    procedure Set_Email(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTEndereco }

  TXMLTEndereco = class(TXMLNode, IXMLTEndereco)
  protected
    { IXMLTEndereco }
    function Get_XLgr: WideString;
    function Get_Nro: WideString;
    function Get_XCpl: WideString;
    function Get_XBairro: WideString;
    function Get_CMun: WideString;
    function Get_XMun: WideString;
    function Get_CEP: WideString;
    function Get_UF: WideString;
    function Get_CPais: WideString;
    function Get_XPais: WideString;
    procedure Set_XLgr(Value: WideString);
    procedure Set_Nro(Value: WideString);
    procedure Set_XCpl(Value: WideString);
    procedure Set_XBairro(Value: WideString);
    procedure Set_CMun(Value: WideString);
    procedure Set_XMun(Value: WideString);
    procedure Set_CEP(Value: WideString);
    procedure Set_UF(Value: WideString);
    procedure Set_CPais(Value: WideString);
    procedure Set_XPais(Value: WideString);
  end;

{ TXMLCompl }

  TXMLCompl = class(TXMLNode, IXMLCompl)
  protected
    { IXMLCompl }
    function Get_XCaracAd: WideString;
    function Get_XCaracSer: WideString;
    function Get_XEmi: WideString;
    function Get_Fluxo: IXMLFluxo;
    function Get_Entrega: IXMLEntrega;
    function Get_OrigCalc: WideString;
    function Get_DestCalc: WideString;
    function Get_XObs: WideString;
    function Get_ObsCont: IXMLObsCont;
    function Get_ObsFisco: IXMLObsFisco;
    procedure Set_XCaracAd(Value: WideString);
    procedure Set_XCaracSer(Value: WideString);
    procedure Set_XEmi(Value: WideString);
    procedure Set_OrigCalc(Value: WideString);
    procedure Set_DestCalc(Value: WideString);
    procedure Set_XObs(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLFluxo }

  TXMLFluxo = class(TXMLNode, IXMLFluxo)
  private
    FPass: IXMLPassList;
  protected
    { IXMLFluxo }
    function Get_XOrig: WideString;
    function Get_Pass: IXMLPassList;
    function Get_XDest: WideString;
    function Get_XRota: WideString;
    procedure Set_XOrig(Value: WideString);
    procedure Set_XDest(Value: WideString);
    procedure Set_XRota(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLPass }

  TXMLPass = class(TXMLNode, IXMLPass)
  protected
    { IXMLPass }
    function Get_XPass: WideString;
    procedure Set_XPass(Value: WideString);
  end;

{ TXMLPassList }

  TXMLPassList = class(TXMLNodeCollection, IXMLPassList)
  protected
    { IXMLPassList }
    function Add: IXMLPass;
    function Insert(const Index: Integer): IXMLPass;
    function Get_Item(Index: Integer): IXMLPass;
  end;

{ TXMLEntrega }

  TXMLEntrega = class(TXMLNode, IXMLEntrega)
  protected
    { IXMLEntrega }
    function Get_SemData: IXMLSemData;
    function Get_ComData: IXMLComData;
    function Get_NoPeriodo: IXMLNoPeriodo;
    function Get_SemHora: IXMLSemHora;
    function Get_ComHora: IXMLComHora;
    function Get_NoInter: IXMLNoInter;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLSemData }

  TXMLSemData = class(TXMLNode, IXMLSemData)
  protected
    { IXMLSemData }
    function Get_TpPer: WideString;
    procedure Set_TpPer(Value: WideString);
  end;

{ TXMLComData }

  TXMLComData = class(TXMLNode, IXMLComData)
  protected
    { IXMLComData }
    function Get_TpPer: WideString;
    function Get_DProg: WideString;
    procedure Set_TpPer(Value: WideString);
    procedure Set_DProg(Value: WideString);
  end;

{ TXMLNoPeriodo }

  TXMLNoPeriodo = class(TXMLNode, IXMLNoPeriodo)
  protected
    { IXMLNoPeriodo }
    function Get_TpPer: WideString;
    function Get_DIni: WideString;
    function Get_DFim: WideString;
    procedure Set_TpPer(Value: WideString);
    procedure Set_DIni(Value: WideString);
    procedure Set_DFim(Value: WideString);
  end;

{ TXMLSemHora }

  TXMLSemHora = class(TXMLNode, IXMLSemHora)
  protected
    { IXMLSemHora }
    function Get_TpHor: WideString;
    procedure Set_TpHor(Value: WideString);
  end;

{ TXMLComHora }

  TXMLComHora = class(TXMLNode, IXMLComHora)
  protected
    { IXMLComHora }
    function Get_TpHor: WideString;
    function Get_HProg: WideString;
    procedure Set_TpHor(Value: WideString);
    procedure Set_HProg(Value: WideString);
  end;

{ TXMLNoInter }

  TXMLNoInter = class(TXMLNode, IXMLNoInter)
  protected
    { IXMLNoInter }
    function Get_TpHor: WideString;
    function Get_HIni: WideString;
    function Get_HFim: WideString;
    procedure Set_TpHor(Value: WideString);
    procedure Set_HIni(Value: WideString);
    procedure Set_HFim(Value: WideString);
  end;

{ TXMLObsCont }

  TXMLObsCont = class(TXMLNode, IXMLObsCont)
  protected
    { IXMLObsCont }
    function Get_XCampo: WideString;
    function Get_XTexto: WideString;
    procedure Set_XCampo(Value: WideString);
    procedure Set_XTexto(Value: WideString);
  end;

{ TXMLObsFisco }

  TXMLObsFisco = class(TXMLNode, IXMLObsFisco)
  protected
    { IXMLObsFisco }
    function Get_XCampo: WideString;
    function Get_XTexto: WideString;
    procedure Set_XCampo(Value: WideString);
    procedure Set_XTexto(Value: WideString);
  end;

{ TXMLEmit }

  TXMLEmit = class(TXMLNode, IXMLEmit)
  protected
    { IXMLEmit }
    function Get_CNPJ: WideString;
    function Get_IE: WideString;
    function Get_XNome: WideString;
    function Get_XFant: WideString;
    function Get_EnderEmit: IXMLTEndeEmi;
    procedure Set_CNPJ(Value: WideString);
    procedure Set_IE(Value: WideString);
    procedure Set_XNome(Value: WideString);
    procedure Set_XFant(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTEndeEmi }

  TXMLTEndeEmi = class(TXMLNode, IXMLTEndeEmi)
  protected
    { IXMLTEndeEmi }
    function Get_XLgr: WideString;
    function Get_Nro: WideString;
    function Get_XCpl: WideString;
    function Get_XBairro: WideString;
    function Get_CMun: WideString;
    function Get_XMun: WideString;
    function Get_CEP: WideString;
    function Get_UF: WideString;
    function Get_Fone: WideString;
    procedure Set_XLgr(Value: WideString);
    procedure Set_Nro(Value: WideString);
    procedure Set_XCpl(Value: WideString);
    procedure Set_XBairro(Value: WideString);
    procedure Set_CMun(Value: WideString);
    procedure Set_XMun(Value: WideString);
    procedure Set_CEP(Value: WideString);
    procedure Set_UF(Value: WideString);
    procedure Set_Fone(Value: WideString);
  end;

{ TXMLRem }

  TXMLRem = class(TXMLNode, IXMLRem)
  protected
    { IXMLRem }
    function Get_CNPJ: WideString;
    function Get_CPF: WideString;
    function Get_IE: WideString;
    function Get_XNome: WideString;
    function Get_XFant: WideString;
    function Get_Fone: WideString;
    function Get_EnderReme: IXMLTEndereco;
    function Get_Email: WideString;
    procedure Set_CNPJ(Value: WideString);
    procedure Set_CPF(Value: WideString);
    procedure Set_IE(Value: WideString);
    procedure Set_XNome(Value: WideString);
    procedure Set_XFant(Value: WideString);
    procedure Set_Fone(Value: WideString);
    procedure Set_Email(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLExped }

  TXMLExped = class(TXMLNode, IXMLExped)
  protected
    { IXMLExped }
    function Get_CNPJ: WideString;
    function Get_CPF: WideString;
    function Get_IE: WideString;
    function Get_XNome: WideString;
    function Get_Fone: WideString;
    function Get_EnderExped: IXMLTEndereco;
    function Get_Email: WideString;
    procedure Set_CNPJ(Value: WideString);
    procedure Set_CPF(Value: WideString);
    procedure Set_IE(Value: WideString);
    procedure Set_XNome(Value: WideString);
    procedure Set_Fone(Value: WideString);
    procedure Set_Email(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLReceb }

  TXMLReceb = class(TXMLNode, IXMLReceb)
  protected
    { IXMLReceb }
    function Get_CNPJ: WideString;
    function Get_CPF: WideString;
    function Get_IE: WideString;
    function Get_XNome: WideString;
    function Get_Fone: WideString;
    function Get_EnderReceb: IXMLTEndereco;
    function Get_Email: WideString;
    procedure Set_CNPJ(Value: WideString);
    procedure Set_CPF(Value: WideString);
    procedure Set_IE(Value: WideString);
    procedure Set_XNome(Value: WideString);
    procedure Set_Fone(Value: WideString);
    procedure Set_Email(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDest }

  TXMLDest = class(TXMLNode, IXMLDest)
  protected
    { IXMLDest }
    function Get_CNPJ: WideString;
    function Get_CPF: WideString;
    function Get_IE: WideString;
    function Get_XNome: WideString;
    function Get_Fone: WideString;
    function Get_ISUF: WideString;
    function Get_EnderDest: IXMLTEndereco;
    function Get_Email: WideString;
    procedure Set_CNPJ(Value: WideString);
    procedure Set_CPF(Value: WideString);
    procedure Set_IE(Value: WideString);
    procedure Set_XNome(Value: WideString);
    procedure Set_Fone(Value: WideString);
    procedure Set_ISUF(Value: WideString);
    procedure Set_Email(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLVPrest }

  TXMLVPrest = class(TXMLNode, IXMLVPrest)
  private
    FComp: IXMLCompList;
  protected
    { IXMLVPrest }
    function Get_VTPrest: WideString;
    function Get_VRec: WideString;
    function Get_Comp: IXMLCompList;
    procedure Set_VTPrest(Value: WideString);
    procedure Set_VRec(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLComp }

  TXMLComp = class(TXMLNode, IXMLComp)
  protected
    { IXMLComp }
    function Get_XNome: WideString;
    function Get_VComp: WideString;
    procedure Set_XNome(Value: WideString);
    procedure Set_VComp(Value: WideString);
  end;

{ TXMLCompList }

  TXMLCompList = class(TXMLNodeCollection, IXMLCompList)
  protected
    { IXMLCompList }
    function Add: IXMLComp;
    function Insert(const Index: Integer): IXMLComp;
    function Get_Item(Index: Integer): IXMLComp;
  end;

{ TXMLImp }

  TXMLImp = class(TXMLNode, IXMLImp)
  protected
    { IXMLImp }
    function Get_ICMS: IXMLTImp;
    function Get_VTotTrib: WideString;
    function Get_InfAdFisco: WideString;
    function Get_ICMSUFFim: IXMLICMSUFFim;
    procedure Set_VTotTrib(Value: WideString);
    procedure Set_InfAdFisco(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTImp }

  TXMLTImp = class(TXMLNode, IXMLTImp)
  protected
    { IXMLTImp }
    function Get_ICMS00: IXMLICMS00;
    function Get_ICMS20: IXMLICMS20;
    function Get_ICMS45: IXMLICMS45;
    function Get_ICMS60: IXMLICMS60;
    function Get_ICMS90: IXMLICMS90;
    function Get_ICMSOutraUF: IXMLICMSOutraUF;
    function Get_ICMSSN: IXMLICMSSN;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLICMS00 }

  TXMLICMS00 = class(TXMLNode, IXMLICMS00)
  protected
    { IXMLICMS00 }
    function Get_CST: WideString;
    function Get_VBC: WideString;
    function Get_PICMS: WideString;
    function Get_VICMS: WideString;
    procedure Set_CST(Value: WideString);
    procedure Set_VBC(Value: WideString);
    procedure Set_PICMS(Value: WideString);
    procedure Set_VICMS(Value: WideString);
  end;

{ TXMLICMS20 }

  TXMLICMS20 = class(TXMLNode, IXMLICMS20)
  protected
    { IXMLICMS20 }
    function Get_CST: WideString;
    function Get_PRedBC: WideString;
    function Get_VBC: WideString;
    function Get_PICMS: WideString;
    function Get_VICMS: WideString;
    procedure Set_CST(Value: WideString);
    procedure Set_PRedBC(Value: WideString);
    procedure Set_VBC(Value: WideString);
    procedure Set_PICMS(Value: WideString);
    procedure Set_VICMS(Value: WideString);
  end;

{ TXMLICMS45 }

  TXMLICMS45 = class(TXMLNode, IXMLICMS45)
  protected
    { IXMLICMS45 }
    function Get_CST: WideString;
    procedure Set_CST(Value: WideString);
  end;

{ TXMLICMS60 }

  TXMLICMS60 = class(TXMLNode, IXMLICMS60)
  protected
    { IXMLICMS60 }
    function Get_CST: WideString;
    function Get_VBCSTRet: WideString;
    function Get_VICMSSTRet: WideString;
    function Get_PICMSSTRet: WideString;
    function Get_VCred: WideString;
    procedure Set_CST(Value: WideString);
    procedure Set_VBCSTRet(Value: WideString);
    procedure Set_VICMSSTRet(Value: WideString);
    procedure Set_PICMSSTRet(Value: WideString);
    procedure Set_VCred(Value: WideString);
  end;

{ TXMLICMS90 }

  TXMLICMS90 = class(TXMLNode, IXMLICMS90)
  protected
    { IXMLICMS90 }
    function Get_CST: WideString;
    function Get_PRedBC: WideString;
    function Get_VBC: WideString;
    function Get_PICMS: WideString;
    function Get_VICMS: WideString;
    function Get_VCred: WideString;
    procedure Set_CST(Value: WideString);
    procedure Set_PRedBC(Value: WideString);
    procedure Set_VBC(Value: WideString);
    procedure Set_PICMS(Value: WideString);
    procedure Set_VICMS(Value: WideString);
    procedure Set_VCred(Value: WideString);
  end;

{ TXMLICMSOutraUF }

  TXMLICMSOutraUF = class(TXMLNode, IXMLICMSOutraUF)
  protected
    { IXMLICMSOutraUF }
    function Get_CST: WideString;
    function Get_PRedBCOutraUF: WideString;
    function Get_VBCOutraUF: WideString;
    function Get_PICMSOutraUF: WideString;
    function Get_VICMSOutraUF: WideString;
    procedure Set_CST(Value: WideString);
    procedure Set_PRedBCOutraUF(Value: WideString);
    procedure Set_VBCOutraUF(Value: WideString);
    procedure Set_PICMSOutraUF(Value: WideString);
    procedure Set_VICMSOutraUF(Value: WideString);
  end;

{ TXMLICMSSN }

  TXMLICMSSN = class(TXMLNode, IXMLICMSSN)
  protected
    { IXMLICMSSN }
    function Get_IndSN: WideString;
    procedure Set_IndSN(Value: WideString);
  end;

{ TXMLICMSUFFim }

  TXMLICMSUFFim = class(TXMLNode, IXMLICMSUFFim)
  protected
    { IXMLICMSUFFim }
    function Get_VBCUFFim: WideString;
    function Get_PFCPUFFim: WideString;
    function Get_PICMSUFFim: WideString;
    function Get_PICMSInter: WideString;
    function Get_PICMSInterPart: WideString;
    function Get_VFCPUFFim: WideString;
    function Get_VICMSUFFim: WideString;
    function Get_VICMSUFIni: WideString;
    procedure Set_VBCUFFim(Value: WideString);
    procedure Set_PFCPUFFim(Value: WideString);
    procedure Set_PICMSUFFim(Value: WideString);
    procedure Set_PICMSInter(Value: WideString);
    procedure Set_PICMSInterPart(Value: WideString);
    procedure Set_VFCPUFFim(Value: WideString);
    procedure Set_VICMSUFFim(Value: WideString);
    procedure Set_VICMSUFIni(Value: WideString);
  end;

{ TXMLInfCTeNorm }

  TXMLInfCTeNorm = class(TXMLNode, IXMLInfCTeNorm)
  private
    FSeg: IXMLSegList;
    FPeri: IXMLPeriList;
    FVeicNovos: IXMLVeicNovosList;
  protected
    { IXMLInfCTeNorm }
    function Get_InfCarga: IXMLInfCarga;
    function Get_InfDoc: IXMLInfDoc;
    function Get_DocAnt: IXMLDocAnt;
    function Get_Seg: IXMLSegList;
    function Get_InfModal: IXMLInfModal;
    function Get_Peri: IXMLPeriList;
    function Get_VeicNovos: IXMLVeicNovosList;
    function Get_Cobr: IXMLCobr;
    function Get_InfCteSub: IXMLInfCteSub;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLInfCarga }

  TXMLInfCarga = class(TXMLNode, IXMLInfCarga)
  private
    FInfQ: IXMLInfQList;
  protected
    { IXMLInfCarga }
    function Get_VCarga: WideString;
    function Get_ProPred: WideString;
    function Get_XOutCat: WideString;
    function Get_InfQ: IXMLInfQList;
    procedure Set_VCarga(Value: WideString);
    procedure Set_ProPred(Value: WideString);
    procedure Set_XOutCat(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLInfQ }

  TXMLInfQ = class(TXMLNode, IXMLInfQ)
  protected
    { IXMLInfQ }
    function Get_CUnid: WideString;
    function Get_TpMed: WideString;
    function Get_QCarga: WideString;
    procedure Set_CUnid(Value: WideString);
    procedure Set_TpMed(Value: WideString);
    procedure Set_QCarga(Value: WideString);
  end;

{ TXMLInfQList }

  TXMLInfQList = class(TXMLNodeCollection, IXMLInfQList)
  protected
    { IXMLInfQList }
    function Add: IXMLInfQ;
    function Insert(const Index: Integer): IXMLInfQ;
    function Get_Item(Index: Integer): IXMLInfQ;
  end;

{ TXMLInfDoc }

  TXMLInfDoc = class(TXMLNode, IXMLInfDoc)
  private
    FInfNF: IXMLInfNFList;
    FInfNFe: IXMLInfNFeList;
    FInfOutros: IXMLInfOutrosList;
  protected
    { IXMLInfDoc }
    function Get_InfNF: IXMLInfNFList;
    function Get_InfNFe: IXMLInfNFeList;
    function Get_InfOutros: IXMLInfOutrosList;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLInfNF }

  TXMLInfNF = class(TXMLNode, IXMLInfNF)
  private
    FInfUnidTransp: IXMLTUnidadeTranspList;
    FInfUnidCarga: IXMLTUnidCargaList;
  protected
    { IXMLInfNF }
    function Get_NRoma: WideString;
    function Get_NPed: WideString;
    function Get_Mod_: WideString;
    function Get_Serie: WideString;
    function Get_NDoc: WideString;
    function Get_DEmi: WideString;
    function Get_VBC: WideString;
    function Get_VICMS: WideString;
    function Get_VBCST: WideString;
    function Get_VST: WideString;
    function Get_VProd: WideString;
    function Get_VNF: WideString;
    function Get_NCFOP: WideString;
    function Get_NPeso: WideString;
    function Get_PIN: WideString;
    function Get_DPrev: WideString;
    function Get_InfUnidTransp: IXMLTUnidadeTranspList;
    function Get_InfUnidCarga: IXMLTUnidCargaList;
    procedure Set_NRoma(Value: WideString);
    procedure Set_NPed(Value: WideString);
    procedure Set_Mod_(Value: WideString);
    procedure Set_Serie(Value: WideString);
    procedure Set_NDoc(Value: WideString);
    procedure Set_DEmi(Value: WideString);
    procedure Set_VBC(Value: WideString);
    procedure Set_VICMS(Value: WideString);
    procedure Set_VBCST(Value: WideString);
    procedure Set_VST(Value: WideString);
    procedure Set_VProd(Value: WideString);
    procedure Set_VNF(Value: WideString);
    procedure Set_NCFOP(Value: WideString);
    procedure Set_NPeso(Value: WideString);
    procedure Set_PIN(Value: WideString);
    procedure Set_DPrev(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLInfNFList }

  TXMLInfNFList = class(TXMLNodeCollection, IXMLInfNFList)
  protected
    { IXMLInfNFList }
    function Add: IXMLInfNF;
    function Insert(const Index: Integer): IXMLInfNF;
    function Get_Item(Index: Integer): IXMLInfNF;
  end;

{ TXMLTUnidadeTransp }

  TXMLTUnidadeTransp = class(TXMLNode, IXMLTUnidadeTransp)
  private
    FLacUnidTransp: IXMLLacUnidTranspList;
    FInfUnidCarga: IXMLTUnidCargaList;
  protected
    { IXMLTUnidadeTransp }
    function Get_TpUnidTransp: WideString;
    function Get_IdUnidTransp: WideString;
    function Get_LacUnidTransp: IXMLLacUnidTranspList;
    function Get_InfUnidCarga: IXMLTUnidCargaList;
    function Get_QtdRat: WideString;
    procedure Set_TpUnidTransp(Value: WideString);
    procedure Set_IdUnidTransp(Value: WideString);
    procedure Set_QtdRat(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTUnidadeTranspList }

  TXMLTUnidadeTranspList = class(TXMLNodeCollection, IXMLTUnidadeTranspList)
  protected
    { IXMLTUnidadeTranspList }
    function Add: IXMLTUnidadeTransp;
    function Insert(const Index: Integer): IXMLTUnidadeTransp;
    function Get_Item(Index: Integer): IXMLTUnidadeTransp;
  end;

{ TXMLLacUnidTransp }

  TXMLLacUnidTransp = class(TXMLNode, IXMLLacUnidTransp)
  protected
    { IXMLLacUnidTransp }
    function Get_NLacre: WideString;
    procedure Set_NLacre(Value: WideString);
  end;

{ TXMLLacUnidTranspList }

  TXMLLacUnidTranspList = class(TXMLNodeCollection, IXMLLacUnidTranspList)
  protected
    { IXMLLacUnidTranspList }
    function Add: IXMLLacUnidTransp;
    function Insert(const Index: Integer): IXMLLacUnidTransp;
    function Get_Item(Index: Integer): IXMLLacUnidTransp;
  end;

{ TXMLTUnidCarga }

  TXMLTUnidCarga = class(TXMLNode, IXMLTUnidCarga)
  private
    FLacUnidCarga: IXMLLacUnidCargaList;
  protected
    { IXMLTUnidCarga }
    function Get_TpUnidCarga: WideString;
    function Get_IdUnidCarga: WideString;
    function Get_LacUnidCarga: IXMLLacUnidCargaList;
    function Get_QtdRat: WideString;
    procedure Set_TpUnidCarga(Value: WideString);
    procedure Set_IdUnidCarga(Value: WideString);
    procedure Set_QtdRat(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTUnidCargaList }

  TXMLTUnidCargaList = class(TXMLNodeCollection, IXMLTUnidCargaList)
  protected
    { IXMLTUnidCargaList }
    function Add: IXMLTUnidCarga;
    function Insert(const Index: Integer): IXMLTUnidCarga;
    function Get_Item(Index: Integer): IXMLTUnidCarga;
  end;

{ TXMLLacUnidCarga }

  TXMLLacUnidCarga = class(TXMLNode, IXMLLacUnidCarga)
  protected
    { IXMLLacUnidCarga }
    function Get_NLacre: WideString;
    procedure Set_NLacre(Value: WideString);
  end;

{ TXMLLacUnidCargaList }

  TXMLLacUnidCargaList = class(TXMLNodeCollection, IXMLLacUnidCargaList)
  protected
    { IXMLLacUnidCargaList }
    function Add: IXMLLacUnidCarga;
    function Insert(const Index: Integer): IXMLLacUnidCarga;
    function Get_Item(Index: Integer): IXMLLacUnidCarga;
  end;

{ TXMLInfNFe }

  TXMLInfNFe = class(TXMLNode, IXMLInfNFe)
  private
    FInfUnidTransp: IXMLTUnidadeTranspList;
    FInfUnidCarga: IXMLTUnidCargaList;
  protected
    { IXMLInfNFe }
    function Get_Chave: WideString;
    function Get_PIN: WideString;
    function Get_DPrev: WideString;
    function Get_InfUnidTransp: IXMLTUnidadeTranspList;
    function Get_InfUnidCarga: IXMLTUnidCargaList;
    procedure Set_Chave(Value: WideString);
    procedure Set_PIN(Value: WideString);
    procedure Set_DPrev(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLInfNFeList }

  TXMLInfNFeList = class(TXMLNodeCollection, IXMLInfNFeList)
  protected
    { IXMLInfNFeList }
    function Add: IXMLInfNFe;
    function Insert(const Index: Integer): IXMLInfNFe;
    function Get_Item(Index: Integer): IXMLInfNFe;
  end;

{ TXMLInfOutros }

  TXMLInfOutros = class(TXMLNode, IXMLInfOutros)
  private
    FInfUnidTransp: IXMLTUnidadeTranspList;
    FInfUnidCarga: IXMLTUnidCargaList;
  protected
    { IXMLInfOutros }
    function Get_TpDoc: WideString;
    function Get_DescOutros: WideString;
    function Get_NDoc: WideString;
    function Get_DEmi: WideString;
    function Get_VDocFisc: WideString;
    function Get_DPrev: WideString;
    function Get_InfUnidTransp: IXMLTUnidadeTranspList;
    function Get_InfUnidCarga: IXMLTUnidCargaList;
    procedure Set_TpDoc(Value: WideString);
    procedure Set_DescOutros(Value: WideString);
    procedure Set_NDoc(Value: WideString);
    procedure Set_DEmi(Value: WideString);
    procedure Set_VDocFisc(Value: WideString);
    procedure Set_DPrev(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLInfOutrosList }

  TXMLInfOutrosList = class(TXMLNodeCollection, IXMLInfOutrosList)
  protected
    { IXMLInfOutrosList }
    function Add: IXMLInfOutros;
    function Insert(const Index: Integer): IXMLInfOutros;
    function Get_Item(Index: Integer): IXMLInfOutros;
  end;

{ TXMLDocAnt }

  TXMLDocAnt = class(TXMLNodeCollection, IXMLDocAnt)
  protected
    { IXMLDocAnt }
    function Get_EmiDocAnt(Index: Integer): IXMLEmiDocAnt;
    function Add: IXMLEmiDocAnt;
    function Insert(const Index: Integer): IXMLEmiDocAnt;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLEmiDocAnt }

  TXMLEmiDocAnt = class(TXMLNode, IXMLEmiDocAnt)
  private
    FIdDocAnt: IXMLIdDocAntList;
  protected
    { IXMLEmiDocAnt }
    function Get_CNPJ: WideString;
    function Get_CPF: WideString;
    function Get_IE: WideString;
    function Get_UF: WideString;
    function Get_XNome: WideString;
    function Get_IdDocAnt: IXMLIdDocAntList;
    procedure Set_CNPJ(Value: WideString);
    procedure Set_CPF(Value: WideString);
    procedure Set_IE(Value: WideString);
    procedure Set_UF(Value: WideString);
    procedure Set_XNome(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLIdDocAnt }

  TXMLIdDocAnt = class(TXMLNode, IXMLIdDocAnt)
  private
    FIdDocAntPap: IXMLIdDocAntPapList;
    FIdDocAntEle: IXMLIdDocAntEleList;
  protected
    { IXMLIdDocAnt }
    function Get_IdDocAntPap: IXMLIdDocAntPapList;
    function Get_IdDocAntEle: IXMLIdDocAntEleList;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLIdDocAntList }

  TXMLIdDocAntList = class(TXMLNodeCollection, IXMLIdDocAntList)
  protected
    { IXMLIdDocAntList }
    function Add: IXMLIdDocAnt;
    function Insert(const Index: Integer): IXMLIdDocAnt;
    function Get_Item(Index: Integer): IXMLIdDocAnt;
  end;

{ TXMLIdDocAntPap }

  TXMLIdDocAntPap = class(TXMLNode, IXMLIdDocAntPap)
  protected
    { IXMLIdDocAntPap }
    function Get_TpDoc: WideString;
    function Get_Serie: WideString;
    function Get_Subser: WideString;
    function Get_NDoc: WideString;
    function Get_DEmi: WideString;
    procedure Set_TpDoc(Value: WideString);
    procedure Set_Serie(Value: WideString);
    procedure Set_Subser(Value: WideString);
    procedure Set_NDoc(Value: WideString);
    procedure Set_DEmi(Value: WideString);
  end;

{ TXMLIdDocAntPapList }

  TXMLIdDocAntPapList = class(TXMLNodeCollection, IXMLIdDocAntPapList)
  protected
    { IXMLIdDocAntPapList }
    function Add: IXMLIdDocAntPap;
    function Insert(const Index: Integer): IXMLIdDocAntPap;
    function Get_Item(Index: Integer): IXMLIdDocAntPap;
  end;

{ TXMLIdDocAntEle }

  TXMLIdDocAntEle = class(TXMLNode, IXMLIdDocAntEle)
  protected
    { IXMLIdDocAntEle }
    function Get_Chave: WideString;
    procedure Set_Chave(Value: WideString);
  end;

{ TXMLIdDocAntEleList }

  TXMLIdDocAntEleList = class(TXMLNodeCollection, IXMLIdDocAntEleList)
  protected
    { IXMLIdDocAntEleList }
    function Add: IXMLIdDocAntEle;
    function Insert(const Index: Integer): IXMLIdDocAntEle;
    function Get_Item(Index: Integer): IXMLIdDocAntEle;
  end;

{ TXMLSeg }

  TXMLSeg = class(TXMLNode, IXMLSeg)
  protected
    { IXMLSeg }
    function Get_RespSeg: WideString;
    function Get_XSeg: WideString;
    function Get_NApol: WideString;
    function Get_NAver: WideString;
    function Get_VCarga: WideString;
    procedure Set_RespSeg(Value: WideString);
    procedure Set_XSeg(Value: WideString);
    procedure Set_NApol(Value: WideString);
    procedure Set_NAver(Value: WideString);
    procedure Set_VCarga(Value: WideString);
  end;

{ TXMLSegList }

  TXMLSegList = class(TXMLNodeCollection, IXMLSegList)
  protected
    { IXMLSegList }
    function Add: IXMLSeg;
    function Insert(const Index: Integer): IXMLSeg;
    function Get_Item(Index: Integer): IXMLSeg;
  end;

{ TXMLInfModal }

  TXMLInfModal = class(TXMLNode, IXMLInfModal)
  protected
    { IXMLInfModal }
    function Get_VersaoModal: WideString;
    procedure Set_VersaoModal(Value: WideString);
  end;

{ TXMLPeri }

  TXMLPeri = class(TXMLNode, IXMLPeri)
  protected
    { IXMLPeri }
    function Get_NONU: WideString;
    function Get_XNomeAE: WideString;
    function Get_XClaRisco: WideString;
    function Get_GrEmb: WideString;
    function Get_QTotProd: WideString;
    function Get_QVolTipo: WideString;
    function Get_PontoFulgor: WideString;
    procedure Set_NONU(Value: WideString);
    procedure Set_XNomeAE(Value: WideString);
    procedure Set_XClaRisco(Value: WideString);
    procedure Set_GrEmb(Value: WideString);
    procedure Set_QTotProd(Value: WideString);
    procedure Set_QVolTipo(Value: WideString);
    procedure Set_PontoFulgor(Value: WideString);
  end;

{ TXMLPeriList }

  TXMLPeriList = class(TXMLNodeCollection, IXMLPeriList)
  protected
    { IXMLPeriList }
    function Add: IXMLPeri;
    function Insert(const Index: Integer): IXMLPeri;
    function Get_Item(Index: Integer): IXMLPeri;
  end;

{ TXMLVeicNovos }

  TXMLVeicNovos = class(TXMLNode, IXMLVeicNovos)
  protected
    { IXMLVeicNovos }
    function Get_Chassi: WideString;
    function Get_CCor: WideString;
    function Get_XCor: WideString;
    function Get_CMod: WideString;
    function Get_VUnit: WideString;
    function Get_VFrete: WideString;
    procedure Set_Chassi(Value: WideString);
    procedure Set_CCor(Value: WideString);
    procedure Set_XCor(Value: WideString);
    procedure Set_CMod(Value: WideString);
    procedure Set_VUnit(Value: WideString);
    procedure Set_VFrete(Value: WideString);
  end;

{ TXMLVeicNovosList }

  TXMLVeicNovosList = class(TXMLNodeCollection, IXMLVeicNovosList)
  protected
    { IXMLVeicNovosList }
    function Add: IXMLVeicNovos;
    function Insert(const Index: Integer): IXMLVeicNovos;
    function Get_Item(Index: Integer): IXMLVeicNovos;
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
    function Get_NFat: WideString;
    function Get_VOrig: WideString;
    function Get_VDesc: WideString;
    function Get_VLiq: WideString;
    procedure Set_NFat(Value: WideString);
    procedure Set_VOrig(Value: WideString);
    procedure Set_VDesc(Value: WideString);
    procedure Set_VLiq(Value: WideString);
  end;

{ TXMLDup }

  TXMLDup = class(TXMLNode, IXMLDup)
  protected
    { IXMLDup }
    function Get_NDup: WideString;
    function Get_DVenc: WideString;
    function Get_VDup: WideString;
    procedure Set_NDup(Value: WideString);
    procedure Set_DVenc(Value: WideString);
    procedure Set_VDup(Value: WideString);
  end;

{ TXMLDupList }

  TXMLDupList = class(TXMLNodeCollection, IXMLDupList)
  protected
    { IXMLDupList }
    function Add: IXMLDup;
    function Insert(const Index: Integer): IXMLDup;
    function Get_Item(Index: Integer): IXMLDup;
  end;

{ TXMLInfCteSub }

  TXMLInfCteSub = class(TXMLNode, IXMLInfCteSub)
  protected
    { IXMLInfCteSub }
    function Get_ChCte: WideString;
    function Get_TomaICMS: IXMLTomaICMS;
    function Get_TomaNaoICMS: IXMLTomaNaoICMS;
    procedure Set_ChCte(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTomaICMS }

  TXMLTomaICMS = class(TXMLNode, IXMLTomaICMS)
  protected
    { IXMLTomaICMS }
    function Get_RefNFe: WideString;
    function Get_RefNF: IXMLRefNF;
    function Get_RefCte: WideString;
    procedure Set_RefNFe(Value: WideString);
    procedure Set_RefCte(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLRefNF }

  TXMLRefNF = class(TXMLNode, IXMLRefNF)
  protected
    { IXMLRefNF }
    function Get_CNPJ: WideString;
    function Get_CPF: WideString;
    function Get_Mod_: WideString;
    function Get_Serie: WideString;
    function Get_Subserie: WideString;
    function Get_Nro: WideString;
    function Get_Valor: WideString;
    function Get_DEmi: WideString;
    procedure Set_CNPJ(Value: WideString);
    procedure Set_CPF(Value: WideString);
    procedure Set_Mod_(Value: WideString);
    procedure Set_Serie(Value: WideString);
    procedure Set_Subserie(Value: WideString);
    procedure Set_Nro(Value: WideString);
    procedure Set_Valor(Value: WideString);
    procedure Set_DEmi(Value: WideString);
  end;

{ TXMLTomaNaoICMS }

  TXMLTomaNaoICMS = class(TXMLNode, IXMLTomaNaoICMS)
  protected
    { IXMLTomaNaoICMS }
    function Get_RefCteAnu: WideString;
    procedure Set_RefCteAnu(Value: WideString);
  end;

{ TXMLInfCteComp }

  TXMLInfCteComp = class(TXMLNode, IXMLInfCteComp)
  protected
    { IXMLInfCteComp }
    function Get_Chave: WideString;
    procedure Set_Chave(Value: WideString);
  end;

{ TXMLInfCteAnu }

  TXMLInfCteAnu = class(TXMLNode, IXMLInfCteAnu)
  protected
    { IXMLInfCteAnu }
    function Get_ChCte: WideString;
    function Get_DEmi: WideString;
    procedure Set_ChCte(Value: WideString);
    procedure Set_DEmi(Value: WideString);
  end;

{ TXMLAutXML }

  TXMLAutXML = class(TXMLNode, IXMLAutXML)
  protected
    { IXMLAutXML }
    function Get_CNPJ: WideString;
    function Get_CPF: WideString;
    procedure Set_CNPJ(Value: WideString);
    procedure Set_CPF(Value: WideString);
  end;

{ TXMLSignatureType }

  TXMLSignatureType = class(TXMLNode, IXMLSignatureType)
  protected
    { IXMLSignatureType }
    function Get_Id: WideString;
    function Get_SignedInfo: IXMLSignedInfoType;
    function Get_SignatureValue: IXMLSignatureValueType;
    function Get_KeyInfo: IXMLKeyInfoType;
    procedure Set_Id(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLSignedInfoType }

  TXMLSignedInfoType = class(TXMLNode, IXMLSignedInfoType)
  protected
    { IXMLSignedInfoType }
    function Get_Id: WideString;
    function Get_CanonicalizationMethod: IXMLCanonicalizationMethod;
    function Get_SignatureMethod: IXMLSignatureMethod;
    function Get_Reference: IXMLReferenceType;
    procedure Set_Id(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLCanonicalizationMethod }

  TXMLCanonicalizationMethod = class(TXMLNode, IXMLCanonicalizationMethod)
  protected
    { IXMLCanonicalizationMethod }
    function Get_Algorithm: WideString;
    procedure Set_Algorithm(Value: WideString);
  end;

{ TXMLSignatureMethod }

  TXMLSignatureMethod = class(TXMLNode, IXMLSignatureMethod)
  protected
    { IXMLSignatureMethod }
    function Get_Algorithm: WideString;
    procedure Set_Algorithm(Value: WideString);
  end;

{ TXMLReferenceType }

  TXMLReferenceType = class(TXMLNode, IXMLReferenceType)
  protected
    { IXMLReferenceType }
    function Get_Id: WideString;
    function Get_URI: WideString;
    function Get_Type_: WideString;
    function Get_Transforms: IXMLTransformsType;
    function Get_DigestMethod: IXMLDigestMethod;
    function Get_DigestValue: WideString;
    procedure Set_Id(Value: WideString);
    procedure Set_URI(Value: WideString);
    procedure Set_Type_(Value: WideString);
    procedure Set_DigestValue(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTransformsType }

  TXMLTransformsType = class(TXMLNodeCollection, IXMLTransformsType)
  protected
    { IXMLTransformsType }
    function Get_Transform(Index: Integer): IXMLTransformType;
    function Add: IXMLTransformType;
    function Insert(const Index: Integer): IXMLTransformType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTransformType }

  TXMLTransformType = class(TXMLNodeCollection, IXMLTransformType)
  protected
    { IXMLTransformType }
    function Get_Algorithm: WideString;
    function Get_XPath(Index: Integer): WideString;
    procedure Set_Algorithm(Value: WideString);
    function Add(const XPath: WideString): IXMLNode;
    function Insert(const Index: Integer; const XPath: WideString): IXMLNode;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDigestMethod }

  TXMLDigestMethod = class(TXMLNode, IXMLDigestMethod)
  protected
    { IXMLDigestMethod }
    function Get_Algorithm: WideString;
    procedure Set_Algorithm(Value: WideString);
  end;

{ TXMLSignatureValueType }

  TXMLSignatureValueType = class(TXMLNode, IXMLSignatureValueType)
  protected
    { IXMLSignatureValueType }
    function Get_Id: WideString;
    procedure Set_Id(Value: WideString);
  end;

{ TXMLKeyInfoType }

  TXMLKeyInfoType = class(TXMLNode, IXMLKeyInfoType)
  protected
    { IXMLKeyInfoType }
    function Get_Id: WideString;
    function Get_X509Data: IXMLX509DataType;
    procedure Set_Id(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLX509DataType }

  TXMLX509DataType = class(TXMLNode, IXMLX509DataType)
  protected
    { IXMLX509DataType }
    function Get_X509Certificate: WideString;
    procedure Set_X509Certificate(Value: WideString);
  end;

{ TXMLTProtCTe }

  TXMLTProtCTe = class(TXMLNode, IXMLTProtCTe)
  protected
    { IXMLTProtCTe }
    function Get_Versao: WideString;
    function Get_InfProt: IXMLInfProt;
    procedure Set_Versao(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLInfProt }

  TXMLInfProt = class(TXMLNode, IXMLInfProt)
  protected
    { IXMLInfProt }
    function Get_Id: WideString;
    function Get_TpAmb: WideString;
    function Get_VerAplic: WideString;
    function Get_ChCTe: WideString;
    function Get_DhRecbto: WideString;
    function Get_NProt: WideString;
    function Get_DigVal: WideString;
    function Get_CStat: WideString;
    function Get_XMotivo: WideString;
    procedure Set_Id(Value: WideString);
    procedure Set_TpAmb(Value: WideString);
    procedure Set_VerAplic(Value: WideString);
    procedure Set_ChCTe(Value: WideString);
    procedure Set_DhRecbto(Value: WideString);
    procedure Set_NProt(Value: WideString);
    procedure Set_DigVal(Value: WideString);
    procedure Set_CStat(Value: WideString);
    procedure Set_XMotivo(Value: WideString);
  end;

{ Global Functions }

function GetcteProc(Doc: IXMLDocument): IXMLCteProc;
function LoadcteProc(const FileName: WideString): IXMLCteProc;
function NewcteProc: IXMLCteProc;

const
  TargetNamespace = 'http://www.portalfiscal.inf.br/cte';

implementation

{ Global Functions }

function GetcteProc(Doc: IXMLDocument): IXMLCteProc;
begin
  Result := Doc.GetDocBinding('cteProc', TXMLCteProc, TargetNamespace) as IXMLCteProc;
end;

function LoadcteProc(const FileName: WideString): IXMLCteProc;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('cteProc', TXMLCteProc, TargetNamespace) as IXMLCteProc;
end;

function NewcteProc: IXMLCteProc;
begin
  Result := NewXMLDocument.GetDocBinding('cteProc', TXMLCteProc, TargetNamespace) as IXMLCteProc;
end;

{ TXMLCteProc }

procedure TXMLCteProc.AfterConstruction;
begin
  RegisterChildNode('CTe', TXMLTCTe);
  RegisterChildNode('protCTe', TXMLTProtCTe);
  inherited;
end;

function TXMLCteProc.Get_Versao: WideString;
begin
  Result := AttributeNodes['versao'].Text;
end;

procedure TXMLCteProc.Set_Versao(Value: WideString);
begin
  SetAttribute('versao', Value);
end;

function TXMLCteProc.Get_CTe: IXMLTCTe;
begin
  Result := ChildNodes['CTe'] as IXMLTCTe;
end;

function TXMLCteProc.Get_ProtCTe: IXMLTProtCTe;
begin
  Result := ChildNodes['protCTe'] as IXMLTProtCTe;
end;

{ TXMLTCTe }

procedure TXMLTCTe.AfterConstruction;
begin
  RegisterChildNode('infCte', TXMLInfCte);
  RegisterChildNode('Signature', TXMLSignatureType);
  inherited;
end;

function TXMLTCTe.Get_InfCte: IXMLInfCte;
begin
  Result := ChildNodes['infCte'] as IXMLInfCte;
end;

function TXMLTCTe.Get_Signature: IXMLSignatureType;
begin
  Result := ChildNodes['Signature'] as IXMLSignatureType;
end;

{ TXMLInfCte }

procedure TXMLInfCte.AfterConstruction;
begin
  RegisterChildNode('ide', TXMLIde);
  RegisterChildNode('compl', TXMLCompl);
  RegisterChildNode('emit', TXMLEmit);
  RegisterChildNode('rem', TXMLRem);
  RegisterChildNode('exped', TXMLExped);
  RegisterChildNode('receb', TXMLReceb);
  RegisterChildNode('dest', TXMLDest);
  RegisterChildNode('vPrest', TXMLVPrest);
  RegisterChildNode('imp', TXMLImp);
  RegisterChildNode('infCTeNorm', TXMLInfCTeNorm);
  RegisterChildNode('infCteComp', TXMLInfCteComp);
  RegisterChildNode('infCteAnu', TXMLInfCteAnu);
  RegisterChildNode('autXML', TXMLAutXML);
  inherited;
end;

function TXMLInfCte.Get_Versao: WideString;
begin
  Result := AttributeNodes['versao'].Text;
end;

procedure TXMLInfCte.Set_Versao(Value: WideString);
begin
  SetAttribute('versao', Value);
end;

function TXMLInfCte.Get_Id: WideString;
begin
  Result := AttributeNodes['Id'].Text;
end;

procedure TXMLInfCte.Set_Id(Value: WideString);
begin
  SetAttribute('Id', Value);
end;

function TXMLInfCte.Get_Ide: IXMLIde;
begin
  Result := ChildNodes['ide'] as IXMLIde;
end;

function TXMLInfCte.Get_Compl: IXMLCompl;
begin
  Result := ChildNodes['compl'] as IXMLCompl;
end;

function TXMLInfCte.Get_Emit: IXMLEmit;
begin
  Result := ChildNodes['emit'] as IXMLEmit;
end;

function TXMLInfCte.Get_Rem: IXMLRem;
begin
  Result := ChildNodes['rem'] as IXMLRem;
end;

function TXMLInfCte.Get_Exped: IXMLExped;
begin
  Result := ChildNodes['exped'] as IXMLExped;
end;

function TXMLInfCte.Get_Receb: IXMLReceb;
begin
  Result := ChildNodes['receb'] as IXMLReceb;
end;

function TXMLInfCte.Get_Dest: IXMLDest;
begin
  Result := ChildNodes['dest'] as IXMLDest;
end;

function TXMLInfCte.Get_VPrest: IXMLVPrest;
begin
  Result := ChildNodes['vPrest'] as IXMLVPrest;
end;

function TXMLInfCte.Get_Imp: IXMLImp;
begin
  Result := ChildNodes['imp'] as IXMLImp;
end;

function TXMLInfCte.Get_InfCTeNorm: IXMLInfCTeNorm;
begin
  Result := ChildNodes['infCTeNorm'] as IXMLInfCTeNorm;
end;

function TXMLInfCte.Get_InfCteComp: IXMLInfCteComp;
begin
  Result := ChildNodes['infCteComp'] as IXMLInfCteComp;
end;

function TXMLInfCte.Get_InfCteAnu: IXMLInfCteAnu;
begin
  Result := ChildNodes['infCteAnu'] as IXMLInfCteAnu;
end;

function TXMLInfCte.Get_AutXML: IXMLAutXML;
begin
  Result := ChildNodes['autXML'] as IXMLAutXML;
end;

{ TXMLIde }

procedure TXMLIde.AfterConstruction;
begin
  RegisterChildNode('toma03', TXMLToma03);
  RegisterChildNode('toma4', TXMLToma4);
  inherited;
end;

function TXMLIde.Get_CUF: WideString;
begin
  Result := ChildNodes['cUF'].Text;
end;

procedure TXMLIde.Set_CUF(Value: WideString);
begin
  ChildNodes['cUF'].NodeValue := Value;
end;

function TXMLIde.Get_CCT: WideString;
begin
  Result := ChildNodes['cCT'].Text;
end;

procedure TXMLIde.Set_CCT(Value: WideString);
begin
  ChildNodes['cCT'].NodeValue := Value;
end;

function TXMLIde.Get_CFOP: WideString;
begin
  Result := ChildNodes['CFOP'].Text;
end;

procedure TXMLIde.Set_CFOP(Value: WideString);
begin
  ChildNodes['CFOP'].NodeValue := Value;
end;

function TXMLIde.Get_NatOp: WideString;
begin
  Result := ChildNodes['natOp'].Text;
end;

procedure TXMLIde.Set_NatOp(Value: WideString);
begin
  ChildNodes['natOp'].NodeValue := Value;
end;

function TXMLIde.Get_ForPag: WideString;
begin
  Result := ChildNodes['forPag'].Text;
end;

procedure TXMLIde.Set_ForPag(Value: WideString);
begin
  ChildNodes['forPag'].NodeValue := Value;
end;

function TXMLIde.Get_Mod_: WideString;
begin
  Result := ChildNodes['mod'].Text;
end;

procedure TXMLIde.Set_Mod_(Value: WideString);
begin
  ChildNodes['mod'].NodeValue := Value;
end;

function TXMLIde.Get_Serie: WideString;
begin
  Result := ChildNodes['serie'].Text;
end;

procedure TXMLIde.Set_Serie(Value: WideString);
begin
  ChildNodes['serie'].NodeValue := Value;
end;

function TXMLIde.Get_NCT: WideString;
begin
  Result := ChildNodes['nCT'].Text;
end;

procedure TXMLIde.Set_NCT(Value: WideString);
begin
  ChildNodes['nCT'].NodeValue := Value;
end;

function TXMLIde.Get_DhEmi: WideString;
begin
  Result := ChildNodes['dhEmi'].Text;
end;

procedure TXMLIde.Set_DhEmi(Value: WideString);
begin
  ChildNodes['dhEmi'].NodeValue := Value;
end;

function TXMLIde.Get_TpImp: WideString;
begin
  Result := ChildNodes['tpImp'].Text;
end;

procedure TXMLIde.Set_TpImp(Value: WideString);
begin
  ChildNodes['tpImp'].NodeValue := Value;
end;

function TXMLIde.Get_TpEmis: WideString;
begin
  Result := ChildNodes['tpEmis'].Text;
end;

procedure TXMLIde.Set_TpEmis(Value: WideString);
begin
  ChildNodes['tpEmis'].NodeValue := Value;
end;

function TXMLIde.Get_CDV: WideString;
begin
  Result := ChildNodes['cDV'].Text;
end;

procedure TXMLIde.Set_CDV(Value: WideString);
begin
  ChildNodes['cDV'].NodeValue := Value;
end;

function TXMLIde.Get_TpAmb: WideString;
begin
  Result := ChildNodes['tpAmb'].Text;
end;

procedure TXMLIde.Set_TpAmb(Value: WideString);
begin
  ChildNodes['tpAmb'].NodeValue := Value;
end;

function TXMLIde.Get_TpCTe: WideString;
begin
  Result := ChildNodes['tpCTe'].Text;
end;

procedure TXMLIde.Set_TpCTe(Value: WideString);
begin
  ChildNodes['tpCTe'].NodeValue := Value;
end;

function TXMLIde.Get_ProcEmi: WideString;
begin
  Result := ChildNodes['procEmi'].Text;
end;

procedure TXMLIde.Set_ProcEmi(Value: WideString);
begin
  ChildNodes['procEmi'].NodeValue := Value;
end;

function TXMLIde.Get_VerProc: WideString;
begin
  Result := ChildNodes['verProc'].Text;
end;

procedure TXMLIde.Set_VerProc(Value: WideString);
begin
  ChildNodes['verProc'].NodeValue := Value;
end;

function TXMLIde.Get_RefCTE: WideString;
begin
  Result := ChildNodes['refCTE'].Text;
end;

procedure TXMLIde.Set_RefCTE(Value: WideString);
begin
  ChildNodes['refCTE'].NodeValue := Value;
end;

function TXMLIde.Get_CMunEnv: WideString;
begin
  Result := ChildNodes['cMunEnv'].Text;
end;

procedure TXMLIde.Set_CMunEnv(Value: WideString);
begin
  ChildNodes['cMunEnv'].NodeValue := Value;
end;

function TXMLIde.Get_XMunEnv: WideString;
begin
  Result := ChildNodes['xMunEnv'].Text;
end;

procedure TXMLIde.Set_XMunEnv(Value: WideString);
begin
  ChildNodes['xMunEnv'].NodeValue := Value;
end;

function TXMLIde.Get_UFEnv: WideString;
begin
  Result := ChildNodes['UFEnv'].Text;
end;

procedure TXMLIde.Set_UFEnv(Value: WideString);
begin
  ChildNodes['UFEnv'].NodeValue := Value;
end;

function TXMLIde.Get_Modal: WideString;
begin
  Result := ChildNodes['modal'].Text;
end;

procedure TXMLIde.Set_Modal(Value: WideString);
begin
  ChildNodes['modal'].NodeValue := Value;
end;

function TXMLIde.Get_TpServ: WideString;
begin
  Result := ChildNodes['tpServ'].Text;
end;

procedure TXMLIde.Set_TpServ(Value: WideString);
begin
  ChildNodes['tpServ'].NodeValue := Value;
end;

function TXMLIde.Get_CMunIni: WideString;
begin
  Result := ChildNodes['cMunIni'].Text;
end;

procedure TXMLIde.Set_CMunIni(Value: WideString);
begin
  ChildNodes['cMunIni'].NodeValue := Value;
end;

function TXMLIde.Get_XMunIni: WideString;
begin
  Result := ChildNodes['xMunIni'].Text;
end;

procedure TXMLIde.Set_XMunIni(Value: WideString);
begin
  ChildNodes['xMunIni'].NodeValue := Value;
end;

function TXMLIde.Get_UFIni: WideString;
begin
  Result := ChildNodes['UFIni'].Text;
end;

procedure TXMLIde.Set_UFIni(Value: WideString);
begin
  ChildNodes['UFIni'].NodeValue := Value;
end;

function TXMLIde.Get_CMunFim: WideString;
begin
  Result := ChildNodes['cMunFim'].Text;
end;

procedure TXMLIde.Set_CMunFim(Value: WideString);
begin
  ChildNodes['cMunFim'].NodeValue := Value;
end;

function TXMLIde.Get_XMunFim: WideString;
begin
  Result := ChildNodes['xMunFim'].Text;
end;

procedure TXMLIde.Set_XMunFim(Value: WideString);
begin
  ChildNodes['xMunFim'].NodeValue := Value;
end;

function TXMLIde.Get_UFFim: WideString;
begin
  Result := ChildNodes['UFFim'].Text;
end;

procedure TXMLIde.Set_UFFim(Value: WideString);
begin
  ChildNodes['UFFim'].NodeValue := Value;
end;

function TXMLIde.Get_Retira: WideString;
begin
  Result := ChildNodes['retira'].Text;
end;

procedure TXMLIde.Set_Retira(Value: WideString);
begin
  ChildNodes['retira'].NodeValue := Value;
end;

function TXMLIde.Get_XDetRetira: WideString;
begin
  Result := ChildNodes['xDetRetira'].Text;
end;

procedure TXMLIde.Set_XDetRetira(Value: WideString);
begin
  ChildNodes['xDetRetira'].NodeValue := Value;
end;

function TXMLIde.Get_Toma03: IXMLToma03;
begin
  Result := ChildNodes['toma03'] as IXMLToma03;
end;

function TXMLIde.Get_Toma4: IXMLToma4;
begin
  Result := ChildNodes['toma4'] as IXMLToma4;
end;

function TXMLIde.Get_DhCont: WideString;
begin
  Result := ChildNodes['dhCont'].Text;
end;

procedure TXMLIde.Set_DhCont(Value: WideString);
begin
  ChildNodes['dhCont'].NodeValue := Value;
end;

function TXMLIde.Get_XJust: WideString;
begin
  Result := ChildNodes['xJust'].Text;
end;

procedure TXMLIde.Set_XJust(Value: WideString);
begin
  ChildNodes['xJust'].NodeValue := Value;
end;

{ TXMLToma03 }

function TXMLToma03.Get_Toma: WideString;
begin
  Result := ChildNodes['toma'].Text;
end;

procedure TXMLToma03.Set_Toma(Value: WideString);
begin
  ChildNodes['toma'].NodeValue := Value;
end;

{ TXMLToma4 }

procedure TXMLToma4.AfterConstruction;
begin
  RegisterChildNode('enderToma', TXMLTEndereco);
  inherited;
end;

function TXMLToma4.Get_Toma: WideString;
begin
  Result := ChildNodes['toma'].Text;
end;

procedure TXMLToma4.Set_Toma(Value: WideString);
begin
  ChildNodes['toma'].NodeValue := Value;
end;

function TXMLToma4.Get_CNPJ: WideString;
begin
  Result := ChildNodes['CNPJ'].Text;
end;

procedure TXMLToma4.Set_CNPJ(Value: WideString);
begin
  ChildNodes['CNPJ'].NodeValue := Value;
end;

function TXMLToma4.Get_CPF: WideString;
begin
  Result := ChildNodes['CPF'].Text;
end;

procedure TXMLToma4.Set_CPF(Value: WideString);
begin
  ChildNodes['CPF'].NodeValue := Value;
end;

function TXMLToma4.Get_IE: WideString;
begin
  Result := ChildNodes['IE'].Text;
end;

procedure TXMLToma4.Set_IE(Value: WideString);
begin
  ChildNodes['IE'].NodeValue := Value;
end;

function TXMLToma4.Get_XNome: WideString;
begin
  Result := ChildNodes['xNome'].Text;
end;

procedure TXMLToma4.Set_XNome(Value: WideString);
begin
  ChildNodes['xNome'].NodeValue := Value;
end;

function TXMLToma4.Get_XFant: WideString;
begin
  Result := ChildNodes['xFant'].Text;
end;

procedure TXMLToma4.Set_XFant(Value: WideString);
begin
  ChildNodes['xFant'].NodeValue := Value;
end;

function TXMLToma4.Get_Fone: WideString;
begin
  Result := ChildNodes['fone'].Text;
end;

procedure TXMLToma4.Set_Fone(Value: WideString);
begin
  ChildNodes['fone'].NodeValue := Value;
end;

function TXMLToma4.Get_EnderToma: IXMLTEndereco;
begin
  Result := ChildNodes['enderToma'] as IXMLTEndereco;
end;

function TXMLToma4.Get_Email: WideString;
begin
  Result := ChildNodes['email'].Text;
end;

procedure TXMLToma4.Set_Email(Value: WideString);
begin
  ChildNodes['email'].NodeValue := Value;
end;

{ TXMLTEndereco }

function TXMLTEndereco.Get_XLgr: WideString;
begin
  Result := ChildNodes['xLgr'].Text;
end;

procedure TXMLTEndereco.Set_XLgr(Value: WideString);
begin
  ChildNodes['xLgr'].NodeValue := Value;
end;

function TXMLTEndereco.Get_Nro: WideString;
begin
  Result := ChildNodes['nro'].Text;
end;

procedure TXMLTEndereco.Set_Nro(Value: WideString);
begin
  ChildNodes['nro'].NodeValue := Value;
end;

function TXMLTEndereco.Get_XCpl: WideString;
begin
  Result := ChildNodes['xCpl'].Text;
end;

procedure TXMLTEndereco.Set_XCpl(Value: WideString);
begin
  ChildNodes['xCpl'].NodeValue := Value;
end;

function TXMLTEndereco.Get_XBairro: WideString;
begin
  Result := ChildNodes['xBairro'].Text;
end;

procedure TXMLTEndereco.Set_XBairro(Value: WideString);
begin
  ChildNodes['xBairro'].NodeValue := Value;
end;

function TXMLTEndereco.Get_CMun: WideString;
begin
  Result := ChildNodes['cMun'].Text;
end;

procedure TXMLTEndereco.Set_CMun(Value: WideString);
begin
  ChildNodes['cMun'].NodeValue := Value;
end;

function TXMLTEndereco.Get_XMun: WideString;
begin
  Result := ChildNodes['xMun'].Text;
end;

procedure TXMLTEndereco.Set_XMun(Value: WideString);
begin
  ChildNodes['xMun'].NodeValue := Value;
end;

function TXMLTEndereco.Get_CEP: WideString;
begin
  Result := ChildNodes['CEP'].Text;
end;

procedure TXMLTEndereco.Set_CEP(Value: WideString);
begin
  ChildNodes['CEP'].NodeValue := Value;
end;

function TXMLTEndereco.Get_UF: WideString;
begin
  Result := ChildNodes['UF'].Text;
end;

procedure TXMLTEndereco.Set_UF(Value: WideString);
begin
  ChildNodes['UF'].NodeValue := Value;
end;

function TXMLTEndereco.Get_CPais: WideString;
begin
  Result := ChildNodes['cPais'].Text;
end;

procedure TXMLTEndereco.Set_CPais(Value: WideString);
begin
  ChildNodes['cPais'].NodeValue := Value;
end;

function TXMLTEndereco.Get_XPais: WideString;
begin
  Result := ChildNodes['xPais'].Text;
end;

procedure TXMLTEndereco.Set_XPais(Value: WideString);
begin
  ChildNodes['xPais'].NodeValue := Value;
end;

{ TXMLCompl }

procedure TXMLCompl.AfterConstruction;
begin
  RegisterChildNode('fluxo', TXMLFluxo);
  RegisterChildNode('Entrega', TXMLEntrega);
  RegisterChildNode('ObsCont', TXMLObsCont);
  RegisterChildNode('ObsFisco', TXMLObsFisco);
  inherited;
end;

function TXMLCompl.Get_XCaracAd: WideString;
begin
  Result := ChildNodes['xCaracAd'].Text;
end;

procedure TXMLCompl.Set_XCaracAd(Value: WideString);
begin
  ChildNodes['xCaracAd'].NodeValue := Value;
end;

function TXMLCompl.Get_XCaracSer: WideString;
begin
  Result := ChildNodes['xCaracSer'].Text;
end;

procedure TXMLCompl.Set_XCaracSer(Value: WideString);
begin
  ChildNodes['xCaracSer'].NodeValue := Value;
end;

function TXMLCompl.Get_XEmi: WideString;
begin
  Result := ChildNodes['xEmi'].Text;
end;

procedure TXMLCompl.Set_XEmi(Value: WideString);
begin
  ChildNodes['xEmi'].NodeValue := Value;
end;

function TXMLCompl.Get_Fluxo: IXMLFluxo;
begin
  Result := ChildNodes['fluxo'] as IXMLFluxo;
end;

function TXMLCompl.Get_Entrega: IXMLEntrega;
begin
  Result := ChildNodes['Entrega'] as IXMLEntrega;
end;

function TXMLCompl.Get_OrigCalc: WideString;
begin
  Result := ChildNodes['origCalc'].Text;
end;

procedure TXMLCompl.Set_OrigCalc(Value: WideString);
begin
  ChildNodes['origCalc'].NodeValue := Value;
end;

function TXMLCompl.Get_DestCalc: WideString;
begin
  Result := ChildNodes['destCalc'].Text;
end;

procedure TXMLCompl.Set_DestCalc(Value: WideString);
begin
  ChildNodes['destCalc'].NodeValue := Value;
end;

function TXMLCompl.Get_XObs: WideString;
begin
  Result := ChildNodes['xObs'].Text;
end;

procedure TXMLCompl.Set_XObs(Value: WideString);
begin
  ChildNodes['xObs'].NodeValue := Value;
end;

function TXMLCompl.Get_ObsCont: IXMLObsCont;
begin
  Result := ChildNodes['ObsCont'] as IXMLObsCont;
end;

function TXMLCompl.Get_ObsFisco: IXMLObsFisco;
begin
  Result := ChildNodes['ObsFisco'] as IXMLObsFisco;
end;

{ TXMLFluxo }

procedure TXMLFluxo.AfterConstruction;
begin
  RegisterChildNode('pass', TXMLPass);
  FPass := CreateCollection(TXMLPassList, IXMLPass, 'pass') as IXMLPassList;
  inherited;
end;

function TXMLFluxo.Get_XOrig: WideString;
begin
  Result := ChildNodes['xOrig'].Text;
end;

procedure TXMLFluxo.Set_XOrig(Value: WideString);
begin
  ChildNodes['xOrig'].NodeValue := Value;
end;

function TXMLFluxo.Get_Pass: IXMLPassList;
begin
  Result := FPass;
end;

function TXMLFluxo.Get_XDest: WideString;
begin
  Result := ChildNodes['xDest'].Text;
end;

procedure TXMLFluxo.Set_XDest(Value: WideString);
begin
  ChildNodes['xDest'].NodeValue := Value;
end;

function TXMLFluxo.Get_XRota: WideString;
begin
  Result := ChildNodes['xRota'].Text;
end;

procedure TXMLFluxo.Set_XRota(Value: WideString);
begin
  ChildNodes['xRota'].NodeValue := Value;
end;

{ TXMLPass }

function TXMLPass.Get_XPass: WideString;
begin
  Result := ChildNodes['xPass'].Text;
end;

procedure TXMLPass.Set_XPass(Value: WideString);
begin
  ChildNodes['xPass'].NodeValue := Value;
end;

{ TXMLPassList }

function TXMLPassList.Add: IXMLPass;
begin
  Result := AddItem(-1) as IXMLPass;
end;

function TXMLPassList.Insert(const Index: Integer): IXMLPass;
begin
  Result := AddItem(Index) as IXMLPass;
end;
function TXMLPassList.Get_Item(Index: Integer): IXMLPass;
begin
  Result := List[Index] as IXMLPass;
end;

{ TXMLEntrega }

procedure TXMLEntrega.AfterConstruction;
begin
  RegisterChildNode('semData', TXMLSemData);
  RegisterChildNode('comData', TXMLComData);
  RegisterChildNode('noPeriodo', TXMLNoPeriodo);
  RegisterChildNode('semHora', TXMLSemHora);
  RegisterChildNode('comHora', TXMLComHora);
  RegisterChildNode('noInter', TXMLNoInter);
  inherited;
end;

function TXMLEntrega.Get_SemData: IXMLSemData;
begin
  Result := ChildNodes['semData'] as IXMLSemData;
end;

function TXMLEntrega.Get_ComData: IXMLComData;
begin
  Result := ChildNodes['comData'] as IXMLComData;
end;

function TXMLEntrega.Get_NoPeriodo: IXMLNoPeriodo;
begin
  Result := ChildNodes['noPeriodo'] as IXMLNoPeriodo;
end;

function TXMLEntrega.Get_SemHora: IXMLSemHora;
begin
  Result := ChildNodes['semHora'] as IXMLSemHora;
end;

function TXMLEntrega.Get_ComHora: IXMLComHora;
begin
  Result := ChildNodes['comHora'] as IXMLComHora;
end;

function TXMLEntrega.Get_NoInter: IXMLNoInter;
begin
  Result := ChildNodes['noInter'] as IXMLNoInter;
end;

{ TXMLSemData }

function TXMLSemData.Get_TpPer: WideString;
begin
  Result := ChildNodes['tpPer'].Text;
end;

procedure TXMLSemData.Set_TpPer(Value: WideString);
begin
  ChildNodes['tpPer'].NodeValue := Value;
end;

{ TXMLComData }

function TXMLComData.Get_TpPer: WideString;
begin
  Result := ChildNodes['tpPer'].Text;
end;

procedure TXMLComData.Set_TpPer(Value: WideString);
begin
  ChildNodes['tpPer'].NodeValue := Value;
end;

function TXMLComData.Get_DProg: WideString;
begin
  Result := ChildNodes['dProg'].Text;
end;

procedure TXMLComData.Set_DProg(Value: WideString);
begin
  ChildNodes['dProg'].NodeValue := Value;
end;

{ TXMLNoPeriodo }

function TXMLNoPeriodo.Get_TpPer: WideString;
begin
  Result := ChildNodes['tpPer'].Text;
end;

procedure TXMLNoPeriodo.Set_TpPer(Value: WideString);
begin
  ChildNodes['tpPer'].NodeValue := Value;
end;

function TXMLNoPeriodo.Get_DIni: WideString;
begin
  Result := ChildNodes['dIni'].Text;
end;

procedure TXMLNoPeriodo.Set_DIni(Value: WideString);
begin
  ChildNodes['dIni'].NodeValue := Value;
end;

function TXMLNoPeriodo.Get_DFim: WideString;
begin
  Result := ChildNodes['dFim'].Text;
end;

procedure TXMLNoPeriodo.Set_DFim(Value: WideString);
begin
  ChildNodes['dFim'].NodeValue := Value;
end;

{ TXMLSemHora }

function TXMLSemHora.Get_TpHor: WideString;
begin
  Result := ChildNodes['tpHor'].Text;
end;

procedure TXMLSemHora.Set_TpHor(Value: WideString);
begin
  ChildNodes['tpHor'].NodeValue := Value;
end;

{ TXMLComHora }

function TXMLComHora.Get_TpHor: WideString;
begin
  Result := ChildNodes['tpHor'].Text;
end;

procedure TXMLComHora.Set_TpHor(Value: WideString);
begin
  ChildNodes['tpHor'].NodeValue := Value;
end;

function TXMLComHora.Get_HProg: WideString;
begin
  Result := ChildNodes['hProg'].Text;
end;

procedure TXMLComHora.Set_HProg(Value: WideString);
begin
  ChildNodes['hProg'].NodeValue := Value;
end;

{ TXMLNoInter }

function TXMLNoInter.Get_TpHor: WideString;
begin
  Result := ChildNodes['tpHor'].Text;
end;

procedure TXMLNoInter.Set_TpHor(Value: WideString);
begin
  ChildNodes['tpHor'].NodeValue := Value;
end;

function TXMLNoInter.Get_HIni: WideString;
begin
  Result := ChildNodes['hIni'].Text;
end;

procedure TXMLNoInter.Set_HIni(Value: WideString);
begin
  ChildNodes['hIni'].NodeValue := Value;
end;

function TXMLNoInter.Get_HFim: WideString;
begin
  Result := ChildNodes['hFim'].Text;
end;

procedure TXMLNoInter.Set_HFim(Value: WideString);
begin
  ChildNodes['hFim'].NodeValue := Value;
end;

{ TXMLObsCont }

function TXMLObsCont.Get_XCampo: WideString;
begin
  Result := AttributeNodes['xCampo'].Text;
end;

procedure TXMLObsCont.Set_XCampo(Value: WideString);
begin
  SetAttribute('xCampo', Value);
end;

function TXMLObsCont.Get_XTexto: WideString;
begin
  Result := ChildNodes['xTexto'].Text;
end;

procedure TXMLObsCont.Set_XTexto(Value: WideString);
begin
  ChildNodes['xTexto'].NodeValue := Value;
end;

{ TXMLObsFisco }

function TXMLObsFisco.Get_XCampo: WideString;
begin
  Result := AttributeNodes['xCampo'].Text;
end;

procedure TXMLObsFisco.Set_XCampo(Value: WideString);
begin
  SetAttribute('xCampo', Value);
end;

function TXMLObsFisco.Get_XTexto: WideString;
begin
  Result := ChildNodes['xTexto'].Text;
end;

procedure TXMLObsFisco.Set_XTexto(Value: WideString);
begin
  ChildNodes['xTexto'].NodeValue := Value;
end;

{ TXMLEmit }

procedure TXMLEmit.AfterConstruction;
begin
  RegisterChildNode('enderEmit', TXMLTEndeEmi);
  inherited;
end;

function TXMLEmit.Get_CNPJ: WideString;
begin
  Result := ChildNodes['CNPJ'].Text;
end;

procedure TXMLEmit.Set_CNPJ(Value: WideString);
begin
  ChildNodes['CNPJ'].NodeValue := Value;
end;

function TXMLEmit.Get_IE: WideString;
begin
  Result := ChildNodes['IE'].Text;
end;

procedure TXMLEmit.Set_IE(Value: WideString);
begin
  ChildNodes['IE'].NodeValue := Value;
end;

function TXMLEmit.Get_XNome: WideString;
begin
  Result := ChildNodes['xNome'].Text;
end;

procedure TXMLEmit.Set_XNome(Value: WideString);
begin
  ChildNodes['xNome'].NodeValue := Value;
end;

function TXMLEmit.Get_XFant: WideString;
begin
  Result := ChildNodes['xFant'].Text;
end;

procedure TXMLEmit.Set_XFant(Value: WideString);
begin
  ChildNodes['xFant'].NodeValue := Value;
end;

function TXMLEmit.Get_EnderEmit: IXMLTEndeEmi;
begin
  Result := ChildNodes['enderEmit'] as IXMLTEndeEmi;
end;

{ TXMLTEndeEmi }

function TXMLTEndeEmi.Get_XLgr: WideString;
begin
  Result := ChildNodes['xLgr'].Text;
end;

procedure TXMLTEndeEmi.Set_XLgr(Value: WideString);
begin
  ChildNodes['xLgr'].NodeValue := Value;
end;

function TXMLTEndeEmi.Get_Nro: WideString;
begin
  Result := ChildNodes['nro'].Text;
end;

procedure TXMLTEndeEmi.Set_Nro(Value: WideString);
begin
  ChildNodes['nro'].NodeValue := Value;
end;

function TXMLTEndeEmi.Get_XCpl: WideString;
begin
  Result := ChildNodes['xCpl'].Text;
end;

procedure TXMLTEndeEmi.Set_XCpl(Value: WideString);
begin
  ChildNodes['xCpl'].NodeValue := Value;
end;

function TXMLTEndeEmi.Get_XBairro: WideString;
begin
  Result := ChildNodes['xBairro'].Text;
end;

procedure TXMLTEndeEmi.Set_XBairro(Value: WideString);
begin
  ChildNodes['xBairro'].NodeValue := Value;
end;

function TXMLTEndeEmi.Get_CMun: WideString;
begin
  Result := ChildNodes['cMun'].Text;
end;

procedure TXMLTEndeEmi.Set_CMun(Value: WideString);
begin
  ChildNodes['cMun'].NodeValue := Value;
end;

function TXMLTEndeEmi.Get_XMun: WideString;
begin
  Result := ChildNodes['xMun'].Text;
end;

procedure TXMLTEndeEmi.Set_XMun(Value: WideString);
begin
  ChildNodes['xMun'].NodeValue := Value;
end;

function TXMLTEndeEmi.Get_CEP: WideString;
begin
  Result := ChildNodes['CEP'].Text;
end;

procedure TXMLTEndeEmi.Set_CEP(Value: WideString);
begin
  ChildNodes['CEP'].NodeValue := Value;
end;

function TXMLTEndeEmi.Get_UF: WideString;
begin
  Result := ChildNodes['UF'].Text;
end;

procedure TXMLTEndeEmi.Set_UF(Value: WideString);
begin
  ChildNodes['UF'].NodeValue := Value;
end;

function TXMLTEndeEmi.Get_Fone: WideString;
begin
  Result := ChildNodes['fone'].Text;
end;

procedure TXMLTEndeEmi.Set_Fone(Value: WideString);
begin
  ChildNodes['fone'].NodeValue := Value;
end;

{ TXMLRem }

procedure TXMLRem.AfterConstruction;
begin
  RegisterChildNode('enderReme', TXMLTEndereco);
  inherited;
end;

function TXMLRem.Get_CNPJ: WideString;
begin
  Result := ChildNodes['CNPJ'].Text;
end;

procedure TXMLRem.Set_CNPJ(Value: WideString);
begin
  ChildNodes['CNPJ'].NodeValue := Value;
end;

function TXMLRem.Get_CPF: WideString;
begin
  Result := ChildNodes['CPF'].Text;
end;

procedure TXMLRem.Set_CPF(Value: WideString);
begin
  ChildNodes['CPF'].NodeValue := Value;
end;

function TXMLRem.Get_IE: WideString;
begin
  Result := ChildNodes['IE'].Text;
end;

procedure TXMLRem.Set_IE(Value: WideString);
begin
  ChildNodes['IE'].NodeValue := Value;
end;

function TXMLRem.Get_XNome: WideString;
begin
  Result := ChildNodes['xNome'].Text;
end;

procedure TXMLRem.Set_XNome(Value: WideString);
begin
  ChildNodes['xNome'].NodeValue := Value;
end;

function TXMLRem.Get_XFant: WideString;
begin
  Result := ChildNodes['xFant'].Text;
end;

procedure TXMLRem.Set_XFant(Value: WideString);
begin
  ChildNodes['xFant'].NodeValue := Value;
end;

function TXMLRem.Get_Fone: WideString;
begin
  Result := ChildNodes['fone'].Text;
end;

procedure TXMLRem.Set_Fone(Value: WideString);
begin
  ChildNodes['fone'].NodeValue := Value;
end;

function TXMLRem.Get_EnderReme: IXMLTEndereco;
begin
  Result := ChildNodes['enderReme'] as IXMLTEndereco;
end;

function TXMLRem.Get_Email: WideString;
begin
  Result := ChildNodes['email'].Text;
end;

procedure TXMLRem.Set_Email(Value: WideString);
begin
  ChildNodes['email'].NodeValue := Value;
end;

{ TXMLExped }

procedure TXMLExped.AfterConstruction;
begin
  RegisterChildNode('enderExped', TXMLTEndereco);
  inherited;
end;

function TXMLExped.Get_CNPJ: WideString;
begin
  Result := ChildNodes['CNPJ'].Text;
end;

procedure TXMLExped.Set_CNPJ(Value: WideString);
begin
  ChildNodes['CNPJ'].NodeValue := Value;
end;

function TXMLExped.Get_CPF: WideString;
begin
  Result := ChildNodes['CPF'].Text;
end;

procedure TXMLExped.Set_CPF(Value: WideString);
begin
  ChildNodes['CPF'].NodeValue := Value;
end;

function TXMLExped.Get_IE: WideString;
begin
  Result := ChildNodes['IE'].Text;
end;

procedure TXMLExped.Set_IE(Value: WideString);
begin
  ChildNodes['IE'].NodeValue := Value;
end;

function TXMLExped.Get_XNome: WideString;
begin
  Result := ChildNodes['xNome'].Text;
end;

procedure TXMLExped.Set_XNome(Value: WideString);
begin
  ChildNodes['xNome'].NodeValue := Value;
end;

function TXMLExped.Get_Fone: WideString;
begin
  Result := ChildNodes['fone'].Text;
end;

procedure TXMLExped.Set_Fone(Value: WideString);
begin
  ChildNodes['fone'].NodeValue := Value;
end;

function TXMLExped.Get_EnderExped: IXMLTEndereco;
begin
  Result := ChildNodes['enderExped'] as IXMLTEndereco;
end;

function TXMLExped.Get_Email: WideString;
begin
  Result := ChildNodes['email'].Text;
end;

procedure TXMLExped.Set_Email(Value: WideString);
begin
  ChildNodes['email'].NodeValue := Value;
end;

{ TXMLReceb }

procedure TXMLReceb.AfterConstruction;
begin
  RegisterChildNode('enderReceb', TXMLTEndereco);
  inherited;
end;

function TXMLReceb.Get_CNPJ: WideString;
begin
  Result := ChildNodes['CNPJ'].Text;
end;

procedure TXMLReceb.Set_CNPJ(Value: WideString);
begin
  ChildNodes['CNPJ'].NodeValue := Value;
end;

function TXMLReceb.Get_CPF: WideString;
begin
  Result := ChildNodes['CPF'].Text;
end;

procedure TXMLReceb.Set_CPF(Value: WideString);
begin
  ChildNodes['CPF'].NodeValue := Value;
end;

function TXMLReceb.Get_IE: WideString;
begin
  Result := ChildNodes['IE'].Text;
end;

procedure TXMLReceb.Set_IE(Value: WideString);
begin
  ChildNodes['IE'].NodeValue := Value;
end;

function TXMLReceb.Get_XNome: WideString;
begin
  Result := ChildNodes['xNome'].Text;
end;

procedure TXMLReceb.Set_XNome(Value: WideString);
begin
  ChildNodes['xNome'].NodeValue := Value;
end;

function TXMLReceb.Get_Fone: WideString;
begin
  Result := ChildNodes['fone'].Text;
end;

procedure TXMLReceb.Set_Fone(Value: WideString);
begin
  ChildNodes['fone'].NodeValue := Value;
end;

function TXMLReceb.Get_EnderReceb: IXMLTEndereco;
begin
  Result := ChildNodes['enderReceb'] as IXMLTEndereco;
end;

function TXMLReceb.Get_Email: WideString;
begin
  Result := ChildNodes['email'].Text;
end;

procedure TXMLReceb.Set_Email(Value: WideString);
begin
  ChildNodes['email'].NodeValue := Value;
end;

{ TXMLDest }

procedure TXMLDest.AfterConstruction;
begin
  RegisterChildNode('enderDest', TXMLTEndereco);
  inherited;
end;

function TXMLDest.Get_CNPJ: WideString;
begin
  Result := ChildNodes['CNPJ'].Text;
end;

procedure TXMLDest.Set_CNPJ(Value: WideString);
begin
  ChildNodes['CNPJ'].NodeValue := Value;
end;

function TXMLDest.Get_CPF: WideString;
begin
  Result := ChildNodes['CPF'].Text;
end;

procedure TXMLDest.Set_CPF(Value: WideString);
begin
  ChildNodes['CPF'].NodeValue := Value;
end;

function TXMLDest.Get_IE: WideString;
begin
  Result := ChildNodes['IE'].Text;
end;

procedure TXMLDest.Set_IE(Value: WideString);
begin
  ChildNodes['IE'].NodeValue := Value;
end;

function TXMLDest.Get_XNome: WideString;
begin
  Result := ChildNodes['xNome'].Text;
end;

procedure TXMLDest.Set_XNome(Value: WideString);
begin
  ChildNodes['xNome'].NodeValue := Value;
end;

function TXMLDest.Get_Fone: WideString;
begin
  Result := ChildNodes['fone'].Text;
end;

procedure TXMLDest.Set_Fone(Value: WideString);
begin
  ChildNodes['fone'].NodeValue := Value;
end;

function TXMLDest.Get_ISUF: WideString;
begin
  Result := ChildNodes['ISUF'].Text;
end;

procedure TXMLDest.Set_ISUF(Value: WideString);
begin
  ChildNodes['ISUF'].NodeValue := Value;
end;

function TXMLDest.Get_EnderDest: IXMLTEndereco;
begin
  Result := ChildNodes['enderDest'] as IXMLTEndereco;
end;

function TXMLDest.Get_Email: WideString;
begin
  Result := ChildNodes['email'].Text;
end;

procedure TXMLDest.Set_Email(Value: WideString);
begin
  ChildNodes['email'].NodeValue := Value;
end;

{ TXMLVPrest }

procedure TXMLVPrest.AfterConstruction;
begin
  RegisterChildNode('Comp', TXMLComp);
  FComp := CreateCollection(TXMLCompList, IXMLComp, 'Comp') as IXMLCompList;
  inherited;
end;

function TXMLVPrest.Get_VTPrest: WideString;
begin
  Result := ChildNodes['vTPrest'].Text;
end;

procedure TXMLVPrest.Set_VTPrest(Value: WideString);
begin
  ChildNodes['vTPrest'].NodeValue := Value;
end;

function TXMLVPrest.Get_VRec: WideString;
begin
  Result := ChildNodes['vRec'].Text;
end;

procedure TXMLVPrest.Set_VRec(Value: WideString);
begin
  ChildNodes['vRec'].NodeValue := Value;
end;

function TXMLVPrest.Get_Comp: IXMLCompList;
begin
  Result := FComp;
end;

{ TXMLComp }

function TXMLComp.Get_XNome: WideString;
begin
  Result := ChildNodes['xNome'].Text;
end;

procedure TXMLComp.Set_XNome(Value: WideString);
begin
  ChildNodes['xNome'].NodeValue := Value;
end;

function TXMLComp.Get_VComp: WideString;
begin
  Result := ChildNodes['vComp'].Text;
end;

procedure TXMLComp.Set_VComp(Value: WideString);
begin
  ChildNodes['vComp'].NodeValue := Value;
end;

{ TXMLCompList }

function TXMLCompList.Add: IXMLComp;
begin
  Result := AddItem(-1) as IXMLComp;
end;

function TXMLCompList.Insert(const Index: Integer): IXMLComp;
begin
  Result := AddItem(Index) as IXMLComp;
end;
function TXMLCompList.Get_Item(Index: Integer): IXMLComp;
begin
  Result := List[Index] as IXMLComp;
end;

{ TXMLImp }

procedure TXMLImp.AfterConstruction;
begin
  RegisterChildNode('ICMS', TXMLTImp);
  RegisterChildNode('ICMSUFFim', TXMLICMSUFFim);
  inherited;
end;

function TXMLImp.Get_ICMS: IXMLTImp;
begin
  Result := ChildNodes['ICMS'] as IXMLTImp;
end;

function TXMLImp.Get_VTotTrib: WideString;
begin
  Result := ChildNodes['vTotTrib'].Text;
end;

procedure TXMLImp.Set_VTotTrib(Value: WideString);
begin
  ChildNodes['vTotTrib'].NodeValue := Value;
end;

function TXMLImp.Get_InfAdFisco: WideString;
begin
  Result := ChildNodes['infAdFisco'].Text;
end;

procedure TXMLImp.Set_InfAdFisco(Value: WideString);
begin
  ChildNodes['infAdFisco'].NodeValue := Value;
end;

function TXMLImp.Get_ICMSUFFim: IXMLICMSUFFim;
begin
  Result := ChildNodes['ICMSUFFim'] as IXMLICMSUFFim;
end;

{ TXMLTImp }

procedure TXMLTImp.AfterConstruction;
begin
  RegisterChildNode('ICMS00', TXMLICMS00);
  RegisterChildNode('ICMS20', TXMLICMS20);
  RegisterChildNode('ICMS45', TXMLICMS45);
  RegisterChildNode('ICMS60', TXMLICMS60);
  RegisterChildNode('ICMS90', TXMLICMS90);
  RegisterChildNode('ICMSOutraUF', TXMLICMSOutraUF);
  RegisterChildNode('ICMSSN', TXMLICMSSN);
  inherited;
end;

function TXMLTImp.Get_ICMS00: IXMLICMS00;
begin
  Result := ChildNodes['ICMS00'] as IXMLICMS00;
end;

function TXMLTImp.Get_ICMS20: IXMLICMS20;
begin
  Result := ChildNodes['ICMS20'] as IXMLICMS20;
end;

function TXMLTImp.Get_ICMS45: IXMLICMS45;
begin
  Result := ChildNodes['ICMS45'] as IXMLICMS45;
end;

function TXMLTImp.Get_ICMS60: IXMLICMS60;
begin
  Result := ChildNodes['ICMS60'] as IXMLICMS60;
end;

function TXMLTImp.Get_ICMS90: IXMLICMS90;
begin
  Result := ChildNodes['ICMS90'] as IXMLICMS90;
end;

function TXMLTImp.Get_ICMSOutraUF: IXMLICMSOutraUF;
begin
  Result := ChildNodes['ICMSOutraUF'] as IXMLICMSOutraUF;
end;

function TXMLTImp.Get_ICMSSN: IXMLICMSSN;
begin
  Result := ChildNodes['ICMSSN'] as IXMLICMSSN;
end;

{ TXMLICMS00 }

function TXMLICMS00.Get_CST: WideString;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLICMS00.Set_CST(Value: WideString);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLICMS00.Get_VBC: WideString;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLICMS00.Set_VBC(Value: WideString);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLICMS00.Get_PICMS: WideString;
begin
  Result := ChildNodes['pICMS'].Text;
end;

procedure TXMLICMS00.Set_PICMS(Value: WideString);
begin
  ChildNodes['pICMS'].NodeValue := Value;
end;

function TXMLICMS00.Get_VICMS: WideString;
begin
  Result := ChildNodes['vICMS'].Text;
end;

procedure TXMLICMS00.Set_VICMS(Value: WideString);
begin
  ChildNodes['vICMS'].NodeValue := Value;
end;

{ TXMLICMS20 }

function TXMLICMS20.Get_CST: WideString;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLICMS20.Set_CST(Value: WideString);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLICMS20.Get_PRedBC: WideString;
begin
  Result := ChildNodes['pRedBC'].Text;
end;

procedure TXMLICMS20.Set_PRedBC(Value: WideString);
begin
  ChildNodes['pRedBC'].NodeValue := Value;
end;

function TXMLICMS20.Get_VBC: WideString;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLICMS20.Set_VBC(Value: WideString);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLICMS20.Get_PICMS: WideString;
begin
  Result := ChildNodes['pICMS'].Text;
end;

procedure TXMLICMS20.Set_PICMS(Value: WideString);
begin
  ChildNodes['pICMS'].NodeValue := Value;
end;

function TXMLICMS20.Get_VICMS: WideString;
begin
  Result := ChildNodes['vICMS'].Text;
end;

procedure TXMLICMS20.Set_VICMS(Value: WideString);
begin
  ChildNodes['vICMS'].NodeValue := Value;
end;

{ TXMLICMS45 }

function TXMLICMS45.Get_CST: WideString;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLICMS45.Set_CST(Value: WideString);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

{ TXMLICMS60 }

function TXMLICMS60.Get_CST: WideString;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLICMS60.Set_CST(Value: WideString);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLICMS60.Get_VBCSTRet: WideString;
begin
  Result := ChildNodes['vBCSTRet'].Text;
end;

procedure TXMLICMS60.Set_VBCSTRet(Value: WideString);
begin
  ChildNodes['vBCSTRet'].NodeValue := Value;
end;

function TXMLICMS60.Get_VICMSSTRet: WideString;
begin
  Result := ChildNodes['vICMSSTRet'].Text;
end;

procedure TXMLICMS60.Set_VICMSSTRet(Value: WideString);
begin
  ChildNodes['vICMSSTRet'].NodeValue := Value;
end;

function TXMLICMS60.Get_PICMSSTRet: WideString;
begin
  Result := ChildNodes['pICMSSTRet'].Text;
end;

procedure TXMLICMS60.Set_PICMSSTRet(Value: WideString);
begin
  ChildNodes['pICMSSTRet'].NodeValue := Value;
end;

function TXMLICMS60.Get_VCred: WideString;
begin
  Result := ChildNodes['vCred'].Text;
end;

procedure TXMLICMS60.Set_VCred(Value: WideString);
begin
  ChildNodes['vCred'].NodeValue := Value;
end;

{ TXMLICMS90 }

function TXMLICMS90.Get_CST: WideString;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLICMS90.Set_CST(Value: WideString);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLICMS90.Get_PRedBC: WideString;
begin
  Result := ChildNodes['pRedBC'].Text;
end;

procedure TXMLICMS90.Set_PRedBC(Value: WideString);
begin
  ChildNodes['pRedBC'].NodeValue := Value;
end;

function TXMLICMS90.Get_VBC: WideString;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLICMS90.Set_VBC(Value: WideString);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLICMS90.Get_PICMS: WideString;
begin
  Result := ChildNodes['pICMS'].Text;
end;

procedure TXMLICMS90.Set_PICMS(Value: WideString);
begin
  ChildNodes['pICMS'].NodeValue := Value;
end;

function TXMLICMS90.Get_VICMS: WideString;
begin
  Result := ChildNodes['vICMS'].Text;
end;

procedure TXMLICMS90.Set_VICMS(Value: WideString);
begin
  ChildNodes['vICMS'].NodeValue := Value;
end;

function TXMLICMS90.Get_VCred: WideString;
begin
  Result := ChildNodes['vCred'].Text;
end;

procedure TXMLICMS90.Set_VCred(Value: WideString);
begin
  ChildNodes['vCred'].NodeValue := Value;
end;

{ TXMLICMSOutraUF }

function TXMLICMSOutraUF.Get_CST: WideString;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLICMSOutraUF.Set_CST(Value: WideString);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLICMSOutraUF.Get_PRedBCOutraUF: WideString;
begin
  Result := ChildNodes['pRedBCOutraUF'].Text;
end;

procedure TXMLICMSOutraUF.Set_PRedBCOutraUF(Value: WideString);
begin
  ChildNodes['pRedBCOutraUF'].NodeValue := Value;
end;

function TXMLICMSOutraUF.Get_VBCOutraUF: WideString;
begin
  Result := ChildNodes['vBCOutraUF'].Text;
end;

procedure TXMLICMSOutraUF.Set_VBCOutraUF(Value: WideString);
begin
  ChildNodes['vBCOutraUF'].NodeValue := Value;
end;

function TXMLICMSOutraUF.Get_PICMSOutraUF: WideString;
begin
  Result := ChildNodes['pICMSOutraUF'].Text;
end;

procedure TXMLICMSOutraUF.Set_PICMSOutraUF(Value: WideString);
begin
  ChildNodes['pICMSOutraUF'].NodeValue := Value;
end;

function TXMLICMSOutraUF.Get_VICMSOutraUF: WideString;
begin
  Result := ChildNodes['vICMSOutraUF'].Text;
end;

procedure TXMLICMSOutraUF.Set_VICMSOutraUF(Value: WideString);
begin
  ChildNodes['vICMSOutraUF'].NodeValue := Value;
end;

{ TXMLICMSSN }

function TXMLICMSSN.Get_IndSN: WideString;
begin
  Result := ChildNodes['indSN'].Text;
end;

procedure TXMLICMSSN.Set_IndSN(Value: WideString);
begin
  ChildNodes['indSN'].NodeValue := Value;
end;

{ TXMLICMSUFFim }

function TXMLICMSUFFim.Get_VBCUFFim: WideString;
begin
  Result := ChildNodes['vBCUFFim'].Text;
end;

procedure TXMLICMSUFFim.Set_VBCUFFim(Value: WideString);
begin
  ChildNodes['vBCUFFim'].NodeValue := Value;
end;

function TXMLICMSUFFim.Get_PFCPUFFim: WideString;
begin
  Result := ChildNodes['pFCPUFFim'].Text;
end;

procedure TXMLICMSUFFim.Set_PFCPUFFim(Value: WideString);
begin
  ChildNodes['pFCPUFFim'].NodeValue := Value;
end;

function TXMLICMSUFFim.Get_PICMSUFFim: WideString;
begin
  Result := ChildNodes['pICMSUFFim'].Text;
end;

procedure TXMLICMSUFFim.Set_PICMSUFFim(Value: WideString);
begin
  ChildNodes['pICMSUFFim'].NodeValue := Value;
end;

function TXMLICMSUFFim.Get_PICMSInter: WideString;
begin
  Result := ChildNodes['pICMSInter'].Text;
end;

procedure TXMLICMSUFFim.Set_PICMSInter(Value: WideString);
begin
  ChildNodes['pICMSInter'].NodeValue := Value;
end;

function TXMLICMSUFFim.Get_PICMSInterPart: WideString;
begin
  Result := ChildNodes['pICMSInterPart'].Text;
end;

procedure TXMLICMSUFFim.Set_PICMSInterPart(Value: WideString);
begin
  ChildNodes['pICMSInterPart'].NodeValue := Value;
end;

function TXMLICMSUFFim.Get_VFCPUFFim: WideString;
begin
  Result := ChildNodes['vFCPUFFim'].Text;
end;

procedure TXMLICMSUFFim.Set_VFCPUFFim(Value: WideString);
begin
  ChildNodes['vFCPUFFim'].NodeValue := Value;
end;

function TXMLICMSUFFim.Get_VICMSUFFim: WideString;
begin
  Result := ChildNodes['vICMSUFFim'].Text;
end;

procedure TXMLICMSUFFim.Set_VICMSUFFim(Value: WideString);
begin
  ChildNodes['vICMSUFFim'].NodeValue := Value;
end;

function TXMLICMSUFFim.Get_VICMSUFIni: WideString;
begin
  Result := ChildNodes['vICMSUFIni'].Text;
end;

procedure TXMLICMSUFFim.Set_VICMSUFIni(Value: WideString);
begin
  ChildNodes['vICMSUFIni'].NodeValue := Value;
end;

{ TXMLInfCTeNorm }

procedure TXMLInfCTeNorm.AfterConstruction;
begin
  RegisterChildNode('infCarga', TXMLInfCarga);
  RegisterChildNode('infDoc', TXMLInfDoc);
  RegisterChildNode('docAnt', TXMLDocAnt);
  RegisterChildNode('seg', TXMLSeg);
  RegisterChildNode('infModal', TXMLInfModal);
  RegisterChildNode('peri', TXMLPeri);
  RegisterChildNode('veicNovos', TXMLVeicNovos);
  RegisterChildNode('cobr', TXMLCobr);
  RegisterChildNode('infCteSub', TXMLInfCteSub);
  FSeg := CreateCollection(TXMLSegList, IXMLSeg, 'seg') as IXMLSegList;
  FPeri := CreateCollection(TXMLPeriList, IXMLPeri, 'peri') as IXMLPeriList;
  FVeicNovos := CreateCollection(TXMLVeicNovosList, IXMLVeicNovos, 'veicNovos') as IXMLVeicNovosList;
  inherited;
end;

function TXMLInfCTeNorm.Get_InfCarga: IXMLInfCarga;
begin
  Result := ChildNodes['infCarga'] as IXMLInfCarga;
end;

function TXMLInfCTeNorm.Get_InfDoc: IXMLInfDoc;
begin
  Result := ChildNodes['infDoc'] as IXMLInfDoc;
end;

function TXMLInfCTeNorm.Get_DocAnt: IXMLDocAnt;
begin
  Result := ChildNodes['docAnt'] as IXMLDocAnt;
end;

function TXMLInfCTeNorm.Get_Seg: IXMLSegList;
begin
  Result := FSeg;
end;

function TXMLInfCTeNorm.Get_InfModal: IXMLInfModal;
begin
  Result := ChildNodes['infModal'] as IXMLInfModal;
end;

function TXMLInfCTeNorm.Get_Peri: IXMLPeriList;
begin
  Result := FPeri;
end;

function TXMLInfCTeNorm.Get_VeicNovos: IXMLVeicNovosList;
begin
  Result := FVeicNovos;
end;

function TXMLInfCTeNorm.Get_Cobr: IXMLCobr;
begin
  Result := ChildNodes['cobr'] as IXMLCobr;
end;

function TXMLInfCTeNorm.Get_InfCteSub: IXMLInfCteSub;
begin
  Result := ChildNodes['infCteSub'] as IXMLInfCteSub;
end;

{ TXMLInfCarga }

procedure TXMLInfCarga.AfterConstruction;
begin
  RegisterChildNode('infQ', TXMLInfQ);
  FInfQ := CreateCollection(TXMLInfQList, IXMLInfQ, 'infQ') as IXMLInfQList;
  inherited;
end;

function TXMLInfCarga.Get_VCarga: WideString;
begin
  Result := ChildNodes['vCarga'].Text;
end;

procedure TXMLInfCarga.Set_VCarga(Value: WideString);
begin
  ChildNodes['vCarga'].NodeValue := Value;
end;

function TXMLInfCarga.Get_ProPred: WideString;
begin
  Result := ChildNodes['proPred'].Text;
end;

procedure TXMLInfCarga.Set_ProPred(Value: WideString);
begin
  ChildNodes['proPred'].NodeValue := Value;
end;

function TXMLInfCarga.Get_XOutCat: WideString;
begin
  Result := ChildNodes['xOutCat'].Text;
end;

procedure TXMLInfCarga.Set_XOutCat(Value: WideString);
begin
  ChildNodes['xOutCat'].NodeValue := Value;
end;

function TXMLInfCarga.Get_InfQ: IXMLInfQList;
begin
  Result := FInfQ;
end;

{ TXMLInfQ }

function TXMLInfQ.Get_CUnid: WideString;
begin
  Result := ChildNodes['cUnid'].Text;
end;

procedure TXMLInfQ.Set_CUnid(Value: WideString);
begin
  ChildNodes['cUnid'].NodeValue := Value;
end;

function TXMLInfQ.Get_TpMed: WideString;
begin
  Result := ChildNodes['tpMed'].Text;
end;

procedure TXMLInfQ.Set_TpMed(Value: WideString);
begin
  ChildNodes['tpMed'].NodeValue := Value;
end;

function TXMLInfQ.Get_QCarga: WideString;
begin
  Result := ChildNodes['qCarga'].Text;
end;

procedure TXMLInfQ.Set_QCarga(Value: WideString);
begin
  ChildNodes['qCarga'].NodeValue := Value;
end;

{ TXMLInfQList }

function TXMLInfQList.Add: IXMLInfQ;
begin
  Result := AddItem(-1) as IXMLInfQ;
end;

function TXMLInfQList.Insert(const Index: Integer): IXMLInfQ;
begin
  Result := AddItem(Index) as IXMLInfQ;
end;
function TXMLInfQList.Get_Item(Index: Integer): IXMLInfQ;
begin
  Result := List[Index] as IXMLInfQ;
end;

{ TXMLInfDoc }

procedure TXMLInfDoc.AfterConstruction;
begin
  RegisterChildNode('infNF', TXMLInfNF);
  RegisterChildNode('infNFe', TXMLInfNFe);
  RegisterChildNode('infOutros', TXMLInfOutros);
  FInfNF := CreateCollection(TXMLInfNFList, IXMLInfNF, 'infNF') as IXMLInfNFList;
  FInfNFe := CreateCollection(TXMLInfNFeList, IXMLInfNFe, 'infNFe') as IXMLInfNFeList;
  FInfOutros := CreateCollection(TXMLInfOutrosList, IXMLInfOutros, 'infOutros') as IXMLInfOutrosList;
  inherited;
end;

function TXMLInfDoc.Get_InfNF: IXMLInfNFList;
begin
  Result := FInfNF;
end;

function TXMLInfDoc.Get_InfNFe: IXMLInfNFeList;
begin
  Result := FInfNFe;
end;

function TXMLInfDoc.Get_InfOutros: IXMLInfOutrosList;
begin
  Result := FInfOutros;
end;

{ TXMLInfNF }

procedure TXMLInfNF.AfterConstruction;
begin
  RegisterChildNode('infUnidTransp', TXMLTUnidadeTransp);
  RegisterChildNode('infUnidCarga', TXMLTUnidCarga);
  FInfUnidTransp := CreateCollection(TXMLTUnidadeTranspList, IXMLTUnidadeTransp, 'infUnidTransp') as IXMLTUnidadeTranspList;
  FInfUnidCarga := CreateCollection(TXMLTUnidCargaList, IXMLTUnidCarga, 'infUnidCarga') as IXMLTUnidCargaList;
  inherited;
end;

function TXMLInfNF.Get_NRoma: WideString;
begin
  Result := ChildNodes['nRoma'].Text;
end;

procedure TXMLInfNF.Set_NRoma(Value: WideString);
begin
  ChildNodes['nRoma'].NodeValue := Value;
end;

function TXMLInfNF.Get_NPed: WideString;
begin
  Result := ChildNodes['nPed'].Text;
end;

procedure TXMLInfNF.Set_NPed(Value: WideString);
begin
  ChildNodes['nPed'].NodeValue := Value;
end;

function TXMLInfNF.Get_Mod_: WideString;
begin
  Result := ChildNodes['mod'].Text;
end;

procedure TXMLInfNF.Set_Mod_(Value: WideString);
begin
  ChildNodes['mod'].NodeValue := Value;
end;

function TXMLInfNF.Get_Serie: WideString;
begin
  Result := ChildNodes['serie'].Text;
end;

procedure TXMLInfNF.Set_Serie(Value: WideString);
begin
  ChildNodes['serie'].NodeValue := Value;
end;

function TXMLInfNF.Get_NDoc: WideString;
begin
  Result := ChildNodes['nDoc'].Text;
end;

procedure TXMLInfNF.Set_NDoc(Value: WideString);
begin
  ChildNodes['nDoc'].NodeValue := Value;
end;

function TXMLInfNF.Get_DEmi: WideString;
begin
  Result := ChildNodes['dEmi'].Text;
end;

procedure TXMLInfNF.Set_DEmi(Value: WideString);
begin
  ChildNodes['dEmi'].NodeValue := Value;
end;

function TXMLInfNF.Get_VBC: WideString;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLInfNF.Set_VBC(Value: WideString);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLInfNF.Get_VICMS: WideString;
begin
  Result := ChildNodes['vICMS'].Text;
end;

procedure TXMLInfNF.Set_VICMS(Value: WideString);
begin
  ChildNodes['vICMS'].NodeValue := Value;
end;

function TXMLInfNF.Get_VBCST: WideString;
begin
  Result := ChildNodes['vBCST'].Text;
end;

procedure TXMLInfNF.Set_VBCST(Value: WideString);
begin
  ChildNodes['vBCST'].NodeValue := Value;
end;

function TXMLInfNF.Get_VST: WideString;
begin
  Result := ChildNodes['vST'].Text;
end;

procedure TXMLInfNF.Set_VST(Value: WideString);
begin
  ChildNodes['vST'].NodeValue := Value;
end;

function TXMLInfNF.Get_VProd: WideString;
begin
  Result := ChildNodes['vProd'].Text;
end;

procedure TXMLInfNF.Set_VProd(Value: WideString);
begin
  ChildNodes['vProd'].NodeValue := Value;
end;

function TXMLInfNF.Get_VNF: WideString;
begin
  Result := ChildNodes['vNF'].Text;
end;

procedure TXMLInfNF.Set_VNF(Value: WideString);
begin
  ChildNodes['vNF'].NodeValue := Value;
end;

function TXMLInfNF.Get_NCFOP: WideString;
begin
  Result := ChildNodes['nCFOP'].Text;
end;

procedure TXMLInfNF.Set_NCFOP(Value: WideString);
begin
  ChildNodes['nCFOP'].NodeValue := Value;
end;

function TXMLInfNF.Get_NPeso: WideString;
begin
  Result := ChildNodes['nPeso'].Text;
end;

procedure TXMLInfNF.Set_NPeso(Value: WideString);
begin
  ChildNodes['nPeso'].NodeValue := Value;
end;

function TXMLInfNF.Get_PIN: WideString;
begin
  Result := ChildNodes['PIN'].Text;
end;

procedure TXMLInfNF.Set_PIN(Value: WideString);
begin
  ChildNodes['PIN'].NodeValue := Value;
end;

function TXMLInfNF.Get_DPrev: WideString;
begin
  Result := ChildNodes['dPrev'].Text;
end;

procedure TXMLInfNF.Set_DPrev(Value: WideString);
begin
  ChildNodes['dPrev'].NodeValue := Value;
end;

function TXMLInfNF.Get_InfUnidTransp: IXMLTUnidadeTranspList;
begin
  Result := FInfUnidTransp;
end;

function TXMLInfNF.Get_InfUnidCarga: IXMLTUnidCargaList;
begin
  Result := FInfUnidCarga;
end;

{ TXMLInfNFList }

function TXMLInfNFList.Add: IXMLInfNF;
begin
  Result := AddItem(-1) as IXMLInfNF;
end;

function TXMLInfNFList.Insert(const Index: Integer): IXMLInfNF;
begin
  Result := AddItem(Index) as IXMLInfNF;
end;
function TXMLInfNFList.Get_Item(Index: Integer): IXMLInfNF;
begin
  Result := List[Index] as IXMLInfNF;
end;

{ TXMLTUnidadeTransp }

procedure TXMLTUnidadeTransp.AfterConstruction;
begin
  RegisterChildNode('lacUnidTransp', TXMLLacUnidTransp);
  RegisterChildNode('infUnidCarga', TXMLTUnidCarga);
  FLacUnidTransp := CreateCollection(TXMLLacUnidTranspList, IXMLLacUnidTransp, 'lacUnidTransp') as IXMLLacUnidTranspList;
  FInfUnidCarga := CreateCollection(TXMLTUnidCargaList, IXMLTUnidCarga, 'infUnidCarga') as IXMLTUnidCargaList;
  inherited;
end;

function TXMLTUnidadeTransp.Get_TpUnidTransp: WideString;
begin
  Result := ChildNodes['tpUnidTransp'].Text;
end;

procedure TXMLTUnidadeTransp.Set_TpUnidTransp(Value: WideString);
begin
  ChildNodes['tpUnidTransp'].NodeValue := Value;
end;

function TXMLTUnidadeTransp.Get_IdUnidTransp: WideString;
begin
  Result := ChildNodes['idUnidTransp'].Text;
end;

procedure TXMLTUnidadeTransp.Set_IdUnidTransp(Value: WideString);
begin
  ChildNodes['idUnidTransp'].NodeValue := Value;
end;

function TXMLTUnidadeTransp.Get_LacUnidTransp: IXMLLacUnidTranspList;
begin
  Result := FLacUnidTransp;
end;

function TXMLTUnidadeTransp.Get_InfUnidCarga: IXMLTUnidCargaList;
begin
  Result := FInfUnidCarga;
end;

function TXMLTUnidadeTransp.Get_QtdRat: WideString;
begin
  Result := ChildNodes['qtdRat'].Text;
end;

procedure TXMLTUnidadeTransp.Set_QtdRat(Value: WideString);
begin
  ChildNodes['qtdRat'].NodeValue := Value;
end;

{ TXMLTUnidadeTranspList }

function TXMLTUnidadeTranspList.Add: IXMLTUnidadeTransp;
begin
  Result := AddItem(-1) as IXMLTUnidadeTransp;
end;

function TXMLTUnidadeTranspList.Insert(const Index: Integer): IXMLTUnidadeTransp;
begin
  Result := AddItem(Index) as IXMLTUnidadeTransp;
end;
function TXMLTUnidadeTranspList.Get_Item(Index: Integer): IXMLTUnidadeTransp;
begin
  Result := List[Index] as IXMLTUnidadeTransp;
end;

{ TXMLLacUnidTransp }

function TXMLLacUnidTransp.Get_NLacre: WideString;
begin
  Result := ChildNodes['nLacre'].Text;
end;

procedure TXMLLacUnidTransp.Set_NLacre(Value: WideString);
begin
  ChildNodes['nLacre'].NodeValue := Value;
end;

{ TXMLLacUnidTranspList }

function TXMLLacUnidTranspList.Add: IXMLLacUnidTransp;
begin
  Result := AddItem(-1) as IXMLLacUnidTransp;
end;

function TXMLLacUnidTranspList.Insert(const Index: Integer): IXMLLacUnidTransp;
begin
  Result := AddItem(Index) as IXMLLacUnidTransp;
end;
function TXMLLacUnidTranspList.Get_Item(Index: Integer): IXMLLacUnidTransp;
begin
  Result := List[Index] as IXMLLacUnidTransp;
end;

{ TXMLTUnidCarga }

procedure TXMLTUnidCarga.AfterConstruction;
begin
  RegisterChildNode('lacUnidCarga', TXMLLacUnidCarga);
  FLacUnidCarga := CreateCollection(TXMLLacUnidCargaList, IXMLLacUnidCarga, 'lacUnidCarga') as IXMLLacUnidCargaList;
  inherited;
end;

function TXMLTUnidCarga.Get_TpUnidCarga: WideString;
begin
  Result := ChildNodes['tpUnidCarga'].Text;
end;

procedure TXMLTUnidCarga.Set_TpUnidCarga(Value: WideString);
begin
  ChildNodes['tpUnidCarga'].NodeValue := Value;
end;

function TXMLTUnidCarga.Get_IdUnidCarga: WideString;
begin
  Result := ChildNodes['idUnidCarga'].Text;
end;

procedure TXMLTUnidCarga.Set_IdUnidCarga(Value: WideString);
begin
  ChildNodes['idUnidCarga'].NodeValue := Value;
end;

function TXMLTUnidCarga.Get_LacUnidCarga: IXMLLacUnidCargaList;
begin
  Result := FLacUnidCarga;
end;

function TXMLTUnidCarga.Get_QtdRat: WideString;
begin
  Result := ChildNodes['qtdRat'].Text;
end;

procedure TXMLTUnidCarga.Set_QtdRat(Value: WideString);
begin
  ChildNodes['qtdRat'].NodeValue := Value;
end;

{ TXMLTUnidCargaList }

function TXMLTUnidCargaList.Add: IXMLTUnidCarga;
begin
  Result := AddItem(-1) as IXMLTUnidCarga;
end;

function TXMLTUnidCargaList.Insert(const Index: Integer): IXMLTUnidCarga;
begin
  Result := AddItem(Index) as IXMLTUnidCarga;
end;
function TXMLTUnidCargaList.Get_Item(Index: Integer): IXMLTUnidCarga;
begin
  Result := List[Index] as IXMLTUnidCarga;
end;

{ TXMLLacUnidCarga }

function TXMLLacUnidCarga.Get_NLacre: WideString;
begin
  Result := ChildNodes['nLacre'].Text;
end;

procedure TXMLLacUnidCarga.Set_NLacre(Value: WideString);
begin
  ChildNodes['nLacre'].NodeValue := Value;
end;

{ TXMLLacUnidCargaList }

function TXMLLacUnidCargaList.Add: IXMLLacUnidCarga;
begin
  Result := AddItem(-1) as IXMLLacUnidCarga;
end;

function TXMLLacUnidCargaList.Insert(const Index: Integer): IXMLLacUnidCarga;
begin
  Result := AddItem(Index) as IXMLLacUnidCarga;
end;
function TXMLLacUnidCargaList.Get_Item(Index: Integer): IXMLLacUnidCarga;
begin
  Result := List[Index] as IXMLLacUnidCarga;
end;

{ TXMLInfNFe }

procedure TXMLInfNFe.AfterConstruction;
begin
  RegisterChildNode('infUnidTransp', TXMLTUnidadeTransp);
  RegisterChildNode('infUnidCarga', TXMLTUnidCarga);
  FInfUnidTransp := CreateCollection(TXMLTUnidadeTranspList, IXMLTUnidadeTransp, 'infUnidTransp') as IXMLTUnidadeTranspList;
  FInfUnidCarga := CreateCollection(TXMLTUnidCargaList, IXMLTUnidCarga, 'infUnidCarga') as IXMLTUnidCargaList;
  inherited;
end;

function TXMLInfNFe.Get_Chave: WideString;
begin
  Result := ChildNodes['chave'].Text;
end;

procedure TXMLInfNFe.Set_Chave(Value: WideString);
begin
  ChildNodes['chave'].NodeValue := Value;
end;

function TXMLInfNFe.Get_PIN: WideString;
begin
  Result := ChildNodes['PIN'].Text;
end;

procedure TXMLInfNFe.Set_PIN(Value: WideString);
begin
  ChildNodes['PIN'].NodeValue := Value;
end;

function TXMLInfNFe.Get_DPrev: WideString;
begin
  Result := ChildNodes['dPrev'].Text;
end;

procedure TXMLInfNFe.Set_DPrev(Value: WideString);
begin
  ChildNodes['dPrev'].NodeValue := Value;
end;

function TXMLInfNFe.Get_InfUnidTransp: IXMLTUnidadeTranspList;
begin
  Result := FInfUnidTransp;
end;

function TXMLInfNFe.Get_InfUnidCarga: IXMLTUnidCargaList;
begin
  Result := FInfUnidCarga;
end;

{ TXMLInfNFeList }

function TXMLInfNFeList.Add: IXMLInfNFe;
begin
  Result := AddItem(-1) as IXMLInfNFe;
end;

function TXMLInfNFeList.Insert(const Index: Integer): IXMLInfNFe;
begin
  Result := AddItem(Index) as IXMLInfNFe;
end;
function TXMLInfNFeList.Get_Item(Index: Integer): IXMLInfNFe;
begin
  Result := List[Index] as IXMLInfNFe;
end;

{ TXMLInfOutros }

procedure TXMLInfOutros.AfterConstruction;
begin
  RegisterChildNode('infUnidTransp', TXMLTUnidadeTransp);
  RegisterChildNode('infUnidCarga', TXMLTUnidCarga);
  FInfUnidTransp := CreateCollection(TXMLTUnidadeTranspList, IXMLTUnidadeTransp, 'infUnidTransp') as IXMLTUnidadeTranspList;
  FInfUnidCarga := CreateCollection(TXMLTUnidCargaList, IXMLTUnidCarga, 'infUnidCarga') as IXMLTUnidCargaList;
  inherited;
end;

function TXMLInfOutros.Get_TpDoc: WideString;
begin
  Result := ChildNodes['tpDoc'].Text;
end;

procedure TXMLInfOutros.Set_TpDoc(Value: WideString);
begin
  ChildNodes['tpDoc'].NodeValue := Value;
end;

function TXMLInfOutros.Get_DescOutros: WideString;
begin
  Result := ChildNodes['descOutros'].Text;
end;

procedure TXMLInfOutros.Set_DescOutros(Value: WideString);
begin
  ChildNodes['descOutros'].NodeValue := Value;
end;

function TXMLInfOutros.Get_NDoc: WideString;
begin
  Result := ChildNodes['nDoc'].Text;
end;

procedure TXMLInfOutros.Set_NDoc(Value: WideString);
begin
  ChildNodes['nDoc'].NodeValue := Value;
end;

function TXMLInfOutros.Get_DEmi: WideString;
begin
  Result := ChildNodes['dEmi'].Text;
end;

procedure TXMLInfOutros.Set_DEmi(Value: WideString);
begin
  ChildNodes['dEmi'].NodeValue := Value;
end;

function TXMLInfOutros.Get_VDocFisc: WideString;
begin
  Result := ChildNodes['vDocFisc'].Text;
end;

procedure TXMLInfOutros.Set_VDocFisc(Value: WideString);
begin
  ChildNodes['vDocFisc'].NodeValue := Value;
end;

function TXMLInfOutros.Get_DPrev: WideString;
begin
  Result := ChildNodes['dPrev'].Text;
end;

procedure TXMLInfOutros.Set_DPrev(Value: WideString);
begin
  ChildNodes['dPrev'].NodeValue := Value;
end;

function TXMLInfOutros.Get_InfUnidTransp: IXMLTUnidadeTranspList;
begin
  Result := FInfUnidTransp;
end;

function TXMLInfOutros.Get_InfUnidCarga: IXMLTUnidCargaList;
begin
  Result := FInfUnidCarga;
end;

{ TXMLInfOutrosList }

function TXMLInfOutrosList.Add: IXMLInfOutros;
begin
  Result := AddItem(-1) as IXMLInfOutros;
end;

function TXMLInfOutrosList.Insert(const Index: Integer): IXMLInfOutros;
begin
  Result := AddItem(Index) as IXMLInfOutros;
end;
function TXMLInfOutrosList.Get_Item(Index: Integer): IXMLInfOutros;
begin
  Result := List[Index] as IXMLInfOutros;
end;

{ TXMLDocAnt }

procedure TXMLDocAnt.AfterConstruction;
begin
  RegisterChildNode('emiDocAnt', TXMLEmiDocAnt);
  ItemTag := 'emiDocAnt';
  ItemInterface := IXMLEmiDocAnt;
  inherited;
end;

function TXMLDocAnt.Get_EmiDocAnt(Index: Integer): IXMLEmiDocAnt;
begin
  Result := List[Index] as IXMLEmiDocAnt;
end;

function TXMLDocAnt.Add: IXMLEmiDocAnt;
begin
  Result := AddItem(-1) as IXMLEmiDocAnt;
end;

function TXMLDocAnt.Insert(const Index: Integer): IXMLEmiDocAnt;
begin
  Result := AddItem(Index) as IXMLEmiDocAnt;
end;

{ TXMLEmiDocAnt }

procedure TXMLEmiDocAnt.AfterConstruction;
begin
  RegisterChildNode('idDocAnt', TXMLIdDocAnt);
  FIdDocAnt := CreateCollection(TXMLIdDocAntList, IXMLIdDocAnt, 'idDocAnt') as IXMLIdDocAntList;
  inherited;
end;

function TXMLEmiDocAnt.Get_CNPJ: WideString;
begin
  Result := ChildNodes['CNPJ'].Text;
end;

procedure TXMLEmiDocAnt.Set_CNPJ(Value: WideString);
begin
  ChildNodes['CNPJ'].NodeValue := Value;
end;

function TXMLEmiDocAnt.Get_CPF: WideString;
begin
  Result := ChildNodes['CPF'].Text;
end;

procedure TXMLEmiDocAnt.Set_CPF(Value: WideString);
begin
  ChildNodes['CPF'].NodeValue := Value;
end;

function TXMLEmiDocAnt.Get_IE: WideString;
begin
  Result := ChildNodes['IE'].Text;
end;

procedure TXMLEmiDocAnt.Set_IE(Value: WideString);
begin
  ChildNodes['IE'].NodeValue := Value;
end;

function TXMLEmiDocAnt.Get_UF: WideString;
begin
  Result := ChildNodes['UF'].Text;
end;

procedure TXMLEmiDocAnt.Set_UF(Value: WideString);
begin
  ChildNodes['UF'].NodeValue := Value;
end;

function TXMLEmiDocAnt.Get_XNome: WideString;
begin
  Result := ChildNodes['xNome'].Text;
end;

procedure TXMLEmiDocAnt.Set_XNome(Value: WideString);
begin
  ChildNodes['xNome'].NodeValue := Value;
end;

function TXMLEmiDocAnt.Get_IdDocAnt: IXMLIdDocAntList;
begin
  Result := FIdDocAnt;
end;

{ TXMLIdDocAnt }

procedure TXMLIdDocAnt.AfterConstruction;
begin
  RegisterChildNode('idDocAntPap', TXMLIdDocAntPap);
  RegisterChildNode('idDocAntEle', TXMLIdDocAntEle);
  FIdDocAntPap := CreateCollection(TXMLIdDocAntPapList, IXMLIdDocAntPap, 'idDocAntPap') as IXMLIdDocAntPapList;
  FIdDocAntEle := CreateCollection(TXMLIdDocAntEleList, IXMLIdDocAntEle, 'idDocAntEle') as IXMLIdDocAntEleList;
  inherited;
end;

function TXMLIdDocAnt.Get_IdDocAntPap: IXMLIdDocAntPapList;
begin
  Result := FIdDocAntPap;
end;

function TXMLIdDocAnt.Get_IdDocAntEle: IXMLIdDocAntEleList;
begin
  Result := FIdDocAntEle;
end;

{ TXMLIdDocAntList }

function TXMLIdDocAntList.Add: IXMLIdDocAnt;
begin
  Result := AddItem(-1) as IXMLIdDocAnt;
end;

function TXMLIdDocAntList.Insert(const Index: Integer): IXMLIdDocAnt;
begin
  Result := AddItem(Index) as IXMLIdDocAnt;
end;
function TXMLIdDocAntList.Get_Item(Index: Integer): IXMLIdDocAnt;
begin
  Result := List[Index] as IXMLIdDocAnt;
end;

{ TXMLIdDocAntPap }

function TXMLIdDocAntPap.Get_TpDoc: WideString;
begin
  Result := ChildNodes['tpDoc'].Text;
end;

procedure TXMLIdDocAntPap.Set_TpDoc(Value: WideString);
begin
  ChildNodes['tpDoc'].NodeValue := Value;
end;

function TXMLIdDocAntPap.Get_Serie: WideString;
begin
  Result := ChildNodes['serie'].Text;
end;

procedure TXMLIdDocAntPap.Set_Serie(Value: WideString);
begin
  ChildNodes['serie'].NodeValue := Value;
end;

function TXMLIdDocAntPap.Get_Subser: WideString;
begin
  Result := ChildNodes['subser'].Text;
end;

procedure TXMLIdDocAntPap.Set_Subser(Value: WideString);
begin
  ChildNodes['subser'].NodeValue := Value;
end;

function TXMLIdDocAntPap.Get_NDoc: WideString;
begin
  Result := ChildNodes['nDoc'].Text;
end;

procedure TXMLIdDocAntPap.Set_NDoc(Value: WideString);
begin
  ChildNodes['nDoc'].NodeValue := Value;
end;

function TXMLIdDocAntPap.Get_DEmi: WideString;
begin
  Result := ChildNodes['dEmi'].Text;
end;

procedure TXMLIdDocAntPap.Set_DEmi(Value: WideString);
begin
  ChildNodes['dEmi'].NodeValue := Value;
end;

{ TXMLIdDocAntPapList }

function TXMLIdDocAntPapList.Add: IXMLIdDocAntPap;
begin
  Result := AddItem(-1) as IXMLIdDocAntPap;
end;

function TXMLIdDocAntPapList.Insert(const Index: Integer): IXMLIdDocAntPap;
begin
  Result := AddItem(Index) as IXMLIdDocAntPap;
end;
function TXMLIdDocAntPapList.Get_Item(Index: Integer): IXMLIdDocAntPap;
begin
  Result := List[Index] as IXMLIdDocAntPap;
end;

{ TXMLIdDocAntEle }

function TXMLIdDocAntEle.Get_Chave: WideString;
begin
  Result := ChildNodes['chave'].Text;
end;

procedure TXMLIdDocAntEle.Set_Chave(Value: WideString);
begin
  ChildNodes['chave'].NodeValue := Value;
end;

{ TXMLIdDocAntEleList }

function TXMLIdDocAntEleList.Add: IXMLIdDocAntEle;
begin
  Result := AddItem(-1) as IXMLIdDocAntEle;
end;

function TXMLIdDocAntEleList.Insert(const Index: Integer): IXMLIdDocAntEle;
begin
  Result := AddItem(Index) as IXMLIdDocAntEle;
end;
function TXMLIdDocAntEleList.Get_Item(Index: Integer): IXMLIdDocAntEle;
begin
  Result := List[Index] as IXMLIdDocAntEle;
end;

{ TXMLSeg }

function TXMLSeg.Get_RespSeg: WideString;
begin
  Result := ChildNodes['respSeg'].Text;
end;

procedure TXMLSeg.Set_RespSeg(Value: WideString);
begin
  ChildNodes['respSeg'].NodeValue := Value;
end;

function TXMLSeg.Get_XSeg: WideString;
begin
  Result := ChildNodes['xSeg'].Text;
end;

procedure TXMLSeg.Set_XSeg(Value: WideString);
begin
  ChildNodes['xSeg'].NodeValue := Value;
end;

function TXMLSeg.Get_NApol: WideString;
begin
  Result := ChildNodes['nApol'].Text;
end;

procedure TXMLSeg.Set_NApol(Value: WideString);
begin
  ChildNodes['nApol'].NodeValue := Value;
end;

function TXMLSeg.Get_NAver: WideString;
begin
  Result := ChildNodes['nAver'].Text;
end;

procedure TXMLSeg.Set_NAver(Value: WideString);
begin
  ChildNodes['nAver'].NodeValue := Value;
end;

function TXMLSeg.Get_VCarga: WideString;
begin
  Result := ChildNodes['vCarga'].Text;
end;

procedure TXMLSeg.Set_VCarga(Value: WideString);
begin
  ChildNodes['vCarga'].NodeValue := Value;
end;

{ TXMLSegList }

function TXMLSegList.Add: IXMLSeg;
begin
  Result := AddItem(-1) as IXMLSeg;
end;

function TXMLSegList.Insert(const Index: Integer): IXMLSeg;
begin
  Result := AddItem(Index) as IXMLSeg;
end;
function TXMLSegList.Get_Item(Index: Integer): IXMLSeg;
begin
  Result := List[Index] as IXMLSeg;
end;

{ TXMLInfModal }

function TXMLInfModal.Get_VersaoModal: WideString;
begin
  Result := AttributeNodes['versaoModal'].Text;
end;

procedure TXMLInfModal.Set_VersaoModal(Value: WideString);
begin
  SetAttribute('versaoModal', Value);
end;

{ TXMLPeri }

function TXMLPeri.Get_NONU: WideString;
begin
  Result := ChildNodes['nONU'].Text;
end;

procedure TXMLPeri.Set_NONU(Value: WideString);
begin
  ChildNodes['nONU'].NodeValue := Value;
end;

function TXMLPeri.Get_XNomeAE: WideString;
begin
  Result := ChildNodes['xNomeAE'].Text;
end;

procedure TXMLPeri.Set_XNomeAE(Value: WideString);
begin
  ChildNodes['xNomeAE'].NodeValue := Value;
end;

function TXMLPeri.Get_XClaRisco: WideString;
begin
  Result := ChildNodes['xClaRisco'].Text;
end;

procedure TXMLPeri.Set_XClaRisco(Value: WideString);
begin
  ChildNodes['xClaRisco'].NodeValue := Value;
end;

function TXMLPeri.Get_GrEmb: WideString;
begin
  Result := ChildNodes['grEmb'].Text;
end;

procedure TXMLPeri.Set_GrEmb(Value: WideString);
begin
  ChildNodes['grEmb'].NodeValue := Value;
end;

function TXMLPeri.Get_QTotProd: WideString;
begin
  Result := ChildNodes['qTotProd'].Text;
end;

procedure TXMLPeri.Set_QTotProd(Value: WideString);
begin
  ChildNodes['qTotProd'].NodeValue := Value;
end;

function TXMLPeri.Get_QVolTipo: WideString;
begin
  Result := ChildNodes['qVolTipo'].Text;
end;

procedure TXMLPeri.Set_QVolTipo(Value: WideString);
begin
  ChildNodes['qVolTipo'].NodeValue := Value;
end;

function TXMLPeri.Get_PontoFulgor: WideString;
begin
  Result := ChildNodes['pontoFulgor'].Text;
end;

procedure TXMLPeri.Set_PontoFulgor(Value: WideString);
begin
  ChildNodes['pontoFulgor'].NodeValue := Value;
end;

{ TXMLPeriList }

function TXMLPeriList.Add: IXMLPeri;
begin
  Result := AddItem(-1) as IXMLPeri;
end;

function TXMLPeriList.Insert(const Index: Integer): IXMLPeri;
begin
  Result := AddItem(Index) as IXMLPeri;
end;
function TXMLPeriList.Get_Item(Index: Integer): IXMLPeri;
begin
  Result := List[Index] as IXMLPeri;
end;

{ TXMLVeicNovos }

function TXMLVeicNovos.Get_Chassi: WideString;
begin
  Result := ChildNodes['chassi'].Text;
end;

procedure TXMLVeicNovos.Set_Chassi(Value: WideString);
begin
  ChildNodes['chassi'].NodeValue := Value;
end;

function TXMLVeicNovos.Get_CCor: WideString;
begin
  Result := ChildNodes['cCor'].Text;
end;

procedure TXMLVeicNovos.Set_CCor(Value: WideString);
begin
  ChildNodes['cCor'].NodeValue := Value;
end;

function TXMLVeicNovos.Get_XCor: WideString;
begin
  Result := ChildNodes['xCor'].Text;
end;

procedure TXMLVeicNovos.Set_XCor(Value: WideString);
begin
  ChildNodes['xCor'].NodeValue := Value;
end;

function TXMLVeicNovos.Get_CMod: WideString;
begin
  Result := ChildNodes['cMod'].Text;
end;

procedure TXMLVeicNovos.Set_CMod(Value: WideString);
begin
  ChildNodes['cMod'].NodeValue := Value;
end;

function TXMLVeicNovos.Get_VUnit: WideString;
begin
  Result := ChildNodes['vUnit'].Text;
end;

procedure TXMLVeicNovos.Set_VUnit(Value: WideString);
begin
  ChildNodes['vUnit'].NodeValue := Value;
end;

function TXMLVeicNovos.Get_VFrete: WideString;
begin
  Result := ChildNodes['vFrete'].Text;
end;

procedure TXMLVeicNovos.Set_VFrete(Value: WideString);
begin
  ChildNodes['vFrete'].NodeValue := Value;
end;

{ TXMLVeicNovosList }

function TXMLVeicNovosList.Add: IXMLVeicNovos;
begin
  Result := AddItem(-1) as IXMLVeicNovos;
end;

function TXMLVeicNovosList.Insert(const Index: Integer): IXMLVeicNovos;
begin
  Result := AddItem(Index) as IXMLVeicNovos;
end;
function TXMLVeicNovosList.Get_Item(Index: Integer): IXMLVeicNovos;
begin
  Result := List[Index] as IXMLVeicNovos;
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

function TXMLFat.Get_NFat: WideString;
begin
  Result := ChildNodes['nFat'].Text;
end;

procedure TXMLFat.Set_NFat(Value: WideString);
begin
  ChildNodes['nFat'].NodeValue := Value;
end;

function TXMLFat.Get_VOrig: WideString;
begin
  Result := ChildNodes['vOrig'].Text;
end;

procedure TXMLFat.Set_VOrig(Value: WideString);
begin
  ChildNodes['vOrig'].NodeValue := Value;
end;

function TXMLFat.Get_VDesc: WideString;
begin
  Result := ChildNodes['vDesc'].Text;
end;

procedure TXMLFat.Set_VDesc(Value: WideString);
begin
  ChildNodes['vDesc'].NodeValue := Value;
end;

function TXMLFat.Get_VLiq: WideString;
begin
  Result := ChildNodes['vLiq'].Text;
end;

procedure TXMLFat.Set_VLiq(Value: WideString);
begin
  ChildNodes['vLiq'].NodeValue := Value;
end;

{ TXMLDup }

function TXMLDup.Get_NDup: WideString;
begin
  Result := ChildNodes['nDup'].Text;
end;

procedure TXMLDup.Set_NDup(Value: WideString);
begin
  ChildNodes['nDup'].NodeValue := Value;
end;

function TXMLDup.Get_DVenc: WideString;
begin
  Result := ChildNodes['dVenc'].Text;
end;

procedure TXMLDup.Set_DVenc(Value: WideString);
begin
  ChildNodes['dVenc'].NodeValue := Value;
end;

function TXMLDup.Get_VDup: WideString;
begin
  Result := ChildNodes['vDup'].Text;
end;

procedure TXMLDup.Set_VDup(Value: WideString);
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

{ TXMLInfCteSub }

procedure TXMLInfCteSub.AfterConstruction;
begin
  RegisterChildNode('tomaICMS', TXMLTomaICMS);
  RegisterChildNode('tomaNaoICMS', TXMLTomaNaoICMS);
  inherited;
end;

function TXMLInfCteSub.Get_ChCte: WideString;
begin
  Result := ChildNodes['chCte'].Text;
end;

procedure TXMLInfCteSub.Set_ChCte(Value: WideString);
begin
  ChildNodes['chCte'].NodeValue := Value;
end;

function TXMLInfCteSub.Get_TomaICMS: IXMLTomaICMS;
begin
  Result := ChildNodes['tomaICMS'] as IXMLTomaICMS;
end;

function TXMLInfCteSub.Get_TomaNaoICMS: IXMLTomaNaoICMS;
begin
  Result := ChildNodes['tomaNaoICMS'] as IXMLTomaNaoICMS;
end;

{ TXMLTomaICMS }

procedure TXMLTomaICMS.AfterConstruction;
begin
  RegisterChildNode('refNF', TXMLRefNF);
  inherited;
end;

function TXMLTomaICMS.Get_RefNFe: WideString;
begin
  Result := ChildNodes['refNFe'].Text;
end;

procedure TXMLTomaICMS.Set_RefNFe(Value: WideString);
begin
  ChildNodes['refNFe'].NodeValue := Value;
end;

function TXMLTomaICMS.Get_RefNF: IXMLRefNF;
begin
  Result := ChildNodes['refNF'] as IXMLRefNF;
end;

function TXMLTomaICMS.Get_RefCte: WideString;
begin
  Result := ChildNodes['refCte'].Text;
end;

procedure TXMLTomaICMS.Set_RefCte(Value: WideString);
begin
  ChildNodes['refCte'].NodeValue := Value;
end;

{ TXMLRefNF }

function TXMLRefNF.Get_CNPJ: WideString;
begin
  Result := ChildNodes['CNPJ'].Text;
end;

procedure TXMLRefNF.Set_CNPJ(Value: WideString);
begin
  ChildNodes['CNPJ'].NodeValue := Value;
end;

function TXMLRefNF.Get_CPF: WideString;
begin
  Result := ChildNodes['CPF'].Text;
end;

procedure TXMLRefNF.Set_CPF(Value: WideString);
begin
  ChildNodes['CPF'].NodeValue := Value;
end;

function TXMLRefNF.Get_Mod_: WideString;
begin
  Result := ChildNodes['mod'].Text;
end;

procedure TXMLRefNF.Set_Mod_(Value: WideString);
begin
  ChildNodes['mod'].NodeValue := Value;
end;

function TXMLRefNF.Get_Serie: WideString;
begin
  Result := ChildNodes['serie'].Text;
end;

procedure TXMLRefNF.Set_Serie(Value: WideString);
begin
  ChildNodes['serie'].NodeValue := Value;
end;

function TXMLRefNF.Get_Subserie: WideString;
begin
  Result := ChildNodes['subserie'].Text;
end;

procedure TXMLRefNF.Set_Subserie(Value: WideString);
begin
  ChildNodes['subserie'].NodeValue := Value;
end;

function TXMLRefNF.Get_Nro: WideString;
begin
  Result := ChildNodes['nro'].Text;
end;

procedure TXMLRefNF.Set_Nro(Value: WideString);
begin
  ChildNodes['nro'].NodeValue := Value;
end;

function TXMLRefNF.Get_Valor: WideString;
begin
  Result := ChildNodes['valor'].Text;
end;

procedure TXMLRefNF.Set_Valor(Value: WideString);
begin
  ChildNodes['valor'].NodeValue := Value;
end;

function TXMLRefNF.Get_DEmi: WideString;
begin
  Result := ChildNodes['dEmi'].Text;
end;

procedure TXMLRefNF.Set_DEmi(Value: WideString);
begin
  ChildNodes['dEmi'].NodeValue := Value;
end;

{ TXMLTomaNaoICMS }

function TXMLTomaNaoICMS.Get_RefCteAnu: WideString;
begin
  Result := ChildNodes['refCteAnu'].Text;
end;

procedure TXMLTomaNaoICMS.Set_RefCteAnu(Value: WideString);
begin
  ChildNodes['refCteAnu'].NodeValue := Value;
end;

{ TXMLInfCteComp }

function TXMLInfCteComp.Get_Chave: WideString;
begin
  Result := ChildNodes['chave'].Text;
end;

procedure TXMLInfCteComp.Set_Chave(Value: WideString);
begin
  ChildNodes['chave'].NodeValue := Value;
end;

{ TXMLInfCteAnu }

function TXMLInfCteAnu.Get_ChCte: WideString;
begin
  Result := ChildNodes['chCte'].Text;
end;

procedure TXMLInfCteAnu.Set_ChCte(Value: WideString);
begin
  ChildNodes['chCte'].NodeValue := Value;
end;

function TXMLInfCteAnu.Get_DEmi: WideString;
begin
  Result := ChildNodes['dEmi'].Text;
end;

procedure TXMLInfCteAnu.Set_DEmi(Value: WideString);
begin
  ChildNodes['dEmi'].NodeValue := Value;
end;

{ TXMLAutXML }

function TXMLAutXML.Get_CNPJ: WideString;
begin
  Result := ChildNodes['CNPJ'].Text;
end;

procedure TXMLAutXML.Set_CNPJ(Value: WideString);
begin
  ChildNodes['CNPJ'].NodeValue := Value;
end;

function TXMLAutXML.Get_CPF: WideString;
begin
  Result := ChildNodes['CPF'].Text;
end;

procedure TXMLAutXML.Set_CPF(Value: WideString);
begin
  ChildNodes['CPF'].NodeValue := Value;
end;

{ TXMLSignatureType }

procedure TXMLSignatureType.AfterConstruction;
begin
  RegisterChildNode('SignedInfo', TXMLSignedInfoType);
  RegisterChildNode('SignatureValue', TXMLSignatureValueType);
  RegisterChildNode('KeyInfo', TXMLKeyInfoType);
  inherited;
end;

function TXMLSignatureType.Get_Id: WideString;
begin
  Result := AttributeNodes['Id'].Text;
end;

procedure TXMLSignatureType.Set_Id(Value: WideString);
begin
  SetAttribute('Id', Value);
end;

function TXMLSignatureType.Get_SignedInfo: IXMLSignedInfoType;
begin
  Result := ChildNodes['SignedInfo'] as IXMLSignedInfoType;
end;

function TXMLSignatureType.Get_SignatureValue: IXMLSignatureValueType;
begin
  Result := ChildNodes['SignatureValue'] as IXMLSignatureValueType;
end;

function TXMLSignatureType.Get_KeyInfo: IXMLKeyInfoType;
begin
  Result := ChildNodes['KeyInfo'] as IXMLKeyInfoType;
end;

{ TXMLSignedInfoType }

procedure TXMLSignedInfoType.AfterConstruction;
begin
  RegisterChildNode('CanonicalizationMethod', TXMLCanonicalizationMethod);
  RegisterChildNode('SignatureMethod', TXMLSignatureMethod);
  RegisterChildNode('Reference', TXMLReferenceType);
  inherited;
end;

function TXMLSignedInfoType.Get_Id: WideString;
begin
  Result := AttributeNodes['Id'].Text;
end;

procedure TXMLSignedInfoType.Set_Id(Value: WideString);
begin
  SetAttribute('Id', Value);
end;

function TXMLSignedInfoType.Get_CanonicalizationMethod: IXMLCanonicalizationMethod;
begin
  Result := ChildNodes['CanonicalizationMethod'] as IXMLCanonicalizationMethod;
end;

function TXMLSignedInfoType.Get_SignatureMethod: IXMLSignatureMethod;
begin
  Result := ChildNodes['SignatureMethod'] as IXMLSignatureMethod;
end;

function TXMLSignedInfoType.Get_Reference: IXMLReferenceType;
begin
  Result := ChildNodes['Reference'] as IXMLReferenceType;
end;

{ TXMLCanonicalizationMethod }

function TXMLCanonicalizationMethod.Get_Algorithm: WideString;
begin
  Result := AttributeNodes['Algorithm'].Text;
end;

procedure TXMLCanonicalizationMethod.Set_Algorithm(Value: WideString);
begin
  SetAttribute('Algorithm', Value);
end;

{ TXMLSignatureMethod }

function TXMLSignatureMethod.Get_Algorithm: WideString;
begin
  Result := AttributeNodes['Algorithm'].Text;
end;

procedure TXMLSignatureMethod.Set_Algorithm(Value: WideString);
begin
  SetAttribute('Algorithm', Value);
end;

{ TXMLReferenceType }

procedure TXMLReferenceType.AfterConstruction;
begin
  RegisterChildNode('Transforms', TXMLTransformsType);
  RegisterChildNode('DigestMethod', TXMLDigestMethod);
  inherited;
end;

function TXMLReferenceType.Get_Id: WideString;
begin
  Result := AttributeNodes['Id'].Text;
end;

procedure TXMLReferenceType.Set_Id(Value: WideString);
begin
  SetAttribute('Id', Value);
end;

function TXMLReferenceType.Get_URI: WideString;
begin
  Result := AttributeNodes['URI'].Text;
end;

procedure TXMLReferenceType.Set_URI(Value: WideString);
begin
  SetAttribute('URI', Value);
end;

function TXMLReferenceType.Get_Type_: WideString;
begin
  Result := AttributeNodes['Type'].Text;
end;

procedure TXMLReferenceType.Set_Type_(Value: WideString);
begin
  SetAttribute('Type', Value);
end;

function TXMLReferenceType.Get_Transforms: IXMLTransformsType;
begin
  Result := ChildNodes['Transforms'] as IXMLTransformsType;
end;

function TXMLReferenceType.Get_DigestMethod: IXMLDigestMethod;
begin
  Result := ChildNodes['DigestMethod'] as IXMLDigestMethod;
end;

function TXMLReferenceType.Get_DigestValue: WideString;
begin
  Result := ChildNodes['DigestValue'].Text;
end;

procedure TXMLReferenceType.Set_DigestValue(Value: WideString);
begin
  ChildNodes['DigestValue'].NodeValue := Value;
end;

{ TXMLTransformsType }

procedure TXMLTransformsType.AfterConstruction;
begin
  RegisterChildNode('Transform', TXMLTransformType);
  ItemTag := 'Transform';
  ItemInterface := IXMLTransformType;
  inherited;
end;

function TXMLTransformsType.Get_Transform(Index: Integer): IXMLTransformType;
begin
  Result := List[Index] as IXMLTransformType;
end;

function TXMLTransformsType.Add: IXMLTransformType;
begin
  Result := AddItem(-1) as IXMLTransformType;
end;

function TXMLTransformsType.Insert(const Index: Integer): IXMLTransformType;
begin
  Result := AddItem(Index) as IXMLTransformType;
end;

{ TXMLTransformType }

procedure TXMLTransformType.AfterConstruction;
begin
  ItemTag := 'XPath';
  ItemInterface := IXMLNode;
  inherited;
end;

function TXMLTransformType.Get_Algorithm: WideString;
begin
  Result := AttributeNodes['Algorithm'].Text;
end;

procedure TXMLTransformType.Set_Algorithm(Value: WideString);
begin
  SetAttribute('Algorithm', Value);
end;

function TXMLTransformType.Get_XPath(Index: Integer): WideString;
begin
  Result := List[Index].Text;
end;

function TXMLTransformType.Add(const XPath: WideString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := XPath;
end;

function TXMLTransformType.Insert(const Index: Integer; const XPath: WideString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := XPath;
end;

{ TXMLDigestMethod }

function TXMLDigestMethod.Get_Algorithm: WideString;
begin
  Result := AttributeNodes['Algorithm'].Text;
end;

procedure TXMLDigestMethod.Set_Algorithm(Value: WideString);
begin
  SetAttribute('Algorithm', Value);
end;

{ TXMLSignatureValueType }

function TXMLSignatureValueType.Get_Id: WideString;
begin
  Result := AttributeNodes['Id'].Text;
end;

procedure TXMLSignatureValueType.Set_Id(Value: WideString);
begin
  SetAttribute('Id', Value);
end;

{ TXMLKeyInfoType }

procedure TXMLKeyInfoType.AfterConstruction;
begin
  RegisterChildNode('X509Data', TXMLX509DataType);
  inherited;
end;

function TXMLKeyInfoType.Get_Id: WideString;
begin
  Result := AttributeNodes['Id'].Text;
end;

procedure TXMLKeyInfoType.Set_Id(Value: WideString);
begin
  SetAttribute('Id', Value);
end;

function TXMLKeyInfoType.Get_X509Data: IXMLX509DataType;
begin
  Result := ChildNodes['X509Data'] as IXMLX509DataType;
end;

{ TXMLX509DataType }

function TXMLX509DataType.Get_X509Certificate: WideString;
begin
  Result := ChildNodes['X509Certificate'].Text;
end;

procedure TXMLX509DataType.Set_X509Certificate(Value: WideString);
begin
  ChildNodes['X509Certificate'].NodeValue := Value;
end;

{ TXMLTProtCTe }

procedure TXMLTProtCTe.AfterConstruction;
begin
  RegisterChildNode('infProt', TXMLInfProt);
  inherited;
end;

function TXMLTProtCTe.Get_Versao: WideString;
begin
  Result := AttributeNodes['versao'].Text;
end;

procedure TXMLTProtCTe.Set_Versao(Value: WideString);
begin
  SetAttribute('versao', Value);
end;

function TXMLTProtCTe.Get_InfProt: IXMLInfProt;
begin
  Result := ChildNodes['infProt'] as IXMLInfProt;
end;

{ TXMLInfProt }

function TXMLInfProt.Get_Id: WideString;
begin
  Result := AttributeNodes['Id'].Text;
end;

procedure TXMLInfProt.Set_Id(Value: WideString);
begin
  SetAttribute('Id', Value);
end;

function TXMLInfProt.Get_TpAmb: WideString;
begin
  Result := ChildNodes['tpAmb'].Text;
end;

procedure TXMLInfProt.Set_TpAmb(Value: WideString);
begin
  ChildNodes['tpAmb'].NodeValue := Value;
end;

function TXMLInfProt.Get_VerAplic: WideString;
begin
  Result := ChildNodes['verAplic'].Text;
end;

procedure TXMLInfProt.Set_VerAplic(Value: WideString);
begin
  ChildNodes['verAplic'].NodeValue := Value;
end;

function TXMLInfProt.Get_ChCTe: WideString;
begin
  Result := ChildNodes['chCTe'].Text;
end;

procedure TXMLInfProt.Set_ChCTe(Value: WideString);
begin
  ChildNodes['chCTe'].NodeValue := Value;
end;

function TXMLInfProt.Get_DhRecbto: WideString;
begin
  Result := ChildNodes['dhRecbto'].Text;
end;

procedure TXMLInfProt.Set_DhRecbto(Value: WideString);
begin
  ChildNodes['dhRecbto'].NodeValue := Value;
end;

function TXMLInfProt.Get_NProt: WideString;
begin
  Result := ChildNodes['nProt'].Text;
end;

procedure TXMLInfProt.Set_NProt(Value: WideString);
begin
  ChildNodes['nProt'].NodeValue := Value;
end;

function TXMLInfProt.Get_DigVal: WideString;
begin
  Result := ChildNodes['digVal'].Text;
end;

procedure TXMLInfProt.Set_DigVal(Value: WideString);
begin
  ChildNodes['digVal'].NodeValue := Value;
end;

function TXMLInfProt.Get_CStat: WideString;
begin
  Result := ChildNodes['cStat'].Text;
end;

procedure TXMLInfProt.Set_CStat(Value: WideString);
begin
  ChildNodes['cStat'].NodeValue := Value;
end;

function TXMLInfProt.Get_XMotivo: WideString;
begin
  Result := ChildNodes['xMotivo'].Text;
end;

procedure TXMLInfProt.Set_XMotivo(Value: WideString);
begin
  ChildNodes['xMotivo'].NodeValue := Value;
end;

end.

end.

unit geradorXml;

interface
uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Controls,
  Forms,
  Dialogs,
  ACBrBase,
  ACBrDFe,
  ACBrNFe ,
  strutils,
  math,
  TypInfo,
  DateUtils,
  synacode,
  blcksock,
   FileCtrl,
  IniFiles,
   Printers,
  ACBrUtil,
  ACBrUtil.FilesIO,
  ACBrUtil.DateTime,
  ACBrUtil.Strings,
  ACBrUtil.XMLHTML,
  pcnAuxiliar,
  pcnNFe,
  pcnConversao,
  pcnConversaoNFe,
  pcnNFeRTXT,
  pcnRetConsReciDFe,
  ACBrDFeSSL,
  ACBrDFeOpenSSL,
  ACBrDFeUtil,
  ACBrNFeNotasFiscais
   ;

type
  TgeraXml =class
  private
    Fnota: TACBrNFe;
  public
    function gerarXmlNFCE(NumDFe: String):string;
    function gerarXmlNfe(NumDFe: String):string;
    end;
implementation
       Uses utesteMain;
function TgeraXml.gerarXmlNFCE(NumDFe: String):string;
var
  Ok: Boolean;
  BaseCalculo,
  ValorICMS: Double;
begin
  try
    Fnota:= TACBrNFe.create(Nil);
    with  Fnota.NotasFiscais.Add.NFe do
    begin
      Ide.natOp     := 'VENDA';
      Ide.indPag    := ipVista;
      Ide.modelo    := 65;
      Ide.serie     := 1;
      Ide.nNF       := StrToInt(NumDFe);
      Ide.cNF       := GerarCodigoDFe(Ide.nNF);
      Ide.dEmi      := now;
      Ide.dSaiEnt   := now;
      Ide.hSaiEnt   := now;
      Ide.tpNF      := tnSaida;
      Ide.tpEmis    := teNormal;
      Ide.tpAmb     := taHomologacao;  //Lembre-se de trocar esta variavel quando for para ambiente de producao
      Ide.cUF       := 15; //PARA
      Ide.cMunFG    := 1506161;
      Ide.finNFe    := fnNormal;
      Ide.tpImp     := tiNFCe;
      Ide.indFinal  := cfConsumidorFinal;
      {
        valores aceitos pelo campo:
        pcNao, pcPresencial, pcInternet, pcTeleatendimento, pcEntregaDomicilio,
        pcPresencialForaEstabelecimento, pcOutros
      }
      Ide.indPres   := pcPresencial;

      {
        abaixo o campo incluido no layout a partir da NT 2020/006
      }
      {
        valores aceitos pelo campo:
        iiSemOperacao, iiOperacaoSemIntermediador, iiOperacaoComIntermediador
      }
      // Indicador de intermediador/marketplace
      Ide.indIntermed := iiSemOperacao;

  //     Ide.dhCont := date;
  //     Ide.xJust  := 'Justificativa Contingencia';

      Emit.CNPJCPF           := '13100071000108';
      Emit.IE                := '153257717';
      Emit.xNome             := 'D M PRODUTOS AGROPECUARIOS LTDA';
      Emit.xFant             := 'D M PRODUTOS AGROPECUARIOS LTDA';

      Emit.EnderEmit.fone    := '9434282090';
      Emit.EnderEmit.CEP     := 68530000;
      Emit.EnderEmit.xLgr    := 'SN';
      Emit.EnderEmit.nro     := '0';
      Emit.EnderEmit.xCpl    := '';
      Emit.EnderEmit.xBairro := 'CENTRO';
      Emit.EnderEmit.cMun    := 1506161;
      Emit.EnderEmit.xMun    := 'RIO MARIA';
      Emit.EnderEmit.UF      := 'PA';
      Emit.enderEmit.cPais   := 1058;
      Emit.enderEmit.xPais   := 'BRASIL';

      Emit.IEST := '';

      Emit.CRT  :=crtRegimeNormal;

      // Na NFC-e o Destinatário é opcional
      {
      Dest.CNPJCPF           := 'informar o CPF do destinatário';
      Dest.ISUF              := '';
      Dest.xNome             := 'nome do destinatário';

      Dest.indIEDest         := inNaoContribuinte;

      Dest.EnderDest.Fone    := '1533243333';
      Dest.EnderDest.CEP     := 18270170;
      Dest.EnderDest.xLgr    := 'Rua Coronel Aureliano de Camargo';
      Dest.EnderDest.nro     := '973';
      Dest.EnderDest.xCpl    := '';
      Dest.EnderDest.xBairro := 'Centro';
      Dest.EnderDest.cMun    := 3554003;
      Dest.EnderDest.xMun    := 'Tatuí';
      Dest.EnderDest.UF      := 'SP';
      Dest.EnderDest.cPais   := 1058;
      Dest.EnderDest.xPais   := 'BRASIL';
      }

  //Use os campos abaixo para informar o endereço de retirada quando for diferente do Remetente/Destinatário
      Retirada.CNPJCPF := '';
      Retirada.xLgr    := '';
      Retirada.nro     := '';
      Retirada.xCpl    := '';
      Retirada.xBairro := '';
      Retirada.cMun    := 0;
      Retirada.xMun    := '';
      Retirada.UF      := '';

      Entrega.CNPJCPF := '';
      Entrega.xLgr    := '';
      Entrega.nro     := '';
      Entrega.xCpl    := '';
      Entrega.xBairro := '';
      Entrega.cMun    := 0;
      Entrega.xMun    := '';
      Entrega.UF      := '';


      with Det.New do
      begin
        Prod.nItem    := 1;
        Prod.cProd    := '201469';
        Prod.cEAN     := 'SEM GTIN';
        Prod.xProd    := 'JACARE 20 LT BLD';
        Prod.NCM      := '38089322';
        Prod.EXTIPI   := '';
        Prod.CFOP     := '5101';
        Prod.uCom     := 'UN';
        Prod.qCom     := 1;
        Prod.vUnCom   := 100;
        Prod.vProd    := 100;

        Prod.cEANTrib  := 'SEM GTIN';
        Prod.uTrib     := 'UN';
        Prod.qTrib     := 1;
        Prod.vUnTrib   := 100;

        Prod.vOutro    := 0;
        Prod.vFrete    := 0;
        Prod.vSeg      := 0;
        Prod.vDesc     := 0;

        Prod.CEST := '1111111';

  //         infAdProd      := 'Informação Adicional do Produto';

        {
          abaixo os campos incluidos no layout a partir da NT 2020/005
        }
        // Opcional - Preencher com o Código de Barras próprio ou de terceiros que seja diferente do padrão GTIN
        // por exemplo: código de barras de catálogo, partnumber, etc
        Prod.cBarra :='7896476200012';
        // Opcional - Preencher com o Código de Barras próprio ou de terceiros que seja diferente do padrão GTIN
        //  correspondente àquele da menor unidade comercializável identificado por Código de Barras
        // por exemplo: código de barras de catálogo, partnumber, etc
        Prod.cBarraTrib := '7896476200012';

        // Declaração de Importação. Pode ser adicionada várias através do comando Prod.DI.New
        (*
        with Prod.DI.New do
        begin
          nDi         := '';
          dDi         := now;
          xLocDesemb  := '';
          UFDesemb    := '';
          dDesemb     := now;
          {
            tvMaritima, tvFluvial, tvLacustre, tvAerea, tvPostal, tvFerroviaria, tvRodoviaria,

            abaixo os novos valores incluidos a partir da NT 2020/005

            tvConduto, tvMeiosProprios, tvEntradaSaidaFicta, tvCourier, tvEmMaos, tvPorReboque
          }
          tpViaTransp := tvRodoviaria;
          vAFRMM := 0;
          {
            tiContaPropria, tiContaOrdem, tiEncomenda
          }
          tpIntermedio := tiContaPropria;
          CNPJ := '';
          UFTerceiro := '';
          cExportador := '';

          with adi.New do
          begin
            nAdicao     := 1;
            nSeqAdi     := 1;
            cFabricante := '';
            vDescDI     := 0;
            nDraw       := '';
          end;
        end;
        *)

        with Imposto do
        begin
          // lei da transparencia nos impostos
          vTotTrib := 0;

          with ICMS do
          begin
            // caso o CRT seja:
            // 1=Simples Nacional
            // Os valores aceitos para CSOSN são:
            // csosn101, csosn102, csosn103, csosn201, csosn202, csosn203,
            // csosn300, csosn400, csosn500,csosn900

            // 2=Simples Nacional, excesso sublimite de receita bruta;
            // ou 3=Regime Normal.
            // Os valores aceitos para CST são:
            // cst00, cst10, cst20, cst30, cst40, cst41, cst45, cst50, cst51,
            // cst60, cst70, cst80, cst81, cst90, cstPart10, cstPart90,
            // cstRep41, cstVazio, cstICMSOutraUF, cstICMSSN, cstRep60

            // (consulte o contador do seu cliente para saber qual deve ser utilizado)
            // Pode variar de um produto para outro.

            if Emit.CRT in [crtSimplesExcessoReceita, crtRegimeNormal] then
              CST := cst00
            else
              CSOSN := csosn102;

            orig    := oeNacional;
            modBC   := dbiValorOperacao;

            if Emit.CRT in [crtSimplesExcessoReceita, crtRegimeNormal] then
              BaseCalculo := 100
            else
              BaseCalculo := 0;

            vBC     := BaseCalculo;
            pICMS   := 18;

            ValorICMS := (vBC * pICMS)/100;

            vICMS   := ValorICMS;
            modBCST := dbisMargemValorAgregado;
            pMVAST  := 0;
            pRedBCST:= 0;
            vBCST   := 0;
            pICMSST := 0;
            vICMSST := 0;
            pRedBC  := 0;

            pCredSN := 5;
            vCredICMSSN := 50;
            vBCFCPST := 100;
            pFCPST := 2;
            vFCPST := 2;
            vBCSTRet := 0;
            pST := 0;
            vICMSSubstituto := 0;
            vICMSSTRet := 0;

            vBCFCPSTRet := 0;
            pFCPSTRet := 0;
            vFCPSTRet := 0;
            pRedBCEfet := 0;
            vBCEfet := 0;
            pICMSEfet := 0;
            vICMSEfet := 0;

            {
              abaixo os campos incluidos no layout a partir da NT 2020/005
            }
            // Informar apenas nos motivos de desoneração documentados abaixo
            vICMSSTDeson := 0;
            {
              o campo abaixo só aceita os valores:
              mdiProdutorAgropecuario, mdiOutros, mdiOrgaoFomento
              Campo será preenchido quando o campo anterior estiver preenchido.
            }
            motDesICMSST := mdiOutros;

            // Percentual do diferimento do ICMS relativo ao Fundo de Combate à Pobreza (FCP).
            // No caso de diferimento total, informar o percentual de diferimento "100"
            pFCPDif := 0;
            // Valor do ICMS relativo ao Fundo de Combate à Pobreza (FCP) diferido
            vFCPDif := 0;
            // Valor do ICMS relativo ao Fundo de Combate à Pobreza (FCP) realmente devido.
            vFCPEfet := 0;

            // partilha do ICMS e fundo de probreza
            with ICMSUFDest do
            begin
              vBCUFDest      := 0.00;
              pFCPUFDest     := 0.00;
              pICMSUFDest    := 0.00;
              pICMSInter     := 0.00;
              pICMSInterPart := 0.00;
              vFCPUFDest     := 0.00;
              vICMSUFDest    := 0.00;
              vICMSUFRemet   := 0.00;
            end;
          end;

          with PIS do
          begin
            CST      := pis99;
            PIS.vBC  := 0;
            PIS.pPIS := 0;
            PIS.vPIS := 0;

            PIS.qBCProd   := 0;
            PIS.vAliqProd := 0;
            PIS.vPIS      := 0;
          end;

          with PISST do
          begin
            vBc       := 0;
            pPis      := 0;
            qBCProd   := 0;
            vAliqProd := 0;
            vPIS      := 0;
            {
              abaixo o campo incluido no layout a partir da NT 2020/005
            }
            {
              valores aceitos pelo campo:
              ispNenhum, ispPISSTNaoCompoe, ispPISSTCompoe
            }
            // Indica se o valor do PISST compõe o valor total da NF-e
            IndSomaPISST :=  ispNenhum;
          end;

          with COFINS do
          begin
            CST            := cof99;
            COFINS.vBC     := 0;
            COFINS.pCOFINS := 0;
            COFINS.vCOFINS := 0;

            COFINS.qBCProd   := 0;
            COFINS.vAliqProd := 0;
          end;

          with COFINSST do
          begin
            vBC       := 0;
            pCOFINS   := 0;
            qBCProd   := 0;
            vAliqProd := 0;
            vCOFINS   := 0;
            {
              abaixo o campo incluido no layout a partir da NT 2020/005
            }
            {
              valores aceitos pelo campo:
              iscNenhum, iscCOFINSSTNaoCompoe, iscCOFINSSTCompoe
            }
            // Indica se o valor da COFINS ST compõe o valor total da NF-e
            indSomaCOFINSST :=  iscNenhum;
          end;
        end;
      end;

      Total.ICMSTot.vBC     := BaseCalculo;
      Total.ICMSTot.vICMS   := ValorICMS;
      Total.ICMSTot.vBCST   := 0;
      Total.ICMSTot.vST     := 0;
      Total.ICMSTot.vProd   := 100;
      Total.ICMSTot.vFrete  := 0;
      Total.ICMSTot.vSeg    := 0;
      Total.ICMSTot.vDesc   := 0;
      Total.ICMSTot.vII     := 0;
      Total.ICMSTot.vIPI    := 0;
      Total.ICMSTot.vPIS    := 0;
      Total.ICMSTot.vCOFINS := 0;
      Total.ICMSTot.vOutro  := 0;
      Total.ICMSTot.vNF     := 100;

      // partilha do icms e fundo de probreza
      Total.ICMSTot.vFCPUFDest   := 0.00;
      Total.ICMSTot.vICMSUFDest  := 0.00;
      Total.ICMSTot.vICMSUFRemet := 0.00;

      Total.ISSQNtot.vServ   := 0;
      Total.ISSQNTot.vBC     := 0;
      Total.ISSQNTot.vISS    := 0;
      Total.ISSQNTot.vPIS    := 0;
      Total.ISSQNTot.vCOFINS := 0;

      Total.retTrib.vRetPIS    := 0;
      Total.retTrib.vRetCOFINS := 0;
      Total.retTrib.vRetCSLL   := 0;
      Total.retTrib.vBCIRRF    := 0;
      Total.retTrib.vIRRF      := 0;
      Total.retTrib.vBCRetPrev := 0;
      Total.retTrib.vRetPrev   := 0;

      Transp.modFrete := mfSemFrete; // NFC-e não pode ter FRETE

      with pag.New do
      begin
        tPag := fpDinheiro;
        {
          abaixo o campo incluido no layout a partir da NT 2020/006
        }
        {
          se tPag for fpOutro devemos incluir o campo xPag
        xPag := 'Caderneta';
        }
        vPag := 100;
      end;

      // O grupo infIntermed só deve ser gerado nos casos de operação não presencial
      // pela internet em site de terceiros (Intermediadores).
  //    infIntermed.CNPJ := '';
  //    infIntermed.idCadIntTran := '';

      InfAdic.infCpl     :=  '';
      InfAdic.infAdFisco :=  '';

      with InfAdic.obsCont.New do
      begin
        xCampo := 'ObsCont';
        xTexto := 'Texto';
      end;

      with InfAdic.obsFisco.New do
      begin
        xCampo := 'ObsFisco';
        xTexto := 'Texto';
      end;

      {
        abaixo o campo incluido no layout a partir da NT 2020/006
      }
      // CNPJ do Intermediador da Transação (agenciador, plataforma de delivery,
      // marketplace e similar) de serviços e de negócios.
      infIntermed.CNPJ := '';
      // Nome do usuário ou identificação do perfil do vendedor no site do intermediador
      // (agenciador, plataforma de delivery, marketplace e similar) de serviços e de
      // negócios.
      infIntermed.idCadIntTran := '';
    end;
    Fnota.NotasFiscais.GerarNFe;
    result:=(Fnota.NotasFiscais[0].XML) ;
    if DebugHook >0  then
    begin
      ForceDirectories(ExtractFilePath(GetModuleName(HInstance))+'\outputLog\');
       with tstringList.Create do
       begin
          text :=Fnota.NotasFiscais[0].XML;
          SaveToFile(ExtractFilePath(GetModuleName(HInstance))+'\outputLog\Nfce- '+Fnota.NotasFiscais[0].NFe.infNFe.ID+'.xml');
          free;
       end;
    end;
  finally
    freeAndNil(Fnota)
  end;
end;

function TgeraXml.gerarXmlNFE(NumDFe: String):string;
var
  Ok: Boolean;
  NotaF: NotaFiscal;
  Produto: TDetCollectionItem;

  Volume: TVolCollectionItem;
  Duplicata: TDupCollectionItem;
  ObsComplementar: TobsContCollectionItem;
  ObsFisco: TobsFiscoCollectionItem;

  InfoPgto: TpagCollectionItem;
begin
  Fnota:=TACBrNFe.create(Nil);
  try
    NotaF := Fnota.NotasFiscais.Add;
    NotaF.NFe.Ide.natOp     := 'VENDA PRODUCAO DO ESTAB.';
    NotaF.NFe.Ide.indPag    := ipVista;
    NotaF.NFe.Ide.modelo    := 55;
    NotaF.NFe.Ide.serie     := 1;
    NotaF.NFe.Ide.nNF       := StrToInt(NumDFe);
    NotaF.NFe.Ide.cNF       := GerarCodigoDFe(NotaF.NFe.Ide.nNF);
    NotaF.NFe.Ide.dEmi      := Date;
    NotaF.NFe.Ide.dSaiEnt   := Date;
    NotaF.NFe.Ide.hSaiEnt   := Now;
    NotaF.NFe.Ide.tpNF      := tnSaida;
    NotaF.NFe.Ide.tpEmis    := teNormal ;
    NotaF.NFe.Ide.tpAmb     := taHomologacao;  //Lembre-se de trocar esta variável quando for para ambiente de produção
    NotaF.NFe.Ide.verProc   := '1.0.0.0';
    NotaF.NFe.Ide.cUF       :=15;
    NotaF.NFe.Ide.cMunFG    :=1501402;
    NotaF.NFe.Ide.finNFe    := fnNormal;



    // Valores aceitos:
    // iiSemOperacao, iiOperacaoSemIntermediador, iiOperacaoComIntermediador
  //  NotaF.NFe.Ide.indIntermed := iiSemOperacao;

  //  NotaF.NFe.Ide.dhCont := date;
  //  NotaF.NFe.Ide.xJust  := 'Justificativa Contingencia';

    {
      abaixo o campo incluido no layout a partir da NT 2020/006
    }
    {
      valores aceitos pelo campo:
      iiSemOperacao, iiOperacaoSemIntermediador, iiOperacaoComIntermediador
    }
    // Indicador de intermediador/marketplace
    NotaF.NFe.Ide.indIntermed := iiSemOperacao;


    //Para NFe referenciada use os campos abaixo
    (*
    Referenciada := NotaF.NFe.Ide.NFref.Add;
    Referenciada.refNFe       := ''; //NFe Eletronica

    Referenciada.RefNF.cUF    := 0;  // |
    Referenciada.RefNF.AAMM   := ''; // |
    Referenciada.RefNF.CNPJ   := ''; // |
    Referenciada.RefNF.modelo := 1;  // |- NFe Modelo 1/1A
    Referenciada.RefNF.serie  := 1;  // |
    Referenciada.RefNF.nNF    := 0;  // |

    Referenciada.RefNFP.cUF     := 0;  // |
    Referenciada.RefNFP.AAMM    := ''; // |
    Referenciada.RefNFP.CNPJCPF := ''; // |
    Referenciada.RefNFP.IE      := ''; // |- NF produtor Rural
    Referenciada.RefNFP.modelo  := ''; // |
    Referenciada.RefNFP.serie   := 1;  // |
    Referenciada.RefNFP.nNF     := 0;  // |

    Referenciada.RefECF.modelo  := ECFModRef2B; // |
    Referenciada.RefECF.nECF    := '';          // |- Cupom Fiscal
    Referenciada.RefECF.nCOO    := '';          // |
    *)
    NotaF.nfe.Emit.CNPJCPF           := _cnpj;
    NotaF.nfe.Emit.IE                := _ie;
    NotaF.nfe.Emit.xNome             := 'WK TESTE S.A.';
    NotaF.nfe.Emit.xFant             := 'WK TESTE S.A.';
    NotaF.nfe.Emit.EnderEmit.fone    := '9434282090';
    NotaF.nfe.Emit.EnderEmit.CEP     := 79560000;
    NotaF.nfe.Emit.EnderEmit.xLgr    := 'SN';
    NotaF.nfe.Emit.EnderEmit.nro     := '0';
    NotaF.nfe.Emit.EnderEmit.xCpl    := '';
    NotaF.nfe.Emit.EnderEmit.xBairro := 'CENTRO';
    NotaF.nfe.Emit.EnderEmit.cMun    := 5002951 ;
    NotaF.nfe.Emit.EnderEmit.xMun    := 'CHAPADAO DO SUL';
    NotaF.nfe.Emit.EnderEmit.UF      := 'MS';
    NotaF.nfe.Emit.enderEmit.cPais   := 1058;
    NotaF.nfe.Emit.enderEmit.xPais   := 'BRASIL';

    NotaF.NFe.Emit.IEST              := '';
    NotaF.NFe.Emit.IM                := '2648800'; // Preencher no caso de existir serviços na nota
    NotaF.NFe.Emit.CNAE              := '6201500'; // Verifique na cidade do emissor da NFe se é permitido
                                                   // a inclusão de serviços na NFe

      // esta sendo somando 1 uma vez que o ItemIndex inicia do zero e devemos
      // passar os valores 1, 2 ou 3
      // (1-crtSimplesNacional, 2-crtSimplesExcessoReceita, 3-crtRegimeNormal)
    NotaF.NFe.Emit.CRT  := crtRegimeNormal;

  //Para NFe Avulsa preencha os campos abaixo

    NotaF.NFe.Avulsa.CNPJ    := '';
    NotaF.NFe.Avulsa.xOrgao  := '';
    NotaF.NFe.Avulsa.matr    := '';
    NotaF.NFe.Avulsa.xAgente := '';
    NotaF.NFe.Avulsa.fone    := '';
    NotaF.NFe.Avulsa.UF      := '';
    NotaF.NFe.Avulsa.nDAR    := '';
    NotaF.NFe.Avulsa.dEmi    := now;
    NotaF.NFe.Avulsa.vDAR    := 0;
    NotaF.NFe.Avulsa.repEmi  := '';
    NotaF.NFe.Avulsa.dPag    := now;


    NotaF.NFe.Dest.CNPJCPF           := '33631727100';
    NotaF.NFe.Dest.indIEDest         :=inIsento;
    NotaF.NFe.Dest.IE                := 'INSENTO';
    NotaF.NFe.Dest.Email             := 'wilson.rodrigues@mail.wktechnology.com.br';
    NotaF.NFe.Dest.ISUF              := '';
    NotaF.NFe.Dest.xNome             := 'WK CONSULTURIA';

    NotaF.NFe.Dest.EnderDest.Fone    := '1532599600';
    NotaF.NFe.Dest.EnderDest.CEP     := 18270170;
    NotaF.NFe.Dest.EnderDest.xLgr    := 'SR 52 QUADARA 72 LOTE 22';
    NotaF.NFe.Dest.EnderDest.nro     := '973';
    NotaF.NFe.Dest.EnderDest.xCpl    := '';
    NotaF.NFe.Dest.EnderDest.xBairro := 'Centro';
    NotaF.NFe.Dest.EnderDest.cMun    := 1501402;
    NotaF.NFe.Dest.EnderDest.xMun    := 'RIO MARIA';
    NotaF.NFe.Dest.EnderDest.UF      := 'PA';
    NotaF.NFe.Dest.EnderDest.cPais   := 1058;
    NotaF.NFe.Dest.EnderDest.xPais   := 'BRASIL';

  //Use os campos abaixo para informar o endereço de retirada quando for diferente do Remetente/Destinatário

    NotaF.NFe.Retirada.CNPJCPF := '';
    NotaF.NFe.Retirada.xLgr    := '';
    NotaF.NFe.Retirada.nro     := '';
    NotaF.NFe.Retirada.xCpl    := '';
    NotaF.NFe.Retirada.xBairro := '';
    NotaF.NFe.Retirada.cMun    := 0;
    NotaF.NFe.Retirada.xMun    := '';
    NotaF.NFe.Retirada.UF      := '';

  //Use os campos abaixo para informar o endereço de entrega quando for diferente do Remetente/Destinatário

    NotaF.NFe.Entrega.CNPJCPF := '';
    NotaF.NFe.Entrega.xLgr    := '';
    NotaF.NFe.Entrega.nro     := '';
    NotaF.NFe.Entrega.xCpl    := '';
    NotaF.NFe.Entrega.xBairro := '';
    NotaF.NFe.Entrega.cMun    := 0;
    NotaF.NFe.Entrega.xMun    := '';
    NotaF.NFe.Entrega.UF      := '';

  //Adicionando Produtos
    Produto := NotaF.NFe.Det.New;
    Produto.prod.nItem    := 1;
    Produto.prod.cProd    := '201469';
    Produto.Prod.cEAN     := 'SEM GTIN';
    Produto.Prod.xProd    := 'JACARE 20 LT BLD';
    Produto.Prod.NCM      := '38089322';
    Produto.Prod.EXTIPI   := '';

    Produto.Prod.CFOP     := '5101';
    Produto.Prod.uCom     := 'UN';
    Produto.Prod.qCom     := 1;
    Produto.Prod.vUnCom   := 100;
    Produto.Prod.vProd    := 100;

    Produto.Prod.cEANTrib  := 'SEM GTIN';
    Produto.Prod.uTrib     := 'UN';
    Produto.Prod.qTrib     := 1;
    Produto.Prod.vUnTrib   := 100;

    Produto.Prod.vOutro    := 0;
    Produto.Prod.vFrete    := 0;
    Produto.Prod.vSeg      := 0;
    Produto.Prod.vDesc     := 0;

    Produto.Prod.CEST := '1111111';

    Produto.infAdProd := 'Informacao Adicional do Produto';

    {
      abaixo os campos incluidos no layout a partir da NT 2020/005
    }
    // Opcional - Preencher com o Código de Barras próprio ou de terceiros que seja diferente do padrão GTIN
    // por exemplo: código de barras de catálogo, partnumber, etc
    Produto.Prod.cBarra := '7896476200012';
    // Opcional - Preencher com o Código de Barras próprio ou de terceiros que seja diferente do padrão GTIN
    //  correspondente àquele da menor unidade comercializável identificado por Código de Barras
    // por exemplo: código de barras de catálogo, partnumber, etc
    Produto.Prod.cBarraTrib := '7896476200012';

    // Declaração de Importação. Pode ser adicionada várias através do comando Prod.DI.Add
    (*
    DI := Produto.Prod.DI.Add;
    DI.nDi         := '';
    DI.dDi         := now;
    DI.xLocDesemb  := '';
    DI.UFDesemb    := '';
    DI.dDesemb     := now;
    {
      tvMaritima, tvFluvial, tvLacustre, tvAerea, tvPostal, tvFerroviaria, tvRodoviaria,

      abaixo os novos valores incluidos a partir da NT 2020/005

      tvConduto, tvMeiosProprios, tvEntradaSaidaFicta, tvCourier, tvEmMaos, tvPorReboque
    }
    DI.tpViaTransp := tvRodoviaria;
    DI.vAFRMM := 0;
    {
      tiContaPropria, tiContaOrdem, tiEncomenda
    }
    DI.tpIntermedio := tiContaPropria;
    DI.CNPJ := '';
    DI.UFTerceiro := '';
    DI.cExportador := '';

    Adicao := DI.adi.Add;
    Adicao.nAdicao     := 1;
    Adicao.nSeqAdi     := 1;
    Adicao.cFabricante := '';
    Adicao.vDescDI     := 0;
    Adicao.nDraw       := '';
    *)

  //Campos para venda de veículos novos

    Produto.Prod.veicProd.tpOP    := toVendaConcessionaria;
    Produto.Prod.veicProd.chassi  := '';
    Produto.Prod.veicProd.cCor    := '';
    Produto.Prod.veicProd.xCor    := '';
    Produto.Prod.veicProd.pot     := '';
    Produto.Prod.veicProd.Cilin   := '';
    Produto.Prod.veicProd.pesoL   := '';
    Produto.Prod.veicProd.pesoB   := '';
    Produto.Prod.veicProd.nSerie  := '';
    Produto.Prod.veicProd.tpComb  := '';
    Produto.Prod.veicProd.nMotor  := '';
    Produto.Prod.veicProd.CMT     := '';
    Produto.Prod.veicProd.dist    := '';
    Produto.Prod.veicProd.anoMod  := 0;
    Produto.Prod.veicProd.anoFab  := 0;
    Produto.Prod.veicProd.tpPint  := '';
    Produto.Prod.veicProd.tpVeic  := 0;
    Produto.Prod.veicProd.espVeic := 0;
    Produto.Prod.veicProd.VIN     := '';
    Produto.Prod.veicProd.condVeic := cvAcabado;
    Produto.Prod.veicProd.cMod    := '';

  // Campos de Rastreabilidade do produto
    {
    O grupo <rastro> permiti a rastreabilidade de qualquer produto sujeito a
    regulações sanitárias, casos de recolhimento/recall, além de defensivos agrícolas,
    produtos veterinários, odontológicos, medicamentos, bebidas, águas envasadas,
    embalagens, etc., a partir da indicação de informações de número de lote,
    data de fabricação/produção, data de validade, etc.
    Obrigatório o preenchimento deste grupo no caso de medicamentos e
    produtos farmacêuticos.
    }

    // Ocorrências: 0 - 500
    (*
    Rastro := Produto.Prod.rastro.Add;

    Rastro.nLote  := '17H8F5';
    Rastro.qLote  := 1;
    Rastro.dFab   := StrToDate('01/08/2017');
    Rastro.dVal   := StrToDate('01/08/2019');
    Rastro.cAgreg := ''; // Código de Agregação (opcional) de 1 até 20 dígitos
    *)

  //Campos específicos para venda de medicamentos

    // Ocorrências: 1 - 500 ==> 1 - 1 (4.00)
    (*
    Medicamento := Produto.Prod.med.Add;

    Medicamento.cProdANVISA := '1256802470029';
    Medicamento.vPMC        := 100.00; // Preço máximo consumidor
    *)

  //Campos específicos para venda de armamento
    (*
    Arma := Produto.Prod.arma.Add;
    Arma.nSerie := 0;
    Arma.tpArma := taUsoPermitido;
    Arma.nCano  := 0;
    Arma.descr  := '';
    *)

  //Campos específicos para venda de combustível(distribuidoras)

    Produto.Prod.comb.cProdANP := 0;
    Produto.Prod.comb.CODIF    := '';
    Produto.Prod.comb.qTemp    := 0;
    Produto.Prod.comb.UFcons   := '';

    Produto.Prod.comb.CIDE.qBCprod   := 0;
    Produto.Prod.comb.CIDE.vAliqProd := 0;
    Produto.Prod.comb.CIDE.vCIDE     := 0;

    Produto.Prod.comb.ICMS.vBCICMS   := 0;
    Produto.Prod.comb.ICMS.vICMS     := 0;
    Produto.Prod.comb.ICMS.vBCICMSST := 0;
    Produto.Prod.comb.ICMS.vICMSST   := 0;

    Produto.Prod.comb.ICMSInter.vBCICMSSTDest := 0;
    Produto.Prod.comb.ICMSInter.vICMSSTDest   := 0;

    Produto.Prod.comb.ICMSCons.vBCICMSSTCons := 0;
    Produto.Prod.comb.ICMSCons.vICMSSTCons   := 0;
    Produto.Prod.comb.ICMSCons.UFcons        := '';


    with Produto.Imposto do
    begin
      // lei da transparencia nos impostos
      vTotTrib := 0;

      with ICMS do
      begin
        // caso o CRT seja:
        // 1=Simples Nacional
        // Os valores aceitos para CSOSN são:
        // csosn101, csosn102, csosn103, csosn201, csosn202, csosn203,
        // csosn300, csosn400, csosn500,csosn900

        // 2=Simples Nacional, excesso sublimite de receita bruta;
        // ou 3=Regime Normal.
        // Os valores aceitos para CST são:
        // cst00, cst10, cst20, cst30, cst40, cst41, cst45, cst50, cst51,
        // cst60, cst70, cst80, cst81, cst90, cstPart10, cstPart90,
        // cstRep41, cstVazio, cstICMSOutraUF, cstICMSSN, cstRep60

        // (consulte o contador do seu cliente para saber qual deve ser utilizado)
        // Pode variar de um produto para outro.

        orig := oeNacional;

        if NotaF.NFe.Emit.CRT in [crtSimplesExcessoReceita, crtRegimeNormal] then
        begin
          CST     := cst00;
          modBC   := dbiPrecoTabelado;
          vBC     := 100;
          pICMS   := 18;
          vICMS   := 18;
          modBCST := dbisMargemValorAgregado;
          pMVAST  := 0;
          pRedBCST:= 0;
          vBCST   := 0;
          pICMSST := 0;
          vICMSST := 0;
          pRedBC  := 0;
        end
        else
        begin
          CSOSN   := csosn101;
          modBC   := dbiValorOperacao;
          pCredSN := 5;
          vCredICMSSN := 100 * pCredSN / 100;;
          vBC     := 0;
          pICMS   := 0;
          vICMS   := 0;
          modBCST := dbisListaNeutra;
          pMVAST  := 0;
          pRedBCST:= 0;
          vBCST   := 0;
          pICMSST := 0;
          vICMSST := 0;
        end;

        vBCFCPST := 100;
        pFCPST := 2;
        vFCPST := 2;
        vBCSTRet := 0;
        pST := 0;
        vICMSSubstituto := 0;
        vICMSSTRet := 0;

        vBCFCPSTRet := 0;
        pFCPSTRet := 0;
        vFCPSTRet := 0;
        pRedBCEfet := 0;
        vBCEfet := 0;
        pICMSEfet := 0;
        vICMSEfet := 0;

        {
          abaixo os campos incluidos no layout a partir da NT 2020/005
        }
        // Informar apenas nos motivos de desoneração documentados abaixo
        vICMSSTDeson := 0;
        {
          o campo abaixo só aceita os valores:
          mdiProdutorAgropecuario, mdiOutros, mdiOrgaoFomento
          Campo será preenchido quando o campo anterior estiver preenchido.
        }
        motDesICMSST := mdiOutros;

        // Percentual do diferimento do ICMS relativo ao Fundo de Combate à Pobreza (FCP).
        // No caso de diferimento total, informar o percentual de diferimento "100"
        pFCPDif := 0;
        // Valor do ICMS relativo ao Fundo de Combate à Pobreza (FCP) diferido
        vFCPDif := 0;
        // Valor do ICMS relativo ao Fundo de Combate à Pobreza (FCP) realmente devido.
        vFCPEfet := 0;
      end;

      with ICMSUFDest do
      begin
        // partilha do ICMS e fundo de probreza
        vBCUFDest      := 0.00;
        pFCPUFDest     := 0.00;
        pICMSUFDest    := 0.00;
        pICMSInter     := 0.00;
        pICMSInterPart := 0.00;
        vFCPUFDest     := 0.00;
        vICMSUFDest    := 0.00;
        vICMSUFRemet   := 0.00;
      end;

      (*
      // IPI, se hpouver...
      with IPI do
      begin
        CST      := ipi99;
        clEnq    := '999';
        CNPJProd := '';
        cSelo    := '';
        qSelo    := 0;
        cEnq     := '';

        vBC    := 100;
        qUnid  := 0;
        vUnid  := 0;
        pIPI   := 5;
        vIPI   := 5;
      end;
      *)

      with II do
      begin
        II.vBc      := 0;
        II.vDespAdu := 0;
        II.vII      := 0;
        II.vIOF     := 0;
      end;

      with PIS do
      begin
        CST  := pis99;
        vBC  := 0;
        pPIS := 0;
        vPIS := 0;

        qBCProd   := 0;
        vAliqProd := 0;
        vPIS      := 0;
      end;

      with PISST do
      begin
        vBc       := 0;
        pPis      := 0;
        qBCProd   := 0;
        vAliqProd := 0;
        vPIS      := 0;
        {
          abaixo o campo incluido no layout a partir da NT 2020/005
        }
        {
          valores aceitos pelo campo:
          ispNenhum, ispPISSTNaoCompoe, ispPISSTCompoe
        }
        // Indica se o valor do PISST compõe o valor total da NF-e
        IndSomaPISST :=  ispNenhum;
      end;

      with COFINS do
      begin
        CST     := cof99;
        vBC     := 0;
        pCOFINS := 0;
        vCOFINS := 0;
        qBCProd   := 0;
        vAliqProd := 0;
      end;

      with COFINSST do
      begin
        vBC       := 0;
        pCOFINS   := 0;
        qBCProd   := 0;
        vAliqProd := 0;
        vCOFINS   := 0;
        {
          abaixo o campo incluido no layout a partir da NT 2020/005
        }
        {
          valores aceitos pelo campo:
          iscNenhum, iscCOFINSSTNaoCompoe, iscCOFINSSTCompoe
        }
        // Indica se o valor da COFINS ST compõe o valor total da NF-e
        indSomaCOFINSST :=  iscNenhum;
      end;
    end;



    //Adicionando Serviços
    (*
    Servico := NotaF.Nfe.Det.Add;
    Servico.Prod.nItem    := 1; // Número sequencial, para cada item deve ser incrementado
    Servico.Prod.cProd    := '123457';
    Servico.Prod.cEAN     := '';
    Servico.Prod.xProd    := 'Descrição do Serviço';
    Servico.Prod.NCM      := '99';
    Servico.Prod.EXTIPI   := '';
    Servico.Prod.CFOP     := '5933';
    Servico.Prod.uCom     := 'UN';
    Servico.Prod.qCom     := 1;
    Servico.Prod.vUnCom   := 100;
    Servico.Prod.vProd    := 100;

    Servico.Prod.cEANTrib  := '';
    Servico.Prod.uTrib     := 'UN';
    Servico.Prod.qTrib     := 1;
    Servico.Prod.vUnTrib   := 100;

    Servico.Prod.vFrete    := 0;
    Servico.Prod.vSeg      := 0;
    Servico.Prod.vDesc     := 0;

    Servico.infAdProd      := 'Informação Adicional do Serviço';

    //Grupo para serviços
    Servico.Imposto.ISSQN
    Servico.Imposto.cSitTrib  := ISSQNcSitTribNORMAL;
    Servico.Imposto.vBC       := 100;
    Servico.Imposto.vAliq     := 2;
    Servico.Imposto.vISSQN    := 2;
    Servico.Imposto.cMunFG    := 3554003;
    // Preencha este campo usando a tabela disponível
    // em http://www.planalto.gov.br/Ccivil_03/LEIS/LCP/Lcp116.htm
    Servico.Imposto.cListServ := '1402';

    NotaF.NFe.Total.ISSQNtot.vServ   := 100;
    NotaF.NFe.Total.ISSQNTot.vBC     := 100;
    NotaF.NFe.Total.ISSQNTot.vISS    := 2;
    NotaF.NFe.Total.ISSQNTot.vPIS    := 0;
    NotaF.NFe.Total.ISSQNTot.vCOFINS := 0;

  *)

    if NotaF.NFe.Emit.CRT in [crtSimplesExcessoReceita, crtRegimeNormal] then
    begin
      NotaF.NFe.Total.ICMSTot.vBC := 100;
      NotaF.NFe.Total.ICMSTot.vICMS := 18;
    end
    else
    begin
      NotaF.NFe.Total.ICMSTot.vBC := 0;
      NotaF.NFe.Total.ICMSTot.vICMS := 0;
    end;

    NotaF.NFe.Total.ICMSTot.vBCST   := 0;
    NotaF.NFe.Total.ICMSTot.vST     := 0;
    NotaF.NFe.Total.ICMSTot.vProd   := 100;
    NotaF.NFe.Total.ICMSTot.vFrete  := 0;
    NotaF.NFe.Total.ICMSTot.vSeg    := 0;
    NotaF.NFe.Total.ICMSTot.vDesc   := 0;
    NotaF.NFe.Total.ICMSTot.vII     := 0;
    NotaF.NFe.Total.ICMSTot.vIPI    := 0;
    NotaF.NFe.Total.ICMSTot.vPIS    := 0;
    NotaF.NFe.Total.ICMSTot.vCOFINS := 0;
    NotaF.NFe.Total.ICMSTot.vOutro  := 0;
    NotaF.NFe.Total.ICMSTot.vNF     := 100;

    // lei da transparencia de impostos
    NotaF.NFe.Total.ICMSTot.vTotTrib := 0;

    // partilha do icms e fundo de probreza
    NotaF.NFe.Total.ICMSTot.vFCPUFDest   := 0.00;
    NotaF.NFe.Total.ICMSTot.vICMSUFDest  := 0.00;
    NotaF.NFe.Total.ICMSTot.vICMSUFRemet := 0.00;

    NotaF.NFe.Total.ICMSTot.vFCPST     := 0;
    NotaF.NFe.Total.ICMSTot.vFCPSTRet  := 0;

    NotaF.NFe.Total.retTrib.vRetPIS    := 0;
    NotaF.NFe.Total.retTrib.vRetCOFINS := 0;
    NotaF.NFe.Total.retTrib.vRetCSLL   := 0;
    NotaF.NFe.Total.retTrib.vBCIRRF    := 0;
    NotaF.NFe.Total.retTrib.vIRRF      := 0;
    NotaF.NFe.Total.retTrib.vBCRetPrev := 0;
    NotaF.NFe.Total.retTrib.vRetPrev   := 0;

    NotaF.NFe.Transp.modFrete := mfContaEmitente;
    NotaF.NFe.Transp.Transporta.CNPJCPF  := '';
    NotaF.NFe.Transp.Transporta.xNome    := '';
    NotaF.NFe.Transp.Transporta.IE       := '';
    NotaF.NFe.Transp.Transporta.xEnder   := '';
    NotaF.NFe.Transp.Transporta.xMun     := '';
    NotaF.NFe.Transp.Transporta.UF       := '';

    NotaF.NFe.Transp.retTransp.vServ    := 0;
    NotaF.NFe.Transp.retTransp.vBCRet   := 0;
    NotaF.NFe.Transp.retTransp.pICMSRet := 0;
    NotaF.NFe.Transp.retTransp.vICMSRet := 0;
    NotaF.NFe.Transp.retTransp.CFOP     := '';
    NotaF.NFe.Transp.retTransp.cMunFG   := 0;

    Volume := NotaF.NFe.Transp.Vol.New;
    Volume.qVol  := 1;
    Volume.esp   := 'Especie';
    Volume.marca := 'Marca';
    Volume.nVol  := 'Numero';
    Volume.pesoL := 100;
    Volume.pesoB := 110;

    //Lacres do volume. Pode ser adicionado vários
    (*
    Lacre := Volume.Lacres.Add;
    Lacre.nLacre := '';
    *)

    NotaF.NFe.Cobr.Fat.nFat  := '1001'; // 'Numero da Fatura'
    NotaF.NFe.Cobr.Fat.vOrig := 100;
    NotaF.NFe.Cobr.Fat.vDesc := 0;
    NotaF.NFe.Cobr.Fat.vLiq  := 100;

    Duplicata := NotaF.NFe.Cobr.Dup.New;
    Duplicata.nDup  := '001';
    Duplicata.dVenc := now+10;
    Duplicata.vDup  := 50;

    Duplicata := NotaF.NFe.Cobr.Dup.New;
    Duplicata.nDup  := '002';
    Duplicata.dVenc := now+20;
    Duplicata.vDup  := 50;

      // O grupo infIntermed só deve ser gerado nos casos de operação não presencial
      // pela internet em site de terceiros (Intermediadores).
  //  NotaF.NFe.infIntermed.CNPJ := '';
  //  NotaF.NFe.infIntermed.idCadIntTran := '';

    NotaF.NFe.InfAdic.infCpl     :=  '';
    NotaF.NFe.InfAdic.infAdFisco :=  '';

    ObsComplementar := NotaF.NFe.InfAdic.obsCont.New;
    ObsComplementar.xCampo := 'ObsCont';
    ObsComplementar.xTexto := 'Texto';

    ObsFisco := NotaF.NFe.InfAdic.obsFisco.New;
    ObsFisco.xCampo := 'ObsFisco';
    ObsFisco.xTexto := 'Texto';

  //Processo referenciado
    (*
    ProcReferenciado := NotaF.Nfe.InfAdic.procRef.Add;
    ProcReferenciado.nProc := '';
    ProcReferenciado.indProc := ipSEFAZ;
    *)

    NotaF.NFe.exporta.UFembarq   := '';;
    NotaF.NFe.exporta.xLocEmbarq := '';

    NotaF.NFe.compra.xNEmp := '';
    NotaF.NFe.compra.xPed  := '';
    NotaF.NFe.compra.xCont := '';

  // YA. Informações de pagamento

    InfoPgto := NotaF.NFe.pag.New;
    InfoPgto.indPag := ipVista;
    InfoPgto.tPag   := fpDinheiro;
    InfoPgto.vPag   := 50;

  // Exemplo de pagamento integrado.

    InfoPgto := NotaF.NFe.pag.New;
    InfoPgto.indPag := ipVista;
    InfoPgto.tPag   := fpCartaoCredito;

    {
      abaixo o campo incluido no layout a partir da NT 2020/006
    }
    {
      se tPag for fpOutro devemos incluir o campo xPag
    InfoPgto.xPag := 'Caderneta';
    }
    InfoPgto.vPag   := 50;
    InfoPgto.tpIntegra := tiPagIntegrado;
    InfoPgto.CNPJ      := '05481336000137';
    InfoPgto.tBand     := bcVisa;
    InfoPgto.cAut      := '1234567890123456';

  // YA09 Troco
  // Regra opcional: Informar se valor dos pagamentos maior que valor da nota.
  // Regra obrigatória: Se informado, Não pode diferir de "(+) vPag (id:YA03) (-) vNF (id:W16)"
  //  NotaF.NFe.pag.vTroco := 75;

    {
      abaixo o campo incluido no layout a partir da NT 2020/006
    }
    // CNPJ do Intermediador da Transação (agenciador, plataforma de delivery,
    // marketplace e similar) de serviços e de negócios.
    NotaF.NFe.infIntermed.CNPJ := '';
    // Nome do usuário ou identificação do perfil do vendedor no site do intermediador
    // (agenciador, plataforma de delivery, marketplace e similar) de serviços e de
    // negócios.
    NotaF.NFe.infIntermed.idCadIntTran := '';

    Fnota.NotasFiscais.GerarNFe;
    result:=Fnota.NotasFiscais[0].XML ;
    if DebugHook >0  then
    begin
      ForceDirectories((ExtractFilePath(GetModuleName(HInstance)))+'\outputLog\');
       with tstringList.Create do
       begin
          text :=Fnota.NotasFiscais[0].XML;
          SaveToFile(ExtractFilePath(GetModuleName(HInstance))+'\outputLog\Nfe-'+Fnota.NotasFiscais[0].NFe.infNFe.ID+'.xml');
          free;
       end;
    end;
  finally

     freeAndNil( Fnota)
  end;
end;
end.

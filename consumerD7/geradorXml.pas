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
  ACBrNFe,
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
  ACBrNFeNotasFiscais;

type
  TgeraXml = class
  private
    Fnota: TACBrNFe;
  public
    function gerarXmlNFCE(NumDFe, Serie: String): string;
    function gerarXmlNfe(NumDFe, Serie: String): string;
  end;

implementation

Uses utesteMain;

function TgeraXml.gerarXmlNFCE(NumDFe, Serie: String): string;
var
  Ok: Boolean;
  BaseCalculo, ValorICMS: Double;
begin
  try
    Fnota := TACBrNFe.create(Nil);
    with Fnota.NotasFiscais.Add.NFe do
    begin
      Ide.natOp := 'VENDA';
      Ide.indPag := ipVista;
      Ide.modelo := 65;
      Ide.Serie := strtoint(Serie);
      Ide.nNF := strtoint(NumDFe);
      Ide.cNF := GerarCodigoDFe(Ide.nNF);
      Ide.dEmi := now;
      Ide.dSaiEnt := now;
      Ide.hSaiEnt := now;
      Ide.tpNF := tnSaida;
      Ide.tpEmis := teNormal;
      Ide.tpAmb := taHomologacao;
      // Lembre-se de trocar esta variavel quando for para ambiente de producao
      Ide.cUF := 15; // PARA
      Ide.cMunFG := 1506161;
      Ide.finNFe := fnNormal;
      Ide.tpImp := tiNFCe;
      Ide.indFinal := cfConsumidorFinal;
      {
        valores aceitos pelo campo:
        pcNao, pcPresencial, pcInternet, pcTeleatendimento, pcEntregaDomicilio,
        pcPresencialForaEstabelecimento, pcOutros
      }
      Ide.indPres := pcPresencial;

      {
        abaixo o campo incluido no layout a partir da NT 2020/006
      }
      {
        valores aceitos pelo campo:
        iiSemOperacao, iiOperacaoSemIntermediador, iiOperacaoComIntermediador
      }
      // Indicador de intermediador/marketplace
      Ide.indIntermed := iiSemOperacao;

      // Ide.dhCont := date;
      // Ide.xJust  := 'Justificativa Contingencia';

      Emit.CNPJCPF := '13100071000108';
      Emit.IE := '153257717';
      Emit.xNome := 'D M PRODUTOS AGROPECUARIOS LTDA';
      Emit.xFant := 'D M PRODUTOS AGROPECUARIOS LTDA';

      Emit.EnderEmit.fone := '9434282090';
      Emit.EnderEmit.CEP := 68530000;
      Emit.EnderEmit.xLgr := 'SN';
      Emit.EnderEmit.nro := '0';
      Emit.EnderEmit.xCpl := '';
      Emit.EnderEmit.xBairro := 'CENTRO';
      Emit.EnderEmit.cMun := 1506161;
      Emit.EnderEmit.xMun := 'RIO MARIA';
      Emit.EnderEmit.UF := 'PA';
      Emit.EnderEmit.cPais := 1058;
      Emit.EnderEmit.xPais := 'BRASIL';

      Emit.IEST := '';

      Emit.CRT := crtRegimeNormal;

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

      // Use os campos abaixo para informar o endereço de retirada quando for diferente do Remetente/Destinatário
      Retirada.CNPJCPF := '';
      Retirada.xLgr := '';
      Retirada.nro := '';
      Retirada.xCpl := '';
      Retirada.xBairro := '';
      Retirada.cMun := 0;
      Retirada.xMun := '';
      Retirada.UF := '';

      Entrega.CNPJCPF := '';
      Entrega.xLgr := '';
      Entrega.nro := '';
      Entrega.xCpl := '';
      Entrega.xBairro := '';
      Entrega.cMun := 0;
      Entrega.xMun := '';
      Entrega.UF := '';

      with Det.New do
      begin
        Prod.nItem := 1;
        Prod.cProd := '201469';
        Prod.cEAN := 'SEM GTIN';
        Prod.xProd := 'JACARE 20 LT BLD';
        Prod.NCM := '38089322';
        Prod.EXTIPI := '';
        Prod.CFOP := '5101';
        Prod.uCom := 'UN';
        Prod.qCom := 1;
        Prod.vUnCom := 100;
        Prod.vProd := 100;

        Prod.cEANTrib := 'SEM GTIN';
        Prod.uTrib := 'UN';
        Prod.qTrib := 1;
        Prod.vUnTrib := 100;

        Prod.vOutro := 0;
        Prod.vFrete := 0;
        Prod.vSeg := 0;
        Prod.vDesc := 0;

        Prod.CEST := '1111111';

        // infAdProd      := 'Informação Adicional do Produto';

        {
          abaixo os campos incluidos no layout a partir da NT 2020/005
        }
        // Opcional - Preencher com o Código de Barras próprio ou de terceiros que seja diferente do padrão GTIN
        // por exemplo: código de barras de catálogo, partnumber, etc
        Prod.cBarra := '7896476200012';
        // Opcional - Preencher com o Código de Barras próprio ou de terceiros que seja diferente do padrão GTIN
        // correspondente àquele da menor unidade comercializável identificado por Código de Barras
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

            orig := oeNacional;
            modBC := dbiValorOperacao;

            if Emit.CRT in [crtSimplesExcessoReceita, crtRegimeNormal] then
              BaseCalculo := 100
            else
              BaseCalculo := 0;

            vBC := BaseCalculo;
            pICMS := 18;

            ValorICMS := (vBC * pICMS) / 100;

            vICMS := ValorICMS;
            modBCST := dbisMargemValorAgregado;
            pMVAST := 0;
            pRedBCST := 0;
            vBCST := 0;
            pICMSST := 0;
            vICMSST := 0;
            pRedBC := 0;

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
              vBCUFDest := 0.00;
              pFCPUFDest := 0.00;
              pICMSUFDest := 0.00;
              pICMSInter := 0.00;
              pICMSInterPart := 0.00;
              vFCPUFDest := 0.00;
              vICMSUFDest := 0.00;
              vICMSUFRemet := 0.00;
            end;
          end;

          with PIS do
          begin
            CST := pis99;
            PIS.vBC := 0;
            PIS.pPIS := 0;
            PIS.vPIS := 0;

            PIS.qBCProd := 0;
            PIS.vAliqProd := 0;
            PIS.vPIS := 0;
          end;

          with PISST do
          begin
            vBC := 0;
            pPIS := 0;
            qBCProd := 0;
            vAliqProd := 0;
            vPIS := 0;
            {
              abaixo o campo incluido no layout a partir da NT 2020/005
            }
            {
              valores aceitos pelo campo:
              ispNenhum, ispPISSTNaoCompoe, ispPISSTCompoe
            }
            // Indica se o valor do PISST compõe o valor total da NF-e
            IndSomaPISST := ispNenhum;
          end;

          with COFINS do
          begin
            CST := cof99;
            COFINS.vBC := 0;
            COFINS.pCOFINS := 0;
            COFINS.vCOFINS := 0;

            COFINS.qBCProd := 0;
            COFINS.vAliqProd := 0;
          end;

          with COFINSST do
          begin
            vBC := 0;
            pCOFINS := 0;
            qBCProd := 0;
            vAliqProd := 0;
            vCOFINS := 0;
            {
              abaixo o campo incluido no layout a partir da NT 2020/005
            }
            {
              valores aceitos pelo campo:
              iscNenhum, iscCOFINSSTNaoCompoe, iscCOFINSSTCompoe
            }
            // Indica se o valor da COFINS ST compõe o valor total da NF-e
            indSomaCOFINSST := iscNenhum;
          end;
        end;
      end;

      Total.ICMSTot.vBC := BaseCalculo;
      Total.ICMSTot.vICMS := ValorICMS;
      Total.ICMSTot.vBCST := 0;
      Total.ICMSTot.vST := 0;
      Total.ICMSTot.vProd := 100;
      Total.ICMSTot.vFrete := 0;
      Total.ICMSTot.vSeg := 0;
      Total.ICMSTot.vDesc := 0;
      Total.ICMSTot.vII := 0;
      Total.ICMSTot.vIPI := 0;
      Total.ICMSTot.vPIS := 0;
      Total.ICMSTot.vCOFINS := 0;
      Total.ICMSTot.vOutro := 0;
      Total.ICMSTot.vNF := 100;

      // partilha do icms e fundo de probreza
      Total.ICMSTot.vFCPUFDest := 0.00;
      Total.ICMSTot.vICMSUFDest := 0.00;
      Total.ICMSTot.vICMSUFRemet := 0.00;

      Total.ISSQNtot.vServ := 0;
      Total.ISSQNtot.vBC := 0;
      Total.ISSQNtot.vISS := 0;
      Total.ISSQNtot.vPIS := 0;
      Total.ISSQNtot.vCOFINS := 0;

      Total.retTrib.vRetPIS := 0;
      Total.retTrib.vRetCOFINS := 0;
      Total.retTrib.vRetCSLL := 0;
      Total.retTrib.vBCIRRF := 0;
      Total.retTrib.vIRRF := 0;
      Total.retTrib.vBCRetPrev := 0;
      Total.retTrib.vRetPrev := 0;

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
      // infIntermed.CNPJ := '';
      // infIntermed.idCadIntTran := '';

      InfAdic.infCpl := '';
      InfAdic.infAdFisco := '';

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
    result := (Fnota.NotasFiscais[0].XML);
    if DebugHook > 0 then
    begin
      ForceDirectories(ExtractFilePath(GetModuleName(HInstance)) +
        '\outputLog\');
      with tstringList.create do
      begin
        text := Fnota.NotasFiscais[0].XML;
        SaveToFile(ExtractFilePath(GetModuleName(HInstance)) +
          '\outputLog\Nfce- ' + Fnota.NotasFiscais[0].NFe.infNFe.ID + '.xml');
        free;
      end;
    end;
  finally
    freeAndNil(Fnota)
  end;
end;

function TgeraXml.gerarXmlNfe(NumDFe, Serie: String): string;
var
  Ok: Boolean;
  NotaF: NotaFiscal;
  Produto: TDetCollectionItem;

  Volume: TVolCollectionItem;
  Duplicata: TDupCollectionItem;
  ObsComplementar: TobsContCollectionItem;
  obsFisco: TobsFiscoCollectionItem;

  InfoPgto: TpagCollectionItem;
begin
  Fnota := TACBrNFe.create(Nil);
  try
    NotaF := Fnota.NotasFiscais.Add;
    NotaF.NFe.Ide.natOp := 'VENDA PRODUCAO DO ESTAB.';
    NotaF.NFe.Ide.indPag := ipVista;
    NotaF.NFe.Ide.modelo := 55;
    NotaF.NFe.Ide.Serie := strtoint(Serie);
    NotaF.NFe.Ide.nNF := strtoint(NumDFe);
    NotaF.NFe.Ide.cNF := GerarCodigoDFe(NotaF.NFe.Ide.nNF);
    NotaF.NFe.Ide.dEmi := Date;
    NotaF.NFe.Ide.dSaiEnt := Date;
    NotaF.NFe.Ide.hSaiEnt := now;
    NotaF.NFe.Ide.tpNF := tnSaida;
    NotaF.NFe.Ide.tpEmis := teNormal;
    NotaF.NFe.Ide.tpAmb := taHomologacao;
    NotaF.NFe.Ide.verProc := '1.0.0.0';
    NotaF.NFe.Ide.cUF := 50;
    NotaF.NFe.Ide.cMunFG := 5003256;
    NotaF.NFe.Ide.finNFe := fnNormal;
    NotaF.NFe.Ide.indFinal := cfConsumidorFinal;
    NotaF.NFe.Ide.indIntermed := iiSemOperacao;
    NotaF.NFe.Emit.CNPJCPF := _cnpj;
    NotaF.NFe.Emit.IE := '283224665';
    NotaF.NFe.Emit.xNome := 'WK TESTE S.A.';
    NotaF.NFe.Emit.xFant := 'WK TESTE S.A.';
    NotaF.NFe.Emit.EnderEmit.fone := '9434282090';
    NotaF.NFe.Emit.EnderEmit.CEP := 79550000;
    NotaF.NFe.Emit.EnderEmit.xLgr := 'SN';
    NotaF.NFe.Emit.EnderEmit.nro := '0';
    NotaF.NFe.Emit.EnderEmit.xCpl := '';
    NotaF.NFe.Emit.EnderEmit.xBairro := 'CENTRO';
    NotaF.NFe.Emit.EnderEmit.cMun := 5003256;
    NotaF.NFe.Emit.EnderEmit.xMun := 'GOIANIA';
    NotaF.NFe.Emit.EnderEmit.UF := 'MS';
    NotaF.NFe.Emit.EnderEmit.cPais := 1058;
    NotaF.NFe.Emit.EnderEmit.xPais := 'BRASIL';

    NotaF.NFe.Emit.CRT := crtRegimeNormal;
    NotaF.NFe.Dest.CNPJCPF := '33631727100';
    NotaF.NFe.Dest.indIEDest := inNaoContribuinte;
    NotaF.NFe.Dest.IE := 'INSENTO';
    NotaF.NFe.Dest.Email := 'wilson.rodrigues@mail.wktechnology.com.br';
    NotaF.NFe.Dest.ISUF := '';
    NotaF.NFe.Dest.xNome := 'WK CONSULTORIA';
    NotaF.NFe.Dest.EnderDest.fone := '1532599600';
    NotaF.NFe.Dest.EnderDest.CEP := 79550000;
    NotaF.NFe.Dest.EnderDest.xLgr := 'SR 52 QUADARA 72 LOTE 22';
    NotaF.NFe.Dest.EnderDest.nro := '973';
    NotaF.NFe.Dest.EnderDest.xCpl := '';
    NotaF.NFe.Dest.EnderDest.xBairro := 'Centro';
    NotaF.NFe.Dest.EnderDest.cMun := 5003256;
    NotaF.NFe.Dest.EnderDest.xMun := 'RIO MARIA';
    NotaF.NFe.Dest.EnderDest.UF := 'MS';
    NotaF.NFe.Dest.EnderDest.cPais := 1058;

    Produto := NotaF.NFe.Det.New;
    Produto.Prod.nItem := 1;
    Produto.Prod.cProd := '201469';
    Produto.Prod.cEAN := 'SEM GTIN';
    Produto.Prod.xProd := 'JACARE 20 LT BLD';
    Produto.Prod.NCM := '38089322';
    Produto.Prod.EXTIPI := '';

    Produto.Prod.CFOP := '5101';
    Produto.Prod.uCom := 'UN';
    Produto.Prod.qCom := 1;
    Produto.Prod.vUnCom := 100;
    Produto.Prod.vProd := 100;

    Produto.Prod.cEANTrib := 'SEM GTIN';
    Produto.Prod.uTrib := 'UN';
    Produto.Prod.qTrib := 1;
    Produto.Prod.vUnTrib := 100;

    Produto.Prod.vOutro := 0;
    Produto.Prod.vFrete := 0;
    Produto.Prod.vSeg := 0;
    Produto.Prod.vDesc := 0;

    Produto.Prod.CEST := '1111111';

    Produto.infAdProd := 'Informacao Adicional do Produto';

    Produto.Prod.cBarra := '7896476200012';

    Produto.Prod.cBarraTrib := '7896476200012';

    Produto.Prod.veicProd.tpOP := toVendaConcessionaria;

    Produto.Prod.veicProd.condVeic := cvAcabado;
    Produto.Prod.veicProd.cMod := '';

    Produto.Prod.comb.cProdANP := 0;
    Produto.Prod.comb.CODIF := '';
    Produto.Prod.comb.qTemp := 0;
    Produto.Prod.comb.UFcons := '';

    Produto.Prod.comb.CIDE.qBCProd := 0;
    Produto.Prod.comb.CIDE.vAliqProd := 0;
    Produto.Prod.comb.CIDE.vCIDE := 0;

    Produto.Prod.comb.ICMS.vBCICMS := 0;
    Produto.Prod.comb.ICMS.vICMS := 0;
    Produto.Prod.comb.ICMS.vBCICMSST := 0;
    Produto.Prod.comb.ICMS.vICMSST := 0;

    Produto.Prod.comb.ICMSInter.vBCICMSSTDest := 0;
    Produto.Prod.comb.ICMSInter.vICMSSTDest := 0;

    Produto.Prod.comb.ICMSCons.vBCICMSSTCons := 0;
    Produto.Prod.comb.ICMSCons.vICMSSTCons := 0;
    Produto.Prod.comb.ICMSCons.UFcons := '';

    with Produto.Imposto do
    begin

      vTotTrib := 0;

      with ICMS do
      begin

        orig := oeNacional;

        if NotaF.NFe.Emit.CRT in [crtSimplesExcessoReceita, crtRegimeNormal]
        then
        begin
          CST := cst00;
          modBC := dbiPrecoTabelado;
          vBC := 100;
          pICMS := 18;
          vICMS := 18;
          modBCST := dbisMargemValorAgregado;
          pMVAST := 0;
          pRedBCST := 0;
          vBCST := 0;
          pICMSST := 0;
          vICMSST := 0;
          pRedBC := 0;
        end
        else
        begin
          CSOSN := csosn101;
          modBC := dbiValorOperacao;
          pCredSN := 5;
          vCredICMSSN := 100 * pCredSN / 100;;
          vBC := 0;
          pICMS := 0;
          vICMS := 0;
          modBCST := dbisListaNeutra;
          pMVAST := 0;
          pRedBCST := 0;
          vBCST := 0;
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

        vICMSSTDeson := 0;

        motDesICMSST := mdiOutros;

        pFCPDif := 0;

        vFCPDif := 0;

        vFCPEfet := 0;
      end;

      with ICMSUFDest do
      begin
        // partilha do ICMS e fundo de probreza
        vBCUFDest := 0.00;
        pFCPUFDest := 0.00;
        pICMSUFDest := 0.00;
        pICMSInter := 0.00;
        pICMSInterPart := 0.00;
        vFCPUFDest := 0.00;
        vICMSUFDest := 0.00;
        vICMSUFRemet := 0.00;
      end;

      with II do
      begin
        II.vBC := 0;
        II.vDespAdu := 0;
        II.vII := 0;
        II.vIOF := 0;
      end;

      with PIS do
      begin
        CST := pis99;
        vBC := 0;
        pPIS := 0;
        vPIS := 0;

        qBCProd := 0;
        vAliqProd := 0;
        vPIS := 0;
      end;

      with PISST do
      begin
        vBC := 0;
        pPIS := 0;
        qBCProd := 0;
        vAliqProd := 0;
        vPIS := 0;

        IndSomaPISST := ispNenhum;
      end;

      with COFINS do
      begin
        CST := cof99;
        vBC := 0;
        pCOFINS := 0;
        vCOFINS := 0;
        qBCProd := 0;
        vAliqProd := 0;
      end;

      with COFINSST do
      begin
        vBC := 0;
        pCOFINS := 0;
        qBCProd := 0;
        vAliqProd := 0;
        vCOFINS := 0;

        indSomaCOFINSST := iscNenhum;
      end;
    end;

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

    NotaF.NFe.Total.ICMSTot.vBCST := 0;
    NotaF.NFe.Total.ICMSTot.vST := 0;
    NotaF.NFe.Total.ICMSTot.vProd := 100;
    NotaF.NFe.Total.ICMSTot.vFrete := 0;
    NotaF.NFe.Total.ICMSTot.vSeg := 0;
    NotaF.NFe.Total.ICMSTot.vDesc := 0;
    NotaF.NFe.Total.ICMSTot.vII := 0;
    NotaF.NFe.Total.ICMSTot.vIPI := 0;
    NotaF.NFe.Total.ICMSTot.vPIS := 0;
    NotaF.NFe.Total.ICMSTot.vCOFINS := 0;
    NotaF.NFe.Total.ICMSTot.vOutro := 0;
    NotaF.NFe.Total.ICMSTot.vNF := 100;

    NotaF.NFe.Total.ICMSTot.vTotTrib := 0;

    NotaF.NFe.Total.ICMSTot.vFCPUFDest := 0.00;
    NotaF.NFe.Total.ICMSTot.vICMSUFDest := 0.00;
    NotaF.NFe.Total.ICMSTot.vICMSUFRemet := 0.00;

    NotaF.NFe.Total.ICMSTot.vFCPST := 0;
    NotaF.NFe.Total.ICMSTot.vFCPSTRet := 0;

    NotaF.NFe.Total.retTrib.vRetPIS := 0;
    NotaF.NFe.Total.retTrib.vRetCOFINS := 0;
    NotaF.NFe.Total.retTrib.vRetCSLL := 0;
    NotaF.NFe.Total.retTrib.vBCIRRF := 0;
    NotaF.NFe.Total.retTrib.vIRRF := 0;
    NotaF.NFe.Total.retTrib.vBCRetPrev := 0;
    NotaF.NFe.Total.retTrib.vRetPrev := 0;

    NotaF.NFe.Transp.modFrete := mfContaEmitente;
    NotaF.NFe.Transp.Transporta.CNPJCPF := '';
    NotaF.NFe.Transp.Transporta.xNome := '';
    NotaF.NFe.Transp.Transporta.IE := '';
    NotaF.NFe.Transp.Transporta.xEnder := '';
    NotaF.NFe.Transp.Transporta.xMun := '';
    NotaF.NFe.Transp.Transporta.UF := '';

    NotaF.NFe.Transp.retTransp.vServ := 0;
    NotaF.NFe.Transp.retTransp.vBCRet := 0;
    NotaF.NFe.Transp.retTransp.pICMSRet := 0;
    NotaF.NFe.Transp.retTransp.vICMSRet := 0;
    NotaF.NFe.Transp.retTransp.CFOP := '';
    NotaF.NFe.Transp.retTransp.cMunFG := 0;

    Volume := NotaF.NFe.Transp.Vol.New;
    Volume.qVol := 1;
    Volume.esp := 'Especie';
    Volume.marca := 'Marca';
    Volume.nVol := 'Numero';
    Volume.pesoL := 100;
    Volume.pesoB := 110;

    NotaF.NFe.Cobr.Fat.nFat := '1001'; // 'Numero da Fatura'
    NotaF.NFe.Cobr.Fat.vOrig := 100;
    NotaF.NFe.Cobr.Fat.vDesc := 0;
    NotaF.NFe.Cobr.Fat.vLiq := 100;

    Duplicata := NotaF.NFe.Cobr.Dup.New;
    Duplicata.nDup := '001';
    Duplicata.dVenc := now + 10;
    Duplicata.vDup := 50;

    Duplicata := NotaF.NFe.Cobr.Dup.New;
    Duplicata.nDup := '002';
    Duplicata.dVenc := now + 20;
    Duplicata.vDup := 50;

    NotaF.NFe.InfAdic.infCpl := '';
    NotaF.NFe.InfAdic.infAdFisco := '';

    ObsComplementar := NotaF.NFe.InfAdic.obsCont.New;
    ObsComplementar.xCampo := 'ObsCont';
    ObsComplementar.xTexto := 'Texto';

    obsFisco := NotaF.NFe.InfAdic.obsFisco.New;
    obsFisco.xCampo := 'ObsFisco';
    obsFisco.xTexto := 'Texto';

    NotaF.NFe.exporta.UFembarq := '';;
    NotaF.NFe.exporta.xLocEmbarq := '';

    NotaF.NFe.compra.xNEmp := '';
    NotaF.NFe.compra.xPed := '';
    NotaF.NFe.compra.xCont := '';

    InfoPgto := NotaF.NFe.pag.New;
    InfoPgto.indPag := ipVista;
    InfoPgto.tPag := fpDinheiro;
    InfoPgto.vPag := 50;

    InfoPgto := NotaF.NFe.pag.New;
    InfoPgto.indPag := ipVista;
    InfoPgto.tPag := fpCartaoCredito;

    InfoPgto.vPag := 50;
    InfoPgto.tpIntegra := tiPagIntegrado;
    InfoPgto.CNPJ := '05481336000137';
    InfoPgto.tBand := bcVisa;
    InfoPgto.cAut := '1234567890123456';

    NotaF.NFe.infIntermed.CNPJ := '';

    NotaF.NFe.infIntermed.idCadIntTran := '';

    Fnota.NotasFiscais.GerarNFe;
    result := Fnota.NotasFiscais[0].XML;
    if DebugHook > 0 then
    begin
      ForceDirectories((ExtractFilePath(GetModuleName(HInstance))) +
        '\outputLog\');
      with tstringList.create do
      begin
        text := Fnota.NotasFiscais[0].XML;
        SaveToFile(ExtractFilePath(GetModuleName(HInstance)) + '\outputLog\Nfe-'
          + Fnota.NotasFiscais[0].NFe.infNFe.ID + '.xml');
        free;
      end;
    end;
  finally

    freeAndNil(Fnota)
  end;
end;

end.

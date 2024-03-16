unit dfe.services.consultadestinadas;

interface

{$TYPEINFO OFF}

uses
  windows,
  dfe.dao.base,
  dfe.dao.empresa,
  dfe.services.importar_xml,
  dfe.model.empresa,
  dfe.lib.acbr.config,
  dfe.lib.util,
  variants,

  data.db,

  dfe.services.ciencia_operacao,
  forms,

  system.SysUtils,

  classes,
  {ACBR}
  ACBrECFVirtual,
  pcnAuxiliar,
  ACBrECFVirtualBuffer,
  ACBrECFVirtualNFCe,
  ACBrMail,
  ACBrDANFCeFortesFr,
  ACBrNFeDANFeRLClass,
  ACBrDANFCeFortesFrA4,
  ACBrMDFeDAMDFeClass,
  ACBrDFeReport,
  ACBrDFeDANFeReport,
  pcnConversaoNFe,
  ACBrNFe,
  ACBrUtil,
  ACBrNFeDANFEClass,
  ACBrNFeDANFeESCPOS,
  ACBrPosPrinter,

  ACBrMDFe,
  ACBrDFe,
  ACBrBase,
  ACBrMDFeDAMDFeRLClass,

  ACBrECFVirtualPrinter,
  pcnConversao,
  ACBrSMSClass,
  ACBrSMS,
  ACBrNFeWebServices,
  pcnNFe,
  ACBrNFeNotasFiscais,
  ACBrDFeSSL,
  pcnRetConsSitNFe,
  pcnRetEnvEventoNFe,
  pcnEventoNFe,
  pcnNFeRTXT,
  RLPreviewForm,

  {firedac}

  FireDAC.Phys.MSSQL,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Param,
  FireDAC.Phys.Intf,
  FireDAC.Phys.SQLPreprocessor,
  FireDAC.Phys.ODBCCli,
  FireDAC.Phys.ODBCWrapper,
  FireDAC.Phys.SQLGenerator,
  FireDAC.Phys.Meta,
  FireDAC.Phys.ODBCBase,
  FireDAC.Phys.MSSQLDef,
  FireDAC.Phys.MSSQLCli,
  FireDAC.Phys.MSSQLWrapper,
  FireDAC.Phys.MSSQLMeta,
  FireDAC.Moni.base,
  FireDAC.Moni.Custom,
  FireDAC.Moni.FlatFile,
  FireDAC.Comp.Client;

type
  TGbConsultarDestinadasClass = class(TThread)
  public
    FNsuSequencia: double;
    FNSUdata: TDateTime;
    procedure Execute; override;
    procedure executar(codLoja: integer);

  private
    FDaoBase: TDaoBase;
    FdaoEmpresa: Tdaoempresa;
    Fempresa: TEmpresa;
    Floja: integer;
    Fchave: string;
    FcountNotas: integer;
    qry1: TFDQuery;
    consulta: TFDQuery;
    qry2: TFDQuery;
    fcon: TFDConnection;
    smensagen: string;

    FgbNFe: TACBrNFe;
    FdirXml: string;
    FdirXMLimportado: string;

    procedure setAcbr();
    procedure setdadosNSU(sequencia: double; dataConsulta: TDateTime;
      codigo_loja: integer);

  published
    property loja: integer read Floja write Floja;
  end;

implementation

uses
  dfe.schedule.MDE;

procedure TGbConsultarDestinadasClass.setdadosNSU(sequencia: double;
  dataConsulta: TDateTime; codigo_loja: integer);

var
  qry: TFDQuery;
begin

  qry := TFDQuery.Create(Nil);
  qry.Connection := fcon;
  try
    qry.SQL.Clear;
    with qry.SQL do
    begin
      qry.SQL.Add('UPDATE ');
      qry.SQL.Add('   emitente');
      qry.SQL.Add('SET ');
      qry.SQL.Add(' NSU_DATA_CONSULTA  = :data');
      if sequencia > 0 then
        qry.SQL.Add(', NSU_SEQUENCIA  = :sequencia  ');
      qry.SQL.Add('WHERE');
      qry.SQL.Add('  Codigo_loja = ' + IntToStr(codigo_loja));
      if sequencia > 0 then
        qry.Params.ParamByName('sequencia').AsFloat := sequencia;
      qry.Params.ParamByName('data').AsDateTime := dataConsulta;

      qry.ExecSQL();
    end;

  finally
    qry.Close;
    FreeAndNil(qry);
  end;
end;

procedure TGbConsultarDestinadasClass.executar(codLoja: integer);
var
  cUFAutor, CNPJ, IndNFe, IndEmi, vtpEvento, ANSU: string;
  ok, Tem_Doctos, vIni: Boolean;
  I, vReg: integer;
  vSetenta_PorCento: Real;
  cSitConf: TpcnSituacaoManifDest;

begin
  FDaoBase := TDaoBase.Create;
  FdaoEmpresa := Tdaoempresa.Create;
  Fempresa := FdaoEmpresa.getEmpresaCod(IntToStr(codLoja));

  FNsuSequencia := Fempresa.nsu_sequencia;
  fcon := TFDConnection.Create(Nil);
  fcon.ResourceOptions.DirectExecute := True;
  fcon.LoginPrompt := false;
  fcon.Params := FDaoBase.FDConNFe.Params;
  qry1 := TFDQuery.Create(Nil);
  qry1.Connection := fcon;
  qry2 := TFDQuery.Create(Nil);
  qry2.Connection := fcon;
  consulta := TFDQuery.Create(Nil);
  consulta.Connection := fcon;
  FgbNFe := TACBrNFe.Create(Nil);
  TAcbrConfig.setAcbrObj(FgbNFe, Fempresa);

  try
    FdirXml := ExtractFilePath(GetModuleName(HInstance)) + 'Arq\Emp' +
      IntToStr(codLoja) + '\Xml\';

    FdirXMLimportado := ExtractFilePath(GetModuleName(HInstance)) + 'Arq\Emp' +
      IntToStr(codLoja) + '\XmlI\';

    ForceDirectories(FdirXml);
    ForceDirectories(FdirXMLimportado);
    setAcbr();
    consulta.ResourceOptions.CmdExecMode := amNonBlocking;
    qry1.ResourceOptions.CmdExecMode := amNonBlocking;
    qry2.ResourceOptions.CmdExecMode := amNonBlocking;
    fcon.ResourceOptions.CmdExecMode := amNonBlocking;
    try
      FcountNotas := 0;
      vIni := True;
      vReg := 0;
      cUFAutor := IntToStr(UFtoCUF(Fempresa.uf));
      CNPJ := Fempresa.CNPJ;

      ANSU := '';
      Tem_Doctos := True;

      while Tem_Doctos do
      begin
        Tem_Doctos := false;
        FgbNFe.NotasFiscais.Clear;
        FgbNFe.EventoNFe.Evento.Clear;
        FgbNFe.WebServices.consulta.Clear;
        try
          // ANSU:= floattostr(FNsuSequencia) ;
          gravalog('[ConsultaNSU] Loja ' + Fempresa.codigo_loja + ' NSU ' +
            floattostr(FNsuSequencia), CNPJ);
          FgbNFe.DistribuicaoDFe(StrToInt(cUFAutor), CNPJ,
            floattostr(FNsuSequencia), ANSU);

          if vIni then
          begin
            vReg := (StrToInt(FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.
              maxNSU) - StrToInt(FgbNFe.WebServices.DistribuicaoDFe.
              retDistDFeInt.ultNSU));
            vIni := false;
          end;
        except
          on e: exception do
          begin
            // distribuiçao DFE Rejeicao: Consumo Indevido
            if (FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.ultNSU <> '')
              and (strtofloat(FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.
              ultNSU) > 0) then
              FNsuSequencia :=
                strtofloat
                (FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.ultNSU);

            setdadosNSU(FNsuSequencia, now, codLoja);

            gravalog('[ConsultaNSU] Loja ' + Fempresa.codigo_loja +
              ' NSU retornado: ' + FloatToString(FNsuSequencia) +
              ' Erro ao obter distribuiçao DFE ' + e.Message, CNPJ);
            exit;
          end;
        end;
        if (FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.ultNSU = FgbNFe.
          WebServices.DistribuicaoDFe.retDistDFeInt.maxNSU) then

        else
          Tem_Doctos := True;
        if FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.ultNSU <> '' then
        begin
          if strtofloat(FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.ultNSU)
            > FNsuSequencia then
            FNSUdata := now;
          FNsuSequencia :=
            strtofloat(FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.ultNSU);
          FNSUdata := now;
          setdadosNSU(FNsuSequencia, FNSUdata, codLoja);
        end;
        if FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Count > 0
        then
          gravalog('[ConsultaNSU]Loja ' + Fempresa.codigo_loja +
            ' Consulta realizada -> documentos encontrados ' +
            IntToStr(FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.
            docZip.Count), CNPJ);

        for I := 0 to FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.
          Count - 1 do
        begin
          if Trim(FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items
            [I].resDFe.chDFe) <> '' then
          begin
            gravalog('[ConsultaNSU] Loja ' + Fempresa.codigo_loja +
              ' Gravando chave consultada  ' +
              FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[I]
              .resDFe.chDFe, CNPJ);
            inc(FcountNotas);
            Fchave := FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.
              Items[I].resDFe.chDFe;

            qry1.Close;
            qry1.SQL.Clear;
            qry1.SQL.Add('SET DATEFORMAT dmy   ');
            qry1.SQL.Add(' Select    ');
            qry1.SQL.Add('  t1.Xml_Aut   as  MDFe_Xml_Aut    ');
            qry1.SQL.Add(' ,t1.Xml_Bai   as  MDFe_Xml_Bai    ');
            qry1.SQL.Add(' ,t1.idLote    as  MDFe_idLote   ');
            qry1.SQL.Add(' ,t1.NSU     as  MDFe_NSU      ');
            qry1.SQL.Add(' ,t1.Codigo_loja   as  MDFe_Codigo_loja    ');
            qry1.SQL.Add(' ,t1.Chave_nfe     as  MDFe_Chave_nfe      ');
            qry1.SQL.Add(' ,t1.Evento    as  MDFe_Evento   ');
            qry1.SQL.Add(' ,t1.cnpj_cpf      as  MDFe_cnpj_cpf   ');
            qry1.SQL.Add(' ,t1.xNome   as  MDFe_xNome    ');
            qry1.SQL.Add(' ,t1.IE      as  MDFe_IE   ');
            qry1.SQL.Add(' ,t1.dEmi    as  MDFe_dEmi     ');
            qry1.SQL.Add(' ,t1.tpNF    as  MDFe_tpNF     ');
            qry1.SQL.Add(' ,t1.vNF     as  MDFe_vNF      ');
            qry1.SQL.Add(' ,t1.digVal    as  MDFe_digVal   ');
            qry1.SQL.Add(' ,t1.dhRecbto      as  MDFe_dhRecbto   ');
            qry1.SQL.Add(' ,t1.cStat   as  MDFe_cStat    ');
            qry1.SQL.Add(' ,t1.xMotivo   as  MDFe_xMotivo    ');
            qry1.SQL.Add(' ,t1.cSitNFe   as  MDFe_cSitNFe    ');
            qry1.SQL.Add(' ,t1.cSitConf      as  MDFe_cSitConf   ');
            qry1.SQL.Add(' ,t2.cnpj    as  MEMI_cnpj     ');
            qry1.SQL.Add('   ');
            qry1.SQL.Add
              (' from nfe_MDFe t1 join emitente t2 on t1.Codigo_loja = t2.Codigo_loja ');
            qry1.SQL.Add('  where t1.Codigo_loja = :Codigo_loja and    ');
            qry1.SQL.Add('    t2.Codigo_loja = :Codigo_loja and    ');
            qry1.SQL.Add
              ('  isnull( t1.Chave_nfe, '''')  Like ''%'' + :Chave_nfe + ''%'' ');
            qry1.SQL.Add('  Order by t1.dEmi desc    ');

            qry1.ParamByName('Codigo_loja').AsInteger := codLoja;
            qry1.ParamByName('Chave_nfe').AsString :=
              FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[I]
              .resDFe.chDFe;
            qry1.Open;

            if (FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.ultNSU <> '')
              and (strtofloat(FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.
              ultNSU) > FNsuSequencia) then
            begin
              FNsuSequencia :=
                strtofloat
                (FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.ultNSU);

              setdadosNSU(FNsuSequencia, now, codLoja);
            end;
            if qry1.IsEmpty then
            begin
              try
                gravalog('[ConsultaNSU] Loja ' + Fempresa.codigo_loja +
                  ' inerindo chave ->  ' + FgbNFe.WebServices.DistribuicaoDFe.
                  retDistDFeInt.docZip.Items[I].resDFe.chDFe, CNPJ);
                qry1.Close;
                qry1.SQL.Clear;
                qry1.SQL.Add('SET DATEFORMAT dmy     ');
                qry1.SQL.Add('Insert into nfe_MDFe ( ');
                qry1.SQL.Add('      Xml_Aut    ');
                qry1.SQL.Add('   ,  Xml_Bai    ');
                qry1.SQL.Add('   ,  NSU    ');
                qry1.SQL.Add('   ,  Codigo_loja      ');
                qry1.SQL.Add('   ,  Chave_nfe    ');
                qry1.SQL.Add('   ,  Evento     ');
                qry1.SQL.Add('   ,  cnpj_cpf   ');
                qry1.SQL.Add('   ,  xNome      ');
                qry1.SQL.Add('   ,  IE   ');
                qry1.SQL.Add('   ,  dEmi   ');
                qry1.SQL.Add('   ,  tpNF   ');
                qry1.SQL.Add('   ,  vNF    ');
                qry1.SQL.Add('   ,  digVal     ');
                qry1.SQL.Add('   ,  dhRecbto   ');
                qry1.SQL.Add('   ,  cStat      ');
                qry1.SQL.Add('   ,  xMotivo    ');
                qry1.SQL.Add('   ,  cSitNFe    ');
                qry1.SQL.Add('   ,  cSitConf   ');
                qry1.SQL.Add('   ,  id     ');
                qry1.SQL.Add('    )    ');
                qry1.SQL.Add('  Values   (      ');
                qry1.SQL.Add('     :Xml_Aut    ');
                qry1.SQL.Add('   , :Xml_Bai    ');
                qry1.SQL.Add('   , :NSU    ');
                qry1.SQL.Add('   , :Codigo_loja      ');
                qry1.SQL.Add('   , :Chave_nfe    ');
                qry1.SQL.Add('   , :Evento     ');
                qry1.SQL.Add('   , :cnpj_cpf   ');
                qry1.SQL.Add('   , :xNome      ');
                qry1.SQL.Add('   , :IE     ');
                qry1.SQL.Add('   , :dEmi   ');
                qry1.SQL.Add('   , :tpNF   ');
                qry1.SQL.Add('   , :vNF    ');
                qry1.SQL.Add('   , :digVal     ');
                qry1.SQL.Add('   , :dhRecbto   ');
                qry1.SQL.Add('   , :cStat      ');
                qry1.SQL.Add('   , :xMotivo    ');
                qry1.SQL.Add('   , :cSitNFe    ');
                qry1.SQL.Add('   , :cSitConf   ');
                qry1.SQL.Add('   , :id   ');
                qry1.SQL.Add('    )      ');

                Case FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.
                  Items[I].resEvento.tpEvento of
                  teManifDestConfirmacao:
                    qry1.ParamByName('Xml_Aut').Value := '1';
                  teManifDestDesconhecimento:
                    qry1.ParamByName('Xml_Aut').Value := '1';
                  teManifDestOperNaoRealizada:
                    qry1.ParamByName('Xml_Aut').Value := '1';
                  teManifDestCiencia:
                    qry1.ParamByName('Xml_Aut').Value := '1';
                else
                  qry1.ParamByName('Xml_Aut').Value := '0';
                end;

                Case FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.
                  Items[I].resEvento.tpEvento of
                  teManifDestConfirmacao:
                    qry1.ParamByName('Xml_Bai').Value := '1';
                  teManifDestDesconhecimento:
                    qry1.ParamByName('Xml_Bai').Value := '1';
                  teManifDestOperNaoRealizada:
                    qry1.ParamByName('Xml_Bai').Value := '1';
                  teManifDestCiencia:
                    qry1.ParamByName('Xml_Bai').Value := '1';
                else
                  qry1.ParamByName('Xml_Bai').Value := '0';
                end;

                qry1.ParamByName('NSU').AsString :=
                  FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.
                  Items[I].NSU;
                qry1.ParamByName('Codigo_loja').AsInteger := codLoja;
                qry1.ParamByName('Chave_nfe').AsString :=
                  FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items
                  [I].resDFe.chDFe;
                qry1.ParamByName('Evento').AsString := '0';
                qry1.ParamByName('cnpj_cpf').Value :=
                  FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items
                  [I].resDFe.CNPJCPF;
                qry1.ParamByName('xNome').Value :=
                  copy(FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.
                  Items[I].resDFe.xNome, 1, 60);
                qry1.ParamByName('IE').Value :=
                  FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items
                  [I].resDFe.IE;
                qry1.ParamByName('dEmi').Value :=
                  StrToDateTime(FormatDateTime('dd/mm/yyyy',
                  FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items
                  [I].resDFe.dhEmi));
                Case FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.
                  Items[I].resDFe.tpNF of
                  tnEntrada:
                    qry1.ParamByName('tpNF').AsString := '0';
                  tnSaida:
                    qry1.ParamByName('tpNF').AsString := '1';
                end;
                qry1.ParamByName('vNF').AsFloat :=
                  FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items
                  [I].resDFe.vNF;
                qry1.ParamByName('digVal').Value :=
                  FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items
                  [I].resDFe.digVal;
                qry1.ParamByName('dhRecbto').Value :=
                  StrToDateTime(FormatDateTime('dd/mm/yyyy hh:nn:ss',
                  FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items
                  [I].resDFe.dhRecbto));
                qry1.ParamByName('cStat').Value :=
                  FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.cStat;
                qry1.ParamByName('xMotivo').Value :=
                  FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.xMotivo;
                Case FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.
                  Items[I].resDFe.cSitDFe of
                  snAutorizado:
                    qry1.ParamByName('cSitNFe').AsString := '1';
                  snDenegado:
                    qry1.ParamByName('cSitNFe').AsString := '2';
                  snCancelado:
                    qry1.ParamByName('cSitNFe').AsString := '3';
                  snEncerrado:
                    qry1.ParamByName('cSitNFe').AsString := '4';
                end;

                Case FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.
                  Items[I].resDFe.cSitDFe of
                  snAutorizado:
                    begin

                      case FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.
                        docZip.Items[I].resEvento.tpEvento of
                        teManifDestConfirmacao:
                          qry1.ParamByName('cSitConf').Value := '1';
                        teManifDestDesconhecimento:
                          qry1.ParamByName('cSitConf').Value := '2';
                        teManifDestOperNaoRealizada:
                          qry1.ParamByName('cSitConf').Value := '3';
                        teManifDestCiencia:
                          qry1.ParamByName('cSitConf').Value := '4';
                      else
                        qry1.ParamByName('cSitConf').Value := '0';

                      end;
                    end;

                  snDenegado:
                    qry1.ParamByName('cSitConf').Value := 5;

                  snCancelado:
                    qry1.ParamByName('cSitConf').Value := 6;

                  snEncerrado:
                    qry1.ParamByName('cSitConf').Value := 7;

                end;

                Case FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.
                  Items[I].resEvento.tpEvento of
                  teManifDestConfirmacao:
                    vtpEvento := '210200';
                  teManifDestDesconhecimento:
                    vtpEvento := '210210';
                  teManifDestOperNaoRealizada:
                    vtpEvento := '210220';
                  teManifDestCiencia:
                    vtpEvento := '210240';
                else
                  vtpEvento := '';
                end;

                if (vtpEvento <> '') then
                begin
                  qry1.ParamByName('Evento').Value := '1';
                  qry1.ParamByName('id').Value := 'ID' + vtpEvento +
                    FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.
                    Items[I].resDFe.chDFe + '1';
                end
                else
                begin
                  qry1.ParamByName('id').Value := '';
                  qry1.ParamByName('Evento').Value := '0';
                end;

                qry1.ExecSQL;
              except
                on e: exception do
                begin
                  gravalog('[ConsultaNSU]508 Loja ' + Fempresa.codigo_loja +
                    ' ERRO: MDe não criada !' + chr(13) + e.Message, CNPJ);
                end;

              end;
            end
            else
            begin
              gravalog('[ConsultaNSU] Loja ' + Fempresa.codigo_loja +
                ' chave ja gravada na tabela nfe_MDFe chave ' +
                FgbNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[I]
                .resDFe.chDFe, CNPJ);
            end;

          end;

        end;
        FgbNFe.NotasFiscais.Clear;
        FgbNFe.EventoNFe.Evento.Clear;
      end;
      smensagen := '';
    except
      on e: exception do
      begin
        smensagen := '[ConsultaNSU] 537 Loja  ' + Fempresa.codigo_loja +
          '  ERRO ' + e.Message;

        Fchave := smensagen;

      end;
    end;
  finally
    if FcountNotas > 0 then

      smensagen := '[ConsultaNSU] Loja ' + Fempresa.codigo_loja +
        '  - processo finalizado, ' + IntToStr(FcountNotas) +
        ' documentos encontrados';
    gravalog(smensagen, CNPJ);
    sendMessageServer(smensagen);
    try
      FreeAndNil(FgbNFe);
      fcon.Close;
      FreeAndNil(fcon);
      FreeAndNil(qry1);
      FreeAndNil(qry2);
      FreeAndNil(FdaoEmpresa);
      FreeAndNil(FDaoBase);
      try
        FreeAndNil(Fempresa);
      finally

      end;
    except
    end;

  end;
end;

procedure TGbConsultarDestinadasClass.Execute;
begin
  inherited;
  // thead não sera mais chamada de modo automatico
end;

procedure TGbConsultarDestinadasClass.setAcbr;
begin
  TAcbrConfig.setAcbrObj(FgbNFe, Fempresa);
  FgbNFe.Configuracoes.Arquivos.Salvar := True;
  FgbNFe.Configuracoes.Arquivos.EmissaoPathNFe := True;
  FgbNFe.Configuracoes.Arquivos.PathNFe := FdirXml;
  FgbNFe.Configuracoes.Arquivos.DownloadDFe.PathDownload := FdirXml;
  FgbNFe.Configuracoes.Arquivos.PathInu := FdirXml;
  FgbNFe.Configuracoes.Arquivos.PathEvento := FdirXml;
  FgbNFe.Configuracoes.Geral.Salvar := True;
end;

end.

unit dfe.services.ciencia_operacao;

interface

uses
  windows,

  dfe.services.importar_xml,
  dfe.lib.acbr.config,
  variants,
  dfe.lib.util,
  dfe.model.empresa,
  FireDAC.Stan.Intf,
  system.SysUtils,
  dfe.dao.base,
  dfe.dao.empresa,
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
  FireDAC.Stan.param,
  FireDAC.Phys.MSSQL,
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
  TGbCienciaOperacaoClass = class(TThread)
  public
    procedure Execute; override;

    procedure executarCiencia(CodigoLoja: integer);
  private
    FcodigoLoja: integer;
    FcnpjLoja: string;
    FDaoBase: TDaoBase;
    FDaoEmpresa: TDaoEmpresa;
    Floja: integer;
    FmodelEmpresa: Tempresa;
    FrecNo: integer;
    Fchave: string;
    FcountNotas: integer;
    qry1: TFDQuery;
    consulta: TFDQuery;
    qry2: TFDQuery;
    fcon: TFDConnection;
    FgbNFe: TACBrNFe;
    FdirXml: string;
    FdirXMLimportado: string;
    lst: tstringList;
    smensagen: string;
    baixaXml: boolean;
    chave: string;
    idLote: string;
    cnpj: string;
    vEvento: string;
    strPathArquivo: string;
    vVer_leiaute: string;
    vVerEvento: string;
    lMsg: string;
    vId: string;
    vStatus: integer;
    vtpE: string;
    vtpEvento: string;
    vdescEvento: string;
    vdhEvento: TDateTime;

    procedure atualizarMDe();
    procedure setMde();

    procedure setAcbr();
    procedure inicializarComponentes;
    function fTrataErro(Status: integer; ChvCompl: string = ''): string;
    procedure setConsulta;
    procedure importarXmlAutomatizado;
    procedure dolog(msg: string);

  published
    property loja: integer read Floja write Floja;
  end;

implementation

procedure TGbCienciaOperacaoClass.setMde();
begin
  try
    with FgbNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0]
      .RetInfEvento do
    begin
      lMsg := 'Id: ' + id + #13 + 'tpAmb: ' + TpAmbToStr(tpAmb) + #13 +
        'verAplic: ' + verAplic + #13 + 'cOrgao: ' + inttostr(cOrgao) + #13 +
        'cStat: ' + inttostr(cstat) + #13 + 'xMotivo: ' + xMotivo + #13 +
        'chNFe: ' + chNFe + #13 + 'tpEvento: ' + TpEventoToStr(tpEvento) + #13 +
        'xEvento: ' + xEvento + #13 + 'nSeqEvento: ' + inttostr(nSeqEvento) +
        #13 + 'CNPJDest: ' + CNPJDest + #13 + 'emailDest: ' + emailDest + #13 +
        'dhRegEvento: ' + DateTimeToStr(dhRegEvento) + #13 + 'nProt: ' + nProt;
      dolog('[CienciaOperacao]145 - loja: ' + inttostr(FcodigoLoja) + ' ' +
        smensagen);
      vStatus := cstat;
      vtpE := TpEventoToStr(tpEvento);
      qry1.Close;
      qry1.SQL.Clear;
      qry1.SQL.Add('SET DATEFORMAT dmy        ');
      qry1.SQL.Add('update nfe_MDFe  set      ');
      qry1.SQL.Add('   cSitConf      = :cSitConf   ');
      qry1.SQL.Add('  where      ');
      qry1.SQL.Add('    Codigo_loja = :Codigo_loja    ');
      qry1.SQL.Add('    and Evento  = :Evento       ');
      qry1.SQL.Add
        ('   and  isnull( Chave_nfe, '''')  Like ''%'' + :Chave_nfe + ''%'' ');
      qry1.ParamByName('Codigo_loja').AsInteger := FcodigoLoja;
      qry1.ParamByName('Chave_nfe').AsString := chNFe;
      qry1.ParamByName('Evento').Value := consulta['MDFe_Evento'];
      qry1.ParamByName('cSitConf').Value := 4;
      try
        qry1.ExecSQL;
      except
        on e: exception do
          dolog('[CienciaOperacao]165 ' + inttostr(FcodigoLoja) + ' ' +
            e.Message);

      end;
      qry1.Close;

      qry1.SQL.Clear;
      qry1.SQL.Add('SET DATEFORMAT dmy        ');
      qry1.SQL.Add('update nfe_MDFe  set      ');
      qry1.SQL.Add('      Xml_Aut       = :Xml_Aut        ');
      qry1.SQL.Add('   ,  Xml_Bai       = :Xml_Bai        ');
      qry1.SQL.Add('   ,  Ver_leiaute   = :Ver_leiaute    ');
      qry1.SQL.Add('   ,  id            = :id   ');
      qry1.SQL.Add('   ,  cOrgao        = :cOrgao   ');
      qry1.SQL.Add('   ,  dhEvento      = :dhEvento   ');
      qry1.SQL.Add('   ,  tpEvento      = :tpEvento   ');
      qry1.SQL.Add('   ,  nSeqEvento    = :nSeqEvento     ');
      qry1.SQL.Add('   ,  verEvento     = :verEvento      ');
      qry1.SQL.Add('   ,  desEvento     = :desEvento      ');
      qry1.SQL.Add('   ,  xJust         = :xJust    ');
      qry1.SQL.Add('   ,  cStat         = :cStat    ');
      qry1.SQL.Add('   ,  xMotivo       = :xMotivo    ');
      qry1.SQL.Add('   ,  dhRegEvento   = :dhRegEvento    ');
      qry1.SQL.Add('   ,  cSitConf      = :cSitConf   ');
      qry1.SQL.Add('   ,  nProt         =:nProt    ');
      qry1.SQL.Add('    ');
      qry1.SQL.Add('  where      ');
      qry1.SQL.Add('    Codigo_loja = :Codigo_loja    ');
      qry1.SQL.Add('    and Evento  = :Evento       ');
      qry1.SQL.Add
        ('   and  isnull( Chave_nfe, '''')  Like ''%'' + :Chave_nfe + ''%'' ');
      qry1.ParamByName('Codigo_loja').AsInteger := FcodigoLoja;
      qry1.ParamByName('Chave_nfe').AsString := chNFe;

      if (lst.Count > 0) then
      begin
        qry1.ParamByName('Xml_Aut').Value := '1';
        qry1.ParamByName('Xml_Bai').Value := '1';
      end
      else
      begin
        qry1.ParamByName('Xml_Aut').Value := '0';
        qry1.ParamByName('Xml_Bai').Value := '0';
      end;

      qry1.ParamByName('Evento').Value := consulta['MDFe_Evento'];

      qry1.ParamByName('Ver_leiaute').Value := vVer_leiaute;
      qry1.ParamByName('id').Value := vId;
      qry1.ParamByName('cOrgao').Value := cOrgao;
      qry1.ParamByName('dhEvento').Value :=
        StrToDateTime(FormatDateTime('dd/mm/yyyy', vdhEvento));
      qry1.ParamByName('tpEvento').Value := tpEvento;
      qry1.ParamByName('nSeqEvento').Value := nSeqEvento;
      qry1.ParamByName('verEvento').Value := vVerEvento;
      qry1.ParamByName('desEvento').Value := xEvento;
      qry1.ParamByName('xJust').Value := '';
      qry1.ParamByName('cStat').Value := inttostr(cstat);
      qry1.ParamByName('xMotivo').Value := xMotivo;
      qry1.ParamByName('dhRegEvento').Value :=
        StrToDateTime(FormatDateTime('dd/mm/yyyy', dhRegEvento));
      qry1.ParamByName('cSitConf').Value := 4;
      smensagen := inttostr(cstat);
      dolog('[CienciaOperacao]210 - Retorno do manifesto :' + inttostr(cstat) +
        '  = ' + fTrataErro(cstat));
      case cstat of
        650:
          qry1.ParamByName('cSitConf').Value := 6;
        // Cancelada
        653:
          qry1.ParamByName('cSitConf').Value := 5;
        // Denegada
        654:
          qry1.ParamByName('cSitConf').Value := 6;
        // Cancelada
        574, 575, 576:
          qry1.ParamByName('cSitConf').Value := 7;
        // Terceiros
      end;

      qry1.ParamByName('nProt').Value := nProt;
      try
        qry1.ExecSQL;

      except
        on e: exception do
          raise exception.Create('Eroo ao atualizar tabela manifestos ' +
            e.Message);

      end;
      case cstat of
        650, 653, 654, 574, 575, 576:

        end;
        smensagen := '';
        case cstat of 650, 654:
          begin
            smensagen := 'Att: Nota nº ' + copy(consulta['MDFe_Chave_nfe'], 26,
              9) + ', com uso cancelada!';

          end;

        653:
          smensagen := 'Att: Nota nº ' + copy(consulta['MDFe_Chave_nfe'], 26, 9)
            + ', com uso denegaga!';
        574, 575, 576:
          smensagen := 'Att: Nota nº ' + copy(consulta['MDFe_Chave_nfe'], 26, 9)
            + ', com uso de terceiros!';

      end;
    end;
    if smensagen <> '' then
      dolog('[CienciaOperacao]269-Loja: ' + inttostr(FcodigoLoja) + ' ' +
        smensagen);
  except
    on e: exception do
    begin
      dolog('[CienciaOperacao]274 ' + inttostr(FcodigoLoja) + ' ' + e.Message);
    end;
  end;
end;

procedure TGbCienciaOperacaoClass.atualizarMDe();
begin
  qry1.Close;
  qry1.SQL.Clear;
  qry1.SQL.Add('SET DATEFORMAT dmy    ');
  qry1.SQL.Add('update nfe_MDFe  set      ');
  qry1.SQL.Add('      Xml_Bai   = :Xml_Bai    ');
  qry1.SQL.Add('    ');
  qry1.SQL.Add('  where Codigo_loja = :Codigo_loja    and   ');
  qry1.SQL.Add('    Evento      = :Evento   and   ');
  qry1.SQL.Add('  isnull( Chave_nfe, '''')  Like ''%'' + :Chave_nfe + ''%'' ');
  qry1.ParamByName('Xml_Bai').Value := '1';
  qry1.ParamByName('Codigo_loja').AsInteger := FcodigoLoja;
  qry1.ParamByName('Evento').AsString := consulta['MDFe_Evento'];
  qry1.ParamByName('Chave_nfe').AsString := Fchave;
  qry1.ExecSQL;
end;

Procedure TGbCienciaOperacaoClass.inicializarComponentes();
begin

  FDaoBase := TDaoBase.Create;
  FDaoEmpresa := TDaoEmpresa.Create;

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
  lst := tstringList.Create;
  FdirXml := ExtractFilePath(GetModuleName(HInstance)) + 'Arq\Emp' +
    inttostr(FcodigoLoja) + '\Xml\';
  FdirXMLimportado := ExtractFilePath(GetModuleName(HInstance)) + 'Arq\Emp' +
    inttostr(FcodigoLoja) + '\XmlI\';
  ForceDirectories(FdirXMLimportado);
  ForceDirectories(FdirXml);

  FmodelEmpresa := FDaoEmpresa.getempresaCod(inttostr(FcodigoLoja));
  FcnpjLoja := FmodelEmpresa.cnpj;
  setAcbr();
  consulta.ResourceOptions.CmdExecMode := amNonBlocking;
  qry1.ResourceOptions.CmdExecMode := amNonBlocking;
  qry2.ResourceOptions.CmdExecMode := amNonBlocking;
  fcon.ResourceOptions.CmdExecMode := amNonBlocking;
end;

procedure TGbCienciaOperacaoClass.dolog(msg: string);
begin

  gravalog(msg, FcnpjLoja);

end;

procedure TGbCienciaOperacaoClass.executarCiencia(CodigoLoja: integer);
var

  indContador: integer;

begin
  FcodigoLoja := CodigoLoja;
  inicializarComponentes();
  try
    try
      setConsulta;
      consulta.Open();
      consulta.Last;
      FcountNotas := consulta.RecordCount;
      if FcountNotas > 0 then
        dolog('[CienciaOperacao 339 -Loja: ' + inttostr(CodigoLoja) +
          '  - Consulta realizada -> documentos a manifestar ' +
          inttostr(FcountNotas));
      consulta.First;
      while not consulta.Eof do
      begin
        try
          baixaXml := false;
          chave := consulta['MDFe_Chave_nfe'];
          dolog('[CienciaOperacao] 348- Loja ' + inttostr(CodigoLoja) +
            ' Manfifestando nota -> ' + chave);
          Fchave := chave;
          FrecNo := consulta.RecNo;

          idLote := consulta['MDFe_idLote'];

          cnpj := FmodelEmpresa.cnpj;
          vEvento := inttostr(StrToInt(consulta['MDFe_Evento']) + 1);
          if consulta['PosMov'] <> 3 then
          begin
            FgbNFe.NotasFiscais.Clear;
            FgbNFe.EventoNFe.Evento.Clear;

            with FgbNFe.EventoNFe.Evento.Add do
            begin
              infEvento.tpEvento := teManifDestCiencia;
              vtpEvento := '210210';
              vdescEvento := 'Ciencia da Operacao';
              lst.Clear;
              dolog('[CienciaOperacao]368 - Loja: ' + inttostr(CodigoLoja) +
                ' localizando o arquivo ' + chave + '-nfe.xml ');
              getFilesRecursive(lst, chave + '-nfe.xml', FdirXml);

              baixaXml := lst.Count = 0;

              if lst.Count > 0 then
              begin
                with TGbImportadorClass.Create(lst[0], inttostr(CodigoLoja)) do
                begin
                  Importar;
                  free;
                end;
              end
              else
                dolog('[CienciaOperacao]383 - Loja: ' + inttostr(CodigoLoja) +
                  ' o arquivo ' + chave +
                  '-nfe.xml  não foi encontrando para importacao apos ciencia da operaçao ');

              vId := 'ID' + vtpEvento + chave + '1';
              infEvento.id := vId;
              infEvento.cOrgao := 91;

              If (FmodelEmpresa.Web_Ambiente = 'P') then
                infEvento.tpAmb := taProducao
              else
                infEvento.tpAmb := taHomologacao;

              infEvento.cnpj := cnpj;
              infEvento.chNFe := chave;
              infEvento.dhEvento := now();
              vdhEvento := now();
              infEvento.nSeqEvento := 1;
              infEvento.detEvento.descEvento := vdescEvento;

            end;

            if not(FgbNFe.EnviarEvento(StrToInt(idLote))) then
            begin

              dolog('[CienciaOperacao] 407 - Loja:' + inttostr(CodigoLoja) +
                ' Abortando processo! Erro de no envio do evento!');
              exit;
            end;

            vVer_leiaute := FgbNFe.EventoNFe.Evento.Add.infEvento.versaoEvento;
            vVerEvento := FgbNFe.EventoNFe.Evento.Add.infEvento.
              detEvento.versao;
            setMde();
          end;

          if consulta['MDFe_cSitNFe'] = 2 then
            smensagen := 'Att: Nota nº ' + copy(consulta['MDFe_Chave_nfe'], 6,
              9) + ', com uso denegado!'
          else if consulta['MDFe_cSitNFe'] = 3 then
            smensagen := 'Att: Nota nº ' + copy(consulta['MDFe_Chave_nfe'], 26,
              9) + ', com uso cancelado!'
          else if consulta['MDFe_cSitNFe'] = 4 then
            smensagen := 'Att: Nota nº ' + copy(consulta['MDFe_Chave_nfe'], 26,
              9) + ', com uso encerrado!';

          dolog('[CienciaOperacao]428 - loja: ' + inttostr(CodigoLoja) + ' ' +
            smensagen);

          if baixaXml then
          begin
            with FgbNFe do
            begin
              WebServices.DistribuicaoDFe.CNPJCPF := FmodelEmpresa.cnpj;

              If FmodelEmpresa.Web_Ambiente = 'P' then
                Configuracoes.WebServices.ambiente := taProducao
              else
                Configuracoes.WebServices.ambiente := taHomologacao;
              FgbNFe.Configuracoes.Arquivos.DownloadDFe.PathDownload := FdirXml;
              FgbNFe.Configuracoes.Arquivos.PathEvento := FdirXml;
              FgbNFe.Configuracoes.Arquivos.PathSalvar := FdirXml;
              FgbNFe.Configuracoes.Arquivos.PathNFe := FdirXml;
              FgbNFe.Configuracoes.Arquivos.PathInu := FdirXml;

              FgbNFe.Configuracoes.Arquivos.PathSchemas :=
                ExtractFilePath(GetModuleName(HInstance)) + 'Schemas\';
              Configuracoes.Arquivos.PathSalvar :=
                FgbNFe.Configuracoes.Arquivos.PathSalvar;

              if not(DistribuicaoDFePorChaveNFe(UFtoCUF(FmodelEmpresa.uf),
                FmodelEmpresa.cnpj, VarToStr(consulta['MDFe_Chave_nfe']))) then

              begin
                smensagen := 'O download falhou pra chave:' +
                  VarToStr(consulta['MDFe_Chave_nfe']);

                dolog('[CienciaOperacao] 458 - Loja:' + inttostr(CodigoLoja) +
                  ' ' + smensagen);

              end
              else
              begin
                dolog('[CienciaOperacao] 464 - Loja: ' + inttostr(CodigoLoja) +
                  ' download realizado ');

              end;
              strPathArquivo := '';
              with WebServices.DistribuicaoDFe.retDistDFeInt do
              begin
                for indContador := 0 to docZip.Count - 1 do
                begin
                  Fchave := docZip.Items[indContador].resDFe.chDFe;
                  strPathArquivo := FdirXml + FormatDateTime('yyyymm',
                    consulta.FieldByName('MDFe_dEmi').AsDateTime);

                  ForceDirectories(strPathArquivo);
                  strPathArquivo := strPathArquivo + '\Down\';
                  ForceDirectories(strPathArquivo);
                  strPathArquivo := strPathArquivo + docZip.Items[indContador]
                    .resDFe.chDFe + '-nfe.xml';
                  with tstringList.Create do
                  begin
                    dolog('[CienciaOperacao]484 - loja: ' + inttostr(CodigoLoja)
                      + ' gravando arquivo ' + strPathArquivo);
                    text := WebServices.DistribuicaoDFe.retDistDFeInt.docZip
                      [indContador].XML;
                    SaveToFile(strPathArquivo);
                    free;
                  end;
                  dolog('[CienciaOperacao] 491 - loja: ' + inttostr(CodigoLoja)
                    + ' Realizando importacao do arquivo ' + strPathArquivo);

                  with TGbImportadorClass.Create(strPathArquivo,
                    inttostr(CodigoLoja)) do
                  begin
                    Importar;
                    free;
                  end;

                  if ((cstat = 138) or (cstat = 139) or (cstat = 140) or
                    (cstat = 555)) then
                  begin
                    try
                      if ((cstat = 138) or (cstat = 139) or (cstat = 140)) then
                      begin

                        atualizarMDe();
                      end;

                    except
                      on e: exception do
                      begin
                        smensagen := 'ERRO: MDe não alterada ' + e.Message;
                        dolog('[CienciaOperacao] ' + inttostr(CodigoLoja) + ' '
                          + smensagen);
                      end;
                    end;
                    lMsg := 'Protocolo: ' + docZip.Items[indContador]
                      .resDFe.nProt + #13 + 'cStat: ' + inttostr(cstat) + #13 +
                      'xMotivo: ' + xMotivo + #13 + 'chNFe: ' + docZip.Items
                      [indContador].resDFe.chDFe;
                    dolog('[CienciaOperacao] ' + inttostr(CodigoLoja) +
                      ' ' + lMsg);
                  end
                  else
                  begin

                    case cstat of

                      137, 653, 654:
                        fTrataErro(cstat,
                          (' para a chave: ' +
                          VarToStr(consulta['MDFe_Chave_nfe'])));

                    else
                      fTrataErro(cstat);

                    end;

                  end;
                end;
              end;
            end;
          end;

        except
          on e: exception do
          begin
            dolog('[CienciaOperacao] E530 ' + inttostr(CodigoLoja) + ' ' +
              e.Message);
          end;
        end;
        consulta.Next;
      end; // end while
    except
      on e: exception do
      begin
        smensagen := e.Message;
        dolog('[CienciaOperacao] E539 ' + inttostr(CodigoLoja) + ' ' +
          smensagen);
      end;

    end;
    DeleteInfoDashBoard;
  finally
    freeAndNil(FgbNFe);
    freeAndNil(FDaoBase);
    freeAndNil(FDaoEmpresa);
    fcon.Close;
    freeAndNil(fcon);
    freeAndNil(qry1);
    freeAndNil(qry2);
    importarXmlAutomatizado();

  end;
end;

procedure TGbCienciaOperacaoClass.Execute;
begin
  inherited;
  if Floja = 0 then
  begin
    executarCiencia(Floja);
  end;
end;

function TGbCienciaOperacaoClass.fTrataErro(Status: integer;
  ChvCompl: string = ''): string;
var
  msn: string;
begin

  case Status of
    137:
      msn := 'Nenhum documento localizado' + ChvCompl;
    489:
      msn := 'CNPJ informado inválido (DV ou zeros)';
    490:
      msn := 'CPF informado inválido (DV ou zeros)';
    491:
      msn := 'O tpEvento informado inválido';
    492:
      msn := 'O verEvento informado inválido';
    493:
      msn := 'Evento não atende o Schema XML específico';
    494:
      msn := 'Chave de Acesso inexistente';
    572:
      msn := 'Erro Atributo ID do evento não corresponde' + chr(13) +
        'a concatenação dos campos (“ID” +' + chr(13) +
        'tpEvento + chNFe + nSeqEvento)';
    573:
      msn := 'Duplicidade de Evento';
    574:
      msn := 'O autor do evento diverge do' + chr(13) + 'emissor da NF-e';
    575:
      msn := 'O autor do evento diverge do' + chr(13) + 'destinatário da NF-e';
    576:
      msn := 'O autor do evento não é um órgão' + chr(13) +
        'autorizado a gerar o evento';
    577:
      msn := 'A data do evento não pode ser' + chr(13) +
        'menor que a data de emissão da NF-e';
    578:
      msn := 'A data do evento não pode ser' + chr(13) +
        'maior que a data do processamento';
    579:
      msn := 'A data do evento não pode ser menor que a' + chr(13) +
        'data de autorização para NF-e não' + chr(13) +
        'emitida em contingência';
    580:
      msn := 'O evento exige uma NF-e autorizada';
    587:
      msn := 'Usar somente o namespace padrão da NF-e';
    588:
      msn := 'Não é permitida a presença de caracteres' + chr(13) +
        'de edição no início/fim da mensagem ou entre as' + chr(13) +
        'tags da mensagem';
    589:
      msn := 'Número do NSU informado superior ao maior' + chr(13) +
        'NSU da base de dados da SEFAZ';
    593:
      msn := 'CNPJ-Base consultado difere do CNPJ-Base' + chr(13) +
        'do Certificado Digital';
    594:
      msn := 'O número de sequencia do evento informado' + chr(13) +
        'é maior que o permitido';
    595:
      msn := 'Obrigatória a informação da' + chr(13) +
        'justificativa do evento';
    596:
      msn := 'Evento apresentado fora do prazo: [prazo vigente]';
    614:
      msn := 'Chave de Acesso inválida (Código UF inválido)';
    615:
      msn := 'Chave de Acesso inválida (Ano menor que' + chr(13) +
        '06 ou Ano maior que Ano corrente)';
    616:
      msn := 'Chave de Acesso inválida' + chr(13) +
        '(Mês menor que 1 ou Mês maior que 12)';
    617:
      msn := 'Chave de Acesso inválida' + chr(13) +
        '(CNPJ zerado ou dígito inválido)';
    618:
      msn := 'Chave de Acesso inválida' + chr(13) + '(modelo diferente de 55)';
    619:
      msn := 'Chave de Acesso inválida (número NF = 0)';
    631:
      msn := 'CNPJ-Base do Destinatário difere do' + chr(13) +
        'CNPJ-Base do Certificado Digital';
    632:
      msn := 'Solicitação fora de prazo, a NF-e não' + chr(13) +
        'está mais disponível para download';
    633:
      msn := 'NF-e indisponível para download devido' + chr(13) +
        'a ausência de Manifestação do Destinatário';
    634:
      msn := 'Destinatário da NF-e não tem o mesmo' + chr(13) +
        'CNPJ raiz do solicitante do download';
    650:
      msn := 'Evento de "Ciência da Operação" para' + chr(13) +
        'NF-e Cancelada ou Denegada';
    651:
      msn := 'Evento de "Desconhecimento da Operação"' + chr(13) +
        'para NF-e Cancelada ou Denegada';

    653:
      msn := 'NF-e Cancelada, arquivo' + chr(13) + 'indisponível para download'
        + ChvCompl;
    654:
      msn := 'NF-e Denegada, arquivo' + chr(13) + 'indisponível para download'
        + ChvCompl;
    655:
      msn := 'Evento de Ciência da Operação informado' + chr(13) +
        'após a manifestação final do destinatário';
    656:
      msn := 'Consumo Indevido';
    657:
      msn := 'Código do Órgão diverge do órgão autorizador';
    658:
      msn := 'UF do destinatário da Chave de Acesso' + chr(13) +
        'diverge da UF autorizadora';

  else
    msn := ' Retorno Sefaz -> ' + inttostr(Status);
  end;

  Result := msn;
  dolog('CienciaOperacao]' + msn);
end;

procedure TGbCienciaOperacaoClass.setAcbr;
begin

  TAcbrConfig.setAcbrObj(FgbNFe, FmodelEmpresa);
  FgbNFe.Configuracoes.Arquivos.Salvar := True;
  FgbNFe.Configuracoes.Arquivos.EmissaoPathNFe := True;
  FgbNFe.Configuracoes.Arquivos.PathNFe := FdirXml;
  FgbNFe.Configuracoes.Arquivos.DownloadDFe.PathDownload := FdirXml;
  FgbNFe.Configuracoes.Arquivos.PathInu := FdirXml;
  FgbNFe.Configuracoes.Arquivos.PathEvento := FdirXml;
  FgbNFe.Configuracoes.Geral.Salvar := True;
  If FmodelEmpresa.Web_Ambiente = 'P' then
  begin

    FgbNFe.NotasFiscais.Add.nfe.Ide.tpAmb := taProducao;
    FgbNFe.Configuracoes.WebServices.ambiente := taProducao;

  end
  else
  begin

    FgbNFe.NotasFiscais.Add.nfe.Ide.tpAmb := taHomologacao;
    FgbNFe.Configuracoes.WebServices.ambiente := taHomologacao;

  end;

end;

procedure TGbCienciaOperacaoClass.setConsulta;
begin
  with consulta.SQL do
  begin

    Clear;
    Add('SET DATEFORMAT dmy    ');
    Add('Select distinct   ');
    Add('      ');
    Add('  Checado=''''    ');
    Add(' ,t1.Xml_Aut   as  MDFe_Xml_Aut   ');
    Add(' ,t1.Xml_Bai   as  MDFe_Xml_Bai   ');
    Add(' ,t1.idLote    as  MDFe_idLote    ');
    Add(' ,t1.Codigo_Loja     as  MDFe_Codigo_Loja   ');
    Add(' ,t1.Chave_nfe   as  MDFe_Chave_nfe     ');
    Add(' ,t1.Evento    as  MDFe_Evento    ');
    Add(' ,t1.Ver_Leiaute     as  MDFe_Ver_Leiaute   ');
    Add(' ,t1.id    as  MDFe_id      ');
    Add(' ,t1.cOrgao    as  MDFe_cOrgao    ');
    Add(' ,t1.dhEvento    as  MDFe_dhEvento      ');
    Add(' ,t1.tpEvento    as  MDFe_tpEvento      ');
    Add(' ,t1.nSeqEvento      as  MDFe_nSeqEvento    ');
    Add(' ,t1.verEvento   as  MDFe_verEvento     ');
    Add(' ,t1.desEvento   as  MDFe_desEvento     ');
    Add(' ,t1.xJust     as  MDFe_xJust   ');
    Add(' ,t1.cStat     as  MDFe_cStat   ');
    Add(' ,t1.xMotivo   as  MDFe_xMotivo   ');
    Add(' ,t1.dhRegEvento     as  MDFe_dhRegEvento   ');
    Add(' ,t1.nProt     as  MDFe_nProt   ');
    Add(' ,t1.NSU   as  MDFe_NSU     ');
    Add(' ,t1.xNome     as  MDFe_xNome   ');
    Add(' ,t1.cnpj_cpf    as  MDFe_cnpj_cpf      ');
    Add(' ,t1.IE    as  MDFe_IE      ');
    Add(' ,t1.dEmi      as  MDFe_dEmi    ');
    Add(' ,t1.tpNF      as  MDFe_tpNF    ');
    Add(' ,t1.vNF   as  MDFe_vNF     ');
    Add(' ,t1.digVal    as  MDFe_digVal    ');
    Add(' ,t1.dhRecbto    as  MDFe_dhRecbto      ');
    Add(' ,t1.cSitNFe   as  MDFe_cSitNFe   ');
    Add(' ,t1.cSitConf    as  MDFe_cSitConf      ');
    Add('      ');
    Add(' ,t2.cnpj      as  MEMI_cnpj    ');
    Add('      ');
    Add(' ,PosMov = CASE t3.PosMov   ');
    Add('     WHEN ''C'' THEN Cast(''2'' AS Integer)   ');
    Add('     WHEN ''E'' THEN Cast(''3'' AS Integer)   ');
    Add('     WHEN ''I'' THEN Cast(''4'' AS Integer)   ');
    Add('     WHEN ''P'' THEN Cast(''5'' AS Integer)   ');
    Add('     ELSE Cast( ISNULL(t3.PosMov, ''1'') AS Integer)    ');
    Add('  END   ');
    Add('      ');
    Add(' from nfe_MDFe t1     ');
    Add('   join emitente t2 on t1.codigo_loja = t2.codigo_loja  ');
    Add('    left join NFeE_Mov t3 on t1.Chave_nfe   = t3.ChvNFe   ');
    Add('      ');
    Add(' where t1.Codigo_Loja = :Codigo_Loja1   ');
    Add(' and   t2.Codigo_Loja = :Codigo_Loja2   ');

    Add(' and   cSitConf       = 0   ');

    consulta.ParamByName('codigo_loja1').AsInteger := Floja;
    consulta.ParamByName('Codigo_Loja2').AsInteger := Floja;

  end;
end;

procedure TGbCienciaOperacaoClass.importarXmlAutomatizado;
var
  X: integer;
  vArq: string;
  lst: tstringList;
begin
  Try
    lst := tstringList.Create;
    getFiles(lst, '*.xml', FdirXMLimportado);
    if (lst.Count > 0) then

      dolog('[ImportacaoAutomatica] Documentos ' + inttostr(lst.Count) +
        '  ARQUIVOS ENCONTRADOS PARA IMPORTAÇAO AUTOMATICA EM ' +
        FdirXMLimportado);

    for X := 0 to lst.Count - 1 do
    begin
      try
        vArq := lst[X];

        dolog('[CienciaOperacao] loja:  ' + inttostr(FcodigoLoja) +
          ' Importando arquivo ' + vArq);

        with TGbImportadorClass.Create(vArq, inttostr(FcodigoLoja)) do
        begin
          Importar;
          free;
        end;
      except
      end;
    end;
  finally
    if assigned(lst) then
      freeAndNil(lst);
  End;

end;

end.

unit dfe.model.infonfe;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  System.json,
  System.classes;

type
  Tanalissemensal = class
    tipo: string;
    valor: double;
    data: TDateTime;
  end;

type
  Tinfoempresa = class
    codigo_loja: string;
    razao_social: string;
    nsu_data_consulta: string;
    nsu_sequencia: string;
  end;

type
  Tinfoempresas = TObjectList<Tinfoempresa>;

type
  TanalisesmensalList = TObjectList<Tanalissemensal>;

type
  TinfoNfe = class
  private
    FnotasEmitidas: integer;
    FnotasContigencia: integer;
    FnotasDenegadas: integer;
    FnotasPenddentes: integer;
    FnotasCanceladas: integer;
    FnotasInutilizadas: integer;
    FcienciaOperacao: integer;
    FconfirmacaoOperacao: integer;
    FdesconhecimentoOperaco: integer;

    FoperacaoNaoRealizada: integer;

    FerrosEmissao: integer;
    FdataUpdate: TDate;
    Fcod_Loja: integer;
    Fcnpj: string;
    Fanalissemensal: TanalisesmensalList;
    FNsuSequencia: double;
    FNSUdata: TDateTime;
    FultimaExecucao: string;
    Fempresas: Tinfoempresas;
    Flog: string;
  published
    property notasEmitidas: integer read FnotasEmitidas write FnotasEmitidas;
    property notasDenegadas: integer read FnotasDenegadas write FnotasDenegadas;
    property notasPendentes: integer read FnotasPenddentes
      write FnotasPenddentes;
    property notasContigencia: integer read FnotasContigencia
      write FnotasContigencia;
    property notasCanceladas: integer read FnotasCanceladas
      write FnotasCanceladas;
    property notasInutilizadas: integer read FnotasInutilizadas
      write FnotasInutilizadas;
    property errosEmissao: integer read FerrosEmissao write FerrosEmissao;
    property dataUpdate: TDate read FdataUpdate write FdataUpdate;
    property analissemensal: TanalisesmensalList read Fanalissemensal
      write Fanalissemensal;

    property cienciaOperacao: integer read FcienciaOperacao
      write FcienciaOperacao;
    property confirmacaoOperacao: integer read FconfirmacaoOperacao
      write FconfirmacaoOperacao;
    property desconhecimentoOperacao: integer read FdesconhecimentoOperaco
      write FdesconhecimentoOperaco;

    property operacaoNaoRealizada: integer read FoperacaoNaoRealizada
      write FoperacaoNaoRealizada;
    property cod_loja: integer read Fcod_Loja write Fcod_Loja;
    property cnpj: string read Fcnpj write Fcnpj;

    property NSUSequencia: double read FNsuSequencia write FNsuSequencia;
    property NSUdata: TDateTime read FNSUdata write FNSUdata;
    property ultimaExecucao: string read FultimaExecucao write FultimaExecucao;
    property empresas: Tinfoempresas read Fempresas write Fempresas;

    property log: string read Flog write Flog;

  public
    constructor create;
   destructor destroy;
  end;

implementation

{ TinfoNfe }

constructor TinfoNfe.create;
begin
  FnotasEmitidas := 0;
  FnotasCanceladas := 0;
  FnotasInutilizadas := 0;
  FerrosEmissao := 0;
  FdataUpdate := now;
  Fanalissemensal := TanalisesmensalList.create();;
  // Fempresas := Tinfoempresas.create();
  FoperacaoNaoRealizada := 0;
end;

destructor TinfoNfe.destroy;
begin
  FreeAndNil(Fanalissemensal);
end;

end.

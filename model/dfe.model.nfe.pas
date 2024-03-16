unit dfe.model.nfe;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  System.json,
  System.classes;

type
  TfiltroNota = class
  private
    Fcnpj: string;
    FlistType: string;
    Fcodigo_loja: string;
    Fnumero: Integer;
    Fserie: string;
    Fmodelo: string;
    Fchave: string;
    FdataInicial: Tdatetime;
    FdataFinal: Tdatetime;
    Fambiente: string;

    Fsituacao: string;
  public
    constructor create();
  published
    property cnpj: string read Fcnpj write Fcnpj;
    property codigo_loja: string read Fcodigo_loja write Fcodigo_loja;
    property numero: Integer read Fnumero write Fnumero;
    property serie: string read Fserie write Fserie;
    property chave: string read Fchave write Fchave;
    property dataInicial: Tdatetime read FdataInicial write FdataInicial;
    property dataFinal: Tdatetime read FdataFinal write FdataFinal;
    property modelo: string read Fmodelo write Fmodelo;
    property ambiente: string read Fambiente write Fambiente;
    property situacao: string read Fsituacao write Fsituacao;

    property listType: string read FlistType write FlistType;
  end;

Type
  Tnota = class
  private
    Fcnpj: string;
    Fcodigo_loja: string;
    Fnumero: Integer;
    Fserie: Integer;
    Fmodelo: string;
    Fchave: string;
    FdataEmissao: Tdatetime;
    Fxml: string;
    FxmlRetorno: string;
    Fstatus: Integer;
    Fmotivo: String;
    Ftxt: string;
    Fdigitoval: string;
    FdataValidacao: Tdatetime;
    FdataProcessamento: Tdatetime;
    Fprotocolo: string;
    Fdanfe: string;
    Fsituacao: string;
    Fcancelada: Boolean;
    Fambiente: string;
    Ffsda: Boolean;
    Femailtransportadora: string;
  public
    constructor create();
  published
    property cnpj: string read Fcnpj write Fcnpj;
    property codigo_loja: string read Fcodigo_loja write Fcodigo_loja;
    property numero: Integer read Fnumero write Fnumero;
    property serie: Integer read Fserie write Fserie;
    property chave: string read Fchave write Fchave;
    property dataEmissao: Tdatetime read FdataEmissao write FdataEmissao;
    property xml: string read Fxml write Fxml;
    property xmlRetorno: string read FxmlRetorno write FxmlRetorno;
    property txt: string read Ftxt write Ftxt;
    property status: Integer read Fstatus write Fstatus;
    property motivo: string read Fmotivo write Fmotivo;
    property dataValidacao: Tdatetime read FdataValidacao write FdataValidacao;
    property dataProcessamento: Tdatetime read FdataProcessamento
      write FdataProcessamento;
    property protocolo: string read Fprotocolo write Fprotocolo;
    property digitoval: string read Fdigitoval write Fdigitoval;
    property cancelada: Boolean read Fcancelada write Fcancelada;
    property danfe: string read Fdanfe write Fdanfe;
    property modelo: string read Fmodelo write Fmodelo;
    property ambiente: string read Fambiente write Fambiente;
    property situacao: string read Fsituacao write Fsituacao;
    property emailtransportadora: string read Femailtransportadora
      write Femailtransportadora;
    property Fsda: Boolean read Ffsda write Ffsda;

  end;

type
  Tnotas = TObjectList<Tnota>;

implementation

uses
  dfe.dao.nfe;

{ Tnota }

{ TfiltroNota }

constructor TfiltroNota.create;
begin
  Fnumero := 0;
  Fcodigo_loja := '';
  Fcnpj := '';
  FdataInicial := 0;
  FdataFinal := 0;
  Fambiente := 'H';
end;

{ Tnota }

constructor Tnota.create;
begin
  FdataEmissao := 0;
  Fcodigo_loja := '';
  Fnumero := 0;
  FdataProcessamento := 0;
  FdataValidacao := 0;
  Fambiente := 'H';
end;

end.

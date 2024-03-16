unit dfe.dto.cancelamento;

interface

uses
  System.SysUtils,
  System.Generics.Collections,

  System.classes;

Type
  TDtoCancelamento = class
  private
    Fcnpj: string;
    Fnumero: integer;
    Fserie: integer;
    Fchave: string;
    Fambiente: integer;
    FprotocoloNota: string;
    FprotocoloCancelamento: string;
    Fdata: string;
    Fjustificativa: string;
    Fcstat: integer;
    Fxmotivo: string;
    FxmlRetorno: string;
    Fdanfe: string;
    FdanfeBase64: string;
    FemailDestinatario: string;
  public

  published

    property cnpj: string read Fcnpj write Fcnpj;
    property numero: integer read Fnumero write Fnumero;
    property serie: integer read Fserie write Fserie;
    property chave: string read Fchave write Fchave;
    property ambiente: integer read Fambiente write Fambiente;
    property protocoloNota: string read FprotocoloNota write FprotocoloNota;
    property protocoloCancelamento: string read FprotocoloCancelamento
      write FprotocoloCancelamento;
    property data: string read Fdata write Fdata;
    property justificativa: string read Fjustificativa write Fjustificativa;
    property cstat: integer read Fcstat write Fcstat;
    property xmotivo: string read Fxmotivo write Fxmotivo;
    property xmlRetorno: string read FxmlRetorno write FxmlRetorno;
    property danfe: string read Fdanfe write Fdanfe;
    property danfeBase64: string read FdanfeBase64 write FdanfeBase64;
    property emailDestinatario: string read FemailDestinatario
      write FemailDestinatario;
  end;

type

  TDtoCancelamentos = TObjectList<TDtoCancelamento>;

implementation

end.

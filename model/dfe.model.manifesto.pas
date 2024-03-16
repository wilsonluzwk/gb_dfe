unit dfe.model.manifesto;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  System.classes;

type
  TfiltroManifesto = class
  private
    Fcnpj: string;
    FlistType: string;
    Fcodigo_loja: string;
    Ftipo: string;
    Fchave: string;
    FdataInicial: Tdatetime;
    FdataFinal: Tdatetime;
    Fcstat: string;
    FdesEvento: string;
    Fxmotivo: string;
    FTipoData:string;
  public

  published
    property cnpj: string read Fcnpj write Fcnpj;
    property codigo_loja: string read Fcodigo_loja write Fcodigo_loja;

    property tipo: string read Ftipo write Ftipo;
    property chave: string read Fchave write Fchave;
    property dataInicial: Tdatetime read FdataInicial write FdataInicial;
    property dataFinal: Tdatetime read FdataFinal write FdataFinal;
    property cstat: string read Fcstat write Fcstat;
    property xmotivo: string read Fxmotivo write Fxmotivo;
    property desEvento: string read FdesEvento write FdesEvento;
    property tipoData: string read FTipoData write FTipoData;

  end;

Type
  Tmanifesto = class
  private
    Fcnpj: string;
    Fchave: string;
    Ftipo: integer;
    FdataHora: Tdatetime;
    Fsequencia: integer;
    Fjustificativa: string;
    FxmlEvento: string;
    Fprotocolo: string;
    Fcstat: integer;
    Fxmotivo: string;
    Fdanfe: string;
    FdescEvento: string;

    FdanfeBase64: string;
  public
    constructor create;
  published
    property cnpj: string read Fcnpj write Fcnpj;
    property chave: string read Fchave write Fchave;
    property dataHora: Tdatetime read FdataHora write FdataHora;
    property sequencia: integer read Fsequencia write Fsequencia;
    property justificativa: string read Fjustificativa write Fjustificativa;
    property xmlEvento: string read FxmlEvento write FxmlEvento;
    property cstat: integer read Fcstat write Fcstat;
    property xmotivo: string read Fxmotivo write Fxmotivo;
    property protocolo: string read Fprotocolo write Fprotocolo;
    property danfe: string read Fdanfe write Fdanfe;
    property tipo: integer read Ftipo write Ftipo;
    property danfeBase64: string read FdanfeBase64 write FdanfeBase64;
    property descEvento: string read FdescEvento write FdescEvento;

  end;

type
  Tmanifestos = TObjectList<Tmanifesto>;

implementation

{ Tmanifesto }

{ Tmanifesto }

constructor Tmanifesto.create;
begin
  tipo := 0;
  cstat := 0;

end;

end.

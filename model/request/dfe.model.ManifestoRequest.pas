unit dfe.model.manifestoRequest;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  System.classes;

Type
  TmanifestoRequest = class

  private
    Foperacao: string;
    Fcnpj: string;
    Fchave: string;
    FdataHora: TDateTime;
    Fsequencia: integer;
    Fjustificativa: string;
    Ftipo: integer;
  public
    constructor create;
  published
    property operacao: string read Foperacao;
    property cnpj: string read Fcnpj write Fcnpj;
    property chave: string read Fchave write Fchave;
    property dataHora: TDateTime read FdataHora write FdataHora;
    property sequencia: integer read Fsequencia write Fsequencia;
    property justificativa: string read Fjustificativa write Fjustificativa;
    property tipo: integer read Ftipo write Ftipo;

  end;

implementation

{ TmanifestoRequestRequest }

constructor TmanifestoRequest.create;
begin
  Foperacao := 'manifesto'
end;

end.

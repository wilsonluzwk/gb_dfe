unit dfe.model.validacaoRequest;

interface

uses
  SysUtils,
  System.Generics.Collections,

  System.classes;

Type
  TValidacaoRequest = class

  private
    Foperacao: string;
    Fcnpj: string;
    Fnumero: integer;
    Fserie: integer;
    Fmodelo: integer;
    Fxml: string;
    Ftxt: string;
    Femailtransportadora:string;
    Flote: string;

  public
    constructor create;
  published
    property operacao: string read Foperacao;
    property cnpj: string read Fcnpj write Fcnpj;
    property numero: integer read Fnumero write Fnumero;
    property emailtransportadora :string read Femailtransportadora write Femailtransportadora;
    property serie: integer read Fserie write Fserie;
    property modelo: integer read Fmodelo write Fmodelo;
    property xml: string read Fxml write Fxml;
    property txt: string read Ftxt write Ftxt;
    property lote: string read Flote write Flote;
      end;

implementation

{ TValidacaoRequest }

constructor TValidacaoRequest.create;
begin
  Foperacao := 'validacao'
end;

end.

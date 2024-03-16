unit WK.Server.Dto.NotaServico;

interface

uses
  WK.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TEndereco = class;
  TIss = class;
  TValor = class;

  TValor = class
  private
    FDescontoCondicionado: Integer;
    FDescontoIncondicionado: Integer;
    FServico: double;
  published
    property DescontoCondicionado: Integer read FDescontoCondicionado write FDescontoCondicionado;
    property DescontoIncondicionado: Integer read FDescontoIncondicionado write FDescontoIncondicionado;
    property Servico: double read FServico write FServico;
  end;

  TIss = class
  private
    FAliquota: Integer;
    FExigibilidade: Integer;
    FTipoTributacao: Integer;
  published
    property Aliquota: Integer read FAliquota write FAliquota;
    property Exigibilidade: Integer read FExigibilidade write FExigibilidade;
    property TipoTributacao: Integer read FTipoTributacao write FTipoTributacao;
  end;

  TServico = class
  private

    FCnae: string;
    FCodigo: string;
    FCodigoTributacao: string;
    FDiscriminacao: string;
    FIss: TIss;
    FValor: TValor;
  published
    property Cnae: string read FCnae write FCnae;
    property Codigo: string read FCodigo write FCodigo;
    property CodigoTributacao: string read FCodigoTributacao write FCodigoTributacao;
    property Discriminacao: string read FDiscriminacao write FDiscriminacao;
    property Iss: TIss read FIss;
    property Valor: TValor read FValor;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TEndereco = class
  private
    FBairro: string;
    FCep: string;

    FCodigoCidade: string;
    FComplemento: string;
    FDescricaoCidade: string;
    FEstado: string;
    FLogradouro: string;
    FNumero: string;
    FTipoBairro: string;
    FTipoLogradouro: string;
  published
    property Bairro: string read FBairro write FBairro;
    property Cep: string read FCep write FCep;
    property CodigoCidade: string read FCodigoCidade write FCodigoCidade;
    property Complemento: string read FComplemento write FComplemento;
    property DescricaoCidade: string read FDescricaoCidade write FDescricaoCidade;
    property Estado: string read FEstado write FEstado;
    property Logradouro: string read FLogradouro write FLogradouro;
    property Numero: string read FNumero write FNumero;
    property TipoBairro: string read FTipoBairro write FTipoBairro;
    property TipoLogradouro: string read FTipoLogradouro write FTipoLogradouro;
  end;

  TTomador = class
  private
    FCpfCnpj: string;
    FEmail: string;
    FEndereco: TEndereco;
    FInscricaoMunicipal: string;
    FRazaoSocial: string;
  published
    property CpfCnpj: string read FCpfCnpj write FCpfCnpj;
    property Email: string read FEmail write FEmail;
    property Endereco: TEndereco read FEndereco;
    property InscricaoMunicipal: string read FInscricaoMunicipal write FInscricaoMunicipal;
    property RazaoSocial: string read FRazaoSocial write FRazaoSocial;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TPrestador = class
  private
    FCpfCnpj: string;
  published
    property CpfCnpj: string read FCpfCnpj write FCpfCnpj;
  end;

  TNotaServico = class(TJsonDTO)
  private
    FIdIntegracao: string;
    FPrestador: TPrestador;
    [JSONName('servico'), JSONMarshalled(False)]
    FServicoArray: TArray<TServico>;
    [GenericListReflect]
    FServico: TObjectList<TServico>;
    FTomador: TTomador;
    function GetServico: TObjectList<TServico>;
  protected
    function GetAsJson: string; override;
  published
    property IdIntegracao: string read FIdIntegracao write FIdIntegracao;
    property Prestador: TPrestador read FPrestador;
    property Servico: TObjectList<TServico> read GetServico;
    property Tomador: TTomador read FTomador;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

implementation

{ TServico }

constructor TServico.Create;
begin
  inherited;
  FIss := TIss.Create;
  FValor := TValor.Create;
end;

destructor TServico.Destroy;
begin
  FIss.Free;
  FValor.Free;
  inherited;
end;

{ TTomador }

constructor TTomador.Create;
begin
  inherited;
  FEndereco := TEndereco.Create;
end;

destructor TTomador.Destroy;
begin
  FEndereco.Free;
  inherited;
end;

{ TNotaServico }

constructor TNotaServico.Create;
begin
  inherited;
  FPrestador := TPrestador.Create;
  FTomador := TTomador.Create;
end;

destructor TNotaServico.Destroy;
begin
  FPrestador.Free;
  FTomador.Free;
  GetServico.Free;
  inherited;
end;

function TNotaServico.GetServico: TObjectList<TServico>;
begin
  Result := ObjectList<TServico>(FServico, FServicoArray);
end;

function TNotaServico.GetAsJson: string;
begin
  RefreshArray<TServico>(FServico, FServicoArray);
  Result := inherited;
end;

end.

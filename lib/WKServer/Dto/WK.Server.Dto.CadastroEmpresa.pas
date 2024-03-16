unit WK.Server.Dto.CadastroEmpresa;

interface

uses
  WK.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TCalculoAutomaticoIbpt = class;
  TConfig = class;
  TEmail = class;
  TNumeracao = class;
  TPrefeitura = class;
  TRps = class;

  TCalculoAutomaticoIbpt = class
  private
    FAtivo: Boolean;
  published
    property Ativo: Boolean read FAtivo write FAtivo;
  end;

  TEmail = class
  private
    FEnvio: Boolean;
  published
    property Envio: Boolean read FEnvio write FEnvio;
  end;

  TPrefeitura = class
  private
    [SuppressZero]
    FDataInicio: TDateTime;
    FLei: string;
    FLogin: string;
    FReceitaBruta: Integer;
    FSenha: string;
  published
    property DataInicio: TDateTime read FDataInicio write FDataInicio;
    property Lei: string read FLei write FLei;
    property Login: string read FLogin write FLogin;
    property ReceitaBruta: Integer read FReceitaBruta write FReceitaBruta;
    property Senha: string read FSenha write FSenha;
  end;

  TNumeracao = class
  private
    FNumero: Integer;
    FSerie: string;
  published
    property Numero: Integer read FNumero write FNumero;
    property Serie: string read FSerie write FSerie;
  end;

  TRps = class(TJsonDTO)
  private
    FLote: Integer;
    [JSONName('numeracao'), JSONMarshalled(False)]
    FNumeracaoArray: TArray<TNumeracao>;
    [GenericListReflect]
    FNumeracao: TObjectList<TNumeracao>;
    FNumeracaoAutomatica: Boolean;
    function GetNumeracao: TObjectList<TNumeracao>;
  protected
    function GetAsJson: string; override;
  published
    property Lote: Integer read FLote write FLote;
    property Numeracao: TObjectList<TNumeracao> read GetNumeracao;
    property NumeracaoAutomatica: Boolean read FNumeracaoAutomatica write FNumeracaoAutomatica;
  public
    destructor Destroy; override;
  end;

  TConfig = class
  private
    FCalculoAutomaticoIbpt: TCalculoAutomaticoIbpt;
    FEmail: TEmail;
    FNfseNacional: Boolean;
    FPrefeitura: TPrefeitura;
    FProducao: Boolean;
    FRps: TRps;
  published
    property CalculoAutomaticoIbpt: TCalculoAutomaticoIbpt read FCalculoAutomaticoIbpt;
    property Email: TEmail read FEmail;
    property NfseNacional: Boolean read FNfseNacional write FNfseNacional;
    property Prefeitura: TPrefeitura read FPrefeitura;
    property Producao: Boolean read FProducao write FProducao;
    property Rps: TRps read FRps;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TNfse = class
  private
    FAtivo: Boolean;
    FConfig: TConfig;
    FTipoContrato: Integer;
  published
    property Ativo: Boolean read FAtivo write FAtivo;
    property Config: TConfig read FConfig;
    property TipoContrato: Integer read FTipoContrato write FTipoContrato;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TTelefone = class
  private
    FDdd: string;
    FNumero: string;
  published
    property Ddd: string read FDdd write FDdd;
    property Numero: string read FNumero write FNumero;
  end;

  TEndereco = class
  private
    FBairro: string;
    FCep: string;
    [SuppressZero]
    FCodigoCidade: TDateTime;
    FCodigoPais: string;
    FComplemento: string;
    FDescricaoCidade: string;
    FDescricaoPais: string;
    FEstado: string;
    FLogradouro: string;
    FNumero: string;
    FTipoBairro: string;
    FTipoLogradouro: string;
  published
    property Bairro: string read FBairro write FBairro;
    property Cep: string read FCep write FCep;
    property CodigoCidade: TDateTime read FCodigoCidade write FCodigoCidade;
    property CodigoPais: string read FCodigoPais write FCodigoPais;
    property Complemento: string read FComplemento write FComplemento;
    property DescricaoCidade: string read FDescricaoCidade write FDescricaoCidade;
    property DescricaoPais: string read FDescricaoPais write FDescricaoPais;
    property Estado: string read FEstado write FEstado;
    property Logradouro: string read FLogradouro write FLogradouro;
    property Numero: string read FNumero write FNumero;
    property TipoBairro: string read FTipoBairro write FTipoBairro;
    property TipoLogradouro: string read FTipoLogradouro write FTipoLogradouro;
  end;

  TCadastroEmpresa = class(TJsonDTO)
  private
    FCertificado: string;
    FCpfCnpj: string;
    FEmail: string;
    FEndereco: TEndereco;
    FIncentivadorCultural: Boolean;
    FIncentivoFiscal: Boolean;
    FInscricaoEstadual: string;
    FInscricaoMunicipal: string;
    FNfse: TNfse;
    FNomeFantasia: string;
    FRazaoSocial: string;
    FRegimeTributario: Integer;
    FRegimeTributarioEspecial: Integer;
    FSimplesNacional: Boolean;
    FTelefone: TTelefone;
  published
    property Certificado: string read FCertificado write FCertificado;
    property CpfCnpj: string read FCpfCnpj write FCpfCnpj;
    property Email: string read FEmail write FEmail;
    property Endereco: TEndereco read FEndereco;
    property IncentivadorCultural: Boolean read FIncentivadorCultural write FIncentivadorCultural;
    property IncentivoFiscal: Boolean read FIncentivoFiscal write FIncentivoFiscal;
    property InscricaoEstadual: string read FInscricaoEstadual write FInscricaoEstadual;
    property InscricaoMunicipal: string read FInscricaoMunicipal write FInscricaoMunicipal;
    property Nfse: TNfse read FNfse;
    property NomeFantasia: string read FNomeFantasia write FNomeFantasia;
    property RazaoSocial: string read FRazaoSocial write FRazaoSocial;
    property RegimeTributario: Integer read FRegimeTributario write FRegimeTributario;
    property RegimeTributarioEspecial: Integer read FRegimeTributarioEspecial write FRegimeTributarioEspecial;
    property SimplesNacional: Boolean read FSimplesNacional write FSimplesNacional;
    property Telefone: TTelefone read FTelefone;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

implementation

{ TRps }

destructor TRps.Destroy;
begin
  GetNumeracao.Free;
  inherited;
end;

function TRps.GetNumeracao: TObjectList<TNumeracao>;
begin
  Result := ObjectList<TNumeracao>(FNumeracao, FNumeracaoArray);
end;

function TRps.GetAsJson: string;
begin
  RefreshArray<TNumeracao>(FNumeracao, FNumeracaoArray);
  Result := inherited;
end;

{ TConfig }

constructor TConfig.Create;
begin
  inherited;
  FRps := TRps.Create;
  FPrefeitura := TPrefeitura.Create;
  FEmail := TEmail.Create;
  FCalculoAutomaticoIbpt := TCalculoAutomaticoIbpt.Create;
end;

destructor TConfig.Destroy;
begin
  FRps.Free;
  FPrefeitura.Free;
  FEmail.Free;
  FCalculoAutomaticoIbpt.Free;
  inherited;
end;

{ TNfse }

constructor TNfse.Create;
begin
  inherited;
  FConfig := TConfig.Create;
end;

destructor TNfse.Destroy;
begin
  FConfig.Free;
  inherited;
end;

{ TCadastroEmpresa }

constructor TCadastroEmpresa.Create;
begin
  inherited;
  FEndereco := TEndereco.Create;
  FTelefone := TTelefone.Create;
  FNfse := TNfse.Create;
end;

destructor TCadastroEmpresa.Destroy;
begin
  FEndereco.Free;
  FTelefone.Free;
  FNfse.Free;
  inherited;
end;

end.

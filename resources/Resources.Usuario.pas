unit Resources.usuario;

interface

uses
  System.Classes,
  WK.Server.Attributes,
  System.SysUtils,
  System.Generics.Collections,
  WK.Server.ResourceBaseClass,
  WK.Utils.Criptografia,
  WK.Server.Connection;

type

  [Resource('usuario')]
  [Table('usuario')]

  TUsuario = class(TResourceBaseClass)
  private

  protected
    procedure ValidateBusiness(List: TObjectList<TObject>); override;
    procedure OnBeforePut; override;
    procedure OnBeforePost; override;
  public
    [DBField('ID', True, True, false, PrimaryKey)]
    [AutoInc('usuario_id_seq')]
    Id: Integer;
    [DBField('CPF', True, True, True, null)]
    Cpf: String;
    [DBField('NOME', True, True, True, null)]
    Nome: String;
    [DBField('LOGIN', True, True, True, null)]
    Login: String;
    [DBField('SENHA', True, True, True, null)]
    Senha: string;
    [DBField('NIVEL', True, True, True, null)]
    Nivel: Integer;
    [DBField('CARGO', True, True, True, null)]
    Cargo: String;
    [DBField('DEPARTAMENTO', True, True, True, null)]
    Departamento: String;
    [DBField('EMAIL', True, True, True, null)]
    Email: String;

  end;

implementation

{ TUsuario }
procedure TUsuario.OnBeforePost;

begin

  Email := LowerCase(Email);
  var
  LConnection := TConnection.Create;
  try
    LConnection.Query.Close;
    LConnection.Query.SQL.Add('select id from usuario');
    LConnection.Query.SQL.Add('where lower(email) = :email and id <> :id');
    LConnection.Query.ParamByName('email').AsString := Email.ToLower;
    LConnection.Query.ParamByName('id').AsInteger := Id;
    LConnection.Query.Open();
    if (LConnection.Query.RecordCount > 0) then
      raise Exception.Create('Email já está sendo usado por outro usuário !');

    LConnection.Query.Close;
    LConnection.Query.SQL.Clear;
    LConnection.Query.SQL.Add('select id from usuario');
    LConnection.Query.SQL.Add('where lower(login) = :login and id <> :id');
    LConnection.Query.ParamByName('login').AsString := Login.ToLower;
    LConnection.Query.ParamByName('id').AsInteger := Id;
    LConnection.Query.Open();
    if (LConnection.Query.RecordCount > 0) then
      raise Exception.Create('login já está sendo usado por outro usuário !');
    Senha := TCriptografia.Criptografar(Senha);
  finally
    LConnection.Free;

  end;
end;

procedure TUsuario.OnBeforePut;
begin
  Email := LowerCase(Email);
  Senha := TCriptografia.Criptografar(Senha);
end;

procedure TUsuario.ValidateBusiness(List: TObjectList<TObject>);
begin
end;

initialization

RegisterClass(TUsuario);

end.

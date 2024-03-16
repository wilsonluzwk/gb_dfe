unit Resources.nota;
interface
uses
  System.Classes,
  WK.Server.Attributes,
  System.Generics.Collections,
  WK.Server.ResourceBaseClass;
type

   [Resource('nota')]
   [Table('nota')]

   TNota = class(TResourceBaseClass)
   private
      
   protected
      procedure ValidateBusiness(List: TObjectList<TObject>); override; 
   public
     [DBField('ID'  ,True, True,false, PrimaryKey)]
     [AutoInc('nota_id_seq')]
     Id : Integer;
     [DBField('CNPJ'  ,True, True,True, null)]
     Cnpj : String;
     [DBField('CODIGO_LOJA'  ,True, True,True, null)]
     CodigoLoja : String;
     [DBField('NUMERO'  ,True, True,True, null)]
     Numero : Integer;
     [DBField('SERIE'  ,True, True,True, null)]
     Serie : Integer;
     [DBField('CHAVE'  ,True, True,True, null)]
     Chave : String;
     [DBField('DATAEMISSAO'  ,True, True,True, null)]
     Dataemissao : TDateTime;
     [DBField('XML'  ,True, True,True, null)]
     Xml : String;
     [DBField('XMLRETORNO'  ,True, True,True, null)]
     Xmlretorno : String;
     [DBField('TXT'  ,True, True,True, null)]
     Txt : String;
     [DBField('STATUS'  ,True, True,True, null)]
     Status : Integer;
     [DBField('MOTIVO'  ,True, True,True, null)]
     Motivo : String;
     [DBField('DATAVALIDACAO'  ,True, True,True, null)]
     Datavalidacao : TDateTime;
     [DBField('DATAPROCESSAMENTO'  ,True, True,True, null)]
     Dataprocessamento : TDateTime;
     [DBField('PROTOCOLO'  ,True, True,True, null)]
     Protocolo : String;
     [DBField('DIGITOVAL'  ,True, True,True, null)]
     Digitoval : String;
     [DBField('CANCELADA'  ,True, True,True, null)]
     Cancelada : boolean;
     [DBField('DANFE'  ,True, True,True, null)]
     Danfe : TBytea;
     [DBField('MODELO'  ,True, True,True, null)]
     Modelo : String;
     [DBField('AMBIENTE'  ,True, True,True, null)]
     Ambiente : String;
     [DBField('SITUACAO'  ,True, True,True, null)]
     Situacao : String;
     [DBField('EMAILTRANSPORTADORA'  ,True, True,True, null)]
     Emailtransportadora : String;
     [DBField('FSDA'  ,True, True,True, null)]
     Fsda : boolean;
     
	  
   end;

implementation

{TNota }
procedure TNota.ValidateBusiness(List: TObjectList<TObject>);
begin
end;
initialization

RegisterClass(TNota);

end.

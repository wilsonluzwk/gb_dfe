unit Resources.manifesto;
interface
uses
  System.Classes,
  WK.Server.Attributes,
  System.Generics.Collections,
  WK.Server.ResourceBaseClass;
type

   [Resource('manifesto')]
   [Table('manifesto')]

   TManifesto = class(TResourceBaseClass)
   private
      
   protected
      procedure ValidateBusiness(List: TObjectList<TObject>); override; 
   public
     [DBField('ID'  ,True, True,false, PrimaryKey)]
     [AutoInc('manifesto_id_seq')]
     Id : Integer;
     [DBField('CNPJ'  ,True, True,True, null)]
     Cnpj : String;
     [DBField('CHAVE'  ,True, True,True, null)]
     Chave : String;
     [DBField('DATAHORA'  ,True, True,True, null)]
     Datahora : TDateTime;
     [DBField('SEQUENCIA'  ,True, True,True, null)]
     Sequencia : Integer;
     [DBField('JUSTIFICATIVA'  ,True, True,True, null)]
     Justificativa : String;
     [DBField('XCORRECAO'  ,True, True,True, null)]
     Xcorrecao : String;
     [DBField('XMLEVENTO'  ,True, True,True, null)]
     Xmlevento : String;
     [DBField('CSTAT'  ,True, True,True, null)]
     Cstat : Integer;
     [DBField('XMOTIVO'  ,True, True,True, null)]
     Xmotivo : String;
     [DBField('PROTOCOLOCCE'  ,True, True,True, null)]
     Protocolocce : String;
     [DBField('EMAILDESTINATARIO'  ,True, True,True, null)]
     Emaildestinatario : String;
     [DBField('DANFE'  ,True, True,True, null)]
     Danfe : String;
     [DBField('DANFEBASE64'  ,True, True,True, null)]
     Danfebase64 : String;
     [DBField('TPAMB'  ,True, True,True, null)]
     Tpamb : String;
     [DBField('XMLRETORNO'  ,True, True,True, null)]
     Xmlretorno : String;
     [DBField('DESCEVENTO'  ,True, True,True, null)]
     Descevento : String;
     
	  
   end;

implementation

{TManifesto }
procedure TManifesto.ValidateBusiness(List: TObjectList<TObject>);
begin
end;
initialization

RegisterClass(TManifesto);

end.

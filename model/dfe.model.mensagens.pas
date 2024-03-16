unit dfe.model.mensagens;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  System.json,
  System.classes;

type
  TmensagemServer = class
  private
    Fmsgtype: string;
    Fmsgcontent: string;
    Fdata: TdateTime;
    Fpriority: Integer;
  public
    constructor create;
  published
    property msgtype: string read Fmsgtype write Fmsgtype;
    property msgcontent: string read Fmsgcontent write Fmsgcontent;
    property data: TdateTime read Fdata write Fdata;
    property priority: Integer read Fpriority write Fpriority;
  end;

implementation

{ TmensagemServer }

constructor TmensagemServer.create;
begin
  Fmsgtype:='Info';
  Fpriority:=0;
  Fdata:=now;

end;

end.

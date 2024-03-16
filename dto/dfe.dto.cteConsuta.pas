unit dfe.dto.cteConsuta;

interface
uses
  classes;
  type
   TDtoCteConsulta =class
   Private
     FId : double;
     FCodigoLoja : Integer;
     FNsu : String;
     FChdfe : String;
     FCnpjcpf : String;
     FXnome : String;
     FIe : String;
     FDhemi : TDateTime;
     FTpnf : String;
     FVnf : double;
     FDigval : String;
     FDhrecbto : TDateTime;
     FNprot : String;
     FCsitdfe : String;
     FEventocorgao : Integer;
     FEventocnpjcpf : String;
     FEventochdfe : String;
     FEventodhevento : TDateTime;
     FEventotpevento : String;
     FEventonseqevento : Integer;
     FEventoxevento : String;
     FEventodhrecbto : TDateTime;
     FEventonprot : String;
     FXml : String;
   published
    property  Id : double read FId write FId;
    property  CodigoLoja : Integer read FCodigoLoja write FCodigoLoja;
     property  Nsu : String read FNsu write FNsu;
     property  Chdfe : String  read FChdfe write FChdfe;
     property  Cnpjcpf : String read FCnpjcpf write FCnpjcpf;
     property  Xnome : String read FXnome  write FXnome ;
     property  Ie : String read FIe  write FIe ;
     property  Dhemi : TDateTime read FDhemi write FDhemi;
     property  Tpnf : String read FTpnf write FTpnf;
     property  Vnf : double read FVnf write FVnf;
     property  Digval : String read FDigval write FDigval;
     property  Dhrecbto : TDateTime read FDhrecbto write FDhrecbto;
     property  Nprot : String read FNprot write FNprot;
     property  Csitdfe : String read FCsitdfe write FCsitdfe;
     property  Eventocorgao : Integer read FEventocorgao write FEventocorgao;
     property  Eventocnpjcpf : String read FEventocnpjcpf write FEventocnpjcpf;
     property  Eventochdfe : String read FEventochdfe write FEventochdfe;
     property  Eventodhevento : TDateTime read FEventodhevento write FEventodhevento;
     property  Eventotpevento : String read FEventotpevento write FEventotpevento;
     property  Eventonseqevento : Integer read FEventonseqevento write FEventonseqevento;
     property  Eventoxevento : String read FEventoxevento write FEventoxevento;
     property  Eventodhrecbto : TDateTime read FEventodhrecbto write FEventodhrecbto;
     property  Eventonprot : String read FEventonprot write FEventonprot;
     property  Xml : String read Fxml write Fxml;
   end;
implementation

end.

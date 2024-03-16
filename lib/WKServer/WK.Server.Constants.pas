unit WK.Server.Constants;

interface




resourcestring
  sPortInUse = '- Error: Port %s already in use';
  sPortSet = '- Port set to %s';
  sServerRunning = '- The Server is already running';
  sStartingServer = '- Starting HTTP Server on port %d';
  sStoppingServer = '- Stopping Server';
  sServerStopped = '- Server Stopped';
  sServerNotRunning = '- The Server is not running';
  sInvalidCommand = '- Error: Invalid Command';
  sIndyVersion = '- Indy Version: ';
  sActive = '- Active: ';
  sPort = '- Port: ';
  sSessionID = '- Session ID CookieName: ';
  sCommands = 'Enter a Command: ' + slineBreak +
    '   - "start" to start the server'+ slineBreak +
    '   - "stop" to stop the server'+ slineBreak +
    '   - "set port" to change the default port'+ slineBreak +
    '   - "status" for Server status'+ slineBreak +
    '   - "help" to show commands'+ slineBreak +
    '   - "exit" to close the application';

const
  cArrow = '->';
  cCommandStart = 'start';
  cCommandStop = 'stop';
  cCommandStatus = 'status';
  cCommandHelp = 'help';
  cCommandSetPort = 'set port';
  cCommandExit = 'exit';
  cWebRepository = 'web' ;
  cAppWeb ='http://20.109.50.102';
  cUrlApi ='20.109.50.102:8081';

  cConnectionDefName ='GbDfeConection';
  cConfigFileName  ='GBNFe.Ini' ;
  cUrlAssasSandbox ='https://sandbox.asaas.com/api/v3';
  cUrlAssasProducao ='https://api.asaas.com/v3';
  curlsAssas: array [0 .. 1] of string = (cUrlAssasSandbox, cUrlAssasProducao);
  curlPlugNotas: array [0 .. 1] of string = ('https://api.sandbox.plugnotas.com.br',
    'https://api.plugnotas.com.br');

 cLogoAscArt  =
 '+-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+   +-+ +-+ +-+ ' + #13#10+
 '|A| |P| |I|  | |D|F|E| |              |A |R|P| A| ' + #13#10+
 '+-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+   +-+ +-+ +-+ ' + #13#10;

implementation

end.



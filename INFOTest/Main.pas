unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.MaskUtils, System.Classes, System.StrUtils, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.DBCtrls, Data.DB,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, ViaCEP,
  Vcl.ComCtrls, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc,
  IdComponent,
  IdTCPConnection,
  IdTCPClient,
  IdHTTP,
  IdBaseComponent,
  IdMessage,
  IdExplicitTLSClientServerBase,
  IdMessageClient,
  IdSMTPBase,
  IdSMTP,
  IdIOHandler,
  IdIOHandlerSocket,
  IdIOHandlerStack,
  IdSSL,
  IdSSLOpenSSL,
  IdAttachmentFile,
  IdText;

type
  TfrmMain = class(TForm)
    cdsCliente: TClientDataSet;
    dsCliente: TDataSource;
    cdsClienteNome: TStringField;
    cdsClienteIdentidade: TStringField;
    cdsClienteCPF: TStringField;
    cdsClienteTelefone: TStringField;
    cdsClienteEmail: TStringField;
    cdsClienteCEP: TStringField;
    cdsClienteLogradouro: TStringField;
    cdsClienteNumero: TIntegerField;
    cdsClienteComplemento: TStringField;
    cdsClienteBairro: TStringField;
    cdsClienteCidade: TStringField;
    cdsClienteEstado: TStringField;
    cdsClientePais: TStringField;
    PageControl1: TPageControl;
    tshClientes: TTabSheet;
    tshDados: TTabSheet;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    dbeNome: TDBEdit;
    Label2: TLabel;
    dbeIdentidade: TDBEdit;
    Label3: TLabel;
    dbeCPF: TDBEdit;
    Label4: TLabel;
    dbeTelefone: TDBEdit;
    Label5: TLabel;
    dbeEmail: TDBEdit;
    Label6: TLabel;
    Bevel1: TBevel;
    Label7: TLabel;
    dbeCEP: TDBEdit;
    Label8: TLabel;
    dbeLogradouro: TDBEdit;
    Label9: TLabel;
    dbeNumero: TDBEdit;
    Label10: TLabel;
    dbeComplemento: TDBEdit;
    Label11: TLabel;
    dbeBairro: TDBEdit;
    Label12: TLabel;
    dbeCidade: TDBEdit;
    Label13: TLabel;
    dbeEstado: TDBEdit;
    Label14: TLabel;
    dbePais: TDBEdit;
    Button1: TButton;
    SaveDialog: TSaveDialog;
    Button2: TButton;
    XMLDocument: TXMLDocument;
    tshEmail: TTabSheet;
    ledOrigem: TLabeledEdit;
    ledDestino: TLabeledEdit;
    ledLogin: TLabeledEdit;
    ledSenha: TLabeledEdit;
    ledSMTP: TLabeledEdit;
    btnEnviar: TButton;
    ledPorta: TLabeledEdit;
    chbSSL: TCheckBox;
    chbTLS: TCheckBox;
    OpenDialog: TOpenDialog;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure dbeCEPExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
  private
    procedure CreateXML(AFileName: String);
    function GetClientList: String;
    function GetXMLFileName: String;
    function SendEmail(ABody, AFileName: String): Boolean;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  with SaveDialog do
  begin
    if Execute then
    begin
      cdsCliente.SaveToFile(FileName, dfXML);
    end;
  end;
end;

procedure TfrmMain.Button2Click(Sender: TObject);
begin
  with OpenDialog do
  begin
    if Execute then
    begin
      cdsCliente.LoadFromFile(FileName);
    end;
  end;
end;

procedure TfrmMain.btnEnviarClick(Sender: TObject);
begin
  if ledSMTP.EditText.Trim.IsEmpty then
  begin
    Application.MessageBox('Favor informar o servidor de SMTP para o envio correto do e-mail', 'Erro', MB_ICONERROR);
    Abort;
  end;

  if ledPorta.EditText.Trim.IsEmpty then
  begin
    Application.MessageBox('Favor informar a porta do servidor de SMTP para o envio correto do e-mail', 'Erro', MB_ICONERROR);
    Abort;
  end;

  if ledOrigem.EditText.Trim.IsEmpty then
  begin
    Application.MessageBox('Favor informar o e-mail de origem da mensagem', 'Erro', MB_ICONERROR);
    Abort;
  end;

  if ledDestino.EditText.Trim.IsEmpty then
  begin
    Application.MessageBox('Favor informar o e-mail de destino da mensagem', 'Erro', MB_ICONERROR);
    Abort;
  end;

  if ledLogin.EditText.Trim.IsEmpty then
  begin
    Application.MessageBox('Favor informar o usuário para efetuar o login na conta do e-mail de origem', 'Erro', MB_ICONERROR);
    Abort;
  end;

  if ledSenha.EditText.Trim.IsEmpty then
  begin
    Application.MessageBox('Favor informar a senha do usuário para efetuar o login na conta do e-mail de origem', 'Erro', MB_ICONERROR);
    Abort;
  end;

  if SendEmail(GetClientList, GetXMLFileName) then
  begin
    ShowMessage('E-mail enviado com sucesso');
  end;
end;

procedure TfrmMain.CreateXML(AFileName: String);
var
  RecsNode, ClientNode: IXMLNode;
begin
  XMLDocument.Active := True;
  XMLDocument.Encoding := 'ISO-8859-1';
  XMLDocument.Version := '1.0';

  RecsNode := XMLDocument.AddChild('registros');

  cdsCliente.DisableControls;
  cdsCliente.First;

  while not cdsCliente.Eof do
  begin
    ClientNode := RecsNode.AddChild('cliente');
    ClientNode.AddChild('nome').NodeValue := cdsClienteNome.Value;
    ClientNode.AddChild('identidade').NodeValue := cdsClienteIdentidade.Value;
    ClientNode.AddChild('cpf').NodeValue := cdsClienteCPF.Value;
    ClientNode.AddChild('telefone').NodeValue := cdsClienteTelefone.Value;
    ClientNode.AddChild('email').NodeValue := cdsClienteEmail.Value;
    ClientNode.AddChild('cep').NodeValue := cdsClienteCEP.Value;
    ClientNode.AddChild('logradouro').NodeValue := cdsClienteLogradouro.Value;
    ClientNode.AddChild('numero').NodeValue := cdsClienteNumero.Value;
    ClientNode.AddChild('complemento').NodeValue := cdsClienteComplemento.Value;
    ClientNode.AddChild('bairro').NodeValue := cdsClienteBairro.Value;
    ClientNode.AddChild('cidade').NodeValue := cdsClienteCidade.Value;
    ClientNode.AddChild('estado').NodeValue := cdsClienteEstado.Value;
    ClientNode.AddChild('pais').NodeValue := cdsClientePais.Value;

    cdsCliente.Next;
  end;

  XMLDocument.SaveToFile(AFileName);
  XMLDocument.Active := False;
  XMLDocument.XML.Clear;

  cdsCliente.EnableControls;
end;

procedure TfrmMain.dbeCEPExit(Sender: TObject);
var
  ViaCEP: TViaCEP;
begin
  if not cdsClienteCEP.IsNull and (cdsCliente.State in dsEditModes) then
  begin
    ViaCEP := TViaCEP.Create(cdsClienteCEP.AsString);

    try
      if ViaCEP.GetRespCode = 0 then
      begin
        cdsClienteLogradouro.AsString := ViaCEP.GetLogradouro.ToUpper;
        cdsClienteComplemento.AsString := ViaCEP.GetComplemento.ToUpper;
        cdsClienteBairro.AsString := ViaCEP.GetBairro.ToUpper;
        cdsClienteCidade.AsString := ViaCEP.GetLocalidade.ToUpper;
        cdsClienteEstado.AsString := ViaCEP.GetUF.ToUpper;
        cdsClientePais.AsString := 'BRASIL';
      end
      else
      begin
        cdsClienteLogradouro.Clear;
        cdsClienteComplemento.Clear;
        cdsClienteBairro.Clear;
        cdsClienteCidade.Clear;
        cdsClienteEstado.Clear;
        cdsClientePais.Clear;
        Application.MessageBox('CEP inválido', 'Erro', MB_ICONERROR);
      end;
    finally
      FreeAndNil(ViaCEP);
    end;
  end;
end;

procedure TfrmMain.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbInsert then
  begin
    dbeNome.SetFocus;
  end;
end;

procedure TfrmMain.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_RETURN then
  begin
    SelectNext(ActiveControl, True, True);
  end;
end;

function TfrmMain.GetClientList: String;
var
  List: TStrings;
begin
  List := TStringList.Create;

  try
    cdsCliente.DisableControls;
    cdsCliente.First;

    while not cdsCliente.Eof do
    begin
      List.Add('Nome: ' + cdsClienteNome.Value);
      List.Add('Identidad: ' + cdsClienteIdentidade.Value);
      List.Add('CPF: ' + cdsClienteCPF.Value);
      List.Add('Telefone: ' + cdsClienteTelefone.Value);
      List.Add('E-mail: ' + cdsClienteEmail.Value);
      List.Add('CEP: ' + cdsClienteCEP.Value);
      List.Add('Logradouro: ' + cdsClienteLogradouro.Value);
      List.Add('Número: ' + cdsClienteNumero.AsString);
      List.Add('Complemento: ' + cdsClienteComplemento.Value);
      List.Add('Bairro: ' + cdsClienteBairro.Value);
      List.Add('Cidade: ' + cdsClienteCidade.Value);
      List.Add('Estado: ' + cdsClienteEstado.Value);
      List.Add('País: ' + cdsClientePais.Value);
      List.Add('');

      cdsCliente.Next;
    end;

    cdsCliente.EnableControls;

    Result := List.Text;
  finally
    List.Free;
  end;
end;

function TfrmMain.GetXMLFileName: String;
begin
  Result := ExtractFilePath(ParamStr(0)) + 'clientes_info.xml';
end;

function TfrmMain.SendEmail(ABody, AFileName: String): Boolean;
var
  idMsg: TIdMessage;
  IdText: TIdText;
  idSMTP: TIdSMTP;
  IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
begin
  try
    try
      //Configura os parâmetros necessários para SSL
      IdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create(Self);

      //Variável referente a mensagem
      idMsg              := TIdMessage.Create(Self);
      idMsg.Encoding     := meMIME;
      idMsg.From.Name    := ledOrigem.EditText;
      idMsg.From.Address := ledOrigem.EditText;
      idMsg.Priority     := mpHighest;
      idMsg.Subject      := 'ENVIO DOS DADOS CADASTRAIS DO TESTE DE SELETIVIDADE INFO';

      //Add Destinatário(s)
      idMsg.Recipients.Add;
      idMsg.ReplyTo.EMailAddresses := idMsg.From.Address;
      idMsg.ReceiptRecipient.Address := idMsg.From.Address;
      idMsg.Recipients.EMailAddresses := ledDestino.EditText;

      //Variável do texto
      idText := TIdText.Create(idMsg.MessageParts);
      idText.Body.Add(ABody);
      idText.ContentType := 'text/plain; charset=iso-8859-1';

      //Cria o XML com os dados dos clientes
      CreateXML(AFileName);

      //Anexa ao email o XML gerado
      TIdAttachmentFile.Create(idMsg.MessageParts, AFileName);

      //Prepara o Servidor
      IdSMTP           := TIdSMTP.Create(Self);
      IdSMTP.AuthType  := satDefault;
      IdSMTP.Host      := ledSMTP.EditText;
      IdSMTP.Port      := StrToInt(ledPorta.EditText);
      IdSMTP.Username  := ledLogin.EditText;
      IdSMTP.Password  := ledSenha.EditText;

      //Configura de acordo com as opções de SSL e TLS
      if chbSSL.Checked or chbTLS.Checked then begin
        try
          idSMTP.IOHandler := IdSSLIOHandlerSocket;
          IdSSLIOHandlerSocket.SSLOptions.Mode := sslmClient;

          if chbTLS.Checked then begin
            IdSSLIOHandlerSocket.SSLOptions.Method := sslvTLSv1_2;
            idSMTP.UseTLS := utUseRequireTLS;
          end else begin
            IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
            idSMTP.UseTLS := utUseImplicitTLS;
          end;
        except
          idSMTP.IOHandler := TIdIOHandler.MakeDefaultIOHandler(Application);
          idSMTP.UseTLS := utNoTLSSupport;
        end;
      end;

      //configura o timeout
      IdSMTP.ConnectTimeout := 20000;

      //Conecta e Autentica
      try
        IdSMTP.Connect;
      except on E: Exception do
        Application.MessageBox(PWideChar('Erro na tentativa de conexão: ' + E.Message), 'Erro', MB_ICONERROR);
      end;

      try
        IdSMTP.Authenticate;
      except on E: Exception do
        Application.MessageBox(PWideChar('Erro na autenticação: ' + E.Message), 'Erro', MB_ICONERROR);
      end;

      //Se a conexão foi bem sucedida, envia a mensagem
      if IdSMTP.Connected then
      begin
        try
          IdSMTP.Send(idMsg);
        except on E:Exception do
          Application.MessageBox(PWideChar('Erro ao tentar enviar: ' + E.Message), 'Erro', MB_ICONERROR);
        end;
      end;

      //Depois de tudo pronto, desconecta do servidor SMTP
      if IdSMTP.Connected then
      begin
        IdSMTP.Disconnect;
      end;

      Result := True;
    finally
      UnLoadOpenSSLLibrary;
      FreeAndNil(idMsg);
      FreeAndNil(IdSSLIOHandlerSocket);
      FreeAndNil(idSMTP);
    end;
  except on E: Exception do
    begin
      Result := False;
    end;
  end;
end;

end.

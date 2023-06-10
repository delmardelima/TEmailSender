unit EmailSender;

interface

uses
  System.SysUtils, System.Classes, IdSMTP, IdSSLOpenSSL, IdMessage, IdText,
  IdExplicitTLSClientServerBase, IdAttachmentFile;

type
  TEmailSender = class
  private
    FFromAddress: string;
    FToAddress: string;
    FSubject: string;
    FBody: string;
    FSMTPHost: string;
    FSMTPPort: Integer;
    FSMTPUsername: string;
    FSMTPPassword: string;
    FAttachmentFilePath: string;
    procedure SetFromAddress(const Value: string);
    procedure SetToAddress(const Value: string);
    procedure SetSubject(const Value: string);
    procedure SetBody(const Value: string);
    procedure SetSMTPHost(const Value: string);
    procedure SetSMTPPort(const Value: Integer);
    procedure SetSMTPUsername(const Value: string);
    procedure SetSMTPPassword(const Value: string);
  public
    procedure SendEmail;
    property FromAddress: string read FFromAddress write SetFromAddress;
    property ToAddress: string read FToAddress write SetToAddress;
    property Subject: string read FSubject write SetSubject;
    property Body: string read FBody write SetBody;
    property SMTPHost: string read FSMTPHost write SetSMTPHost;
    property SMTPPort: Integer read FSMTPPort write SetSMTPPort;
    property SMTPUsername: string read FSMTPUsername write SetSMTPUsername;
    property SMTPPassword: string read FSMTPPassword write SetSMTPPassword;
    property AttachmentFilePath: string read FAttachmentFilePath
      write FAttachmentFilePath;
  end;

implementation

{ TEmailSender }

procedure TEmailSender.SendEmail;
var
  IdSMTP: TIdSMTP;
  IdSSL: TIdSSLIOHandlerSocketOpenSSL;
  IdMessage: TIdMessage;
  IdText: TIdText;
  Attachment: TIdAttachmentFile;
  Template: TStringList;
begin
  IdSMTP := TIdSMTP.Create(nil);
  IdSSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  IdMessage := TIdMessage.Create(nil);
  Template := TStringList.Create;
  try
    IdSSL.SSLOptions.Method := sslvTLSv1_2;
    IdSMTP.IOHandler := IdSSL;
    IdSMTP.UseTLS := utUseExplicitTLS;
    IdSMTP.Host := FSMTPHost;
    IdSMTP.Port := FSMTPPort;
    IdSMTP.AuthType := satDefault;
    IdSMTP.Username := FSMTPUsername;
    IdSMTP.Password := FSMTPPassword;

    IdMessage.From.Address := FFromAddress;
    IdMessage.Recipients.Add.Address := FToAddress;
    IdMessage.Subject := FSubject;

    IdMessage.MessageParts.Clear;
    IdMessage.ContentType := 'multipart/mixed';
    IdText := TIdText.Create(IdMessage.MessageParts, nil);
    IdText.ContentType := 'text/html';
    Template.LoadFromFile('Template.html');
    Template.Text := StringReplace(Template.Text, '<%TituloEmail%>', FSubject,
      [rfReplaceAll]);
    Template.Text := StringReplace(Template.Text, '<%ConteudoEmail%>', FBody,
      [rfReplaceAll]);
    Template.Text := StringReplace(Template.Text, '<%RodapeEmail%>',
      'Este é um email enviado pela Amil Contabilidade LTDA.', [rfReplaceAll]);
    IdText.CharSet := 'ISO-8859-1';
    IdText.Body.Text := Template.Text;

    if FAttachmentFilePath <> '' then
    begin
      Attachment := TIdAttachmentFile.Create(IdMessage.MessageParts,
        FAttachmentFilePath);
      Attachment.ContentType := 'application/pdf;';
      Attachment.FileName := ExtractFileName(FAttachmentFilePath);
    end;

    IdSMTP.Connect;
    IdSMTP.Send(IdMessage);
  finally
    IdSMTP.Disconnect;
    IdSMTP.Free;
    IdSSL.Free;
    IdMessage.Free;
  end;
end;

procedure TEmailSender.SetBody(const Value: string);
begin
  FBody := Value;
end;

procedure TEmailSender.SetFromAddress(const Value: string);
begin
  FFromAddress := Value;
end;

procedure TEmailSender.SetSMTPHost(const Value: string);
begin
  FSMTPHost := Value;
end;

procedure TEmailSender.SetSMTPPassword(const Value: string);
begin
  FSMTPPassword := Value;
end;

procedure TEmailSender.SetSMTPPort(const Value: Integer);
begin
  FSMTPPort := Value;
end;

procedure TEmailSender.SetSMTPUsername(const Value: string);
begin
  FSMTPUsername := Value;
end;

procedure TEmailSender.SetSubject(const Value: string);
begin
  FSubject := Value;
end;

procedure TEmailSender.SetToAddress(const Value: string);
begin
  FToAddress := Value;
end;

end.

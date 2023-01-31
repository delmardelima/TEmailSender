unit EmailSender;

interface

uses
  SysUtils, Classes, IdSMTP, IdMessage;

type
  TEmailSender = class
  private
    FSMTP: TIdSMTP;
    FMailMessage: TIdMessage;
    FHost: string;
    FPort: Integer;
    FUsername: string;
    FPassword: string;
    FFrom: string;
    FFromName: string;
    FTo: string;
    FSubject: string;
    FBody: string;
    FAttachments: TStringList;
    procedure SetHost(const Value: string);
    procedure SetPassword(const Value: string);
    procedure SetUsername(const Value: string);
    procedure SetPort(const Value: Integer);
    procedure SetFrom(const Value: string);
    procedure SetFromName(const Value: string);
    procedure SetTo(const Value: string);
    procedure SetSubject(const Value: string);
    procedure SetBody(const Value: string);
    procedure SetAttachments(const Value: TStringList);
  public
    constructor Create;
    destructor Destroy; override;
    procedure AddAttachment(const FileName: string);
    procedure SendEmail;
    property Host: string read FHost write SetHost;
    property Port: Integer read FPort write SetPort;
    property Username: string read FUsername write SetUsername;
    property Password: string read FPassword write SetPassword;
    property From: string read FFrom write SetFrom;
    property FromName: string read FFromName write SetFromName;
    property ToAddress: string read FTo write SetTo;
    property Subject: string read FSubject write SetSubject;
    property Body: string read FBody write SetBody;
    property Attachments: TStringList read FAttachments write SetAttachments;
  end;

implementation

{ TEmailSender }

constructor TEmailSender.Create;
begin
  FSMTP := TIdSMTP.Create(nil);
  FMailMessage := TIdMessage.Create(nil);
  FAttachments := TStringList.Create;
end;

destructor TEmailSender.Destroy;
begin
  FreeAndNil(FMailMessage);
  FreeAndNil(FSMTP);
  FreeAndNil(FAttachments);
  inherited;
end;

procedure TEmailSender.AddAttachment(const FileName: string);
begin
  FMailMessage.Attachments.Add(FileName);
end;

procedure TEmailSender.SendEmail;
begin
  FSMTP.Host := FHost;
  FSMTP.Port := FPort;
  FSMTP.Username := FUsername;
  FSMTP.Password := FPassword;

  FMailMessage.From.Address := FFrom;
  FMailMessage.From.Name := FFromName;
  FMailMessage.Recipients.EMailAddresses := FTo;
  FMailMessage.Subject := FSubject;
  FMailMessage.Body.Text := FBody;

  try
    FSMTP.Connect;
    try
      FSMTP.Send(FMailMessage);
    finally
      FSMTP.Disconnect;
    end;
  except
    on E: Exception do
      raise Exception.Create('Não foi possível enviar o email: ' + E.Message);
  end;
end;

procedure TEmailSender.SetAttachments(const Value: TStringList);
begin
  FAttachments := Value;
end;

procedure TEmailSender.SetBody(const Value: string);
begin
  FBody := Value;
end;

procedure TEmailSender.SetFrom(const Value: string);
begin
  FFrom := Value;
end;

procedure TEmailSender.SetFromName(const Value: string);
begin
  FFromName := Value;
end;

procedure TEmailSender.SetHost(const Value: string);
begin
  FHost := Value;
end;

procedure TEmailSender.SetPassword(const Value: string);
begin
  FPassword := Value;
end;

procedure TEmailSender.SetPort(const Value: Integer);
begin
  FPort := Value;
end;

procedure TEmailSender.SetSubject(const Value: string);
begin
  FSubject := Value;
end;

procedure TEmailSender.SetTo(const Value: string);
begin
  FTo := Value;
end;

procedure TEmailSender.SetUsername(const Value: string);
begin
  FUsername := Value;
end;

end.

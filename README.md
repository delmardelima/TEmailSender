# TEmailSender - Delphi Email Sending Class

TEmailSender is a simple Delphi class for sending emails from Delphi applications. With easy-to-set configurations for SMTP server, sender, recipient, subject, and message body, and support for file attachments, sending emails has never been easier. This repository includes a complete implementation of the TEmailSender class and usage examples to help you get started quickly.

## Features
- Easy-to-use interface
- Support for SMTP server configuration
- Support for sender, recipient, subject, and message body
- Support for file attachments

## Requirements
- Delphi 7 or later
- Indy 10 or later

## Usage
Here's an example of how to use the TEmailSender class:

```
var
EmailSender: TEmailSender;
begin
EmailSender := TEmailSender.Create;
try
EmailSender.Host := 'smtp.example.com';
EmailSender.Port := 587;
EmailSender.Username := 'user@example.com';
EmailSender.Password := 'secret';
EmailSender.From := 'user@example.com';
EmailSender.FromName := 'User Name';
EmailSender.To := 'recipient@example.com';
EmailSender.Subject := 'Test Email';
EmailSender.Body := 'This is a test email sent using the TEmailSender class.';
EmailSender.Send;
finally
EmailSender.Free;
end;
end;
```

## License
This project is licensed under the MIT License. See [LICENSE](LICENSE) for more details.

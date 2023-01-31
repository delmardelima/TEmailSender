# TEmailSender - Delphi Email Sending Class
# TEmailSender - Classe de Envio de E-mail Delphi

TEmailSender is a simple Delphi class for sending emails from Delphi applications. With easy-to-set configurations for SMTP server, sender, recipient, subject, and message body, and support for file attachments, sending emails has never been easier. This repository includes a complete implementation of the TEmailSender class and usage examples to help you get started quickly.

O TEmailSender é uma classe simples para enviar e-mails a partir de aplicações Delphi. Com configurações fáceis para servidor SMTP, remetente, destinatário, assunto e corpo da mensagem, e suporte a anexos de arquivos, o envio de e-mails nunca foi tão fácil. Este repositório inclui uma implementação completa da classe TEmailSender e exemplos de uso para ajudá-lo a começar rapidamente.

## Features
- Easy-to-use interface
- Support for SMTP server configuration
- Support for sender, recipient, subject, and message body
- Support for file attachments

## Recursos
- Interface fácil de usar
- Suporte à configuração do servidor SMTP
- Suporte a remetente, destinatário, assunto e corpo da mensagem
- Suporte a anexos de arquivos

## Requirements
- Delphi 7 or later
- Indy 10 or later

## Requisitos
- Delphi 7 ou posterior
- Indy 10 ou posterior

## Usage
Here's an example of how to use the TEmailSender class:

## Uso
Aqui está um exemplo de como usar a classe TEmailSender:

```Delphi
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
This project is licensed under the GPL-3.0 License. See [LICENSE](LICENSE) for more details.

## Licença
Este projeto está licenciado sob a Licença GPL-3.0. Veja [LICENSE](LICENSE) para mais detalhes.

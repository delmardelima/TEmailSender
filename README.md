# TEmailSender - Delphi Email Sending Class

TEmailSender is a simple Delphi class for sending emails from Delphi applications. With easy-to-set configurations for SMTP server, sender, recipient, subject, and message body, and support for file attachments, sending emails has never been easier. This repository includes a complete implementation of the TEmailSender class and usage examples to help you get started quickly.

# TEmailSender - Classe de Envio de E-mail Delphi

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

## Installation
1. Download the `EmailSender.pas` file.
2. Add the file to your Delphi project.
3. In the uses section of your project, add `EmailSender` to the list of units.
4. Start using the `EmailSender` class in your code.

## Instalação
1. Baixe o arquivo `EmailSender.pas`.
2. Adicione o arquivo ao seu projeto Delphi.
3. Na seção "uses" do seu projeto, adicione `EmailSender` à lista de unidades.
4. Comece a usar a classe `EmailSender` no seu código.

## Usage
Here's an example of how to use the TEmailSender class:
```Delphi
var
  email:TEmailSender;
begin
  email := TEmailSender.Create;
  try
    email.Server := 'smtp.yourserver.com';
    email.Username := 'youremail@yourserver.com';
    email.Password := 'yourpassword';
    email.From := 'youremail@yourserver.com';
    email.Recipient := 'recipient@yourserver.com';
    email.Subject := 'Test email with attachment';
    email.Body := 'This is a test email with attachment';
    email.AddAttachment('c:\attachedfile.pdf');
    try
      email.Send;
    except
      on E: Exception do
        ShowMessage('Error sending email: ' + E.Message);
    end;
  finally
    email.Free;
  end;
end;
```

## Uso
Aqui está um exemplo de como usar a classe TEmailSender:
```Delphi
var
  email: TEmailSender;
begin
  email := TEmailSender.Create;
  try
    email.Server := 'smtp.seuservidor.com';
    email.Username := 'seuemail@seuservidor.com';
    email.Password := 'suasenha';
    email.From := 'seuemail@seuservidor.com';
    email.Recipient := 'destinatario@seuservidor.com';
    email.Subject := 'Teste de envio de e-mail com anexo';
    email.Body := 'Este é um teste de envio de e-mail com anexo';
    email.AddAttachment('c:\arquivoanexo.pdf');
    try
      email.Send;
    except
      on E: Exception do
        ShowMessage('Erro ao enviar e-mail: ' + E.Message);
    end;
  finally
    email.Free;
  end;
end;
```

## License
This project is licensed under the GPL-3.0 License. See [LICENSE](LICENSE) for more details.

## Licença
Este projeto está licenciado sob a Licença GPL-3.0. Veja [LICENSE](LICENSE) para mais detalhes.

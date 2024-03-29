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
    email.SMTPHost := 'smtp.yourserver.com';
    email.SMTPPort := 587;
    email.SMTPUsername := 'youremail@yourserver.com';
    email.SMTPPassword := 'yourpassword';
    email.FromAddress := 'youremail@yourserver.com';
    email.ToAddress := 'recipient@yourserver.com';
    email.Subject := 'Test email with attachment';
    email.Body := 'This is a test email with attachment';
    email.AttachmentFilePath := 'c:\attachedfile.pdf';
    try
      email.SendEmail;
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
    email.SMTPHost := 'smtp.seuservidor.com';
    email.SMTPPort := 587;
    email.SMTPUsername := 'seuemail@seuservidor.com';
    email.SMTPPassword := 'suasenha';
    email.FromAddress := 'seuemail@seuservidor.com';
    email.ToAddress := 'destinatario@seuservidor.com';
    email.Subject := 'Teste de envio de e-mail com anexo';
    email.Body := 'Este é um teste de envio de e-mail com anexo';
    email.AttachmentFilePath := 'c:\arquivoanexo.pdf';
    try
      email.SendEmail;
    except
      on E: Exception do
        ShowMessage('Erro ao enviar e-mail: ' + E.Message);
    end;
  finally
    email.Free;
  end;
end;
```
# Delmar de Lima (Cortes DEV)

## Support
Get in touch with us for any questions or inquiries through WhatsApp: https://wa.me/5597991442486

## Suporte
Entre em contato conosco para qualquer dúvida ou pergunta pelo WhatsApp: https://wa.me/5597991442486

## Donations 
Donate via PIX:
### Email: delmar.apui@gmail.com
### Cell: (97) 99144-2486

## Doações 
Faça sua doação via PIX:
### Email: delmar.apui@gmail.com
### Celular: (97) 99144-2486

## Connect with us
##### [YouTube][] 
##### [WhatsApp][]
##### [Instagram][]
##### [Facebook][] 
##### [Delphi Modern Layout Source Code][]

## Conecte-se com a gente
##### [YouTube][] 
##### [WhatsApp][]
##### [Instagram][]
##### [Facebook][] 
##### [Código Fonte Layout Moderno em Delphi][]

Get to know us better on our YouTube channel: <br/>
**[>> FIND OUT MORE](https://bit.ly/SeguirCortesDev)**

Conheça mais sobre nós em nosso canal no YouTube: <br/>
**[>> CONHEÇA MAIS](https://bit.ly/SeguirCortesDev)**

## License
This project is licensed under the GPL-3.0 License. See [LICENSE](LICENSE) for more details.

## Licença
Este projeto está licenciado sob a Licença GPL-3.0. Veja [LICENSE](LICENSE) para mais detalhes.

[YouTube]: https://bit.ly/SeguirCortesDev
[WhatsApp]: https://wa.me/5597991442486
[Instagram]: https://www.instagram.com/cortesdevoficial/
[Facebook]: https://www.fb.com/cortesdevoficial
[Delphi Modern Layout Source Code]: https://bit.ly/LayoutModerno
[Código Fonte Layout Moderno em Delphi]: https://bit.ly/LayoutModerno

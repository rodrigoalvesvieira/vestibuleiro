# Vestibuleiro

Uma plataforma para obter uma resposta rápida e confiável para sua dúvida. (focado em ensino médio).

## Tech Specs

| Ferramenta                           | Versão           |
| ------------------------------------ |:----------------:|
| Rails                                | 4.2.1            |
| Ruby MRI                             | 2.2.1            |
| MongoDB                              | >= 2.6.5         |

## Setup

```bash
$ bundle install        # Instala as dependências do projeto (backend)

$ rake bower:install    # Instala as dependências de front-end do projeto

$ rake db:seed          # Preenche o BD de desenvolvimento (local) com alguns dados prontos
```

## Uso

`$ foreman start`   - Inicia o servidor na porta 5000

`$ spring rails c`  - Inicia o console interativo do Rails com a aplicação carregada

## Testes

Esse projeto utiliza o [RSpec] para testes de comportamento. Os seguintes comandos (entre **muitos** outros) estão disponíveis para executar a suíte de testes:

```shell
$ rspec               # Executa toda a suíte de testes

$ rspec spec/models   # Executa apenas um único teste de modelo (também disponível para controladores, helpers, etc)

$ rspec spec/models/user_spec.rb # Executa apenas um arquivo de teste
```

## Produção e deploy

Esse projeto está [hospedado no Heroku]. Para deployar uma nova versão, execute o seguinte comando:

`$ git push heroku master`

Alguns outros comandos úteis são:

```shell
$ heroku run console         # Inicia o console do Rails no servidor remoto

$ heroku logs --tail         # Imprime como stream o log do servidor remoto
```

## Autores

* Rodrigo Alves <rav2@cin.ufpe.br> - https://github.com/rodrigoalvesvieira
* Tomer Simis <tls@cin.ufpe.br> - https://github.com/tomersimis
* Guilherme Tavares <mgtc@cin.ufpe.br> - https://github.com/mguilhermetavares
* Samuel Paz <spm@cin.ufpe.br> - https://github.com/pazspm
* Marlon Reghert <mras@cin.ufpe.br> - https://github.com/marlonwc3
* Artur Montenegro <acmh@cin.ufpe.br> - https://github.com/acmh
* Rodolfo José <rjsr@cin.ufpe.br> - https://github.com/rjos
* Bruno Dutra <bdln@cin.ufpe.br> - https://github.com/bdlneto
* Hugo Freire <hrfn@cin.ufpe.br> - https://github.com/Hrfreire
* Ângelo de Sant'Ana <assd@cin.ufpe.br> - https://github.com/AngeloDias
* Danilo Dias <ddp2@cin.ufpe.br> - https://github.com/daniloddp

## Copyright

© 2015 Vestibuleiro. Todos os Direitos Reservados.

[RSpec]: http://rspec.info
[hospedado no Heroku]: http://vestibuleiro.herokuapp.com

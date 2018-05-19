## Descrição
Plataforma que permite a desenvolvedores de inteligências artificiais depositarem conteúdos (imagem/texto/outros) para serem “rotulados” pelos usuários ou mesmo os resultados do processamento desses conteúdos, por algoritmos de aprendizagem de máquina, para serem avaliados por humanos. Ao interagir com cada projeto, avaliando ou rotulando, o usuário pode receber algum tipo de pagamento em créditos/pontos/recompensas, que irão se acumular numa espécie de “saldo da conta”.

## Membros
- Bruno Carneiro 10376388
- Daniel Nunes 10297612
- Eduardo Rocha Laurentino 8988212
- Pedro Henrique Barbosa de Almeida 10258793

## Instalação e Execução
Esse tutorial supõe que você tenha instalado Ruby v2.3-2.5 e tenha um servidor MySQL v5.7 rodando no computador. Caso não possua, siga as instruções para [Ruby](https://www.ruby-lang.org/pt/documentation/installation/) e [MySQL](https://dev.mysql.com/doc/mysql-installation-excerpt/5.7/en/).

O usuário usado no MySQL é ```root```, sem senha.

1. Clone o repositório:
```$ git clone https://github.com/robonauta/MAC0218.git```

2. No diretório criado, instale as dependências:   
```$ bundle install```

3. Configure o banco de dados:  
```$ rake db:setup```

4. Inicie o servidor:  
```$ rails s```

O site estará disponível em: http://localhost:3000

## Docs
[Relatório completo](https://github.com/robonauta/MAC0218/blob/master/docs/Relatorios/Monolito%20-%20relatório.pdf)

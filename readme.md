# Biblioteca Resilia

Este projeto apresenta um modelo de banco de dados para uma biblioteca, chamado `biblioteca_resilia`. O objetivo é estruturar as principais funcionalidades de uma biblioteca, como o gerenciamento de clientes, livros, endereços, telefones e empréstimos.

## Estrutura do Projeto

O projeto consiste nos seguintes arquivos:

1. `biblioteca_resilia.sql`: contém o código SQL para a criação do banco de dados, tabelas e inserção de dados iniciais.
2. `diagrama_biblioteca_dbdiagram.png`: um diagrama visual representando a estrutura do banco de dados.

O banco de dados contém quatro entidades (Clientes, Livros, Empréstimos, Endereços e Telefones) com diversos relacionamentos entre elas.

## Como Usar

Para utilizar o banco de dados, você precisa ter o MySQL instalado. Clone este repositório e importe o arquivo `biblioteca_resilia.sql` no MySQL Workbench ou outra ferramenta similar. 

```bash
$ git clone https://github.com/iohantc/biblioteca_resilia.git
```

## Considerações Finais

Este projeto foi desenvolvido para demonstrar a capacidade de modelar e implementar um banco de dados relacional completo. Ele usa diversas técnicas, incluindo o uso de chaves primárias e estrangeiras, a criação de diversas tabelas e a definição de relacionamentos entre elas. O banco de dados é robusto e permite um gerenciamento eficaz de uma biblioteca.

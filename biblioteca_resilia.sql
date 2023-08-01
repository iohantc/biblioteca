CREATE DATABASE projeto_biblioteca;
USE projeto_biblioteca;

-- Criação da tabela 'LIVROS', com várias colunas para descrever cada livro. 
-- 'ID_LIVRO' é a chave primária e é incrementada automaticamente para cada novo livro.
-- Cardinalidade: um livro pode estar em vários empréstimos (1,N com relação à tabela EMPRESTIMO).
CREATE TABLE `LIVROS` (
  `ID_LIVRO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `ISBN` varchar(13) NOT NULL,
  `ANO_LANCAMENTO` int NOT NULL,
  `GENERO` varchar(50) NOT NULL,
  `TITULO` varchar(100) NOT NULL,
  `AUTOR` varchar(50) NOT NULL,
  `EDITORA` varchar(50) NOT NULL,
  `NUM_PAGS` int NOT NULL
);

-- Criação da tabela 'CLIENTES', que contém informações pessoais sobre cada cliente.
-- 'ID_CLIENTE' é a chave primária e é incrementada automaticamente para cada novo cliente.
-- Cardinalidade: um cliente pode ter vários endereços, telefones e empréstimos (1,N com relação às tabelas ENDERECO, TELEFONE e EMPRESTIMO).
CREATE TABLE `CLIENTES` (
  `ID_CLIENTE` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `NOME` varchar(50) NOT NULL,
  `SEXO` char(1) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `CPF` char(11) NOT NULL
);

-- Criação da tabela 'ENDERECO', que armazena as informações de endereço de cada cliente.
-- 'ID_ENDERECO' é a chave primária e é incrementada automaticamente para cada novo endereço.
-- Esta tabela tem uma chave estrangeira que referencia a 'ID_CLIENTE' na tabela 'CLIENTES'.
-- Cardinalidade: um endereço pertence a um único cliente (1,1 com relação à tabela CLIENTES).
CREATE TABLE `ENDERECO` (
  `ID_ENDERECO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `ID_CLIENTE` int NOT NULL,
  `PAIS` char(2) NOT NULL,
  `ESTADO` char(2) NOT NULL,
  `CIDADE` varchar(50) NOT NULL,
  `BAIRRO` varchar(50) NOT NULL,
  `LOGRADOURO` varchar(100) NOT NULL,
  `NUMERO` char(2) NOT NULL,
  `COMPLEMENTO` varchar(100) NOT NULL,
  FOREIGN KEY(`ID_CLIENTE`) REFERENCES `CLIENTES`(`ID_CLIENTE`)
);

-- Criação da tabela 'TELEFONE', que armazena as informações de contato de cada cliente.
-- 'ID_TELEFONE' é a chave primária e é incrementada automaticamente para cada novo telefone.
-- Esta tabela tem uma chave estrangeira que referencia a 'ID_CLIENTE' na tabela 'CLIENTES'.
-- Cardinalidade: um número de telefone pertence a um único cliente (1,1 com relação à tabela CLIENTES).
CREATE TABLE `TELEFONE` (
  `ID_TELEFONE` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `ID_CLIENTE` int NOT NULL,
  `CODIGO_PAIS` varchar(3) NOT NULL,
  `DDD` char(2) NOT NULL,
  `NUMERO` varchar(9) NOT NULL,
  FOREIGN KEY(`ID_CLIENTE`) REFERENCES `CLIENTES`(`ID_CLIENTE`)
);

-- Criação da tabela 'EMPRESTIMO', que armazena as informações de empréstimos de livros feitos pelos clientes.
-- 'ID_EMPRESTIMO' é a chave primária e é incrementada automaticamente para cada novo empréstimo.
-- Esta tabela tem chaves estrangeiras que referenciam a 'ID_CLIENTE' na tabela 'CLIENTES' e a 'ID_LIVRO' na tabela 'LIVROS'.
-- Cardinalidade: um empréstimo está associado a um único cliente e a um único livro (1,1 com relação às tabelas CLIENTES e LIVROS).
CREATE TABLE `EMPRESTIMO` (
  `ID_EMPRESTIMO` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `ID_CLIENTE` int NOT NULL,
  `ID_LIVRO` int NOT NULL,
  `DATA_LIMITE` date NOT NULL,
  `DATA_EMPRESTIMO` date NOT NULL,
  `DATA_DEVOLUCAO` date,
  FOREIGN KEY(`ID_CLIENTE`) REFERENCES `CLIENTES`(`ID_CLIENTE`),
  FOREIGN KEY(`ID_LIVRO`) REFERENCES `LIVROS`(`ID_LIVRO`)
);

-- Inserções na tabela 'LIVROS'
INSERT INTO LIVROS(ISBN, ANO_LANCAMENTO, GENERO, TITULO, AUTOR, EDITORA, NUM_PAGS)
VALUES ('9788576082675', 2008, 'Romance', 'A Cabana', 'William P. Young', 'Arqueiro', 236),
       ('9788535914849', 2009, 'Drama', 'O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 'Globo', 93),
       ('9788579800242', 2010, 'Aventura', 'Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 'Rocco', 224),
       ('9788573026882', 2011, 'Biografia', 'Steve Jobs', 'Walter Isaacson', 'Companhia das Letras', 630),
       ('9788535916164', 2012, 'Suspense', 'O Código Da Vinci', 'Dan Brown', 'Arqueiro', 385);

-- Inserções na tabela 'CLIENTES'
INSERT INTO CLIENTES(NOME, SEXO, EMAIL, CPF)
VALUES ('Maria', 'F', 'maria@gmail.com', '12345678901'),
       ('João', 'M', 'joao@gmail.com', '23456789012'),
       ('Ana', 'F', 'ana@gmail.com', '34567890123'),
       ('Carlos', 'M', 'carlos@gmail.com', '45678901234'),
       ('Luiza', 'F', 'luiza@gmail.com', '56789012345');
       
-- Inserções na tabela 'ENDERECO'
INSERT INTO ENDERECO(ID_CLIENTE, PAIS, ESTADO, CIDADE, BAIRRO, LOGRADOURO, NUMERO, COMPLEMENTO)
VALUES (1, 'BR', 'SP', 'São Paulo', 'Vila Mariana', 'Rua Domingos de Morais', '23', 'Apto 30'),
       (2, 'BR', 'RJ', 'Rio de Janeiro', 'Copacabana', 'Avenida Atlântica', '45', ''),
       (3, 'BR', 'MG', 'Belo Horizonte', 'Pampulha', 'Avenida Presidente Antônio Carlos', '67', ''),
       (4, 'BR', 'RS', 'Porto Alegre', 'Moinhos de Vento', 'Rua Mostardeiro', '89', 'Casa 1'),
       (5, 'BR', 'PE', 'Recife', 'Boa Viagem', 'Avenida Boa Viagem', '01', 'Apto 1501');

-- Inserções na tabela 'TELEFONE'
INSERT INTO TELEFONE(ID_CLIENTE, CODIGO_PAIS, DDD, NUMERO)
VALUES (1, '55', '11', '987654321'),
       (2, '55', '21', '987654322'),
       (3, '55', '31', '987654323'),
       (4, '55', '51', '987654324'),
       (5, '55', '81', '987654325');

-- Inserções na tabela 'EMPRESTIMO'
INSERT INTO EMPRESTIMO(ID_CLIENTE, ID_LIVRO, DATA_EMPRESTIMO, DATA_LIMITE, DATA_DEVOLUCAO)
VALUES (1, 1, '2023-05-01', '2023-05-11', '2023-05-09'), 
       (2, 2, '2023-05-30', '2023-06-09', '2023-06-11'),  
       (3, 3, '2023-06-15', '2023-06-25', NULL),      
       (4, 4, '2023-07-01', '2023-07-11', '2023-07-08'),
       (5, 5, '2023-07-20', '2023-07-30', '2023-07-20');
 
 
-- Listar todos os livros que estão emprestados no momento, mostrando seu título, autor e data de empréstimo.
SELECT LIVROS.ID_LIVRO as 'LIVROS_EMPRESTADOS', LIVROS.TITULO, LIVROS.AUTOR, EMPRESTIMO.DATA_EMPRESTIMO
FROM LIVROS
JOIN EMPRESTIMO ON LIVROS.ID_LIVRO = EMPRESTIMO.ID_LIVRO;

-- Exibir o nome do cliente, o título do livro e a data de devolução de todos os empréstimos que já foram devolvidos.
SELECT CLIENTES.NOME, LIVROS.TITULO, EMPRESTIMO.DATA_DEVOLUCAO
FROM CLIENTES
JOIN EMPRESTIMO ON CLIENTES.ID_CLIENTE = EMPRESTIMO.ID_CLIENTE
JOIN LIVROS ON EMPRESTIMO.ID_LIVRO = LIVROS.ID_LIVRO
WHERE EMPRESTIMO.DATA_DEVOLUCAO IS NOT NULL;

-- Contar o número total de empréstimos feitos por cada cliente, mostrando o nome do cliente e o total de empréstimos.
SELECT CLIENTES.NOME, COUNT(EMPRESTIMO.ID_EMPRESTIMO) AS TOTAL_EMPRESTIMOS
FROM CLIENTES
JOIN EMPRESTIMO ON CLIENTES.ID_CLIENTE = EMPRESTIMO.ID_CLIENTE
GROUP BY CLIENTES.ID_CLIENTE;

-- Listar os títulos e autores dos livros cujo empréstimo está atrasado.
SELECT CLIENTES.NOME, LIVROS.TITULO, LIVROS.AUTOR, EMPRESTIMO.DATA_LIMITE
FROM LIVROS
JOIN EMPRESTIMO ON LIVROS.ID_LIVRO = EMPRESTIMO.ID_LIVRO
JOIN CLIENTES ON CLIENTES.ID_CLIENTE = EMPRESTIMO.ID_CLIENTE
WHERE EMPRESTIMO.DATA_DEVOLUCAO IS NULL AND EMPRESTIMO.DATA_LIMITE < CURDATE();

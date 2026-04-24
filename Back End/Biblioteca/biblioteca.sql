DROP DATABASE IF EXISTS biblioteca;

CREATE DATABASE biblioteca;

USE biblioteca;

CREATE TABLE usuarios (
id INTEGER AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
email VARCHAR(100),
nascimento DATE
);

USE biblioteca;
CREATE TABLE livros (
id INTEGER AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(100) NOT NULL,
autor VARCHAR(100) NOT NULL ,
publicacao VARCHAR(4)
);


CREATE TABLE emprestimos (
id INTEGER AUTO_INCREMENT PRIMARY KEY,
usuario_id INTEGER,
livro_id INTEGER,
data_emprestimo DATE,
data_devolucao DATE,
FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
FOREIGN KEY (livro_id) REFERENCES Usuarios(id)
);
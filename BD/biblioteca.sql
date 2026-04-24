DROP DATABASE biblioteca;
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


INSERT INTO usuarios (nome, nascimento, email) 
VALUES ("Julia Nogueira", "2006-12-04", "julianogueira@gmail.com"),
("Deluka Rodriguez", "2002-05-12", "rodriguezdeluka@gmail.com"),
("Lebron James", "1984-12-30", "jameslebron@gmail.com");

SELECT * FROM usuarios;


SELECT * FROM usuarios
WHERE id = 2;

INSERT INTO livros (titulo, autor, publicacao) 
VALUES ("Lady Killers: Assassinas em Serie", "Tori Telfer", "2017"),
("Academia dos Casos Arquivados", "Jennifer Lynn Barnes", "2024"),
("Manual de Assassinato para Boas Garotas", " Holly Jackson", "2022");

SELECT * FROM livros;

SELECT titulo, publicacao 
FROM livros 
WHERE id = 3;

INSERT INTO emprestimos (usuario_id, livro_id, data_emprestimo)
VALUES
(1, 2, "2025-09-19"),
(3, 1, '2025-09-21');

SELECT * FROM emprestimos;

SELECT usuario_id, data_emprestimo FROM emprestimos;


UPDATE emprestimos SET data_devolucao = '2025-08-25' 
WHERE id = 1;

SELECT * FROM emprestimos 
WHERE id = 1;


DELETE FROM emprestimos 
WHERE id = 2;

SELECT * FROM usuarios;

SELECT * FROM usuarios 
WHERE id = 3;
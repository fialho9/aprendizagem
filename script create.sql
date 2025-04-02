DROP DATABASE db_discoteca;

CREATE DATABASE IF NOT EXISTS db_discoteca
COLLATE utf8mb4_general_ci CHARSET utf8mb4;

CREATE TABLE IF NOT EXISTS tb_tipo_artista (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS tb_artista (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    data_nasc DATE,
    tipo_artista INTEGER NOT NULL,
    CONSTRAINT fk_tipo_artista_artista FOREIGN KEY (tipo_artista) REFERENCES tb_tipo_artista(id)
);

CREATE TABLE IF NOT EXISTS tb_genero (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS tb_gravadora (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS tb_disco (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    duracao TIME NOT NULL,
    ano_lancamento DATE NOT NULL,
    artista INTEGER NOT NULL,
    gravadora INTEGER NOT NULL,
    genero INTEGER NOT NULL,
    CONSTRAINT fk_musica_artista FOREIGN KEY (artista) REFERENCES tb_artista(id),
    CONSTRAINT fk_musica_gravadora FOREIGN KEY (gravadora) REFERENCES tb_gravadora(id),
    CONSTRAINT fk_disco_genero FOREIGN KEY (genero) REFERENCES tb_genero(id)
);

CREATE TABLE IF NOT EXISTS tb_musica (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    duracao TIME NOT NULL,
    disco INTEGER NOT NULL,
    CONSTRAINT fk_musica_disco FOREIGN KEY (disco) REFERENCES tb_disco(id)
);
CREATE DATABASE IF NOT EXISTS controle_atendimento;
USE controle_atendimento;

CREATE TABLE IF NOT EXISTS tickets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(32) NOT NULL UNIQUE, -- YYMMDD-PPSQ
    tipo ENUM('SP','SG','SE') NOT NULL,
    data_emissao DATETIME NOT NULL,
    data_atendimento DATETIME NULL,
    guiche INT NULL,
    atendido BOOLEAN DEFAULT FALSE,
    descartado BOOLEAN DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS guiches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS logs_chamadas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ticket_id INT,
    guiche INT,
    chamado_em DATETIME,
    FOREIGN KEY (ticket_id) REFERENCES tickets(id)
);
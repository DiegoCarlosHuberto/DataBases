CREATE DATABASE casino;
USE casino;

CREATE TABLE datosusuario(
DNI VARCHAR(10),
fechaNacimiento DATE,
Nombre VARCHAR(40),
Apellido VARCHAR(40),
Credito DOUBLE,
PRIMARY KEY(DNI)
);

CREATE TABLE Usuario(
id INT AUTO_INCREMENT,
DNI VARCHAR(10),
PRIMARY KEY(id),
FOREIGN KEY(DNI) REFERENCES DatosUsuario(DNI)
);

CREATE TABLE banneduser(
id INT AUTO_INCREMENT,
idUsuario INT,
PRIMARY KEY (id),
FOREIGN KEY(idUsuario)REFERENCES Usuario(id)
);

CREATE TABLE Juego(
id INT AUTO_INCREMENT DEFAULT 1,
nombre VARCHAR(20),
PRIMARY KEY(id)
);

CREATE TABLE Partida(
id INT AUTO_INCREMENT,
idJuego INT,
idUsuario INT,
apuesta FLOAT,
balance FLOAT,
fechaHora DATETIME,
PRIMARY KEY(id),
FOREIGN KEY(idJuego) REFERENCES Juego(id),
FOREIGN KEY(idUsuario) REFERENCES Usuario(id)
);
CREATE TABLE password(
idUsuario INT,
password VARCHAR(20),
PRIMARY KEY (idUsuario),
FOREIGN KEY (idUsuario)REFERENCES Usuario(id)
);

INSERT INTO Juego (nombre) VALUES ('Black Jack'),
('Ruleta'),('Tragaperras');
INSERT INTO datosusuario VALUES ('12345678A', '1945-01-01',
'Invitado', 'Invitado', 999999999);
INSERT INTO Usuario (id, DNI) VALUES (1, '12345678A');
INSERT INTO banneduser (idUsuario) VALUES (false, 1);
INSERT INTO password (idUsuario, contrasenia) VALUES (1, 'hola');

DELIMITER $$
CREATE PROCEDURE existe(IN id VARCHAR(10), OUT verify BOOL)
BEGIN
SET verify = FALSE;
SELECT TRUE INTO verify FROM usuario u WHERE u.DNI = id LIMIT 1;
END
$$

CREATE PROCEDURE banCheck (IN id VARCHAR(10), OUT verify BOOL)
BEGIN
SET verify = FALSE;
SELECT TRUE INTO verify FROM bannedUser bu WHERE bu.idUsuario =
id LIMIT 1;
END
$$

CREATE TRIGGER actualizarCredito AFTER INSERT ON Partida FOR EACH
ROW
UPDATE datosusuario
SET Credito = credito - NEW.balance
WHERE DNI = NEW.idUsuario; 
$$

CREATE TRIGGER deleteUsuario AFTER DELETE ON usuario FOR EACH ROW
DELETE FROM datosusuario
WHERE DNI = OLD.DNI;
$$

CREATE TRIGGER deleteUser BEFORE DELETE ON usuario FOR EACH ROW
DELETE FROM password
WHERE idUsuario= OLD.id;
$$
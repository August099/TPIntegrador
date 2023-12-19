-- bases de datos
create database tp_integrador;
use tp_integrador;

-- LOGIN
CREATE TABLE login (
  id INT AUTO_INCREMENT PRIMARY KEY,
  usuario VARCHAR(255),
  email VARCHAR(255),
  contraseña varchar(255),
  fecha_registro date
);

alter table login add estado varchar(255);
INSERT INTO login (usuario, email, contraseña, estado) VALUES ('admin', 'admin', 'admin', 'admin');
select * from login;
truncate login;
--Database: postgres

-- SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = 'vacante';
--DROP DATABASE vacante;
-- drop table catalogo, trabajo, habilidad, usuario cascade;

CREATE TABLE usuario(
	id_usuario integer primary key not null,
	nombre_usuario text,
	apellido_usuario text,
	tipoAcceso integer,
	foto text
);

CREATE TABLE catalogo(
	id_catalogo integer primary key not null,
	profesion text not null
);

CREATE TABLE profesional(
 	id_profesional integer primary key not null,
 	usuario integer not null REFERENCES usuario (id_usuario),
 	catalogo integer references catalogo(id_catalogo)
);

CREATE TABLE trabajo(
	id_trabajo integer primary key not null,
	id_profesional integer REFERENCES profesional (id_profesional),
	descripcion text not null
);

CREATE TABLE habilidad(
	id_habilidad integer primary key not null,
	calificado integer REFERENCES profesional (id_profesional),
	calificador integer REFERENCES profesional (id_profesional),
	puntuacion float4 not null
);	

INSERT INTO usuario(id_usuario, nombre_usuario, apellido_usuario, tipoAcceso, foto) values (1, 'Juan', 'Perez', 1, 'foto');
INSERT INTO catalogo (id_catalogo, profesion) values (1, 'Programador');
INSERT INTO profesional (id_profesional, usuario, catalogo) values(1,1,1);
insert into habilidad (id_habilidad, calificado, calificador, puntuacion) values (1, 1, 1, 7.0);
INSERT INTO trabajo (id_trabajo, id_profesional, descripcion) values (1,1,'Colaborador de informática');
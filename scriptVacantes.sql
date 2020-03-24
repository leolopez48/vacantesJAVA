--Database: postgres

--DROP DATABASE postgres;

CREATE TABLE usuario(
	id_usuario integer primary key not null,
	nombre_usuario text,
	apellido_usuario text,
	tipoAcceso integer
);

CREATE TABLE trabajo(
	id_trabajo integer primary key not null,
	descripcion text not null
);

CREATE TABLE catalogo(
	id_catalogo integer primary key not null,
	profesion text not null
);

CREATE TABLE profesional(
	id_profesional integer primary key not null,
	usuario integer not null REFERENCES usuario (id_usuario),
	trabajo integer not null REFERENCES trabajo (id_trabajo),
	catalogo integer references catalogo(id_catalogo)
);

CREATE TABLE habilidad(
	id_habilidad integer primary key not null,
	calificado integer REFERENCES profesional (id_profesional),
	calificador integer REFERENCES profesional (id_profesional)
);
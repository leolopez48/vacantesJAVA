--Database: postgres

-- SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = 'vacante';
--DROP DATABASE vacante;
-- drop table catalogo, trabajo, habilidad, usuario cascade;

CREATE TABLE usuario(
	id_usuario integer primary key not null,
	tipoAcceso integer,
	foto text,
	correo text not null,
	seguidor integer REFERENCES seguidor(id_seguidor),
);

CREATE TABLE catalogo(
	id_catalogo integer primary key not null,
	profesion text not null,
	calificacion integer references calificacion(id_calificacion)
);

CREATE TABLE profesional(
 	id_profesional integer primary key not null,
 	usuario integer not null REFERENCES usuario (id_usuario),
 	catalogo integer references catalogo(id_catalogo),
	nombre_usuario text,
	apellido_usuario text,
	genero text not null,
	idioma integer not null references idioma(id_idioma),
	experiencia integer not null,
	curso integer not null references curso(id_curso),
	
);

CREATE TABLE idioma(
	id_idioma integer primary key not null, 
	idioma text not null
);

CREATE TABLE curso(
	id_curso integer primary key not null, 
	curso text not null
);

CREATE TABLE trabajo(
	id_trabajo integer primary key not null,
	profesional integer REFERENCES profesional (id_profesional),
	descripcion text not null
);

CREATE TABLE calificacion(
	id_habilidad integer primary key not null,
	descripcion_habilidad text not null,
	calificado integer REFERENCES profesional (id_profesional),
	calificador integer REFERENCES profesional (id_profesional),
	puntuacion float4 not null,
	tipoCalificacion integer not null
);

CREATE TABLE empresa(
	id_empresa integer primary key not null,
	nombre_empresa text not null,
	descripcion_empresa text not null
);

create table publicaciones(
	id_publicacion integer primary key,
	contenido text,
	empresa integer not null references empresa(id_empresa)
);


CREATE TABLE seguidor(
	id_seguidor integer primary key not null,
	seguido integer REFERENCES usuario (id_usuario),
	seguidor integer REFERENCES usuario (id_usuario)
);	
insert into usuario values 
(1,1,'foto', 'leonelcorreo'),
(2, 1, 'foto', 'leonelcorreo2')

INSERT INTO usuario(id_usuario, tipoAcceso, foto, correo) values (1, 1, 'foto', 'leonellopez647@gmail.com');
INSERT INTO catalogo (id_catalogo, profesion) values (1, 'Programador');
INSERT INTO profesional (id_profesional, usuario, catalogo, nombre_usuario, apellido_usuario, genero ) values(1,1,1, 'Juan', 'Perez', 'Masculino');
insert into habilidad (id_habilidad, calificado, calificador, puntuacion) values (1, 1, 1, 7.0);
INSERT INTO trabajo (id_trabajo, profesional, descripcion) values (1,1,'Colaborador de informática');
INSERT INTO empresa(id_empresa, nombre_empresa) values(1, 'La empresa');
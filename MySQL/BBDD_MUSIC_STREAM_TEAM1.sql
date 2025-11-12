CREATE SCHEMA music_stream_team1;

/* ¿Cuál es el artista con más albums?

¿Qué género es el mejor valorado?

¿En qué año se lanzaron más álbumes?

¿Cuál es la canción mejor valorada?

¿Cuál es el artista con más valoración?

¿Cuál es el album más valorado de los años pares de mi selección?

¿Qué país tiene má artistas? (ordenar por popularidad)

¿Qué artista estuvo má tiempo y cuántos albums tiene?*/
/* SP --> artista, genero, noombre, año lanzamiento, IDtrucks(tipo)
LFM --> artista, oyentes, reproducciones, bio_resumen 
*/

USE music_stream_team1;

CREATE TABLE genero_musical(
	id_genero INT AUTO_INCREMENT,
	nombre_genero VARCHAR(20) NOT NULL UNIQUE, -- no puede existir otro igual
	PRIMARY KEY (id_genero)
);


CREATE TABLE artista (
	id_artista INT AUTO_INCREMENT,
	nombre VARCHAR(50), -- sin apellido/opcion columna temporal
	biografia TEXT, -- no contiene cantidad
    pais VARCHAR(50),
    oyentes BIGINT, -- no limitamos el numero de oyentes de lastfm
    reproducciones BIGINT,
	PRIMARY KEY(id_artista));


CREATE TABLE tracks(
	id_track VARCHAR(50), -- Usamos el ID de Spotify
	nombre VARCHAR(255),
    tipo VARCHAR(50) NOT NULL, -- será track en todos los casos
    anio_lanzamiento YEAR, -- evitar caracter especial
	id_genero INT,
    id_artista INT,
	PRIMARY KEY (id_track),
	CONSTRAINT fk_genero_musical_tracks
		FOREIGN KEY(id_genero)
		REFERENCES genero_musical(id_genero)
        ON DELETE SET NULL -- actualización automática de los registros
        ON UPDATE CASCADE
);

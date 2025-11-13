USE music_stream_team1;

-- 1.¿Cuál es el artista con más tracks? 

SELECT  a.nombre, COUNT(t.id_track) AS total_tracks
  FROM artista AS a
  LEFT JOIN tracks AS t
    ON a.id_artista = t.id_artista
  GROUP BY a.nombre
  ORDER BY total_tracks DESC
  LIMIT 1; 

-- 2.¿Qué género es el mejor valorado? 

SELECT gm.nombre_genero, SUM(a.oyentes) AS oyentes_totales
	FROM genero_musical AS gm
INNER JOIN tracks AS t 
	ON gm.id_genero = t.id_genero
INNER JOIN artista AS a 
	ON t.id_artista = a.id_artista
GROUP BY gm.nombre_genero
ORDER BY oyentes_totales DESC
LIMIT 1;  
-- 3.¿En qué año se lanzaron más tracks?

SELECT anio_lanzamiento -- ,COUNT(*) AS cantidad_tracks
	FROM tracks
	GROUP BY anio_lanzamiento
	ORDER BY cantidad_tracks DESC
	LIMIT 1;
    
-- 4.¿Cuál es la canción mejor valorada? 

SELECT t.nombre AS cancion -- , a.nombre AS artista, a.reproducciones
	FROM tracks AS t
	INNER JOIN artista AS a
		ON t.id_artista = a.id_artista
	ORDER BY a.reproducciones DESC
	LIMIT 1;
-- 5.¿Cuál es el artista con más valoración? 

SELECT nombre AS artista, (oyentes + reproducciones) AS valoracion
	 FROM artista
     ORDER BY valoracion DESC
     LIMIT 1;
     
-- 6.¿Cuál es el album más valorado de los años pares de mi selección? 

SELECT t.nombre AS nombre_de_la_publicacion, a.nombre AS nombre_del_artista, t.anio_lanzamiento, a.oyentes AS oyentes_del_artista
	FROM tracks AS t
INNER JOIN artista AS a 
	ON t.id_artista = a.id_artista
WHERE t.anio_lanzamiento IS NOT NULL AND MOD(t.anio_lanzamiento, 2) = 0
ORDER BY a.oyentes DESC 
LIMIT 1; 

-- 7.¿Qué país tiene más artistas? (ordenar por popularidad)

SELECT pais, COUNT(id_artista) AS artistas, SUM(oyentes) AS total_oyentes
FROM artista
GROUP BY pais
ORDER BY total_oyentes DESC;

-- 8.¿Qué artista estuvo más tiempo y cuántos tracks tiene? 

SELECT a.nombre, t.nombre, MAX(t.anio_lanzamiento) - MIN(t.anio_lanzamiento) AS anios_activos, COUNT(t.id_track) AS total_tracks
   FROM artista AS a
   INNER JOIN tracks as t
     ON a.id_artista = t.id_artista
	GROUP BY a.nombre 
	ORDER BY anios_activos DESC
	LIMIT 1;
     
     
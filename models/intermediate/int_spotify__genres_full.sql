-- alimentation des genres null à partir de l'artiste de la même table
WITH liste_artiste_genre AS (-- on crée une table simple avec les artiste + genre principal (il peut y en avoir plusieurs on prends le max)
    SELECT DISTINCT
    artist
    ,MAX(cat_genre) as cat_genre
  FROM {{ref('int_spotify__genres_join')}}
  WHERE cat_genre is NOT NULL
  GROUP BY artist
)

SELECT 
    a.track_id
    ,a.artist
    ,a.title
    ,a.album
    ,a.release_date
    ,a.streams
    ,a.ranking
    ,a.date_date
    ,a.url_link
    ,a.country
    ,a.region
    ,a.chart
    ,a.trend
    ,a.popularity
    ,a.duration_ms
    ,a.is_explicit
    ,a.af_danceability
    ,a.af_energy
    ,a.af_speechiness
    ,a.af_acousticness
    ,a.af_instrumentalness
    ,a.af_valence
    ,a.af_tempo
    ,CASE 
    WHEN a.cat_genre IS NOT NULL THEN a.cat_genre
    WHEN a.cat_genre IS NULL AND b.cat_genre IS NOT NULL THEN b.cat_genre
    ELSE NULL
    END AS cat_genre
    FROM {{ref('int_spotify__genres_join')}} as a
    LEFT JOIN liste_artiste_genre as b
    USING (artist)
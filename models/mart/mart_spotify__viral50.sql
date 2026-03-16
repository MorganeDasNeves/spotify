{{ config(materialized='table') }}
WITH is_top_200 AS (
SELECT DISTINCT artist
FROM {{ ref('mart_spotify__data_by_day') }}
WHERE chart= 'top200'


)

SELECT
    date_date
    ,track_id
    ,a.artist
    ,title
    ,album
    ,release_date
    ,ranking
    ,CASE 
    WHEN ranking <= 10 THEN 1 
    ELSE 0 
    END AS viral10
    ,country
    ,region
    ,chart
    ,trend
    ,popularity
    ,duration_ms
    ,is_explicit
    ,af_danceability
    ,af_energy
    ,af_speechiness
    ,af_acousticness
    ,af_instrumentalness
    ,af_valence
    ,af_tempo
    ,cat_genre
    ,potentiel_viral
    ,energy_vibe
    ,duration_segment
    ,CASE 
    WHEN b.artist is NOT NULL THEN True
    ELSE False
    END AS is_also_top200
    ,CASE
    WHEN b.artist IS NULL THEN 1
    ELSE 0
    END AS nb_ephemeral_artists
    FROM {{ ref('mart_spotify__data_by_day') }} as a
    LEFT JOIN is_top_200 as b
    USING (artist)
    WHERE chart= 'viral50' AND region = 'Europe'
    AND date_date >= '2021-01-01' AND date_date <= '2021-11-30'
    ORDER BY date_date, ranking
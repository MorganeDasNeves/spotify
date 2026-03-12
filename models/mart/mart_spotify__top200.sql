{{ config(materialized='table') }}
SELECT
    date_date
    ,track_id
    ,artist
    ,title
    ,album
    ,release_date
    ,streams
    ,ranking
    ,CASE 
    WHEN ranking <= 20 THEN 1 
    ELSE 0 
    END AS top20
    ,201 - ranking AS CPS 
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
    FROM {{ ref('mart_spotify__data_by_day') }}
    WHERE chart= 'top200' --AND region = 'Europe'
    AND date_date >= '2020-01-01'
    ORDER BY date_date, ranking
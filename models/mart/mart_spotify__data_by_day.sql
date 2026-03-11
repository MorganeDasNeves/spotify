{{ config(materialized='table') }}

-- création table mart la plus complète : reprend l'ensemble des données de int_spotify__genres_full à la granularité la plus fine (au jour)
-- + les KPIs de la vue int_spotify_main_kpi
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
    ,a.cat_genre
    ,b.Potentiel_Viral
    ,b.Energy_Vibe
    ,b.duration_segment
FROM {{ref('int_spotify__genres_full')}} AS a
INNER JOIN {{ref('int_spotify__main_kpi')}} AS b
ON a.track_id = b.track_id
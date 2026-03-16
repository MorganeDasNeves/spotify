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
    ,top20
    ,CPS 
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
    ,cover_url
    ,artist_url
    FROM {{ ref('mart_spotify__top200') }}
    WHERE country = 'France'
    ORDER BY date_date, ranking
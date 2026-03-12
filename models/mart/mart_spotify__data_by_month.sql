{{ config(materialized='table') }}
Select
    FORMAT_DATE('%Y-%m', date_date) AS year_month
    ,region
    ,country
    ,cat_genre
    ,potentiel_viral
    ,energy_vibe
    ,duration_segment
    ,count(distinct artist) as nb_artist
    ,count(distinct title) as nb_title
    ,count(distinct album) as nb_album
    ,sum(streams) as total_streams
    ,avg(popularity) as avg_popularity
    ,sum(case 
    when is_explicit=True then 1 else 0 end) as nb_is_explicit
    ,avg(af_danceability) as avg_danceability
    ,avg(af_energy) as avg_energy
    ,avg(af_speechiness) as avg_speechiness
    ,avg(af_acousticness) as avg_acoustiness
    ,avg(af_instrumentalness) as avg_intrumentalness
    ,avg(af_valence) as avg_valence
    ,avg(af_tempo) as avg_tempo
FROM {{ ref('mart_spotify__data_by_day') }}
group by year_month
    ,country
    ,region
    ,cat_genre 
    ,potentiel_viral
    ,energy_vibe
    ,duration_segment
    order by year_month

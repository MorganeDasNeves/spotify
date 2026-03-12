{{ config(materialized='table') }}
Select
    count(artist) as nb_artist
    ,count(title) as nb_title
    ,count(album) as nb_album
    ,sum(streams) as total_streams
    ,extract(year from date_date) as date_year
    ,extract(month from date_date) as date_month
    ,country
    ,region
    ,sum(popularity) as popularity
    ,sum(case 
    when is_explicit=True then 1 else 0 end) as nb_is_explicit
    ,sum(af_danceability) as sum_danceability
    ,avg(af_danceability) as avg_danceability
    ,sum(af_energy) as sum_energy
    ,avg(af_energy) as avg_energy
    ,sum(af_speechiness) as sum_speechiness
    ,sum(af_acousticness) as sum_acoustiness
    ,sum(af_instrumentalness) as sum_intrumentalness
    ,sum(af_valence) as sum_valence
    ,sum(af_tempo) as sum_tempo
    ,cat_genre
    ,Potentiel_Viral
    ,Energy_Vibe
    ,duration_segment
FROM {{ ref('mart_spotify__data_by_day') }}
group by date_year, date_month
    ,country
    ,region
    ,cat_genre
    ,Potentiel_Viral
    ,Energy_Vibe
    ,duration_segment
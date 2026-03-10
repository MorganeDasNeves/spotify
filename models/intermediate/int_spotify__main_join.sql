{{ config(materialized='table') }}
Select 
         c.track_id
        ,c.artist
        ,c.title
        ,s.album
        ,s.release_date 
        ,c.streams
        ,c.ranking
        ,c.date_date
        ,c.url_link
        ,c.region
        ,c.chart
        ,c.trend      
        ,s.popularity
        ,s.duration_ms
        ,s.is_explicit
        ,s.af_danceability
        ,s.af_energy
        ,s.af_speechiness
        ,s.af_acousticness
        ,s.af_instrumentalness
        ,s.af_valence
        ,s.af_tempo
From {{ ref('int_spotify__charts') }} AS c 
INNER JOIN {{ ref('int_spotify__music_type') }} AS s
ON c.track_id = s.track_id
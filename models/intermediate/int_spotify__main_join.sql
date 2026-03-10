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
        ,c.country
        , CASE
        WHEN country IN (
        'Andorra','Austria','Belgium','Bulgaria','Czech Republic','Denmark',
        'Estonia','Finland','France','Germany','Greece','Hungary','Iceland',
        'Ireland','Italy','Latvia','Lithuania','Luxembourg','Netherlands',
        'Norway','Poland','Portugal','Romania','Russia','Slovakia','Spain',
        'Sweden','Switzerland','Ukraine','United Kingdom'
    ) THEN 'Europe'

         WHEN country IN (
        'Argentina','Bolivia','Brazil','Chile','Colombia',
        'Costa Rica','Dominican Republic','Ecuador','El Salvador',
        'Guatemala','Honduras','Nicaragua','Panama',
        'Paraguay','Peru','Uruguay','Mexico'
    ) THEN 'Latin America'

         WHEN country IN (
        'Canada','United States'
    ) THEN 'North America'


        WHEN country IN (
        'Hong Kong','India','Indonesia','Israel','Japan','Malaysia',
        'Philippines','Saudi Arabia','Singapore','South Korea',
        'Taiwan','Thailand','Turkey','United Arab Emirates','Vietnam'
        ) THEN 'Asia'

         WHEN country IN (
        'Egypt','Morocco','South Africa'
    )    THEN 'Africa'

        WHEN country IN (
        'Australia','New Zealand'
        ) THEN 'Oceania'

        WHEN country = 'Global' THEN 'Global'

        END AS region
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
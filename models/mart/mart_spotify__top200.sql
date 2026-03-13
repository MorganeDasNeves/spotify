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
    ,CASE
    WHEN title = "Blinding Lights" THEN "https://cdn-images.dzcdn.net/images/cover/cf22674710be326f668dfb27d5af9576/0x1900-000000-80-0-0.jpg"
    WHEN title = "The Business" THEN "https://i.scdn.co/image/ab67616d0000b273605a9b89d2501564757d349d"
    WHEN title = "Levitating (feat. DaBaby)" THEN "https://i1.sndcdn.com/artworks-mXTTrOdEQi5H-0-t500x500.jpg"
    WHEN title = "Friday (feat. Mufasa & Hypeman) - Dopamine Re-Edit" THEN "https://i.discogs.com/ZV5gBhy13ZtiOmCgyvuW6siPxW-p32ElTTzBQkLVNJs/rs:fit/g:sm/q:40/h:300/w:300/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE2OTM2/NjgwLTE2MTA3MDYw/MTctNTcwNC5qcGVn.jpeg"
    WHEN title = "Heat Waves" THEN "https://i.scdn.co/image/ab67616d0000b273ab9d1ae18b640b7b0ce390d4"
    WHEN title = "Bande organisée" THEN "https://i.scdn.co/image/ab67616d0000b2736a3b5cd47c9a6932adaa5ef7"
    WHEN title = "Cabeza" THEN "https://cdn-images.dzcdn.net/images/cover/b869ab7fa9d2765c39b1446068d53ce1/1900x1900-000000-80-0-0.jpg"
    WHEN title = "Tout en Gucci" THEN "https://cdn-images.dzcdn.net/images/cover/f6bcf76c6a01ffa7ab295f9b5cecf0c2/500x500.jpg"
    WHEN title = "La kiffance" THEN "https://cdn-images.dzcdn.net/images/cover/0846f00620ad172c934e89bcad774388/0x1900-000000-80-0-0.jpg"
    WHEN title = "Eté 90" THEN "https://cdn-images.dzcdn.net/images/cover/4864326bb55c52bb97ba34fa03a2b084/1900x1900-000000-80-0-0.jpg"
    END AS cover_url
    FROM {{ ref('mart_spotify__data_by_day') }}
    WHERE chart= 'top200' --AND region = 'Europe'
    AND date_date >= '2020-01-01'
    ORDER BY date_date, ranking
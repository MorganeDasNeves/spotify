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
    ,CASE
    WHEN artist = "Ninho" THEN "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/6Te49r3A6f5BiIgBRxH7FH/ar"
    WHEN artist = "ZKR" THEN "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/2yJ6lsLqG06r9bckSTQRt4/fr"
    WHEN artist = "Hamza" THEN "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/5gs4Sm2WQUkcGeikMcVHbh/fr"
    WHEN artist = "Gazo" THEN "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/5gqmbbfjcikQBzPB5Hv13I/fr"
    WHEN artist = "SCH" THEN "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/2kXKa3aAFngGz2P4GjG5w2/en"
    WHEN artist = "Booba" THEN "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/58wXmynHaAWI5hwlPZP3qL/fr"
    WHEN artist = "Aya Nakamura" THEN "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/7IlRNXHjoOCgEAWN5qYksg/ar"
    WHEN artist = "Damso" THEN "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/2UwqpfQtNuhBwviIC0f2ie/ar"
    WHEN artist = "Soso Maness" THEN "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/0oeiA5U9u1U45Gos5cywUU/ar"
    WHEN artist = "Laylow" THEN "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/0LnhY2fzptb0QEs5Q5gM7S/en"
    WHEN artist = "OBOY" THEN "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/66Ok6bgC570sHkw08N20pZ/ar"
    WHEN artist = "Leto" THEN "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/6HCBnyTBSLdb3TFn2ayulY/en-GB"
    WHEN artist = "Ziak" THEN "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/2ubn2zwyYaLdHOCKnTouU2/en"
    WHEN artist = "Orelsan" THEN "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/4FpJcNgOvIpSBeJgRg3OfN/ar"
    WHEN artist = "Niska" THEN "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/7CUFPNi1TU8RowpnFRSsZV/en"
    WHEN artist = "PLK" THEN "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/3DCWeG2J1fZeu0Oe6i5Q6m/en"
    WHEN artist = "JUL" THEN "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/3IW7ScrzXmPvZhB27hmfgy/ar"
    WHEN artist = "UZI" THEN "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/51DevdOxIJin6DB1FXJpD1/en"
    WHEN artist = "Djaja & Dinaz" THEN "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/5hREZP0zTQbTLkZ2M8RS4v/en"
    WHEN artist = "Pop Smoke" THEN "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/0eDvMgVFoNV3TpwtrVCoTj/fr"
    WHEN artist = "Juice WRLD" THEN "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/4MCBfE4596Uoi2O4DtmEMz/ar"
    WHEN artist = "The Weeknd" THEN "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/1Xyo4u8uXC1ZmMpatF05PJ/en"
    WHEN artist = "Justin Bieber" THEN "https://i.scdn.co/image/ab67706f000000021da8a6c4b1647a5c33e8a5b3"
    WHEN artist = "Billie Eilish" THEN "https://i.scdn.co/image/ab67706f000000021e90d0ba15e76049f0d745ae"
    WHEN artist = "Dua Lipa" THEN "https://i.scdn.co/image/ab67706f00000002352b407accb314a9df7a273c"
    WHEN artist = "Ariana Grande" THEN "https://i.scdn.co/image/ab67706f00000002f2f6b801127de27ad3f00e39"
    WHEN artist = "Drake" THEN "https://i.scdn.co/image/ab67706f00000002e47c587e5107b565327a2172"
    WHEN artist = "Olivia Rodrigo" THEN "https://i.scdn.co/image/ab67706f00000002347064f35c60a7c28984226b"
    WHEN artist = "Måneskin" THEN "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/0lAWpj5szCSwM4rUMHYmrr/en"
    WHEN artist = "J. Cole" THEN "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/6l3HvQ5sa6mXTsMTB19rO5/en"
    WHEN artist = "Dojo Cat" THEN "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/5cj0lLjcoR7YOSnhnX0Po5/ar"
    WHEN artist = "Kanye West" THEN "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/5K4W6rqBFWDnAN6FQUkS6x/ar"
    WHEN artist = "Ed Sheeran" THEN "https://i.scdn.co/image/ab67706f00000002e6b2b9f345ec4f969552b15b"
    WHEN artist = "Adele" THEN "https://i.scdn.co/image/ab67706f00000002caad1ad4919c81b38f7b13be"
    WHEN artist = "Lil Nas X" THEN "https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/thisisv3/7jVv8c5Fj3E9VhNjxT4snq/en"
    END AS artist_url
    FROM {{ ref('mart_spotify__data_by_day') }}
    WHERE chart= 'top200' --AND region = 'Europe'
    AND date_date >= '2020-01-01'
    ORDER BY date_date, ranking
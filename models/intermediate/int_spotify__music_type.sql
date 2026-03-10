SELECT 
track_id
,album
,popularity
,duration_ms
,is_explicit
,SAFE_CAST(release_date AS DATE) AS release_date -- 4863 dates qui sont null pas au bon format 
,af_danceability
,af_energy
,af_speechiness
,af_acousticness
,af_instrumentalness
,af_valence
,af_tempo
FROM {{ ref('stg_spotify__music_type') }}
WHERE album IS NOT NULL AND duration_ms != 0
  

SELECT DISTINCT 
        track_id
        ,genres
FROM {{ ref('stg_spotify__genres') }}
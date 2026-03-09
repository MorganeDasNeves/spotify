with 

source as (

    select * from {{ source('spotify', 'music_type') }}

),

renamed as (

    select
        track_id,
        album,
        popularity,
        duration_ms,
        explicit as is_explicit,
        release_date,
        available_markets,
        af_danceability,
        af_energy,
        af_key,
        af_loudness,
        af_mode,
        af_speechiness,
        af_acousticness,
        af_instrumentalness,
        af_liveness,
        af_valence,
        af_tempo,
        af_time_signature

    from source

)

select * from renamed
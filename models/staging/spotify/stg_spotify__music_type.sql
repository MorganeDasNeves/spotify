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
        af_danceability,
        af_energy,
        af_speechiness,
        af_acousticness,
        af_instrumentalness,
        af_valence,
        af_tempo

    from source

)

select * from renamed
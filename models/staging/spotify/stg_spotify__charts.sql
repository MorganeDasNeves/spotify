with 

source as (

    select * from {{ source('spotify', 'charts') }}

),

renamed as (

    select
        title,
        rank,
        date,
        artist,
        url,
        region,
        chart,
        trend,
        streams

    from source

)

select * from renamed
with 

source as (

    select * from {{ source('spotify', 'charts') }}

),

renamed as (

    select
        title,
        rank,
        date as date_date,
        artist,
        url as url_link,
        region,
        chart,
        trend,
        streams

    from source

)

select * from renamed
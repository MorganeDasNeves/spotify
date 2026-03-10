with 

source as (

    select * from {{ source('spotify', 'charts') }}

),

renamed as (

    select
        title,
        rank AS ranking,
        date as date_date,
        artist,
        url as url_link,
        region as country,
        chart,
        trend,
        streams

    from source

)

select * from renamed
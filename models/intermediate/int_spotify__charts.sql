--Ajout colonne track_id dans table charts


SELECT DISTINCT
        title
        ,ranking
        ,date_date
        ,artist
        ,url_link
        ,country
        ,chart
        ,trend
        ,streams
        ,SUBSTRING(url_link, 32) AS track_id
FROM {{ ref('stg_spotify__charts') }}

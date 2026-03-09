--Ajout colonne track_id dans table charts


SELECT *,
SUBSTRING(url_link, 32) AS track_id
FROM {{ ref('stg_spotify__charts') }}
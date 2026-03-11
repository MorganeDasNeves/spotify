SELECT 
m.*
,g.cat_genre
FROM {{ ref('int_spotify__main_join') }} AS m
LEFT JOIN {{ ref('int_spotify__genres_agg') }} AS g 
ON m.track_id = g.track_id
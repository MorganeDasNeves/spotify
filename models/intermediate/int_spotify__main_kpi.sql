with temp as (
    select 
    track_id
    , duration_ms
    ,(Popularity * 0.6) + (af_danceability * 0.4) as potentiel_viral_calcul
    ,(af_energy * 0.6) + (af_valence *0.4) as energy_vibe_calcul
from {{ ref('int_spotify__main_join') }}
)
select DISTINCT
 track_id
,case 
when potentiel_viral_calcul >= 0.75 then 'Viral hits' -- tres populaire tres dansant fort potentiel de diffusion
when potentiel_viral_calcul < 0.4 then 'Niche tracks' -- faible pouplarite et potentiel dansant audiance plus specifique
else 'Popular tracks' -- performance correcte playlist generaliste
end as potentiel_viral
,case
when energy_vibe_calcul >= 0.6 then 'Happy & energetic' -- passé de 0.75 à 0.6
when energy_vibe_calcul < 0.4 then 'Melancholy & chill'
else 'Balanced' 
end as energy_vibe
,case 
when duration_ms < 180000 then 'Radio friendly'
else 'Long play'
end as duration_segment
from temp
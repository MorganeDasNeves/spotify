with temp as (
    select 
    track_id
    , duration_ms
    ,(Popularity * 0.6) + (af_danceability * 0.4) as Potentiel_Viral_calcul
    ,(af_energy * 0.6) + (af_valence *0.4) as Energy_Vibe_calcul
from {{ ref('int_spotify__main_join') }}
)
select DISTINCT
 track_id
,case 
when Potentiel_Viral_calcul >= 0.75 then 'Viral hits' -- tres populaire tres dansant fort potentiel de diffusion
when Potentiel_Viral_calcul < 0.4 then 'Niche tracks' -- faible pouplarite et potentiel dansant audiance plus specifique
else 'Popular tracks' -- performance correcte playlist generaliste
end as Potentiel_Viral
,case
when Energy_Vibe_calcul >= 0.75 then 'Happy & Energetic'
when Energy_Vibe_calcul < 0.4 then 'Melancholy & Chill'
else 'Balanced' 
end as Energy_Vibe
,case 
when duration_ms < 180000 then 'Radio Friendly'
else 'Long play'
end as duration_segment
from temp
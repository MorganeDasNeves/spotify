SELECT DISTINCT 
        track_id
        ,genres

    ,CASE 
        -- 1. Genres très spécifiques (priorité haute)
        WHEN genres LIKE '%metal%' THEN 'Metal'--1
        WHEN genres LIKE '%reggaeton%' OR genres LIKE '%urbano%' OR genres LIKE '%latino%' OR genres LIKE '%bachata%' THEN 'Latino'--2
        WHEN genres LIKE '%hip hop%' OR genres LIKE '%rap%' OR genres LIKE '%trap%' OR genres LIKE '%drill%' THEN 'Hip-Hop/Rap'--3
        WHEN genres LIKE '%reggae%' OR genres LIKE '%dancehall%' THEN 'Reggae/Dancehall'--4
        
        -- 2. Genres avec une identité forte
        WHEN genres LIKE '%techno%' OR genres LIKE '%house%' OR genres LIKE '%electronic%' THEN 'Electronic'--5
        WHEN genres LIKE '%jazz%' OR genres LIKE '%blues%' THEN 'Jazz/blues'--6
        WHEN genres LIKE '%classical%' OR genres LIKE '%orchestra%' THEN 'Classical'--7
        WHEN genres LIKE '%country%' THEN 'Country'--8
        
        -- 3. Genres régionaux / Spécifiques
        WHEN genres LIKE '%afro%' OR genres LIKE '%amapiano%' THEN 'Afro'--9
        WHEN genres LIKE '%children%' OR genres LIKE '%vbs%' THEN 'Children/Family'--10
        
        -- 4. Genres larges (priorité basse, récupère ce qui reste)
        WHEN genres LIKE '%punk%' OR genres LIKE '%rock%' THEN 'Rock'--11
        WHEN genres LIKE '%folk%' OR genres LIKE '%acoustic%' THEN 'Folk'--12
        WHEN genres LIKE '%pop%' OR genres LIKE '%dance pop%' OR genres LIKE '%opm%' THEN 'Pop'--13
        
        -- 5. Par défaut
        ELSE 'Other'--14
    END AS cat_genre

FROM {{ ref('stg_spotify__genres') }}
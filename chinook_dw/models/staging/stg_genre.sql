with sc_genre as (
    select * FROM {{ source('chinookdb', 'Genre') }}
)

select
    "GenreId" as genre_id,
    "Name" as name
from sc_genre
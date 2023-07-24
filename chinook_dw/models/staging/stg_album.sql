with sc_album as (
    select * FROM {{ source('chinookdb', 'Album') }}
)

select
    "AlbumId" as album_id,
    "Title" as title,
    "ArtistId" as artist_id
from sc_album
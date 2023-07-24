
with source_data as (
    select * FROM {{ source('chinookdb', 'Track') }}
)

select
	"TrackId"as track_id,
	"Name" as name,
	"AlbumId" as  album_id,
	"MediaTypeId" as  media_type_id,
	"GenreId" as  genre_id,
	"Composer" as  composer,
	"Milliseconds" as  milliseconds,
	"Bytes" as  bytes,
	"UnitPrice" as  unit_price
from source_data

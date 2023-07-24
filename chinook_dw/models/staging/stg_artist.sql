
with sc_artist as (
    select * FROM {{ source('chinookdb', 'Artist') }}
)

select
	"ArtistId" as artist_id,
	"Name" as name
from sc_artist
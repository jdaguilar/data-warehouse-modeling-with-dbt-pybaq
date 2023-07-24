with sc_media_type as (
    select * FROM {{ source('chinookdb', 'MediaType') }}
)

select
	"MediaTypeId" media_type_id,
	"Name" as media_type_name
from sc_media_type
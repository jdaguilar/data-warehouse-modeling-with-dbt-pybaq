with sc_artist as (
    select * FROM {{ ref('stg_artist') }}
),
sc_album as (
    select * FROM {{ ref('stg_album') }}
),
sc_genre as (
    select * FROM {{ ref('stg_genre') }}
),
sc_track as (
    select * FROM {{ ref('stg_track') }}
),
sc_media_type as (
    select * FROM {{ ref('stg_media_type') }}
),
tmp_album as (
    select sal.album_id,
        sal.title as album_name,
        sar.name as artist_name
    from sc_album sal
        left join sc_artist sar on sal.artist_id = sar.artist_id
),
dim_track as (
    select tr.track_id,
        tr.name as song_name,
        tmp_album.artist_name,
        tmp_album.album_name,
        sc_genre.name as genre,
        tr.composer as composer_name,
        tr.milliseconds as duration_milliseconds,
        tr.unit_price,
        sc_media_type.media_type_name
    from sc_track tr
        left join tmp_album on tr.album_id = tmp_album.album_id
        left join sc_genre on tr.genre_id = sc_genre.genre_id
        left join sc_media_type on tr.media_type_id = sc_media_type.media_type_id
)
select *
from dim_track
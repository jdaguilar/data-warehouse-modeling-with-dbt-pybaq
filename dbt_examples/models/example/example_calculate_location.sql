{{
    config(materialized="table")
}}


select
  {{ dbt_utils.star(ref('airport_locations')) }},
  {{ dbt_utils.haversine_distance(
        lat1="from_latitude",
        lon1="from_longitude",
        lat2="to_latitude",
        lon2="to_longitude",
        unit='km'
    ) }} as distance,
  'KM' as units
from {{ ref('airport_locations') }}
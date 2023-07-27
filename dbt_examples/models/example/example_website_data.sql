
{{
    config(materialized="table")
}}

select
{{ dbt_utils.get_url_host(field="website_url") }} as website_host,
{{ dbt_utils.get_url_path(field="website_url") }} as website_path
from {{ref("website_data")}}
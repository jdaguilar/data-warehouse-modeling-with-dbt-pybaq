
{% set columns_to_exclude = ['address', 'reports_to', 'state', 'postal_code', 'phone', 'fax', 'email'] %}

select
{{ dbt_utils.star(
    from=ref('stg_employee'), 
    except=columns_to_exclude, 
    ) 
}}
from {{ ref('stg_employee') }}


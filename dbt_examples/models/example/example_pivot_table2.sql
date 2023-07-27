select
  region,
  {{ dbt_utils.pivot(
      'color',
      dbt_utils.get_column_values(ref('seed_sample_data'), 'color'),
      agg='sum',
      then_value='units',
      suffix='_color'
  ) }}
from {{ ref('seed_sample_data') }}
group by region
select
  size,
  {{ dbt_utils.pivot(
      'color',
      dbt_utils.get_column_values(ref('orders'), 'color'),
      agg='sum',
      then_value='quantity',
      prefix='pre_',
      suffix='_post'
  ) }}
from {{ ref('orders') }}
group by size
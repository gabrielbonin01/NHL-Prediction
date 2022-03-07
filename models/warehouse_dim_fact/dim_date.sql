with staging_warehouse as(
select *
from from {{ ref('stg_date') }}
)

select * from staging_warehouse
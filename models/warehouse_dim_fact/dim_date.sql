with staging_warehouse as(
    select
    DATE_ID,
    DATE_TIME_GMT,
    YEAR,
    MONTH,
    DAY,
    WEEK,
    QUARTER,
    HOUR,
    MINUTE ,
from {{ ref('stg_date') }}
)

select * from staging_warehouse
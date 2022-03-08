with source_staging as(
select 
    distinct(DATE_TIME_GMT),
    extract (year from DATE_TIME_GMT) as year,
    extract (month from DATE_TIME_GMT) as month,
    extract (day from DATE_TIME_GMT) as day,
    extract (week from DATE_TIME_GMT) as week,

    
    
    
    
from {{ source('DATALAKE', 'GAME') }}  
)

SELECT ROW_NUMBER() OVER (ORDER BY DATE_TIME_GMT) AS DATE_ID, *

FROM source_staging
with source_staging as (
        select 
        PLAY_ID,
        PENALTYSEVERITY,
        PENALTYMINUTES,
        current_timestamp() as ingestion_timestamp
    from {{ source('DATALAKE', 'GAME_PENALITIES') }}       
)

select *
from source_staging
with source_staging as (
        select 
        GAME_ID,
        PLAYER_ID,
        PERIOD,
        SHIFT_START as SHIFT_START_IN_SEC ,
        SHIFT_END as SHIFT_END_IN_SEC,
        current_timestamp() as ingestion_timestamp
    from {{ source('DATALAKE', 'GAME_SHIFTS') }}       
)

select *
from source_staging

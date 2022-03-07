with staging_warehouse as (
        select 
        GAME_ID,
        PLAYER_ID,
        PERIOD,
        SHIFT_START_IN_SEC ,
        SHIFT_END_IN_SEC,
        current_timestamp() as ingestion_timestamp
    from {{ ref('stg_game_shifts') }}       
)

select *
from staging_warehouse

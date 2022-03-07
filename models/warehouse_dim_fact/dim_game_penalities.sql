with staging_warehouse as (
        select 
        PLAY_ID,
        PENALTYSEVERITY,
        PENALTYMINUTES,
        current_timestamp() as ingestion_timestamp
    from {{ ref('stg_game_penalities') }}       
)

select *
from staging_warehouse
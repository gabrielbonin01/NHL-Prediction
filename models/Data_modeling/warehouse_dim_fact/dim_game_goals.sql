with staging_warehouse as (
        select 
        PLAY_ID,
        STRENGTH,
        GAMEWINNINGGOAL,
        EMPTYNET,
        current_timestamp() as ingestion_timestamp
    from {{ ref('stg_game_goals') }}      
)

select *
from staging_warehouse
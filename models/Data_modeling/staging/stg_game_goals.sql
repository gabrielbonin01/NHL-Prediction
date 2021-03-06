with source_staging as (
        select 
        PLAY_ID,
        STRENGTH,
        GAMEWINNINGGOAL,
        EMPTYNET,
        current_timestamp() as ingestion_timestamp
    from {{ source('DATALAKE', 'GAME_GOALS') }}       
)

select *
from source_staging
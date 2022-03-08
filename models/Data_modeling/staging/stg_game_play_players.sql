with source_staging as (
        select 
        PLAY_ID,
        GAME_ID,
        PLAYER_ID,
        PLAYERTYPE,
        current_timestamp() as ingestion_timestamp
    from {{ source('DATALAKE', 'GAME_PLAYS_PLAYERS') }}       
)

select *
from source_staging

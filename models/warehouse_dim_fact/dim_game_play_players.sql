with staging_warehouse as (
        select 
        PLAY_ID,
        GAME_ID,
        PLAYER_ID,
        PLAYERTYPE,
        current_timestamp() as ingestion_timestamp
    from {{ ref('stg_game_play_players') }}       
)

select *
from staging_warehouse

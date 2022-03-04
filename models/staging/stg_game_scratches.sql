with source_datalake as (
        select 
        GAME_ID,
        TEAM_ID,
        PLAYER_ID,
        current_timestamp() as ingestion_timestamp
    from {{ source('DATALAKE', 'GAME_SCRATCHES') }}       
)

select *
from source_datalake
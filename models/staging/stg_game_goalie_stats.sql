with source_datalake as (
        select 
        GAME_ID,
        PLAYER_ID,
        TEAM_ID,
        TIME_ON_ICE,
        ASSISTS,
        GOALS,
        PIM,
        SHOTS,
        SAVES,
        POWER_PLAY_SAVES,
        SHORT_HANDED_SAVES,
        EVEN_SAVES,
        SHORT_HANDED_SHOTS_AGAINST,
        EVEN_SHOTS_AGAINST,
        POWERPLAY_SHOTS_AGAINST,
        DECISION,
        SAVE_PERCENTAGE,
        POWERPLAY_SAVE_PERCENTAGE,
        EVEN_STRENGTH_SAVE_PERCENTAGE,
        current_timestamp() as ingestion_timestamp
    from {{ source('DATALAKE', 'GAME_GOALIE_STATS') }}       
)

select *
from source_datalake




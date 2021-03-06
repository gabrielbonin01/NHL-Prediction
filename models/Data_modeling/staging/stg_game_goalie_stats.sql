with source_staging as (
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
        SAVE_PERCENTAGE,
        POWERPLAY_SAVE_PERCENTAGE,
        EVEN_STRENGTH_SAVE_PERCENTAGE,
        current_timestamp() as ingestion_timestamp,
        case
        WHEN DECISION is NULL THEN 'OUT OF GAME'
        WHEN DECISION = 'W' THEN 'WIN GAME'
        WHEN DECISION = 'L' THEN 'LOST GAME'
        END as DECISION
    from {{ source('DATALAKE', 'GAME_GOALIE_STATS') }}       
)

select *
from source_staging




with staging_warehouse as (
        select 
        GAME_ID,
        PLAYER_ID,
        TEAM_ID,
        TIME_ON_ICE as TIME_ON_ICE_GOALIE,
        ASSISTS as ASSISTS_GOALIE,
        GOALS as GOALS_GOALIE,
        PIM as PIM_GOALIE,
        SHOTS as SHOTS_GOALIE,
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
        DECISION,
        current_timestamp() as ingestion_timestamp
    from {{ ref('stg_game_goalie_stats') }}
)

select *
from staging_warehouse



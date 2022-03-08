with staging_warehouse as (
        select 
        GAME_ID,
        PLAYER_ID,
        TEAM_ID,
        TIME_ON_ICE,
        ASSISTS,
        GOALS,
        SHOTS,
        HITS,
        POWER_PLAY_GOALS,
        POWER_PLAY_ASSISTS,
        PENALITY_MINUTES,
        FACEOFF_WINS,
        FACEOFF_TAKEN,
        TAKEAWAYS,
        GIVEAWAYS,
        SHORT_HANDED_GOALS,
        SHORT_HANDED_ASSISTS,
        BLOCKED,
        PLUS_MINUS,
        EVEN_TIME_ON_ICE,
        SHORT_HANDED_TIME_ON_ICE,
        POWERPLAY_TIME_ON_ICE,
        current_timestamp() as ingestion_timestamp
    from {{ ref('stg_game_skater_stats') }}       
)

select *
from staging_warehouse
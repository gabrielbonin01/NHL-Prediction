with source_datalake as (
        select 
        GAME_ID,
        PLAYER_ID,
        TEAM_ID,
        TIME_ON_ICE as TIME_ON_ICE_SKATER,
        ASSISTS as ASSISTS_SKATER,
        GOALS as GOALS_SKATER,
        SHOTS as SHOTS_SKATER,
        HITS as HITS_SKATER,
        POWER_PLAY_GOALS as POWER_PLAY_GOALS_SKATER,
        POWER_PLAY_ASSISTS as POWER_PLAY_ASSISTS_SKATER,
        PENALITY_MINUTES,
        FACEOFF_WINS,
        FACEOFF_TAKEN,
        TAKEAWAYS as TAKEAWAYS_SKATER,
        GIVEAWAYS as GIVEAWAYS_SKATER,
        SHORT_HANDED_GOALS,
        SHORT_HANDED_ASSISTS,
        BLOCKED,
        PLUS_MINUS,
        EVEN_TIME_ON_ICE,
        SHORT_HANDED_TIME_ON_ICE,
        POWERPLAY_TIME_ON_ICE,
        current_timestamp() as ingestion_timestamp
    from {{ source('DATALAKE', 'GAME_SKATER_STATS') }}       
)

select *
from source_datalake
with source_staging as (
    select 
        GAME_ID,
        HOA,
        WON,
        SETTLED_IN,
        HEAD_COACH,
        GOALS,
        SHOTS,
        HITS,
        PIM,
        POWERPLAY_OPPORTUNITIES,
        POWERPLAY_GOALS,
        FACEOFF_WIN_PERCENTAGE,
        GIVEAWAYS,
        TAKEAWAYS,
        BLOCKED,
        STARTRINKSIDE,
        current_timestamp() as ingestion_timestamp
    from {{ source('DATALAKE', 'GAME_TEAMS_STATS') }}       
)

select *
from source_staging
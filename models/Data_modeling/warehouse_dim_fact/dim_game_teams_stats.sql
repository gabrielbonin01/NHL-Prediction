with staging_warehouse as (
    select 
        GAME_ID,
        TEAM_ID,
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
    from {{ ref('stg_game_teams_stats') }}       
)

select *
from staging_warehouse
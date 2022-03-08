with staging_warehouse as (
    select 
        GAME_ID,
        TEAM_ID,
        HOA,
        WON,
        SETTLED_IN,
        HEAD_COACH,
        GOALS as GOALS_TEAM,
        SHOTS as SHOTS_TEAM,
        HITS as HITS_TEAM,
        PIM as PIM_TEAM,
        POWERPLAY_OPPORTUNITIES,
        POWERPLAY_GOALS as POWERPLAY_GOALS_TEAM,
        FACEOFF_WIN_PERCENTAGE,
        GIVEAWAYS as GIVEAWAYS_TEAM,
        TAKEAWAYS as TAKEAWAYS_TEAM,
        BLOCKED as BLOCKED_TEAM,
        STARTRINKSIDE,
        current_timestamp() as ingestion_timestamp
    from {{ ref('stg_game_teams_stats') }}       
)

select *
from staging_warehouse
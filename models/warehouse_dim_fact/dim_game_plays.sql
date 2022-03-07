with staging_warehouse as (
        select 
        PLAY_ID,
        GAME_ID,
        TEAM_ID_FOR,
        TEAM_ID_AGAINST,
        PLAY_EVENT,
        SECONDARY_TYPE,
        X,
        Y,
        PERIOD,
        PERIOD_TYPE,
        PERIOD_TIME,
        PERIOD_TIME_REMAINING,
        DATE_TIME,
        GOALS_AWAY,
        GOALS_HOME,
        PLAY_DESCRIPTION,
        ST_X,
        ST_Y,
        current_timestamp() as ingestion_timestamp
    from {{ ref('stg_game_plays') }}       
)

select *
from staging_warehouse
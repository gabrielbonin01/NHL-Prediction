with staging_warehouse as (
        select 
        GAME_ID,
        SEASON,
        GAME_TYPE,
        DATE_TIME_GMT,
        DATE_ID,
        AWAY_TEAM_ID,
        HOME_TEAM_ID,
        AWAY_GOALS,
        HOME_GOALS,
        HOME_RINK_START,
        VENUE,
        VENUE_TIME_ZONE_ID,
        VENUE_TIME_ZONE_OFFSET,
        WINNER,
        REG_OT,
        current_timestamp() as ingestion_timestamp
    from {{ ref('stg_game') }}
)

select *
from staging_warehouse



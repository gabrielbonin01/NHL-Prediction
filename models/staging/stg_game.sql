with source_datalake as (
        select 
        GAME_ID,
        SEASON,
        GAME_TYPE,
        DATE_TIME_GMT,
        AWAY_TEAM_ID,
        HOME_TEAM_ID,
        AWAY_GOALS,
        HOME_GOALS,
        HOME_RINK_START,
        VENUE,
        VENUE_TIME_ZONE_ID,
        VENUE_TIME_ZONE_OFFSET, 
        left(OUTCOME, CHARINDEX(' ', OUTCOME) - 1) as WINNER, 
        right(OUTCOME, CHARINDEX(' ', OUTCOME) - 2) as REG_OT,
        current_timestamp() as ingestion_timestamp
    from {{ source('DATALAKE', 'GAME') }}       
)

select *
from source_datalake




with staging_warehouse as(
select *,g.DATE_TIME_GMT as DATE_TIME
from "NHL_PREDICTION"."STAGING_LAYER"."STG_GAME" as g
inner join "NHL_PREDICTION"."STAGING_LAYER"."STG_DATE" as d
where g.DATE_TIME_GMT= d.DATE_TIME_GMT
)
select 
        GAME_ID,
        SEASON,
        GAME_TYPE,
        DATE_TIME,
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

from staging_warehouse
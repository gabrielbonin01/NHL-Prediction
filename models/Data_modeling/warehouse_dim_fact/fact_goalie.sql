with staging_warehouse as (
    select 

        g.GAME_ID,
        g.SEASON,
        g.GAME_TYPE,
        g.DATE_ID,
        g.DATE_TIME_GMT,
        g.AWAY_TEAM_ID,
        g.HOME_TEAM_ID,
        g.AWAY_GOALS,
        g.HOME_GOALS,
        g.HOME_RINK_START,
        g.VENUE,
        g.VENUE_TIME_ZONE_ID,
        g.VENUE_TIME_ZONE_OFFSET,
        g.WINNER,
        g.REG_OT,
        

        d.YEAR,
        d.MONTH,
        d.DAY,
        d.WEEK,
        d.QUARTER,
        d.HOUR,
        d.MINUTE,

        gs.PLAYER_ID,
        gs.TEAM_ID,
        gs.TIME_ON_ICE_GOALIE,
        gs.ASSISTS_GOALIE,
        gs.GOALS_GOALIE,
        gs.PIM_GOALIE,
        gs.SHOTS_GOALIE,
        gs.SAVES,
        gs.POWER_PLAY_SAVES,
        gs.SHORT_HANDED_SAVES,
        gs.EVEN_SAVES,
        gs.SHORT_HANDED_SHOTS_AGAINST,
        gs.EVEN_SHOTS_AGAINST,
        gs.POWERPLAY_SHOTS_AGAINST,
        gs.SAVE_PERCENTAGE,
        gs.POWERPLAY_SAVE_PERCENTAGE,
        gs.EVEN_STRENGTH_SAVE_PERCENTAGE,
        gs.DECISION,

        pi.FIRST_NAME,
        pi.LAST_NAME,
        pi.NATIONALITY,
        pi.BIRTH_CITY,
        pi.PRIMARY_POSITION,
        pi.BIRTH_DATE,
        pi.BIRTHSTATEPROVINCE,
        pi.HEIGHT,
        pi.HEIGHT_CM,
        pi.BIWEIGHTRTH_DATE,
        pi.SHOOTSCATCHES,


        current_timestamp() as ingestion_timestamp




    from {{ ref('dim_game') }} as g
    left join {{ ref('dim_date') }} as d
    on g.DATE_TIME_GMT = d.DATE_TIME_GMT
    left join {{ ref('dim_game_goalie_stats') }} as gs 
    on g.GAME_ID = gs.GAME_ID
    left join {{ ref('dim_player_info') }} as pi
    on gs.PLAYER_ID = pi.PLAYER_ID
    order by g.GAME_ID
    

)    

select * from staging_warehouse
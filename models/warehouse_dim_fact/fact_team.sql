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

        gst.HOA,
        gst.WON,
        gst.SETTLED_IN,
        gst.HEAD_COACH,
        gst.GOALS_TEAM,
        gst.SHOTS_TEAM,
        gst.HITS_TEAM,
        gst.PIM_TEAM,
        gst.POWERPLAY_OPPORTUNITIES,
        gst.POWERPLAY_GOALS_TEAM,
        gst.FACEOFF_WIN_PERCENTAGE,
        gst.GIVEAWAYS_TEAM,
        gst.TAKEAWAYS_TEAM,
        gst.BLOCKED_TEAM,
        gst.STARTRINKSIDE,

        ti.FRANCHISEID,
        ti.SHORTNAME,
        ti.TEAMNAME,
        ti.ABBREVIATION,
        current_timestamp() as ingestion_timestamp




    from {{ ref('dim_game') }} as g
    left join {{ ref('dim_date') }} as d
    on g.DATE_TIME_GMT = d.DATE_TIME_GMT
    left join {{ ref('dim_game_teams_stats') }} as gst
    on g.GAME_ID = gst.GAME_ID
    left join {{ ref('dim_team_info') }} as ti
    on gst.TEAM_ID = ti.TEAM_ID
    order by g.GAME_ID
    

)    

select * from staging_warehouse
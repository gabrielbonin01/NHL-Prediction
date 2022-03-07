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

        p.PLAY_ID,
        p.TEAM_ID_FOR,
        p.TEAM_ID_AGAINST,
        p.PLAY_EVENT,
        p.SECONDARY_TYPE,
        p.X,
        p.Y,
        p.PERIOD,
        p.PERIOD_TYPE,
        p.PERIOD_TIME,
        p.PERIOD_TIME_REMAINING,
        p.DATE_TIME,
        p.GOALS_AWAY,
        p.GOALS_HOME,
        p.PLAY_DESCRIPTION,
        p.ST_X,
        p.ST_Y,
        
        go.STRENGTH,
        go.GAMEWINNINGGOAL,
        go.EMPTYNET,

        o.OFFICIAL_NAME,
        o.OFFICIAL_TYPE,


        pe.PENALTYSEVERITY,
        pe.PENALTYMINUTES,
        
        pp.PLAYERTYPE,

        gsh.SHIFT_START_IN_SEC,
        gsh.SHIFT_END_IN_SEC,

        gss.TIME_ON_ICE_SKATER,
        gss.ASSISTS_SKATER,
        gss.GOALS_SKATER,
        gss.SHOTS_SKATER,
        gss.HITS_SKATER,
        gss.POWER_PLAY_GOALS_SKATER,
        gss.POWER_PLAY_ASSISTS_SKATER,
        gss.PENALITY_MINUTES,
        gss.FACEOFF_WINS,
        gss.FACEOFF_TAKEN,
        gss.TAKEAWAYS_SKATER,
        gss.GIVEAWAYS_SKATER,
        gss.SHORT_HANDED_GOALS,
        gss.SHORT_HANDED_ASSISTS,
        gss.BLOCKED,
        gss.PLUS_MINUS,
        gss.EVEN_TIME_ON_ICE,
        gss.SHORT_HANDED_TIME_ON_ICE,
        gss.POWERPLAY_TIME_ON_ICE,

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

        ti.FRANCHISEID,
        ti.SHORTNAME,
        ti.TEAMNAME,
        ti.ABBREVIATION,
        current_timestamp() as ingestion_timestamp

    from {{ ref('stg_game') }} as g
    left join {{ ref('stg_date') }} as d
    on g.DATE_ID = d.DATE_ID
    left join {{ ref('stg_game_goalie_stats') }} as gs 
    on g.GAME_ID = gs.GAME_ID
    left join {{ ref('stg_game_plays') }} as p
    on gs.GAME_ID = p.GAME_ID
    left join {{ ref('stg_game_goals') }} as go
    on p.PLAY_ID = go.PLAY_ID
    left join {{ ref('stg_game_officials') }} as o
    on p.GAME_ID = o.GAME_ID
    left join {{ ref('stg_game_penalities') }} as pe
    on go.PLAY_ID = pe.PLAY_ID
    left join {{ ref('stg_game_play_players') }} as pp
    on pe.PLAY_ID = pp.PLAY_ID
    left join {{ ref('stg_game_shifts') }} as gsh
    on pp.GAME_ID = gsh.GAME_ID
    left join {{ ref('stg_game_skater_stats') }} as gss
    on gsh.GAME_ID = gss.GAME_ID
    left join {{ ref('stg_game_teams_stats') }} as gst
    on gss.GAME_ID = gst.GAME_ID
    left join {{ ref('stg_player_info') }} as pi
    on pp.PLAYER_ID = pi.PLAYER_ID
    left join {{ ref('stg_team_info') }} as ti
    on gss.TEAM_ID = ti.TEAM_ID
    order by g.GAME_ID
)    

select * from staging_warehouse
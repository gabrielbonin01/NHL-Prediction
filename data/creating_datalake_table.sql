DROP TABLE IF EXISTS "NHL_PREDICTION"."DATA_LAKE"."GAME";
CREATE TABLE "NHL_PREDICTION"."DATA_LAKE"."GAME" (
	game_id INT NOT NULL,
    season INT NULL,
    game_type VARCHAR(2) NULL,
    date_time_GMT DATETIME NULL,
    away_team_id INT NULL,
    home_team_id INT NULL,
    away_goals INT NULL,
    home_goals INT NULL,
    outcome VARCHAR(20) NULL,
    home_rink_start VARCHAR(5) NULL,
    venue VARCHAR(50) NULL,
    venue_link VARCHAR(100) NULL,
    venue_time_zone_id VARCHAR(50) NULL,
    venue_time_zone_offset INT NULL,
    venue_time_zone_tz VARCHAR(5) NULL
)
;


DROP TABLE IF EXISTS "NHL_PREDICTION"."DATA_LAKE"."GAME_GOALIE_STATS";
CREATE TABLE IF NOT EXISTS "NHL_PREDICTION"."DATA_LAKE"."GAME_GOALIE_STATS" (
	game_id INT NOT NULL,
    player_id INT NOT NULL,
    team_id INT NOT NULL,
    time_on_ice INT NULL,
    assists INT NULL,
    goals INT NULL,
    pim INT NULL,
    shots INT NULL,
    saves INT NULL,
    power_play_saves INT NULL,
    short_handed_saves INT NULL,
    even_saves INT NULL,
    short_handed_shots_against INT NULL,
    even_shots_against INT NULL,
    powerplay_shots_against INT NULL,
    decision VARCHAR NULL,
    save_percentage DECIMAL(8,5) NULL,
    powerplay_save_percentage DECIMAL(8,5) NULL,
    even_strength_save_percentage DECIMAL(8,5) NULL
)
;

DROP TABLE IF EXISTS "NHL_PREDICTION"."DATA_LAKE"."GAME_GOALS";
CREATE TABLE IF NOT EXISTS "NHL_PREDICTION"."DATA_LAKE"."GAME_GOALS" (
	play_id VARCHAR NOT NULL,
    strength VARCHAR NULL,
    gameWinningGoal BOOLEAN NULL,
    emptyNet BOOLEAN NULL
)
;

DROP TABLE IF EXISTS "NHL_PREDICTION"."DATA_LAKE"."GAME_OFFICIALS";
CREATE TABLE IF NOT EXISTS "NHL_PREDICTION"."DATA_LAKE"."GAME_OFFICIALS" (
	game_id INT NOT NULL,
    official_name VARCHAR NULL,
    official_type VARCHAR NULL
)
;

DROP TABLE IF EXISTS "NHL_PREDICTION"."DATA_LAKE"."GAME_PENALITIES";
CREATE TABLE IF NOT EXISTS "NHL_PREDICTION"."DATA_LAKE"."GAME_PENALITIES" (
	play_id VARCHAR NOT NULL,
    penaltySeverity VARCHAR NULL,
    penaltyMinutes INT NULL
)
;

DROP TABLE IF EXISTS "NHL_PREDICTION"."DATA_LAKE"."GAME_PLAYS";
CREATE TABLE "NHL_PREDICTION"."DATA_LAKE"."GAME_PLAYS" (
	play_id VARCHAR(20) NOT NULL,
	game_id INT NOT NULL,
    team_id_for INT NULL,
    team_id_against INT NULL,
    play_event VARCHAR(40) NULL,
    secondary_type VARCHAR(40) NULL,
    x INT NULL,
    y INT NULL,
    period INT NULL,
    period_type VARCHAR(10) NULL,
    period_time INT NULL,
    period_time_remaining INT NULL,
    date_time DATETIME NULL,
    goals_away INT NULL,
    goals_home INT NULL,
    play_description VARCHAR(200) NULL,
    st_x INT NULL,
    st_y INT NULL

)
;


DROP TABLE IF EXISTS "NHL_PREDICTION"."DATA_LAKE"."GAME_PLAYS_PLAYERS";
CREATE TABLE IF NOT EXISTS "NHL_PREDICTION"."DATA_LAKE"."GAME_PLAYS_PLAYERS" (
	play_id VARCHAR NOT NULL,
    game_id INT NULL,
    player_id INT NULL,
    playerType VARCHAR NULL
)
;

DROP TABLE IF EXISTS "NHL_PREDICTION"."DATA_LAKE"."GAME_SCRATCHES";
CREATE TABLE IF NOT EXISTS "NHL_PREDICTION"."DATA_LAKE"."GAME_SCRATCHES" (
    game_id INT NOT NULL,
    team_id INT NULL,
    player_id INT NULL
)
;

DROP TABLE IF EXISTS "NHL_PREDICTION"."DATA_LAKE"."GAMES_SHIFTS";
CREATE TABLE IF NOT EXISTS "NHL_PREDICTION"."DATA_LAKE"."GAMES_SHIFTS" (
    game_id INT NOT NULL,
    player_id INT NULL,
    period INT NULL,
    shift_start INT NULL,
    shift_end INT NULL
)
;


DROP TABLE IF EXISTS "NHL_PREDICTION"."DATA_LAKE"."GAME_SKATER_STATS";
CREATE TABLE "NHL_PREDICTION"."DATA_LAKE"."GAME_SKATER_STATS" (
	game_id INT NOT NULL,
    player_id INT NOT NULL,
    team_id INT NOT NULL,
    time_on_ice INT NULL,
    assists INT NULL,
    goals INT NULL,
    shots INT NULL,
    hits INT NULL,
    power_play_goals INT NULL,
    power_play_assists INT NULL,
    penality_minutes INT NULL,
    faceoff_wins INT NULL,
    faceoff_taken INT NULL,
    takeaways INT NULL,
    giveaways INT NULL,
    short_handed_goals INT NULL,
    short_handed_assists INT NULL,
    blocked INT NULL,
    plus_minus INT NULL,
    even_time_on_ice INT NULL,
    short_handed_time_on_ice INT NULL,
    powerplay_time_on_ice INT NULL
)
;

DROP TABLE IF EXISTS "NHL_PREDICTION"."DATA_LAKE"."GAME_TEAMS_STATS";
CREATE TABLE "NHL_PREDICTION"."DATA_LAKE"."GAME_TEAMS_STATS" (
	game_id INT NOT NULL,
    team_id INT NOT NULL,
    hoa VARCHAR(5) NULL,
    won VARCHAR(50) NULL,
    settled_in VARCHAR(5) NULL,
    head_coach VARCHAR(40) NULL,
	goals INT NULL,
    shots INT NULL,
    hits INT NULL,
    pim INT NULL,
    powerplay_opportunities INT NULL,
    powerplay_goals INT NULL,
    faceoff_win_percentage DECIMAL(8,5) NULL,
    giveaways INT NULL,
    takeaways INT NULL,
    blocked INT NULL,
    startRinkSide VARCHAR(40) NULL
)
;
DROP TABLE IF EXISTS "NHL_PREDICTION"."DATA_LAKE"."GAMES_SHIFTS";
CREATE TABLE IF NOT EXISTS "NHL_PREDICTION"."DATA_LAKE"."GAMES_SHIFTS" (
    game_id INT NOT NULL,
    player_id INT NULL,
    period INT NULL,
    shift_start INT NULL,
    shift_end INT NULL
)
;

DROP TABLE IF EXISTS "NHL_PREDICTION"."DATA_LAKE"."PLAYER_INFO";
CREATE TABLE "NHL_PREDICTION"."DATA_LAKE"."PLAYER_INFO" (
	player_id INT NOT NULL,
    first_name VARCHAR(40) NULL,
    last_name VARCHAR(40) NULL,
    nationality VARCHAR(5) NULL,
    birth_city VARCHAR(50) NULL,
    primary_position VARCHAR(5) NULL,
    birth_date DATE NULL,
    BIRTHSTATEPROVINCE	VARCHAR(100),
    HEIGHT	VARCHAR(50),
    HEIGHT_CM	FLOAT,
    BIWEIGHTRTH_DATE INT NULL,
    SHOOTSCATCHES	VARCHAR(100)
)
;

DROP TABLE IF EXISTS "NHL_PREDICTION"."DATA_LAKE"."TEAM_INFO";
CREATE TABLE "NHL_PREDICTION"."DATA_LAKE"."TEAM_INFO" (
    TEAM_ID	INT NOT NULL,
    FRANCHISEID	INT NULL,
    SHORTNAME VARCHAR(100),
    TEAMNAME VARCHAR(100),
    ABBREVIATION VARCHAR(100),
    LINK VARCHAR(100),
)
;





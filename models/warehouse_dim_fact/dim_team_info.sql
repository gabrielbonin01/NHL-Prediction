with staging_warehouse as (
    select 
        TEAM_ID,
        FRANCHISEID,
        SHORTNAME,
        TEAMNAME,
        ABBREVIATION,
        current_timestamp() as ingestion_timestamp
    from {{ ref('stg_team_info') }}              
)

select *
from staging_warehouse

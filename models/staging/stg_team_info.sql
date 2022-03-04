with source_datalake as (
    select 
        TEAM_ID,
        FRANCHISEID,
        SHORTNAME,
        TEAMNAME,
        ABBREVIATION,
        current_timestamp() as ingestion_timestamp
    from {{ source('DATALAKE', 'TEAM_INFO') }}              
)

select *
from source_datalake

with staging_warehouse as (
        select 
        game_id,
        official_name,
        OFFICIAL_TYPE,
        current_timestamp() as ingestion_timestamp
    from  {{ ref('stg_game_officials') }}   
)

select *
from staging_warehouse
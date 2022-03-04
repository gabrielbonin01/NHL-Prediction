with source_datalake as (
        select 
        game_id,
        official_name,
        OFFICIAL_TYPE,
        current_timestamp() as ingestion_timestamp
    from {{ source('DATALAKE', 'GAME_OFFICIALS') }}
)

select *
from source_datalake
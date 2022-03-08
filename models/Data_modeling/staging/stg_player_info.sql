with source_staging as (
    select 
        PLAYER_ID,
        FIRST_NAME,
        LAST_NAME,
        NATIONALITY,
        BIRTH_CITY,
        PRIMARY_POSITION,
        BIRTH_DATE,
        BIRTHSTATEPROVINCE,
        HEIGHT,
        HEIGHT_CM,
        BIWEIGHTRTH_DATE,
        SHOOTSCATCHES,
        current_timestamp() as ingestion_timestamp
    from {{ source('DATALAKE', 'PLAYER_INFO') }}              
)

select *
from source_staging

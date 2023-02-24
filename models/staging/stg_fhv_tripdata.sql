{{ config(materialized='view') }}

select 
    dispatching_base_num as dispatching_base_num,
    pickup_datetime	as pickup_datetime,
    dropOff_datetime as dropoff_datetime,	
    PUlocationID as pu_location_id,
    DOlocationID as do_location_id,		
    SR_Flag	as sr_flag,
    Affiliated_base_number as affiliated_base_number
from {{ source('staging', 'fhv_tripdata') }}

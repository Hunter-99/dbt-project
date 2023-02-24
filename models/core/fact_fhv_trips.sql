{{ config(materialized="table") }}

with 
    dim_zones as (select * from {{ ref("dim_zones") }} where borough != 'Unknown'),
    fhv_tripdata as (select * from {{ ref('stg_fhv_tripdata') }})

select 
    fhv_tripdata.dispatching_base_num as dispatching_base_num,
    fhv_tripdata.pickup_datetime	as pickup_datetime,
    fhv_tripdata.dropoff_datetime as dropoff_datetime,	
    pickup_zone.zone as pickup_zone,
    dropoff_zone.zone as dropoff_zone,
    fhv_tripdata.sr_flag as sr_flag,
    fhv_tripdata.affiliated_base_number as affiliated_base_number
from fhv_tripdata
inner join
    dim_zones as pickup_zone on fhv_tripdata.pu_location_id = pickup_zone.locationid
inner join
    dim_zones as dropoff_zone on fhv_tripdata.do_location_id = pickup_zone.locationid
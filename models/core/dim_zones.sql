{{ config(materialized='table') }}

select 
    LocationID as locationid,
    Borough as borough,
    Zone as zone,
    replace(Zone, 'Boro', 'Green') as service_zone
from {{ ref('taxi_zone_lookup') }}

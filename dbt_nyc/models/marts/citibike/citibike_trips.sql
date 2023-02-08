with

trips as (

    select * from {{ ref('stg_citibike__trips') }}

),

stations as (

    select * from {{ ref('stg_citibike__stations') }}

),

joined as (

    select
        trips.*,
        start_stations.num_bikes_available as start_station_num_bikes_available,
        end_stations.num_bikes_available as end_station_num_bikes_available,
    
    from trips
    
    left join stations as start_stations on start_stations.station_id = trips.start_station_id
    
    left join stations as end_stations on end_stations.station_id = trips.end_station_id

)

select * from joined
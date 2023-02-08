with 

source as (

    select * from {{ source('citibike', 'citibike_trips') }}

),

renamed as (

    select
        -- ids
        {{ dbt_utils.generate_surrogate_key(['bikeid', 'starttime', 'stoptime']) }} as trip_id,
        bikeid as bike_id,
        cast(start_station_id as string) as start_station_id,
        cast(end_station_id as string) as end_station_id,
        
        -- numeric
        tripduration as trip_duration,
        birth_year,

        -- text
        start_station_name,
        end_station_name,
        usertype as user_type,
        gender,
        customer_plan,
        
        -- geom
        start_station_latitude,
        start_station_longitude,
        end_station_latitude,
        end_station_longitude,

        -- datetimes
        starttime as start_time,
        stoptime as stop_time

    from source

)

select * from renamed
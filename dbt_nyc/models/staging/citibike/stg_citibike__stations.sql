with

source as (

    select * from {{ source('citibike', 'citibike_stations') }}

),

renamed as (

    select
        station_id,
        name,
        short_name,
        latitude,
        longitude,
        region_id,
        rental_methods,
        capacity,
        eightd_has_key_dispenser,
        num_bikes_available,
        num_bikes_disabled,
        num_docks_available,
        num_docks_disabled,
        is_installed,
        is_renting,
        is_returning,
        eightd_has_available_keys,
        last_reported,

    from source

)

select * from renamed
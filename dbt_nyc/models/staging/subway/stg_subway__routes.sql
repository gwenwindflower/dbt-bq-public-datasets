with

source as (
    
    select * from {{ source('subway', 'routes') }}

),

renamed as (

    select 
        route_id,
        route_short_name,
        route_long_name,
        route_describe as description,
        route_type,

    from source

)

select * from renamed
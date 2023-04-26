with orange_quality_feature as (
    select
        distinct 
        quality,
        ph,
        residual_sugar,
        fixed_acidity,
        vitamin_c,
        density,
        chlorides,
        citric_acid,
        octyl_acetate,
        type,
        enzymes,
        sulphates,
        total_sulfur_dioxide,
        1 / pow(10, ph) as h_concentration,
        log(citric_acid / residual_sugar) as acidity_ratio
    from 
        {{ ref('dim_orange_quality') }}
)

select 
    *
from
    orange_quality_feature
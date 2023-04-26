select
    pk,
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
    total_sulfur_dioxide
from {{ source("apjuice", "orange_quality") }}
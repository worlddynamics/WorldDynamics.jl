_inits = Dict{Symbol,Float64}(
    :LV_PASS20 => 2 * 94.6,
    :LV_PASS40 => 2 * _params[:PASS20_1980],
    :LV_PASS60 => 2 * _params[:PASS40_1980],
)

getinitialisations() = copy(_inits)

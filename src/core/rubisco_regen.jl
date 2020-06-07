abstract type AbstractRubiscoRegen end

"""
    RubiscoRegen(theta, ajq)

Rubisco regeneration model.
"""
@columns struct RubiscoRegen{} <: AbstractRubiscoRegen
    theta::Float64 | 0.4    | _ | (0.0, 1.0) | "Shape parameter of the non-rectangular hyperbola"
    ajq::Float64   | 0.324  | _ | (0.0, 1.0) | "Quantum yield of electron transport"
end

""" 
    rubisco_regeneration(f::RubiscoRegen, v)

RuBP-regen rate, in umol m-2 s-1 
"""
rubisco_regeneration(f::RubiscoRegen, v) = begin
    a = f.theta
    b = -(f.ajq * v.par + v.jmax)
    c = f.ajq * v.par * v.jmax
    j = quad(Lower(), a, b, c) # Actual e- transport rate, umol m-2 s-1
    return j / 4
end

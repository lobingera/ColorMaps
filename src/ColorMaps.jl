module ColorMaps

access_dict = Dict()

defaultN = 64

include("named_maps.jl")
include("data_only_maps.jl")
include("cubehelix.jl")
include("construct_from_string.jl")


# 1) from sequence of colors 
# 1a) array of colors
# 1b) string of colors

# 2) by name

include("api_sets.jl")

end # module

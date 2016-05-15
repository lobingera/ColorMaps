include("mpl_colormaps.jl")

function mpl_conv(cm_data)
  N = size(cm_data,1)
  colormap = Array(RGB{Float64},N)
  for i in 1:N
    colormap[i] = RGB{Float64}(cm_data[i,:]...)
  end
  colormap
end

# macro might help here
mpl_inferno() = mpl_conv(inferno_data)
access_dict["inferno"] = mpl_inferno

mpl_viridis() = mpl_conv(viridis_data)
access_dict["viridis"] = mpl_viridis

mpl_magma() = mpl_conv(magma_data)
access_dict["magma"] = mpl_magma

mpl_plasma() = mpl_conv(plasma_data)
access_dict["plasma"] = mpl_plasma
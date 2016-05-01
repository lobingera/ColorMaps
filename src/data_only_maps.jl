include("mpl_colormaps.jl")

function mpl_conv(cm_data)
  N = size(cm_data,1)
  colormap = Array(RGB{Float64},N)
  for i in 1:N
    colormap[i] = RGB{Float64}(cm_data[i,:]...)
  end
  colormap
end
using Grid

function perlin_linearinterp(r::Array{Float64,2},m::Int,n::Int)

	# assuming a y,x array/matrix
	s = size(r);

	xc = 1:1:s[2];
	yc = 1:1:s[1];

	zr = CoordInterpGrid((yc,xc), r, BCnil, InterpLinear);

	zr[linspace(1,s[1],m),linspace(1,s[2],n)];
end

function perlin_noise(m::Int,n::Int)
	r = rand(m,n);

	size_series = [48,24,12,6,3];
	power_series = [1.0,0.5,0.25,0.125,0.0625];

	z = zeros(size(r));

	for k=1:length(size_series)
		z0 = perlin_linearinterp(
			r[1:round(Int,(m/size_series[k])),
			1:round(Int,(n/size_series[k]))],
			m,n);
		z = z + (z0 * power_series[k]);
	end
	z
end

#using Winston
#z = perlin_noise(300,300);
#imagesc(z,(minimum(z),maximum(z)));


# julia> z1 = map((x) -> clamp(x,0.5,0.9),z);
# julia> imagesc(z1,(minimum(z1),maximum(z1)))




#

function jet(N::Integer)
	cm = RGB{Float64}[
	    RGB(
	        clamp(min(4x - 1.5, -4x + 4.5) ,0.0,1.0),
	        clamp(min(4x - 0.5, -4x + 3.5) ,0.0,1.0),
	        clamp(min(4x + 0.5, -4x + 2.5) ,0.0,1.0))  
	    for x in linspace(0.0,1.0,N)]
	end

jet() = jet(64);

access_dict["jet"] = jet


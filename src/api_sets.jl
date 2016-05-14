

function colormap(name::AbstractString)
	if haskey(access_dict,name)
		return access_dict[name]()
	else
		# could be color sequence name string
		return construct_from_string(name)
	end

end

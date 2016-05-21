using Gtk
using Compose
using Cairo

function cm_in_context(cm)
	n = length(cm)
	r = Compose.rectangle(linspace(0,1-(1/n),n),0.1*ones(n),ones(n)*(1.1/(n)),0.8*ones(n));
	c = Compose.compose(context(),r,fill(cm));
	c
	end

function cm_in_window(cm)
	co = cm_in_context(cm);
	c = Gtk.@GtkCanvas(400,300);
	w = Gtk.@GtkWindow(c,"data win");
	show(c);

	Gtk.draw(c) do widget
    	Compose.draw(CAIROSURFACE(c.back),co)
    	end
	c
	end

function map_from_colormap(cm,z::Array{Float64,2})
     z1 = z .- minimum(z);
     z2 = round(Int,max(ceil(z1  * (length(cm) / maximum(z1))),1));
    
     display(minimum(z2));
     display(maximum(z2));
     
     c = similar(z,UInt32);

     for i1 in eachindex(z2)
     	c1 = convert(ColorTypes.RGB24,cm[z2[i1]]);
     	c[i1] = c1.color
     	end
    c 	
end

function cm_perlin_window(cm)
	z = perlin_noise(120,120);
	p = map_from_colormap(cm,z);
    imgsurf = Cairo.CairoRGBSurface(p)
    imgpatt = Cairo.CairoPattern(imgsurf)
    Cairo.pattern_set_filter(imgpatt, Cairo.FILTER_NEAREST)

	c = Gtk.@GtkCanvas(160,160);
	w = Gtk.@GtkWindow(c,"data win");
	show(c);

	Gtk.draw(c) do widget
		cr = Cairo.CairoContext(c.back)
		r = Gtk.allocation(c)
		iwidth = Float64(r.width)-20.0;
		iheight = Float64(r.height)-20.0;
		Cairo.rectangle(cr,20.0,20.0,iwidth,iheight)

    	imgmatrix = Cairo.CairoMatrix(120.0/iwidth, 0, 0, 120.0/iheight, 0, 0)
    	Cairo.set_matrix(imgpatt, imgmatrix)

	    Cairo.set_source(cr, imgpatt)
    	Cairo.fill(cr)
    	end
    c
    end






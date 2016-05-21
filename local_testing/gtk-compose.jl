using Gtk
using Cairo
using Compose

function cm_in_context(cm)
	n = length(cm)
	r = rectangle(linspace(0,1-(1/n),n),0.1*ones(n),ones(n)*(1.1/(n)),0.8*ones(n));
	c = compose(context(),r,fill(cm));
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
		Cairo.rectangle(cr,20.0,20.0,180.0,180.0)

    #imgmatrix = Cairo.CairoMatrix(imgsurf.width/w, 0, 0, imgsurf.height/h, 0, 0)
    #Cairo.set_matrix(imgpatt, imgmatrix)

    
    # Translate to draw position and draw
    #Cairo.translate(img.ctx, x, y)
    #Cairo.set_source(img.ctx, imgpatt)
    #Cairo.fill(img.ctx)

	    Cairo.set_source(cr, imgpatt)
    	Cairo.fill(cr)
    	end
    c
    end






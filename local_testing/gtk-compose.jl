using Gtk
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


	
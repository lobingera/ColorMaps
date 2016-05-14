# ColorMaps

prototype for collecting color map generation and application

API ideas:
==========
Overall entrypoint is colormap.
colormap(name) -> colormap with implicit length (with N == reasonably long)

colormap(name,N) -> colormap with N entries

colormap(N,name) -> see above

colormap(N,String) -> use String with colornames to construct a linear interpolation


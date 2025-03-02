using Pkg
Pkg.activate(".")
Pkg.add("TranscodingStreams")
using TranscodingStreams
using EzXML

undirected = """
<?xml version="1.0" encoding="UTF-8"?>
<graphml>
	<graph edgedefault="undirected">
		<node id="n0"/>
		<node id="n1"/>
		<edge source="n0" target="n1"/>
	</graph>
</graphml>
"""

reader = EzXML.StreamReader(NoopStream(IOBuffer(undirected)))

GC.gc()
GC.gc()
GC.gc()

while (item = iterate(reader)) != nothing
	@show reader.type, reader.name
end

close(reader)

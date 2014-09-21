#----------------------------
#  Graph class
#
#  API: 
#  new(n),
#  addEdge(v,w),  
#  adj(v): return  iterable of all  adjacent vertices
#  num_verts,
#  num_edges,
#  to_s
#----------------------------

class Graph
  def initialize(n)
    @graph = Array.new(n) {Array.new}
    #create empty graph with n vertices
    #Data structure is an  "vertex-indexed  array  of iterables(arrays)"
  end

  def add_edge(v,w)
    #
    @graph[v] << w
    @graph[w] <<  v
    return "#{v} -- #{w}"
  end

  def  [](i)
    @graph[i]
  end

  def adj(v)
    #return iterable  containing all  adjacent edges
    @graph[v]
  end

  def num_verts
    @graph.size
  end

  def num_edges
    edges =  0
    @graph.each do |vert|
      edges += vert.size
    end
    edges/2
  end

end

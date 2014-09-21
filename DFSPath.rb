require './graph.rb'

class DFSPath
  def  initialize(g, s)
    @marked = Array.new(g.num_verts, false)
    @edge_to = Array.new(g.num_verts)
    @g = g
    @s = s
    dfs(g,s)
  end


  def has_path_to?(w)
    @marked[w]
  end

  def  path_to(v)
    if !has_path_to?(v)
      nil
    else
      path  = []
      curr =  v
      while curr  != @s
        path << curr
        curr  =  @edge_to[curr]
      end
      path  << @s
    end
  end

  private
  def dfs(g,v)
    @marked[v] = true
    @g.adj(v).each do |w|
      if !@marked[w]
        dfs(g,w)
        @edge_to[w] = v
      end
    end
  end
end

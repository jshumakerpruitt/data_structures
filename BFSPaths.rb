require './graph.rb'

class  BFSPaths
  def  initialize(g,s)
    @g = g
    @s = s
    size =  g.num_verts
    @edge_to  = Array.new(size)
    @dist_to  = Array.new(size)
    @marked  = Array.new(size)

    bfs(@g,@s)
  end


  def  has_path_to?(w)
    @marked[w]
  end

  private
  def  bfs(g,s)
    q =  []  << s
    dist  =  0
    @marked[s] = true
    @dist_to[s]  =  dist

    while !q.empty?
      curr = q.shift
      g.adj(curr).each do |neighbor|
        if !@marked[neighbor]
          q.push(neighbor)
          @marked[neighbor]  = true
          @dist_to[neighbor] = @dist_to[curr] + 1
          @edge_to[neighbor]  =   curr
        end
      end
    end
  end
end      

      
      
    

class BST
  #should MIXIN enumerable

  def initialze
    @root = nil
  end
  
  class Node
    def initialize(key, val, count)
      @key = key
      @val = val
      @right = nil
      @left = nil
      @count = count
    end
    attr_accessor :key, :right, :left, :count, :val
  end

  def size(node=@root)
    if(node.nil?)
      return 0
    else
      return node.count
    end
  end

  def put(key, val)
    @root = self.add(key, val, @root)
  end
    
  def add(key, val, node)
    if (node.nil?)
      return Node.new(key, val, 1)
    end
    if (key < node.key)
      node.left = self.add(key, val, node.left)
    elsif (key > node.key)
      node.right = self.add(key, val, node.right)
    else
      node.val = val
    end
    node.count = self.size(node.left) + self.size(node.right) + 1
    return node
  end

  def get(key, node=@root)
    if (node.nil?)
      return nil
    elsif(key == node.key)
      return node.val
    elsif(key < node.key)
      return  self.get(key, node.left)
    else
      return self.get(key, node.right)
    end
  end

  def min()
    minNode(@root).key
  end

  def minNode(node=@root)
    if node.left.nil?
      return node
    else
      return self.minNode(node.left)
    end
  end

  def max()
    maxNode(@root).key
  end 

  def maxNode(node=@root)
    if node.right.nil?
      return node
    else
      return self.maxNode(node.right)
    end
  end

  def rank(key, node=@root)
    if(node.nil?)
      return 0
    elsif (key > node.key)
      return 1 + self.size(node.left) + self.rank(key, node.right)
    elsif(key < node.key)
      return self.rank(key, node.left)
    else
      return self.size(node.left)
    end
  end

  def select(n)
    selectNode(n, @root).key
  end

  def selectNode(n, node=@root)
    #return key of node s.t. self.rank(node.key, node) == n
    if node.nil?
      return nil
    else 
      t = self.size(node.left)
      if t > n 
        return self.selectNode(n, node.left)
      elsif t < n
        return self.selectNode(n-t-1, node.right)
      else
        return node
      end 
    end
  end

  def floor(key, node=@root)
    if node.nil?
      return nil
    elsif key < node.key
      #look in left subtree
      #floor MUST be in left
      floor(key, node.left)
    elsif key > node.key
      #key COULD be in right subtree
      #but only if there is a key less than given key
      rightFloor = floor(key, node.right)
      if rightFloor.nil?
        return node.key
      else
        return rightFloor
      end
    else
      return node.key
    end
  end


  def ceiling(key, node=@root)
    #return the smallest key greater than given key
    if node.nil?
      return nil
    elsif node.key < key
      return ceiling(key, node.right)
    elsif node.key > key
      #key might be in left subtree or might be key at current root
      candidate = ceiling(key, node.left)
      if candidate.nil?
        return node.key
      else
        return candidate
      end
    else
      return node.key
    end
  end

  def delHelper()
    @root = deleteMin(@root)
  end

  def deleteMin(node=@root)
    if (node.left.nil?)
      return node.right
    end
    node.left = self.deleteMin(node.left)
    node.count = self.size(node.left) + self.size(node.right) + 1
    return node
  end
  
  def deleteMax(node=@root)
    if (node.right.nil?)
      return node.left
    end
    node.right = self.deleteMax(node.right)
    node.count = self.size(node.left) + self.size(node.right) + 1
    return node
  end
  
  def delHelper2(key)
    @root = delete(key, @root)
  end

  def delete(key, node=@root)
    if(node.nil?)
      return nil
    end
    if key < node.key
      node.left = self.delete(key, node.left)
    elsif key > node.key
      node.right = self.delete(key, node.right)
    else
      if node.right.nil?
        return node.left 
      end
      if node.left.nil?
        return node.right 
      end
      temp = node
      node = minNode(temp.right)
      node.right = self.deleteMin(temp.right)
      node.left = temp.left
    end
    node.count  = self.size(node.left) + self.size(node.right) + 1
    return node
  end

  attr_accessor :root
end

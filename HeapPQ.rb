class HeapPQ
  def initialize(a = [])
    @a = [nil].concat a
  end

  def swim(i)
    while (i > 1 and (@a[i] > @a[i/2]))
      @a[i], @a[i/2] = @a[i/2], @a[i]
      i = i/2
    end
  end
  
  def sink(k)
    sz = self.size
    while 2*k <= sz
      j = 2*k
      if (j < sz and @a[j] < @a[j + 1]) 
        j += 1
      end
      if @a[k] > @a[j] 
        break 
      end
      @a[k], @a[j] = @a[j], @a[k]
      k = j
    end
  end

  def size
    @a.length - 1
  end

  def max
    @a[1]
  end

  def delMax
    @a[1], @a[self.size] = @a[self.size], @a[1]
    res = @a.pop
    self.sink(1)
    return res
  end
  
  def insert(val)
    @a.push val
    self.swim(self.size)
  end

  attr_accessor :a
end


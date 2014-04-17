class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end
  
  def purge
    @head = nil
    @tail = nil
  end

  def empty?
    @head.nil?
  end

  def first
    raise ContainerEmpty if @head.nil?
    @head.datum
  end

  def last
    raise ContainerEmpty if @tail.nil?
    @tail.datum
  end

  attr_accessor :head, :tail
  
  def prepend(item)
    tmp = Element.new(self, item, @head)
    @tail = tmp if @head.nil?
    @head = tmp
  end

  def append(item)
    tmp = Element.new(self, item, nil)
    if @head.nil?
      @head = tmp
    else
      @tail.succ = tmp
    end
    @tail = tmp
  end

  def push(item)
    self.prepend(item)
  end

  def pop
    tmp = @head.datum
    @head = @head.succ
    return tmp
  end

  def contains?(val)
    if @head.nil?
      return false
    else
      curr = @head      
      while(curr.datum != val)
        curr = curr.succ   
        return false if curr.nil?
      end
      return true
    end
  end
  
  def remove(val)
    curr = @head
    if curr.nil?
      return false
    elsif curr.datum == val && @head == @tail
      self.purge
      return true
    elsif curr.datum == val
      @head = curr.succ
      return true
    else
      while(!curr.nil?)
        if curr.succ.datum == val
          curr.succ = curr.succ.succ
          if curr.succ == @tail
            @tail = curr
          end
          return true
        end
      end
      return false 
    end
  end

  def delete(val)
    if @head.nil?
      return false
    elsif @head.datum == val
      if @head == @tail
        self.purge
        return true
      else
        @head = @head.succ
        return true
      end
    else
      curr = @head
      while(!curr.succ.nil? && curr.succ.datum != val)
        curr = curr.succ
      end
      if curr.succ.nil?
        return false
      else
        if curr.succ = @tail
          @tail = curr
          return true
        else
          curr.succ = curr.succ.succ
          return true
        end
      end
    end
  end

  def dequeue
    tmp = @tail.datum
    curr = @head
    while(curr.succ != @tail)
      curr = curr.succ
    end
    curr.succ = nil
    @tail = curr
    return tmp
  end

  def enqueue(item)
    self.prepend(item)
  end

  class Element
    def initialize(list, datum, succ)
      @list = list
      @succ = succ
      @datum = datum
    end
    attr_accessor :datum, :succ
  end
end

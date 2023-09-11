class Node
  attr_accessor :value, :next_node

  def initialize(value)
    @value = value
    @next_node = nil
  end
end

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(value)
    new_node = Node.new(value)
    if !@head
      @head = new_node
    else
      current_node = @head
      while current_node.next_node
        current_node = current_node.next_node
      end
      current_node.next_node = new_node
    end
  end

  def prepend(value)
    new_node = Node.new(value)
    if !@head
      @head = new_node
    else
      new_node.next_node = @head
      @head = new_node
    end
  end

  def size
    return 0 if !@head
    current_node = @head
    count = 1
    while current_node.next_node
      current_node = current_node.next_node
      count += 1
    end
    count
  end

  def head
    @head
  end

  def tail
    return nil if !@head
    current_node = @head
    while current_node.next_node
      current_node = current_node.next_node
    end
    current_node
  end

  def at(index)
    return nil if !@head
    current_node = @head
    index.times do
      current_node = current_node.next_node
    end
    current_node
  end

  def pop
    return nil if !@head
    current_node = @head
    while current_node.next_node.next_node
      current_node = current_node.next_node
    end
    current_node.next_node = nil
  end

  def contains?(value)
    return false if !@head
    current_node = @head
    while current_node.next_node
      return true if current_node.value == value
      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    return nil if !@head
    current_node = @head
    index = 0
    while current_node.next_node
      return index if current_node.value == value
      current_node = current_node.next_node
      index += 1
    end
    nil
  end

  def to_s
    return nil if !@head
    current_node = @head
    while current_node.next_node
      print "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    print "( #{current_node.value} ) -> nil"
  end

  def insert_at(value, index)
    return nil if !@head
    new_node = Node.new(value)
    current_node = @head
    (index - 1).times do
      current_node = current_node.next_node
    end
    new_node.next_node = current_node.next_node
    current_node.next_node = new_node
  end

  def remove_at(index)
    return nil if !@head
    current_node = @head
    (index - 1).times do
      current_node = current_node.next_node
    end
    current_node.next_node = current_node.next_node.next_node
  end
end

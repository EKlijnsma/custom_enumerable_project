module Enumerable

end

class Array
  def my_each(&block)
    for element in self
      block.call(element)
    end
    self
  end

  def my_each_with_index(&block)
    for i in 0..self.length-1
      block.call(self[i], i)
    end
    self
  end

  def my_select(&block)
    result = []
    for element in self
      result.push(element) if block.call(element)
    end
    result
  end

  def my_all?(&block)
    for element in self
      return false unless block.call(element)
    end
    true
  end
  
  def my_any?(&block)
    for element in self
      return true if block.call(element)
    end
    false
  end
  
  def my_none?(&block)
    !self.my_any?(&block)
  end
    
  def my_count(&block)
    counter = 0
    if block_given?
      for element in self
        counter += 1 if block.call(element)
      end
      return counter
    end
    self.length
  end
    
  def my_map
    result = []
    for element in self
      block_given? ? result.push(yield(element)) : result.push(element)
    end
    result
  end
  
  def my_inject(value)
    for element in self
      value = yield(value, element)
    end
    value
  end
end
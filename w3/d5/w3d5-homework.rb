class Stack
    attr_reader :stack
    def initialize(stack)
      @stack = stack
    end
  
    def push(el)
      stack << el
    end
  
    def pop
      removed = @stack.pop
    end
  
    def peek
      @stack.last
    end
end

# p test_stack = Stack.new([1,2,3]) #is this a stack?
# p test_stack.push(5)
# p test_stack.pop
# p test_stack.peek

class Queue
    attr_reader :queue
    def initialize(queue)
        @queue = queue
    end

    def enqueue(ele)
        queue.unshift(ele)
    end

    def dequeue
        queue.pop
    end

    def peek
        queue.last
    end
end
# p queue = Queue.new(["cat", "dog", "horse"])
# p queue.enqueue("mouse")
# p queue.peek
# p queue.dequeue
# p queue

class Map
    attr_reader :pairs
    def initialize(k_arr, v_arr)
        pairs = []
        (0...k_arr.length).each do |i|
            pair = [k_arr.shift, v_arr.shift]
            pairs << pair
        end
        pairs
        @pairs = pairs
    end

    def set(key, val)
        if pairs.any? {|pair| pair[0] == key}
            pairs.each do |pair|
                pair[1] = val if pair[0] == key
            end

        else
            pairs << [key,val]
        end
    end

    def get(key)
        pairs.each do |pair|
            return pair[1] if pair[0] == key
        end

    end

    def delete(key)
        target = 0
        (0...pairs.length).each do |i|

            if pairs[i][0] == key
                target = i
            end
        end
        pairs.delete_at(target)
    end

    def show
        p pairs #is this it? not sure what to show
    end
end

keys = [:a, :b, :c]
vals = [1, 2, 3]
map = Map.new(keys, vals)
p map.delete(:b)
p map
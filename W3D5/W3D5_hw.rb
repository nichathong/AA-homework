class Stack
    def initialize
      @stack = []
    end

    def stack
        @stack
    end

    def push(num)
        @stack.push(num)  
    end

    def pop
        @stack.pop(num)
      
    end

    def peek
      return @stack.pop
    end
end

class Queue
    
    def initialize
        @array = []
    end

    def enqueue(ele)
        @array << ele
    end


    def dequeue
        @array.pop(ele)
    end

    def peek
        @array.each { |ele| p ele }
    end

    attr_reader :array
end


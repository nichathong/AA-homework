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
        
    end


    def dequeue
    end

    def peek
    end

    attr_reader :array
end


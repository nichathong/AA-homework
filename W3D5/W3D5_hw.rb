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


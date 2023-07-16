# your code here
class Stack
    def initialize(limit = nil)
        @stack = []
        @limit = limit
    end

    def push(value)
        raise 'Stack Overflow' if full?
        @stack.push(value)
    end

    def pop
        @stack.pop()
    end

    def peek
        @stack.last
    end

    def size 
        @stack.size
    end

    def empty?
        @stack.empty?
    end

    def full?
        @limit && @stack.size == @limit
    end

    def search(value)
        index = @stack.index(value)
        index ? @stack.size - index - 1 : -1
    end
end
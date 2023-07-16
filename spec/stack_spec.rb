describe Stack do
  let(:stack) { Stack.new }

  describe '.new' do
    it 'can be initialized to an empty stack' do
      expect(stack.instance_variable_get(:@stack)).to eq([])
    end
  end

  describe '#push' do
    it 'adds the given element to the top of the stack' do
      stack.push(4)
      expect(stack.instance_variable_get(:@stack)).to eq([4])
    end
  end

  describe '#pop' do
    it 'removes the element at the top of the stack and returns it' do
      stack.push(1)
      stack.push(2)
      stack.push(3)

      expect(stack.pop).to eq(3)
      expect(stack.instance_variable_get(:@stack)).to eq([1, 2])
    end
  end

  describe '#peek' do
    it 'returns the element at the top of the stack without removing it' do
      stack.push(1)
      stack.push(2)
      stack.push(3)

      expect(stack.peek).to eq(3)
      expect(stack.instance_variable_get(:@stack)).to eq([1, 2, 3])
    end
  end

  # BONUS! Uncomment for an extra challenge.
  describe 'Bonus methods ⭐️' do
    describe '.new with optional limit' do
      it 'can be initialized with an optional limit attribute' do
        stack = Stack.new(5)
        expect(stack.instance_variable_get(:@limit)).to eq(5)
      end
    end

    describe '.push with limit' do
      let(:stack) do
        stack = Stack.new(3)
        stack.push(1)
        stack.push(2)
        stack
      end

      it 'adds the given element to the top of the stack if the stack is not full' do
        stack.push(3)
        expect(stack.instance_variable_get(:@stack)).to eq([1, 2, 3])
      end

      it 'throws an exception if the stack is full' do
        stack.push(3)
        expect { stack.push(4) }.to raise_error('Stack Overflow')
      end
    end

    describe '#size' do
      it 'returns the number of elements in the stack' do
        stack = Stack.new

        stack.push(1)
        stack.push(2)
        stack.push(3)
        expect(stack.size).to eq(3)
      end
    end

    describe '#empty?' do
      it 'returns true if the stack is empty' do
        stack = Stack.new
        expect(stack.empty?).to eq(true)
      end

      it 'returns false if the stack is not empty' do
        stack = Stack.new
        stack.push(10)
        expect(stack.empty?).to eq(false)
      end
    end

    describe '#full?' do
      let(:stack) do
        stack = Stack.new(3)

        stack.push(1)
        stack.push(2)
        stack
      end

      it 'returns true if the stack is full' do
        stack.push(3)
        expect(stack.full?).to eq(true)
      end
      it 'returns false if the stack is not full' do
        expect(stack.full?).to eq(false)
      end
    end

    describe '#search' do
      let(:stack) do
        stack = Stack.new(5)

        stack.push(1)
        stack.push(2)
        stack.push(3)
        stack.push(4)
        stack.push(5)
        stack
      end

      it 'returns the distance between the top of the stack and the target element' do
        expect(stack.search(5)).to eq(0)
        expect(stack.search(4)).to eq(1)
        expect(stack.search(1)).to eq(4)
      end

      it 'returns -1 when the target is not in the stack' do
        expect(stack.search(7)).to eq(-1)
      end
    end
  end
end

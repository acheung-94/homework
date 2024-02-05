class BadCache
  attr_reader :array, :max
  def initialize(n)
    @array = []
    @max = n
  end

  def count
    array.length
  end

  def add(item)
    case count
      when max
        array.include?(item) ? reorder(item) : clear_add(item)
      else
        array.include?(item) ? reorder(item) : array.push(item)
    end
  end

  def show
    p array
  end

  private

  def reorder(item)
    i = array.index(item)
    array.delete_at(i)
    array.push(item)
  end

  def clear_add(item)
    array.delete(array.first)
    array.push(item)
  end
end

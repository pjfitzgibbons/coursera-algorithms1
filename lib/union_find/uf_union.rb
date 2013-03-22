class UFUnion

  attr_accessor :array, :count

  def initialize(len)
    @array = (0..len-1).to_a
    @count = len
  end

  def connected(p, q)
    array[p] == array[q]
  end

  def to_s
    @uf.array.join(' ')
  end

  def union(p, q)
    # all array : value = a[p]
    p = p.to_i
    q = q.to_i
    return if array[p] == array[q]

    array.each_with_index do |v, i|
      if v == array[p]
        array[i] = array[q]
      end
    end
  end


end


if __FILE__ == $0
  len = $stdin.readline.to_i
  uf = UFUnion.new(len)
  while (!$stdin.eof? && pair = $stdin.readline)
    p, q = pair.split.map(&:to_i)
    unless uf.connected(p, q)
      uf.union(p, q)
      puts "#{p} #{q}"
    end
  end
  puts " #{uf.count} components"
end



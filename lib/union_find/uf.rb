class UF

  attr_accessor :array

  def initialize(len)
        @array = (0..len-1).to_a
  end

  def to_s
    @uf.array.join(' ')
  end

  def connected(p,q)
    array[p] == array[q]
  end

  def union(p, q)
    # all array : value = a[p]
    p = p.to_i
    q = q.to_i
    array.each_with_index do |v, i|
      if v == array[p]
        array[i] = array[q]
      end
    end
  end


end

if __FILE__ == $0
  len = $stdin.readline.to_i
  uf = UF.new(len)
  while (!$stdin.eof? && pair = $stdin.readline)
    p, q = pair.split.map(&:to_i)
    unless uf.connected(p, q)
      uf.union(p, q)
      puts "#{p} #{q}"
    end
  end
  puts " #{uf.count} components"
end

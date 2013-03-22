#!/usr/bin/env ruby

# Union-Find with Weighted Union and Path Compression
class UFWeighted

  attr_accessor :array, :count, :size

  def initialize(len)
    @array = (0..len-1).to_a
    @size = [1] * len
    @count = len
  end

  def to_s
    @uf.array.join(' ')
  end

  def root(id)
    if array[id] == id
      root_id = id
    else
      root_id = root(array[id])
      array[id] = root_id if array[id] != root_id

    end
    root_id
  end

  def connected(p, q)
    root(p) == root(q)
  end

  def union(p, q)
    root_p = root(p)
    root_q = root(q)

    return if root_p == root_q

    if size[root_p] < size[root_q]
      array[root_p] = root_q
      size[root_q] += size[root_p]
    else
      array[root_q] = root_p
      size[root_p] += size[root_q]
    end
    @count -= 1
  end


end


if __FILE__ == $0
  len = $stdin.readline.to_i
  uf = UFWeighted.new(len)
  while (!$stdin.eof? && pair = $stdin.readline)
    p, q = pair.split.map(&:to_i)
    unless uf.connected(p, q)
      uf.union(p, q)
      puts "#{p} #{q}"
    end
  end
  puts " #{uf.count} components"
end




class UF

  attr_accessor :array

  def initialize(filename = nil)
    if filename
      File.open(filename) do |f|
        length_s = f.readline
        length = length_s.to_i
        @array = (0..length-1).to_a

        connections = f.readlines.map(&:split)

        connections.each do |p, q|
          union(p, q)
        end
      end
    else
      @array = (0..9).to_a
    end
  end

  def to_s
    @uf.array.join(' ')
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
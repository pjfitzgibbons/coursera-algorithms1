require 'ch1-quickfind/uf'

class UFRunner

  def initialize(filename)
    File.open(filename) do |f|
      length_s = f.readline
      length = length_s.to_i
      @uf = UF.new(length)

      connections = f.readlines.map(&:split)

      connections.each do |p,q|
        @uf.union(p,q)
      end
    end
  end
  def to_s
    @uf.array.join(' ')
  end
end

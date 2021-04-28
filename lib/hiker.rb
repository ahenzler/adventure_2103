class Hiker
  attr_reader :name, :experience_level, :snacks, :parks_visited

  def initialize(name, experience_level)
    @name = name
    @experience_level = experience_level
    @snacks = {}
    @parks_visited = []
  end

  def pack(item, count)
    if @snacks[item].nil?
      @snacks[item] = count
    else
      @snacks[item] += count
    end
  end

  def visit(park)
    @parks_visited << park
  end

  def possible_trails
    @parks_visited.flat_map do |park|
      park.trails.map do |trail|
        trail
      end
    end
  end

  def favorite_snack
    snack = @snacks.max_by do |snack, count|
      count
    end
    snack[0]
  end
end
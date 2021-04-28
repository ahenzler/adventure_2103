class Park
  attr_reader :name, :trails

  def initialize(name)
    @name = name
    @trails = []
  end

  def add_trail(trail)
    @trails << trail
  end

  def trails_shorter_than(num)
    @trails.find_all do |trail|
      trail.length < num
    end
  end

  def hikeable_miles
    @trails.flat_map do |trail|
      trail.length
    end.sum
  end
end
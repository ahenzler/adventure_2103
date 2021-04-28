class Trail
  attr_reader :name, :length, :level

  def initialize(info)
    @name = info[:name]
    @length = info[:length].to_f
    @level = info[:level]
  end
end
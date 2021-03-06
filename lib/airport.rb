require_relative "plane.rb"
require_relative "weather.rb"

class Airport
  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane, todays_weather)
    raise "It's too dangerous to land!" if todays_weather >= 8
    raise "This plane has already landed!" if plane.status == :landed
    raise "The airport is full!" if full?
    @planes << plane
    plane.land
  end

  def take_off(plane, todays_weather)
    raise "It's too dangerous to take off!" if todays_weather >= 8
    raise "This plane is already flying!" if plane.status == :flying
    raise "This plane is in a different airport!" unless @planes.include?(plane)
    @planes.delete(plane)
  end

  def full?
    @planes.count >= @capacity
  end
end

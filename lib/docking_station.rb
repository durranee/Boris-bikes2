require_relative 'bike'
class DockingStation
  attr_reader :bikes
  DEFAULT_CAPACITY = 20
  def initialize (capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "Staaaahp! there is no bike" if empty?
    fail "Sorry, bike broken" unless @bikes.last.working
    @bikes.pop
  end

  def dock_bike(bike)
    raise "there is no space" if full?
    bike.working ? @bikes.push(bike) : @bikes.insert(0,bike)
  end

private
  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end
end

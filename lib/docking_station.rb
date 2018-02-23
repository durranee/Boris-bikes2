require_relative 'bike'
class DockingStation
  attr_reader :bikes
  #DEFAULT_LIMIT = 20
  def initialize#(limit = DEFAULT_LIMIT)
    @bikes = []
    @capacity = 20
    #limit.times { dock_bike(Bike.new)}
  end

  def release_bike
    raise "Staaaahp! there is no bike" if empty?
    @bikes.pop
  end

  def dock_bike(bike)
    raise "there is no space" if full?
    @bikes.push(bike)
     #@bike = bike
  end

private
  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end
end

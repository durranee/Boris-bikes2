require_relative 'bike'
require_relative 'garage'

# Docking Station class
class DockingStation
  attr_reader :bikes
  DEFAULT_CAPACITY = 20

  # Initialising DockingStation object with 20 bikes unless instructed otherwise
  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  # release_bike method releases bike and raise errors if there isn't any bikes
  # or there aren't any working bikes
  def release_bike
    raise 'Staaaahp! there is no bike' if empty?
    fail 'Sorry, no working bikes available' unless @bikes.last.working
    @bikes.pop
  end

  # dock_bikes allows docking of bikes and if bike is broken then pushes it as
  # the first bike in the array
  def dock_bike(bike)
    raise 'there is no space' if full?
    bike.working ? @bikes.push(bike) : @bikes.insert(0, bike)
  end

  # send broken bikes to garage
  def send_bikes_to_garage; end

  # private methods full? and empty? to check if bike docking station
  # is full or empty

  private

  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end
end

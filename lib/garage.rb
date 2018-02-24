# Garage class
class Garage
  # attr_accessor :bikes_to_fix
  def initialize
    @broken_bikes = []
    @fixed_bikes = []
  end

  #stack broken bikes in @bikes_to_fix
  def store_bikes(broken_bikes)
    @bikes_to_fix = broken_bikes
  end

  # fix broken bikes
  def fix_bike(bike)
    bike.working = true
    bike
  end

  # Send bikes back to docking station after fixing
  def send_fixed_bikes_to_docking_station(); end
end

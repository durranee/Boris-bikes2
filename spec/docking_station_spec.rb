require 'docking_station'

describe DockingStation do
  before (:each) do
    ds = DockingStation.new
    @bike = Bike.new

  end
  # it 'responds to release_bike' do
  #   expect(subject).to respond_to :release_bike
  # end
  it { should respond_to(:release_bike)}


  it { should respond_to(:dock_bike) }
  it { should respond_to(:dock_bike).with(1).arguments }

  it 'checks if dock_bike actually takes a bike' do
    bike = Bike.new
    #bike = subject.release_bike
    expect(subject.dock_bike(bike).last).to eq(bike)
  end


  it 'release_bike should raise an error if docking station empty' do
    ds = DockingStation.new
    #20.times {ds.release_bike}
    expect { ds.release_bike }.to raise_error "Staaaahp! there is no bike"
  end

  it 'dock_bike should raise an error if its full' do
    # it starts with 20 so subject is fine
    20.times { subject.dock_bike(Bike.new) }
    # no more bikes can be docked so raise error
    expect { subject.dock_bike(@bike)}.to raise_error "there is no space"
  end
end

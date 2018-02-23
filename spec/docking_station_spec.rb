require 'docking_station'

describe DockingStation do
  before (:each) do
    ds = DockingStation.new
    # @fake_bike = double
    # allow(@fake_bike).to receive(:working).and_return(true)
    @fake_bike = double("fake_bike", :working => true)
  end

  it { should respond_to(:release_bike)}
  it { should respond_to(:dock_bike) }
  it { should respond_to(:dock_bike).with(1).arguments }

  it 'checks if dock_bike actually takes a bike' do
    expect(subject.dock_bike(@fake_bike).last).to eq(@fake_bike)
  end


  it 'release_bike should raise an error if docking station empty' do
    expect { subject.release_bike }.to raise_error "Staaaahp! there is no bike"
  end

  it 'dock_bike should raise an error if more than DEFAULT_CAPACITY' do
    # it starts with 20 so subject is fine
    DockingStation::DEFAULT_CAPACITY.times do
      subject.dock_bike(@fake_bike)
    end
    # no more bikes can be docked so raise error
    expect { subject.dock_bike(@fake_bike)}.to raise_error "there is no space"

  end

  it 'dock_bike should raise an error if its full' do
    ds = DockingStation.new(50)
    # it starts with 20 so subject is fine
    50.times { ds.dock_bike(@fake_bike) }
    # no more bikes can be docked so raise error
    expect { ds.dock_bike(@fake_bike)}.to raise_error "there is no space"
  end

  it "doesn't release a bike if it is broken" do
    ds = DockingStation.new
    # broken fake bike scenario set up, one method called working returns false
    @broken_fake_bike = double("broken_bike", :working => false)
    ds.dock_bike(@broken_fake_bike)
    expect { ds.release_bike }.to raise_error "Sorry, bike broken"
  end


end

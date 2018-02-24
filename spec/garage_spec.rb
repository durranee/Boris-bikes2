require 'bike'
require 'garage'

describe Garage do
  it { should respond_to(:fix_bike) }
  it { should respond_to(:fix_bike).with(1).arguments }

  # # creating fake bike object with double (broken bike)
  # before(:each) do
  #   @broken_fake_bike = double :broken_fake_bike, working: false
  # end

  # it 'should fix the bike that we send to fix_bike method in garage' do
  #   expect(subject.dock_bike(@fake_bike).last).to eq(@fake_bike)
  # end

  it 'should fix the bike that we send to fix_bike method in garage' do
    broken_bike = Bike.new
    broken_bike.working = false #break the bike
    expect(subject.fix_bike(broken_bike).working).to eq(true) # checking if returned bike is fixed
  end

  # it 'should fix the bike that we send to fix_bike method in garage' do
  #   broken_bike = double :broken_bike, working: false
  #   working_bike = subject.fix_bike(broken_bike)
  #   expect(working_bike.working).to eq(true)
  # end

  # it 'creates a fake object with string and then trying to change it' do
  #   fake_obj = double :fake_obj, var: "just a string"
  #   fake_obj = double var: "another string"
  #   expect(fake_obj.var).to eq("another string")
  # end
end

# attr_accessor :bikes_to_fix
#
# def initialize
#   @bikes_to_fix = []
# end
#
# def fix_bike(bike)
#   bike.working = true
# end

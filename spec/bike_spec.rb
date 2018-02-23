require 'bike'
describe Bike do
  it { should respond_to(:working) }

  it 'should verify that new bikes are working' do
    expect(Bike.new.working).to eq true
  end

end

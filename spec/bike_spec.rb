require 'bike'
describe Bike do
  it { should respond_to(:working?) }

    it { expect(subject.working?).to be(true) }

end

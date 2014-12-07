require 'spec_helper'

RSpec.describe Meeting, :type => :model do
  let(:meeting) { build_stubbed(:meeting) }

  it "has a valid factory" do
    expect(meeting).to be_valid
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:date) }
  end
end

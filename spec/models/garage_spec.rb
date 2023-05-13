require "rails_helper"

RSpec.describe Garage, type: :model do
  it { should have_many :cars }

  describe "#created" do
    it "displays when garage was created" do
      garage_1 = Garage.create!(name: "Fester's",
                                city: "Indianapolis",
                                open_to_public: false,
                                max_capacity: 6)
      expect(garage_1.created).to eq(garage_1.created_at)
    end
  end
end
require "rails_helper"

RSpec.describe Garage, type: :model do
  it { should have_many :cars }

  describe "#created" do
    it "displays when garage was created" do
      garage_1 = Garage.create!(name: "Fester's",
                                city: "Indianapolis",
                                open_to_public: false,
                                max_capacity: 6,
                                created_at: Date.today - 1)
      garage_2 = Garage.create!(name: "Golden's",
                                city: "Zionsville",
                                open_to_public: true,
                                max_capacity: 8)

      expect(Garage.order_by_created).to eq([garage_2, garage_1])
    end
  end
end
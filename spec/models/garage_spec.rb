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

    it "shows the count of cars in a garage" do
      garage_1 = Garage.create!(name: "Fester's",
                                city: "Indianapolis",
                                open_to_public: false,
                                max_capacity: 6,
                                created_at: Date.today - 1)
      garage_2 = Garage.create!(name: "Golden's",
                                city: "Zionsville",
                                open_to_public: true,
                                max_capacity: 8)
      car1 = garage_1.cars.create!(make: "Honda", model: "Civic", year: 2019, electric: false)
      car2 = garage_1.cars.create!(make: "Tesla", model: "Model S", year: 2020, electric: true)

      expect(garage_1.cars_count).to eq(2)
      expect(garage_2.cars_count).to eq(0)
    end
  end
end
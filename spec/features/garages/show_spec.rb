require "rails_helper"

RSpec.describe "garages show page" do
  it "shows the garage name" do
    garage_1 = Garage.create!(name: "Fester's",
                              city: "Indianapolis",
                              open_to_public: false,
                              max_capacity: 6)
    garage_2 = Garage.create!(name: "Golden's",
                              city: "Zionsville",
                              open_to_public: true,
                              max_capacity: 8)
    visit "/garages/#{garage_1.id}"
    expect(page).to have_content(garage_1.name)
    expect(page).to have_content(garage_1.city)
    expect(page).to have_content(garage_1.open_to_public)
    expect(page).to have_content(garage_1.max_capacity)

    expect(page).to_not have_content(garage_2.name)
    expect(page).to_not have_content(garage_2.city)
    expect(page).to_not have_content(garage_2.open_to_public)
    expect(page).to_not have_content(garage_2.max_capacity)
  end

  it "shows count of cars on garage show page" do
    garage_1 = Garage.create!(name: "Fester's",
                              city: "Indianapolis",
                              open_to_public: false,
                              max_capacity: 6)
    garage_2 = Garage.create!(name: "Golden's",
                              city: "Zionsville",
                              open_to_public: true,
                              max_capacity: 8)
    car1 = garage_1.cars.create!(make: "Honda", model: "Civic", year: 2019, electric: false)
    car2 = garage_1.cars.create!(make: "Tesla", model: "Model S", year: 2020, electric: true)
    visit "/garages/#{garage_1.id}"
    save_and_open_page
    expect(page).to have_content("Number of Cars: 2")
  end
end
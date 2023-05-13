require "rails_helper"

RSpec.describe "garages cars index page" do
  it "shows all the cars in each garage" do
    garage = Garage.create!(name: "Fester's",
                            city: "Indianapolis",
                            open_to_public: false,
                            max_capacity: 6)
    car1 = garage.cars.create!(make: "Honda", model: "Civic", year: 2019, electric: false)
    car2 = garage.cars.create!(make: "Tesla", model: "Model S", year: 2020, electric: true)
    visit "/garages/#{garage.id}/cars"

    expect(page).to have_content(car1.make)
    expect(page).to have_content(car1.model)
    expect(page).to have_content(car1.year)
    expect(page).to have_content(car1.electric)
    expect(page).to have_content(car2.make)
    expect(page).to have_content(car2.model)
    expect(page).to have_content(car2.year)
    expect(page).to have_content(car2.electric)
  end
end
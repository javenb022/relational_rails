require "rails_helper"
# User Story 3
# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes
# (data from each column that is on the child table)
RSpec.describe "cars index page" do
  it "can see all the cars" do
    garage = Garage.create!(name: "Fester's",
                              city: "Indianapolis",
                              open_to_public: false,
                              max_capacity: 6)
                              # require 'pry'; binding.pry
    car1 = garage.cars.create!(make: "Honda", model: "Civic", year: 2019, electric: false)
    car2 = garage.cars.create!(make: "Tesla", model: "Model S", year: 2020, electric: true)

    visit "/cars"
    expect(page).to have_content(car1.make)
    expect(page).to have_content(car1.model)
    expect(page).to have_content(car1.year)
    expect(page).to have_content(car1.electric)
    expect(page).to have_content(car2.make)
    expect(page).to have_content(car2.model)
    expect(page).to have_content(car2.year)
    expect(page).to have_content(car2.electric)
  end
  # User Story 4, Child Show

  # As a visitor
  # When I visit '/child_table_name/:id'
  # Then I see the child with that id including the child's attributes
  # (data from each column that is on the child table)

  describe "cars show" do
    it "links to each cars show page" do
      garage = Garage.create!(name: "Fester's",
                              city: "Indianapolis",
                              open_to_public: false,
                              max_capacity: 6)

      car1 = garage.cars.create!(make: "Honda", model: "Civic", year: 2019, electric: false)
      car2 = garage.cars.create!(make: "Tesla", model: "Model S", year: 2020, electric: true)
      visit "/cars/#{car1.id}"

      expect(page).to have_content(car1.make)
      expect(page).to have_content(car1.model)
      expect(page).to have_content(car1.year)
      expect(page).to have_content(car1.electric)

      expect(page).to_not have_content(car2.make)
      expect(page).to_not have_content(car2.model)
      expect(page).to_not have_content(car2.year)
      expect(page).to_not have_content(car2.electric)
    end
  end
end
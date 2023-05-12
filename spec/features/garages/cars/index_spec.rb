require "rails_helper"
# User Story 5, Parent Children Index
# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes
# (data from each column that is on the child table)
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
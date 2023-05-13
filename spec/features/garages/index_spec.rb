require "rails_helper"

RSpec.describe "garages index page", type: :feature do
  it "can see the name of each garage" do
    garage_1 = Garage.create!(name: "Fester's",
                              city: "Indianapolis",
                              open_to_public: false,
                              max_capacity: 6)
    garage_2 = Garage.create!(name: "Golden's",
                              city: "Zionsville",
                              open_to_public: true,
                              max_capacity: 8)
    visit "/garages"

    expect(page).to have_content(garage_1.name)
    expect(page).to have_content(garage_2.name)
  end
#   User Story 6, Parent Index sorted by Most Recently Created

# As a visitor
# When I visit the parent index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created
  it "sorts garages by most recently created" do
    garage_1 = Garage.create!(name: "Fester's",
                              city: "Indianapolis",
                              open_to_public: false,
                              max_capacity: 6)
    garage_2 = Garage.create!(name: "Golden's",
                              city: "Zionsville",
                              open_to_public: true,
                              max_capacity: 8)
    visit "/garages"

    expect(garage_2.name).to appear_before(garage_1.name)
  end
end
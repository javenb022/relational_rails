require "rails_helper"

RSpec.describe "garages show page" do
  it "shows the garage name" do
    garage_1 = Garage.create!(name: "Fester's",
                              city: "Indianapolis",
                              open_to_public: false,
                              max_capacity: 6)
    garage_2 = Garage.create!(name: "Golden's",
                              city: "Zionsville",
                              open_to_public: false,
                              max_capacity: 8)
    visit "/garages/#{garage_1.id}"
    expect(page).to have_content(garage_1.name)
    expect(page).to_not have_content(garage_2.name)
  end

  it "shows the garage city"

  it "says if the garage is open to the public"

  it "shows the max capacity of the garage"

end
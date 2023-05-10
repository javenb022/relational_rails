require "rails_helper"

RSpec.describe "garages index page", type: :feature do
  it "can see the name of each garage" do
    garage_1 = Garage.create!(name: "Fester's",
                              city: "Indianapolis",
                              open_to_public: false,
                              max_capacity: 6)
    garage_2 = Garage.create!(name: "Golden's",
                              city: "Zionsville",
                              open_to_public: false,
                              max_capacity: 8)
    visit "/garages"
    save_and_open_page
    expect(page).to have_content(garage_1.name)
    expect(page).to have_content(garage_2.name)
  end
end
require "rails_helper"

RSpec.describe "creates new car" do
  it "creates a new car" do
    garage_1 = Garage.create!(name: "Fester's",
                              city: "Indianapolis",
                              open_to_public: false,
                              max_capacity: 6)
    visit "/garages/#{garage_1.id}/cars/new"
    expect(current_path).to eq("/garages/#{garage_1.id}/cars/new")

    # fill_in("Name", with: "Prince")
    fill_in("Make", with: "Tesla")
    fill_in("Model", with: "S")
    check
    fill_in("Year", with: "2021")
    click_button("Create Car")

    expect(current_path).to eq("/garages/#{garage_1.id}/cars")
    save_and_open_page
    expect(page).to have_content("Tesla")
    expect(page).to have_content("S")
    expect(page).to have_content(true)
    expect(page).to have_content("2021")
  end
end
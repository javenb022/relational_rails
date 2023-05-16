require "rails_helper"

RSpec.describe "garage edit form" do
  it "displays form to edit a record" do
    garage_1 = Garage.create!(name: "Fester's",
                              city: "Indianapolis",
                              open_to_public: false,
                              max_capacity: 6)
    visit "/garages/#{garage_1.id}/edit"

    fill_in :name, with: "Dave's"
    fill_in("City", with: "San Francisco")
    check(:open_to_public)
    fill_in :max_capacity, with: "6"
    click_button("Update Garage")

    expect(current_path).to eq("/garages/#{garage_1.id}")
    expect(page).to have_content("Dave's")
    expect(page).to have_content("San Francisco")
    expect(page).to have_content(true)
    expect(page).to have_content("6")

  end
end
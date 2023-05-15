require "rails_helper"

RSpec.describe "New Garage" do
  describe "as a visitor" do
    describe "when I visit a new garage form by clicking on a link on the index" do
      it "can create a new garage" do
        visit "/garages"

        click_link "New Garage"

        expect(current_path).to eq("/garages/new")

        fill_in 'Name', with: "Maurice's"
        fill_in 'City', with: "Lebanon"
        uncheck
        fill_in 'Max Capacity', with: 9
        click_on "Create Garage"

        expect(current_path).to eq("/garages")
        expect(page).to have_content("Maurice's")
      end
    end
  end
end
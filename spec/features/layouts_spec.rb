require "rails_helper"

RSpec.describe "cars index link" do
  describe "as a visitor" do
    it "shows a link to cars index page on top of every page" do
      visit "/garages"
      expect(page).to have_link("Cars")
    end

    it "shows a link to garages index page on top of every page" do
      visit "/cars"
      expect(page).to have_link("Garages")
    end
  end
end
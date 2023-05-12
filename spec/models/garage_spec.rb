require "rails_helper"

RSpec.describe Garage, type: :model do
  it { should have_many :cars }

end
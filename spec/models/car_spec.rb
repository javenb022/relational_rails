require "rails_helper"

RSpec.describe Car, type: :model do
  it { should belong_to :garage }
end
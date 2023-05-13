class Garage < ApplicationRecord
  has_many :cars

  def created
    self.created_at
  end
end
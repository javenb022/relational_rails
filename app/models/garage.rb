class Garage < ApplicationRecord
  has_many :cars

  def self.order_by_created
    order(created_at: :desc)
  end

  def cars_count
    cars.count
  end
end
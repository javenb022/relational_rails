class CreateGarages < ActiveRecord::Migration[7.0]
  def change
    create_table :garages do |t|
      t.string :name
      t.string :city
      t.boolean :open_to_public
      t.integer :max_capacity

      t.timestamps
    end
  end
end

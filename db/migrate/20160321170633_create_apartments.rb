class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.string :street_address
      t.string :city
      t.integer :postal
      t.string :state
      t.string :country
      t.string :name
      t.string :phone_number
      t.string :opens_at
      t.string :closes_at
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end

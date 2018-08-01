class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :maxTemp
      t.string :minTemp
      t.string :temp
      t.string :wind_spd
      t.string :pop
      t.string :datetime
      t.string :rh
      t.string :country_code
      t.string :state_code

      t.timestamps
    end
  end
end

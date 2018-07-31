class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :maxTemp
      t.string :minTemp

      t.timestamps
    end
  end
end

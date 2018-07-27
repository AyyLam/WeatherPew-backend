class CreateForecasts < ActiveRecord::Migration[5.2]
  def change
    create_table :forecasts do |t|
      t.integer :temp
      t.integer :wind
      t.integer :temp_min
      t.integer :temp_max

      t.timestamps
    end
  end
end

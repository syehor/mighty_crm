class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.references :user, :null => false
      t.references :car_model, :null => false
      t.string :number
      t.string :color
      t.string :fuel
      t.date :year
      t.float :engine_size

      t.timestamps
    end

    add_index :cars, [:user_id, :car_model_id]
  end
end

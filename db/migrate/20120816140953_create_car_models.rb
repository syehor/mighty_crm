class CreateCarModels < ActiveRecord::Migration
  def change
    create_table :car_models do |t|
      t.string :name
      t.references :brand, :null => false

      t.timestamps
    end

    add_index :car_models, :brand_id
  end
end

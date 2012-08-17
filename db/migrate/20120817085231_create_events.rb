class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :start_date
      t.date :end_date
      t.integer :status
      t.references :user
      t.references :car
      t.integer :created_by
      t.integer :assigned_to

      t.timestamps
    end
    add_index :events, [:user_id, :car_id]
    add_index :events, [:assigned_to, :created_by]
  end
end

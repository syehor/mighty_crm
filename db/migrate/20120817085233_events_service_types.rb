class EventsServiceTypes < ActiveRecord::Migration
  def change
    create_table :events_service_types, :id => false do |t|
      t.references :event
      t.references :service_type
    end
    add_index :events_service_types, [:event_id, :service_type_id]
  end
end

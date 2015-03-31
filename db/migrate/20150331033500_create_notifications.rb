class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :receiver_id
      t.string :trigger_id
      t.string :status_type
      t.boolean :is_read

      t.timestamps null: false
    end
  end
end

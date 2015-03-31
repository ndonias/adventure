class CreateStatusMessages < ActiveRecord::Migration
  def change
    create_table :status_messages do |t|
      t.string :user_id
      t.string :category
      t.string :body
      
      t.timestamps
    end
  end
end

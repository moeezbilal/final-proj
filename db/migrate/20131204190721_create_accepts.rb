class CreateAccepts < ActiveRecord::Migration
  def change
    create_table :accepts do |t|
      t.integer :user_id
      t.integer :friend
      t.integer :status

      t.timestamps
    end
  end
end

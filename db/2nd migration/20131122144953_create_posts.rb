class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :userid
      t.string :text
      t.integer :status

      t.timestamps
    end
  end
end

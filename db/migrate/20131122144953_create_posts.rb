class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :text
      t.integer :status
      t.string :image
      t.string :url

      t.timestamps
    end
  end
end

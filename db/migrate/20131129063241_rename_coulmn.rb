class RenameCoulmn < ActiveRecord::Migration
  def up
  	rename_column :likes, :postid, :post_id
  end

  def down
  	rename_column :likes, :post_id,:postid
  end
end

class ChangeStatusInNotifications < ActiveRecord::Migration
  def up
change_column :notifications, :status, :integer
  end

  def down
change_column :notifications, :status, :boolean
  end
end

class Change_statusInExperience < ActiveRecord::Migration
 def up
 	    change_column :experiences, :status, :integer

end
def down
    # This might cause trouble if you have strings longer
    # than 255 characters.
        change_column :experiences, :status, :string

end
end

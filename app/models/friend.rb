class Friend < ActiveRecord::Base

belongs_to :user

validates_uniqueness_of :friend, :scope => [:friend, :email]   #chnage

end

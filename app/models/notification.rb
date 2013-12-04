class Notification < ActiveRecord::Base

belongs_to :user

validates_uniqueness_of :sender, :scope => [:sender, :receiver]   #chnage


#chnage sender and receiver to int from varchar

end

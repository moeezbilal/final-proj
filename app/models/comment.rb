class Comment < ActiveRecord::Base

belongs_to :post

belongs_to :user  #change

validates_uniqueness_of :commenterid, :scope => [:commenterid, :comment]
end

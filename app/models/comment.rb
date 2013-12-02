class Comment < ActiveRecord::Base

belongs_to :post

validates_uniqueness_of :commenterid, :scope => [:commenterid, :comment]
end

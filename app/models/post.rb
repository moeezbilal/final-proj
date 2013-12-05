class Post < ActiveRecord::Base

has_many :comments  
has_many :likes

belongs_to :user

validates_uniqueness_of :text, :scope => [:user_id, :text]   #chnage

  mount_uploader :image , ImageUploader

end

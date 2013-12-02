class Experience < ActiveRecord::Base
  belongs_to :user
  attr_accessible :country,:job_title,:company_name,:zip_code,:status
end

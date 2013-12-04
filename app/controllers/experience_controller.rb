class ExperienceController < ApplicationController
layout "empty" 
before_filter :authenticate_user! ,:user_signed_in?
def new
@experience=Experience.new
end

def create
@e=Experience.new()
@e.zip_code=params[:zip_code]
@e.company_name=params[:company]
@e.country=params[:countrycode]
@e.job_title=params[:job]
@e.school=params[:school]
@e.status=params[:statuschooser]
@e.user_id=current_user.id
@e.save!
# redirect_to :root

render "../experience/2of8.html"
end

def imageloader
	 
render "../experience/picture_upload.html", :layout => 'application'



end
    

def imageloader2
@e=User.new(params[:user])
current_user.image=@e.image
current_user.save!

redirect_to "/search/index"
end






def step2

	email=params[:email]
	password=params[:password]
 @imported_contacts = Contacts.new(:gmail, email, password).contacts	
 render :partial => "contacts", :locals => { :imported_contacts => @imported_contacts } 
end

end


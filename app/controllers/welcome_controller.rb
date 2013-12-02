class WelcomeController < ApplicationController
  def index
  	@posts	=	User.all
  end

end

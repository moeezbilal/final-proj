class HomeController < ApplicationController
  def index

  end

  def secure
  end

  def agreement
  	render layout:false;
  end

  def countylist
  	render layout:false;
  end

  def whatislinkedin
  	render layout:false;
  end



def test

   respond_to do |format|

format.html{ render action: "secure"}
end
  
end







end

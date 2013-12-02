	class SearchController < ApplicationController
before_filter :authenticate_user! ,:user_signed_in?

	layout "user_home"

	  def index 

		# @id='aamir.nu@gmail.com' #logged in user's id
		@id1=current_user.email
		@user=User.find(:all, :conditions => ["email = ?",@id1])


	  	@posts=Post.find(:all, :conditions => ["userid = ? OR status= ?",@id1 ,2])


	@friends=Friend.find(:all, :conditions =>["email = ?",@id1])

		

		
		@friends.each do |friend|  
		
		@posts=@posts+Post.find(:all, :conditions => ["userid = ? AND status = ?", friend.friend,3])

		end




		@posts=@posts.sort { |x, y| y <=> x }
		
	  end


	def search_results

		@id1=current_user.email

		@user=User.find(:all, :conditions => ["email = ?",@id1])

	# @users=User.all
	 @users=User.find(:all,:conditions => ["email Like ? ",'%'+params[:search]+'%'])

	@count=@users.count

	@name=params[:search]	

	end

	def add_friend

	@my_id=current_user.email
	@friend=params[:id]

	@friend=Friend.new(:email => @my_id , :friend => @friend)
	@friend1=Friend.new(:email => params[:id], :friend => @my_id)



	if @friend.save && @friend1.save
		
		render "index"
	end


	end


	def connect

	@idd=params[:id]

	@user=User.find(params[:id])

	@sender=current_user.email

	 @notify=Notification.new(:sender => @sender, :receiver => @user.email ,:status => 1, :user_id => @user.id)

	  if @notify.save

	redirect_to :action=>'index' 

end


	end


	def friend_requests

	@my_id=current_user.email

	@requests=Notification.find(:all,:conditions => ["receiver = ? AND status = ?",@my_id,1])



	render "requests"

	end

	def addPost

		@id=current_user.email

	@post=Post.new(:userid=>@id , :text => params[:postText], :status => params[:share])  # status 1 means public

@e=Post.new(params[:post])
@post.image=@e.image

	 # respond_to do |format|  
      # if @post.save  

      # 	format.html { redirect_to @post, notice: 'User was successfully created.' }
      # format.js   {}
      # format.json { render json: @post, status: :created, location: @post }
      #   # format.html { redirect_to(@post, :notice => 'Post created.') }  
      #   # format.js  { render json: @user }

      #    end  
      #   end  

		if @post.save

			redirect_to :action=>'index'

		end

	end


	def addComment
	
	if params[:commentText].length > 0

		@id=current_user.email

		@comment=Comment.new(:commenterid=>@id , :comment => params[:commentText], :post_id => params[:parent_id]) 

		if @comment.save 

			redirect_to :action=>'index'
		else
			redirect_to :action=>'index'
		
		end

	else

	redirect_to :action=>'index' 

			
	end
end

	def like

		@id=current_user.email

	@like=Like.new(:post_id=> params[:id] , :userid => 1)  # status 1 means public

		if @like.save

			redirect_to :action=>'index'
	else
		redirect_to :action=>'index'


		end

	end

def advanceSearch

	@id1=current_user.email

		@user=User.find(:all, :conditions => ["email = ?",@id1])

 @users=User.find(:all,:conditions => ["email Like ? ",'%aa%'])

	@count=@users.count


	render 'search_results'


end


def showFriends

@id=current_user.email

@user=User.find(:all, :conditions => ["email = ?",@id])

@user2=@user


  @user.each do |user| 

   user.friends.each do |friend| 
	
	@user=@user+User.find(:all, :conditions => ["email = ?",friend.friend])
	    
  end 


  end 


end





def findAlumini

@id=current_user.email

@user=User.find(:all, :conditions => ["email = ?",@id])  #for notifications



@users=User.find(:all)


end











end

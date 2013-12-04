	class SearchController < ApplicationController
before_filter :authenticate_user! ,:user_signed_in?

	layout "user_home"

	 	  def index 

# do change  userid to user_id in post and make it integer



		# @id='aamir.nu@gmail.com' #logged in user's id
		@id1=current_user.email
		@user=User.find(:all, :conditions => ["email = ?",@id1])


	  	@posts=Post.find(:all, :conditions => ["user_id = ? OR status= ?",current_user.id ,2])  #change


	@friends=Friend.find(:all, :conditions =>["email = ?",current_user.email])  # change

		

		
		@friends.each do |friend|  
		
		@posts=@posts+Post.find(:all, :conditions => ["user_id = ? AND status = ?", friend.friend,3])


		end


		@posts=@posts.sort { |x, y| y <=> x }
		@notifications=Notification.find(:all,:conditions=>["user_id = ? AND status= ? ",current_user.id,1])
	  end




def search_results

		@id1=current_user.email

		@user=User.find(:all, :conditions => ["email = ?",@id1])

	# @users=User.all
	 @users=User.find(:all,:conditions => ["first_name Like ? ",'%'+params[:search]+'%'])

	 @allfriends=@user

	 # change

	 current_user.friends.each do |friend|
	@allfriends=@allfriends+ User.find(:all, :conditions => ["email = ?", friend.friend]) 	
	end
	# change




	 @users=@users-@user-@allfriends

	@count=@users.count

	@name=params[:search]	

	end




	
	def add_friend

	
	@friendid=User.find(params[:id])

	@friend=Friend.new(:email => current_user.email , :friend => @friendid.id ,:user_id=> current_user.id)
	@friend1=Friend.new(:email => @friendid.email, :friend => current_user.id, :user_id => @friendid.id)



	if @friend.save && @friend1.save

		@update=Notification.find(:all,:conditions => ["sender = ? AND receiver = ?",params[:id], current_user.id] )

		@update.each do |notification|

			notification.status=0

		notification.save
		
		end

		redirect_to :action=>'index'

	else 

		redirect_to :action=>'index'  #throw any error u want

	end



	end



	def connect

	@idd=params[:id]

	@user=User.find(params[:id])

	@sender=current_user.email

	#change

	 @notify=Notification.new(:sender => current_user.id, :receiver => params[:id] ,:status => 1, :user_id => params[:id])

	  if @notify.save

	redirect_to :action=>'index' 

end


	end

	def friend_requests
		
		#change

		@notifications=Notification.find(:all , :conditions => ["user_id = ? AND status = ?",current_user.id,1])
@temp

if @notifications && @notifications.size>0
	render "requests"
else
	redirect_to :action=>'index'  # needed to chnge so request cannot come to this point
end
	

	end





	def addPost

		@id=current_user.email

	@post=Post.new(:user_id=>current_user.id , :text => params[:postText], :status => params[:share])  # status 1 means public

@e=Post.new(params[:post])
@post.image=@e.image
@post.url=params[:weburl]
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

		#chnage below line
		@comment=Comment.new(:commenterid=>@id , :comment => params[:commentText], :post_id => params[:parent_id] ,:user_id => current_user.id ) 

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

	@like=Like.new(:post_id=> params[:id] , :userid => current_user.id)  

		if @like.save

			redirect_to :action=>'index'
	else
		redirect_to :action=>'index'


		end

	end

def advanceSearch

	@id1=current_user.email
	@user=User.find(:all, :conditions => ["email = ?",@id1])

	
	@user2=@user

	@users=@user

	if  params[:email].length > 0
	@users=@users+User.find(:all, :conditions => ["email Like ?",'%'+params[:email]+'%'])
	end

	if params[:last].length > 0
	@users=@users+User.find(:all, :conditions => ["last_name Like ?",'%'+params[:last]+'%'])
	end

	if params[:first].length > 0
	@users=@users+User.find(:all, :conditions => ["first_name Like ?",'%'+params[:first]+'%'])
	end


	# if params[:first].length > 0
	# @users=@users+User.find(:all, :conditions => ["first_name Like ?",params[:first]])
	# end

	# if params[:first].length > 0
	# @users=@users+User.find(:all, :conditions => ["first_name Like ?",params[:first]])
	# end

	# if params[:first].length > 0
	# @users=@users+User.find(:all, :conditions => ["first_name Like ?",params[:first]])
	# end

	@users=@users-@user2

	@count=@users.count


	render 'search_results'


end


def showFriends

@id=current_user.email

@user=User.find(:all, :conditions => ["email = ?",@id])

@user2=@user


  @user.each do |user| 

   user.friends.each do |friend| 
	
	@user=@user+User.find(:all, :conditions => ["id = ?",friend.friend])
	    
  end 


  @user=@user -@user2


  end 


end





def findAlumini

@id=current_user.email
@user=User.find(:all, :conditions => ["email = ?",@id])  #for notifications

@myobject=User.find(current_user.id)  #for notifications


if @myobject.experience  &&  @myobject.experience.school
@allusers=User.find(:all)-@user


else
redirect_to :action=>'index'

end





end





def share_post

		@post=Post.find(params[:id])

		@shared=Post.new(:user_id=> current_user.id , :text => @post.text ,:status => @post.status)

		@shared.save
		
		redirect_to :action=>'index'

end








end

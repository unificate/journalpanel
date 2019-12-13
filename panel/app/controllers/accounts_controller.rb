class AccountsController < ApplicationController
  def index
    #make sure the user is an administrator	  
    if user_signed_in?
	unless current_user.role == "admin" #Only admins can access the settings page!
	   redirect_to '/'	    
        end
    end
    #used to populate the index page
    @users = User.order('username')
  end
end

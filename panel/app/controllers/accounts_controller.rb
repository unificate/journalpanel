class AccountsController < ApplicationController
  def index
    #make sure the user is an administrator	  
    if user_signed_in? and current_user.role == "Admin"
      @users = User.order('username') #load the admin panel
    else redirect_to '/'
    end
  end
end

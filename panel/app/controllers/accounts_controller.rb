class AccountsController < ApplicationController
  def index
    #make sure the user is an administrator	  
    @group = Group.all
    if user_signed_in?
    	@groupName = (Group.find_by username: current_user.username).memberOf
        unless @groupName.downcase == "admin" #Only admins can access the settings page!
	   redirect_to '/'	    
        end
    end
    #make sure that the user is signed in
    unless user_signed_in?
         redirect_to '/'
      end
    #used to populate the index page
    @users = User.order('username')
  end
  
  #Create a new user group
  #When creating a new user add them to the correct group
  def createGroup
     @group = params[:buttonvalue] 
     @incommingUsername = params[:username].downcase
     #check that the username is unique
     if(Group.find_by(:username=>@incommingUsername)==nil)
        Group.create(:username=>@incommingUsername, :memberOf=>@group)
     end
   end
end

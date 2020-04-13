class AccountsController < ApplicationController
  def index
    #make sure the user is an administrator
    if user_signed_in? and current_user.role == "Admin"
      @users = User.order('username') #load the admin panel
    else
      redirect_to '/'
    end
  end

  def update
    #make sure the user is an administrator
    if user_signed_in? and current_user.role == "Admin"
      unless params[:user][:username] == current_user.username
        user = User.find_by(username: params[:user][:username])
        user.update(role: params[:user][:role])
      end
    end
  end

  def create
    # Make new variable with input from form
    @user = User.new(user_params)
    if @user.save
        redirect_to '/users'
    end
  end

  def edit
    if user_signed_in? and current_user.role == "Admin"
      user = User.find_by(username: params[:user][:username])
      user.reset_password(params[:user][:password], params[:user][:password])
    end
  end

  def destroy
    if user_signed_in? and current_user.role == "Admin"
      unless params[:user][:username] == current_user.username
        user = User.find_by(username: params[:user][:username])
        user.destroy()
      end
    end
  end

  private

  def user_params
    # # This makes sure you get all data you are asking for and nothing more
    params.require(:user).permit(:username, :password, :role)
  end
end

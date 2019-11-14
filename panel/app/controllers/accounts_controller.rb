class AccountsController < ApplicationController
  def index
    unless user_signed_in?
      redirect_to '/'
    end
    @users = User.order('username')
  end
end

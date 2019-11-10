class AccountsController < ApplicationController
  def index
  	if (user_signed_in? == false) 
		  redirect_to '/'
  	end
  end
  def create
  end
end

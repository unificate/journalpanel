class AccountsController < ApplicationController
  def index
  	unless user_signed_in? 
		  redirect_to '/'
  	end
  end
  def create
  end
end

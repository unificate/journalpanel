class LoginController < ApplicationController
  def index
    if (user_signed_in?)
      redirect_to :microservices
    end
  end
end

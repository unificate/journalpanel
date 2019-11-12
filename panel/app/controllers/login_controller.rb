class LoginController < ApplicationController
  def index
    if (user_signed_in?)
      redirect_to '/list'
    end
  end

  def list
    render body: nil
  end
end

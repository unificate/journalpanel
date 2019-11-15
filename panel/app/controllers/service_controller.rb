class ServiceController < ApplicationController
  def index
    #unless user_signed_in?
    #      redirect_to '/'
    #end

    @microservice = Microservice.find(params[:id])
  end
  def show
    unless user_signed_in?
          redirect_to '/'
    end
    @microservice = Microservice.find(params[:id])
  end
end

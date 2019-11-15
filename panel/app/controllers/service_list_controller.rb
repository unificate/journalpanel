class ServiceListController < ApplicationController
  def index 
      unless user_signed_in?
          redirect_to '/'
      end
      @services = Microservice.order('name')
  end
end

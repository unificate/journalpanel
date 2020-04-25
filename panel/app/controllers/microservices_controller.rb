class MicroservicesController < ApplicationController

  # GET /microservice --- display all microservices
  def index
    unless user_signed_in?
      render403()
    end
    @microservices = Microservice.order('name')
  end
end

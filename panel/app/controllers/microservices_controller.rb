class MicroservicesController < ApplicationController

  # GET /microservice --- display all microservices
  def index
    unless user_signed_in?
      render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
    end
    @microservices = Microservice.order('name')
  end
end

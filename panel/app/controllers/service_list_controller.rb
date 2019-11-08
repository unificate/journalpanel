class ServiceListController < ApplicationController
  def index 
      @services = Microservice.order('name')
  end
end

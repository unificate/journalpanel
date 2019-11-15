class ServiceController < ApplicationController
  def index
    @microservice = Microservice.find(params[:id])
  end
  def show
    @microservice = Microservice.find(params[:id])
  end
end

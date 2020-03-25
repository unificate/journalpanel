require 'net/http'
class ServiceListController < ApplicationController
  def index
      unless user_signed_in?
        redirect_to '/'
      end
      @services = Microservice.order('name')
      @service_names = Microservice.pluck(:name)
      @service_addresses = Microservice.pluck(:address)
  end
end

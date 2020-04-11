class MicroservicesController < ApplicationController
  def index
    unless user_signed_in?
      render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
    end
    @services = Microservice.order('name')
    @service_names = Microservice.pluck(:name)
    @service_addresses = Microservice.pluck(:address)
  end
end

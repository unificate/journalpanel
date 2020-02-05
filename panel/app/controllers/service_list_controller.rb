require 'net/http'
class ServiceListController < ApplicationController
  def index
      unless user_signed_in?
        redirect_to '/'
      end
      @services = Microservice.order('name')
      @service_names = Microservice.pluck(:name)
      @service_addresses = Microservice.pluck(:address)
      @service_schemas = Array.new
      conn = Faraday.new
      #@service_addresses.each do |adr|
      #  if adr != nil and adr != ""
      #      if adr.include? 'http'
      #          @service_schemas.push(conn.get(adr).body)
      #    else
      #      adr = 'http://'+adr
      #      @service_schemas.push(conn.get(adr).body)
      #    end
      #  end
      #end
  end
end

require 'json'
class ServiceController < ApplicationController
  def index
    unless user_signed_in?
          redirect_to '/'
    end
    @schema = nil
    @table_names = nil
    @microservice = Microservice.find(params[:id])
    adr = @microservice.address
    conn = Faraday.new
    if adr != nil and adr != ""
        if adr.include? 'http'
            @schema = JSON.parse(conn.get(adr).body).with_indifferent_access
            @table_names = @schema.keys.select do |el|
                @schema[el] != nil
            end
        else
            adr = 'http://'+adr
            @schema = JSON.parse(conn.get(adr).body).with_indifferent_access
            @table_names = @schema.keys.select do |el|
                @schema[el] != nil
            end
        end
    end
  end
  def show
    unless user_signed_in?
          redirect_to '/'
    end
    @microservice = Microservice.find(params[:id])
  end
end

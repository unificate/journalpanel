require 'json'
class ServiceController < ApplicationController
  def index
    unless user_signed_in?
          redirect_to '/'
    end
    @schema = nil
    @table_names = nil
    @microservice = Microservice.find(params[:id])
    @schema = micro_get_tables(params[:id])
    unless @schema == nil
      @table_names = @schema.keys.select do |el|
        @schema[el] != nil
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

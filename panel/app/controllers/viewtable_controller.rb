class ViewtableController < ApplicationController
  def index
    @service = Microservice.find(params[:id])
    adr = @service.address
    conn = Faraday.new
    @tname = params[:tid] 
    @records = micro_get_rows(params[:id],@tname)
  end
end

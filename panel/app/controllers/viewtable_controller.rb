class ViewtableController < ApplicationController
  def index
    @service = Microservice.find(params[:id])
    adr = @service.address
    conn = Faraday.new
    @tname = params[:tid] 
    if adr != nil and adr != ""
      if adr.include? 'http'
        @records = JSON.parse(conn.get(adr+"/"+@tname).body)
      else
        adr = 'http://'+adr
        @records = JSON.parse(conn.get(adr+"/"+@tname).body)
      end
    else
      @records = {"Bad":"News"}
    end
  end
end

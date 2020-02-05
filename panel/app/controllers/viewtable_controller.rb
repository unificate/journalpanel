class ViewtableController < ApplicationController
  def index
    @records = {"Nothin":"At all"}
    @tname = "Nothing"
  end
  def show
    keys = params[:id].split("_")
    if keys.length() >= 2
        service = Microservice.find(keys[0])
        keys[1] = keys[1..-1].join('_')
        adr = service.address
        conn = Faraday.new
        @tname = keys[1]
        if adr != nil and adr != ""
            if adr.include? 'http'
                @records = JSON.parse(conn.get(adr+"/"+keys[1]).body)
            else
                adr = 'http://'+adr
                @records = JSON.parse(conn.get(adr+"/"+keys[1]).body)
            end
        else
            @records = {"Bad":"News"}
        end
    else
        @records = {"Bad":"News"}
    end
    render :index
  end
end

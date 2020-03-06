class EditpageController < ApplicationController
    def index
        #params, id (microservice id), table (table name), rowid (row id)
        @microservice = Microservice.find(params[:id])
        adr = @microservice.address
        conn = Faraday.new
        if adr != nil and adr != ""
            unless adr.include? 'http'
                adr = 'http://'+adr+'/'+params[:table]+'/'+params[:rowid]
            end
            rec = JSON.parse(conn.get(adr).body).with_indifferent_access
            @fields = rec.keys
            @data = rec.values
        end 
    end
end

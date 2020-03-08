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
            begin
                response = conn.get(adr).body
            rescue Faraday::Error::ConnectionFailed
                response = "{}" 
            end
            @data = JSON.parse(response).with_indifferent_access
        end 
        adr = @microservice.address
        if adr != nil and adr != ""
            unless adr.include? 'http'
                adr = 'http://'+adr
            end
            begin
                response1 = conn.get(adr).body
            rescue Faraday::Error::ConnectionFailed
                response1 = "{'status':'Failed'}" 
            end
            @table_data = ((JSON.parse(response1).with_indifferent_access)[params[:table]])
        end
    end
end

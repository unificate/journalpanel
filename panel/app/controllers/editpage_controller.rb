class EditpageController < ApplicationController
    def index
        #params, id (microservice id), table (table name), rowid (row id)
        @microservice = Microservice.find(params[:id])
        @mid = params[:id]
        @tid = params[:table]
        @rid = params[:rowid]
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
    def submit
        @microservice = Microservice.find(params[:mid])
        adr = @microservice.address
        conn = Faraday.new
        if adr != nil and adr != ""
            unless adr.include? 'http'
                adr = 'http://'+adr+'/'+params[:tid]+'/'+params[:rid]
            end
            begin
                response = conn.get(adr).body
            rescue Faraday::Error::ConnectionFailed
                response = "{}" 
            end
            @data = JSON.parse(response).with_indifferent_access
        end
        new_val = {}
        @data.each do |key,value|
            if( params[:"#{key}"] != @data[key])
                new_val[key] = params[:"#{key}"]
                puts "Different Value "+ params[:"#{key}"]
            end
        end
        puts "TID: "+params[:tid]
        row = RowEntry.find_by(Table_Name: params[:tid], microservice_id: params[:mid], record_id: params[:rid])
        if(row != nil)
            puts "<ROW FOUND>!!!!"
            # Been changed before, check for unexecuted changes.
            changes = Change.find_by(Row_Entry_id: row.id)
            if( changes == nil)
                puts "<CHANGE NOT FOUND>!!!!"
                # Insert new change here, row already exists
                puts "USER ID "+current_user.id.to_s + "ROW ID "+ row.id.to_s
                if(row != nil)
                    Change.create!( Users_id: current_user.id, Row_Entry_id: row.id,old_value: @data.to_json, new_value: new_val.to_json)
                    render html: "success!"
                end
            else
                puts "Change already exists for that record Bad >:I"
                render html: "Change already exists!"
            end 
        else
            # New change, new Row
            row = RowEntry.create!(Table_Name: params[:tid], microservice_id: params[:mid], record_id: params[:rid])
            Change.create!( Users_id: current_user.id, Row_Entry_id: row.id, old_value: @data.to_json, new_value: new_val.to_json)
            render html: "success!"

        end
    end
end
class EditpageController < ApplicationController
    def index
        #params, id (microservice id), table (table name), rowid (row id)
        @microservice = Microservice.find(params[:id])
        @mid = params[:id]
        @tid = params[:table]
        @rid = params[:rowid]
        @data = micro_get_row(@mid,@tid,@rid) 
        @table_data = micro_get_table(@mid,@tid)
    end
    def submit
        @microservice = Microservice.find(params[:mid])
        @data = micro_get_row(params[:mid],params[:tid],params[:rid])
        new_val = {}
        @data.each do |key,value|
            if( params[:"#{key}"] != @data[key])
                new_val[key] = params[:"#{key}"]
                puts "Different Value "+ params[:"#{key}"]
            end
        end
        row = RowEntry.find_by(Table_Name: params[:tid], microservice_id: params[:mid], record_id: params[:rid])
        if(row != nil)
            puts "Row found"
            # Been changed before, check for unexecuted changes.
            changes = row.modifications; 
            if( changes == nil)
                # Insert new change here, row already exists
                puts "CHANGE BEING CREATED"
                Change.create!( Users_id: current_user.id, Row_Entry_id: row.id,old_value: @data.to_json, new_value: new_val.to_json)
                redirect_to url_for(:controller => "viewtable", :action => "index", :id => params[:mid], :tid => params[:tid])
            else
                puts "Change found"+changes.to_json
                redirect_to url_for(:controller => "viewtable", :action => "index", :id => params[:mid], :tid => params[:tid])
            end 
        else
            # New change, new Row
            row = RowEntry.create!(Table_Name: params[:tid], microservice_id: params[:mid], record_id: params[:rid])
            Change.create!( Users_id: current_user.id, Row_Entry_id: row.id, old_value: @data.to_json, new_value: new_val.to_json)
            redirect_to url_for(:controller => "viewtable", :action => "index", :id => params[:mid], :tid => params[:tid])

        end
    end


end

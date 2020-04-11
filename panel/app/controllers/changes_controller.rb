class ChangesController < ApplicationController
  def index
    if user_signed_in? and current_user.role == "Admin"
      @changes = Change.all

      # Get metadata for each change
      @metadata = []
      @changes.each do |change|
        @metadata.push(change.row_entry)
      end

      # Find microservice for each change
      @microservice = []
      @metadata.each do |cmd|
        @microservice.push(cmd.microservice)
      end
    else
      render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
    end
  end

  def new
    #params, id (microservice id), table (table name), rowid (row id)
    @microservice = Microservice.find(params[:id])
    @mid = params[:id]
    @tid = params[:table]
    @rid = params[:rowid]
    @data = micro_get_row(@mid,@tid,@rid)
    @table_data = micro_get_table(@mid,@tid)
  end

  def create
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
      # Been changed before, check for unexecuted changes.
      changes = row.modifications;
      if( changes == nil || !changes.any?)
        # Insert new change here, row already exists
        new_change = row.modifications.create!( user_id: current_user.id, old_value: @data.to_json, new_value: new_val.to_json)
        #micro_put_change(params[:mid],new_change.id)
        #execute_change(new_change.id);
        redirect_to url_for(:controller => "viewtable", :action => "index", :id => params[:mid], :tid => params[:tid])
      else
        redirect_to url_for(:controller => "viewtable", :action => "index", :id => params[:mid], :tid => params[:tid])
      end
    else
      # New change, new Row
      row = RowEntry.create!(Table_Name: params[:tid], microservice_id: params[:mid], record_id: params[:rid])
      new_change = row.modifications.create!( user_id: current_user.id, old_value: @data.to_json, new_value: new_val.to_json)
      #micro_put_change(params[:mid],new_change.id)
      #execute_change(new_change.id);
      redirect_to url_for(:controller => "viewtable", :action => "index", :id => params[:mid], :tid => params[:tid])

    end
  end

  def create
    puts "Inside create function"
    puts params[:type]
    if params[:type] == "Push Now"
      puts "Inside push now"
      params[:changes].each do |change_id|
        row = Change.find(change_id).row_entry
        puts row
        puts row.microservice_id
        puts change_id
        micro_put_change(row.microservice_id, change_id)
        execute_change(change_id)
      end
    end
    redirect_to "/changes"
  end
end

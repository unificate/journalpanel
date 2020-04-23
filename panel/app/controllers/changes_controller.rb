class ChangesController < ApplicationController

  # GET /changes --- display all changes
  def index
    if user_signed_in? and current_user.role == "Admin"
      @changes = Change.all
      @executed = ExecutedAt.all.order('created_at DESC')

      # Get metadata and username for each change
      @metadata = []
      @users = []
      @changes.each do |change|
        @metadata.push(change.row_entry)
        @users.push(User.find(change.user_id).username)
      end

      # Find microservice for each change
      @microservice = []
      @metadata.each do |cmd|
        @microservice.push(cmd.microservice)
      end

      # Get same data but for executed table
      # Get metadata for each executed
      @metadataEx = []
      @users = []
      @executed.each do |ex|
        @metadataEx.push(ex.row_entry)
        @users.push(User.find(ex.user_id).username)
      end

      # Find microservice for each executed
      @microserviceEx = []
      @metadataEx.each do |cmd|
        @microserviceEx.push(cmd.microservice)
      end
    else
      render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
    end
  end

  # GET /changes/new --- display a form for creating a new change
  def new
    #params, id (microservice id), table (table name), rowid (row id)
    @microservice = Microservice.find(params[:id])
    @mid = params[:id]
    @tid = params[:table]
    @rid = params[:rowid]
    @data = micro_get_row(@mid,@tid,@rid)
    @table_data = micro_get_table(@mid,@tid)
  end

  # POST /changes --- create and store a new change
  def create
    @microservice = Microservice.find(params[:mid])
    @data = micro_get_row(params[:mid],params[:tid],params[:rid])
    new_val = {}
    old_val = {}
    @data.each do |key,value|
      if( params[:"#{key}"] != @data[key])
        new_val[key] = params[:"#{key}"]
        old_val[key] = @data[key]
        puts "Different Value "+ params[:"#{key}"]
      end
    end
    row = RowEntry.find_by(Table_Name: params[:tid], microservice_id: params[:mid], record_id: params[:rid])
    if(row != nil)
      # Been changed before, check for unexecuted changes.
      changes = row.modifications
      if( changes == nil || !changes.any?)
        # Insert new change here, row already exists
        row.modifications.create!( user_id: current_user.id, old_value: old_val.to_json, new_value: new_val.to_json)
        redirect_to url_for(:controller => "tables", :action => "show", :microservice_id => params[:mid], :id => params[:tid])
      else
        redirect_to url_for(:controller => "tables", :action => "show", :microservice_id => params[:mid], :id => params[:tid])
      end
    else
      # New change, new Row
      row = RowEntry.create!(Table_Name: params[:tid], microservice_id: params[:mid], record_id: params[:rid])
      row.modifications.create!( user_id: current_user.id, old_value: old_val.to_json, new_value: new_val.to_json)
      redirect_to url_for(:controller => "tables", :action => "show", :microservice_id => params[:mid], :id => params[:tid])
    end
  end

  def push
    puts "Inside create function"
    puts params[:type]
    if params[:type] == "Push Now"
      puts "Inside push now"
      params[:changes].each do |change_id|
        row = Change.find(change_id).row_entry
        puts row
        puts row.microservice_id
        puts change_id
        unless micro_put_change(row.microservice_id, change_id) == nil
          execute_change(change_id)
          redirect_to url_for(:controller => "changes", :action => "index")
        end
      end
    end
    if params[:type] == "Create Transaction"
      redirect_to url_for(:controller => "transaction", :action => "create", :changes => params[:changes])
    end
  end
end

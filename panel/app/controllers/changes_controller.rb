class ChangesController < ApplicationController

  # GET /changes --- display all changes
  def index
    if checkRole() >= 1
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
      @usersEx = []
      @executed.each do |ex|
        @metadataEx.push(ex.row_entry)
        @usersEx.push(User.find(ex.user_id).username)
      end

      # Find microservice for each executed
      @microserviceEx = []
      @metadataEx.each do |cmd|
        @microserviceEx.push(cmd.microservice)
      end

      # Keep track of changes already in a transaction
      transactions = TransactionEntry.all
      @changes_in_use = []
      transactions.each do |t|
        @changes_in_use.push(t.change_id)
      end
    else
      render403()
    end
  end

  # GET /changes/new --- display a form for creating a new change
  def new
    if checkRole() >= 1
      #params, id (microservice id), table (table name), rowid (row id)
      @microservice = Microservice.find(params[:id])
      @mid = params[:id]
      @tid = params[:table]
      @rid = params[:rowid]
      @data = micro_get_row(@mid,@tid,@rid)
      @table_data = micro_get_table(@mid,@tid)
    else
      render403()
    end
  end

  # POST /changes --- create and store a new change
  def create
    if checkRole() >= 1
      @microservice = Microservice.find(params[:mid])
      @data = micro_get_row(params[:mid],params[:tid],params[:rid])
      new_val = {}
      old_val = {}
      @data.each do |key,value|
        # check for values that have changed, ignoring attributes that can't be changed
        if params[:"#{key}"] != @data[key].to_s and !key.in? ["id", "created_at", "updated_at"]
          new_val[key] = params[:"#{key}"]
          old_val[key] = @data[key]
          puts "Different Value "+ params[:"#{key}"]
        end
      end
      # Ignore submission if no change was made
      unless new_val.any?
        redirect_to url_for(:controller => "tables", :action => "show", :microservice_id => params[:mid], :id => params[:tid])
        return
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
    else
      render403()
    end
  end

  # DELETE /changes/:id --- Destroy a stored change
  def destroy
    if checkRole >= 3
      @change = Change.find(params[:id])
      @change.destroy
    end
    redirect_to url_for(controller: :changes, action: :index)
  end

  # POST /changes/push --- Execute a change request by posting the change to the MicroManage API
  def push
    if checkRole() >= 1
      params[:changes].each do |change_id|
        row = Change.find(change_id).row_entry
        unless micro_put_change(row.microservice_id, change_id) == nil
          # move the change request to the executed table
          execute_change(change_id)
          redirect_to url_for(:controller => "changes", :action => "index")
        end
      end
    else
      render403()
    end
  end
end

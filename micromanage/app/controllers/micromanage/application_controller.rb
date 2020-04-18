module Micromanage
  class ApplicationController < ActionController::Base
    # protect_from_forgery with: :exception
    # don't do any CSRF checks for now
    # we may want to figure out how to support this later
    skip_before_action :verify_authenticity_token

    # GET /micromanage --- return all tables with schemas
    # uses the 'tables' config value to only return approved tables
    # see /lib/micromanage.rb
    def index
      schemas = ActiveRecord::Base.connection.tables
      out = {}
      Micromanage.tables.each do |table_name|
        if schemas.include? table_name
          out[table_name] = ActiveRecord::Base.connection.columns(table_name)
        end
      end
      render json: out, status: :ok
    end

    # GET /micromanage/:table --- return all records in :table
    def show
      if ActiveRecord::Base.connection.tables.include? params[:table]
        table = params[:table].classify.constantize
        render json: table.all, status: :ok
      else
        table = {Response: "Table does not exist"}
        render json: table, status: :not_found
      end
    end

    # GET /micromanage/:table/:row --- return a single record from table
    def getrow
      if ActiveRecord::Base.connection.tables.include? params[:table]
        table = params[:table].classify.constantize
        row = table.find(params[:row])
        render json: row, status: :ok
      else
        error = {Response: "Table does not exist"}
        render json: error, status: :not_found
      end
    end

    # PUT /micromanage/:table/:row --- update a record in :table
    def update
      if ActiveRecord::Base.connection.tables.include? params[:table]
        table = params[:table].classify.constantize
        row = table.find(params[:row])
        # update row using parsed JSON
        row.update(JSON.parse(request.body.read))
      end
    end

    # POST /:table --- create a new record in :table
    def create
      if ActiveRecord::Base.connection.tables.include? params[:table]
        table = params[:table].classify.constantize
        # create new entry using parsed JSON
        table.create(JSON.parse(request.body.read))
      end
    end
  end
end

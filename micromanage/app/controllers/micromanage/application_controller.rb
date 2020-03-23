module Micromanage
  class ApplicationController < ActionController::Base
    # protect_from_forgery with: :exception
    # don't do any CSRF checks for now
    # we may want to figure out how to support this later
    skip_before_action :verify_authenticity_token

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

    def show
      if ActiveRecord::Base.connection.tables.include? params[:table]
        table = params[:table].classify.constantize
        render json: table.all, status: :ok
      else
        table = {Response: "Table does not exist"}
        render json: table, status: :not_found
      end
    end

    def update
      if ActiveRecord::Base.connection.tables.include? params[:table]
        table = params[:table].classify.constantize
        row = table.find(params[:row])
        # update row using parsed JSON
        row.update(JSON.parse(request.body.read))
      end
    end

    def create
      if ActiveRecord::Base.connection.tables.include? params[:table]
        table = params[:table].classify.constantize
        # create new entry using parsed JSON
        table.create(JSON.parse(request.body.read))

        # we may want to check that the request has all the required
        # attributes, unless we can just store null

        # we may also want to try and detect duplicate requests
        # somehow, not sure if that's needed
      end
    end
    def getrow
      if ActiveRecord::Base.connection.tables.include? params[:table]
        table = params[:table].classify.constantize
        row = table.find(params[:row])
        # update row using parsed JSON
        render json: row, status: :ok
      end
    
    end


  end
end

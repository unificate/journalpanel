module Grabber
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    def index
        schemas = ActiveRecord::Base.connection.tables
        out = {}
        Grabber.tables.each do |table_name|
          if schemas.include? table_name
            out[table_name] = ActiveRecord::Base.connection.columns(table_name)
          end
        end
        render json: out, status: :ok
    end

    def show
        if ActiveRecord::Base.connection.tables.include? params[:id]
            table = params[:id].classify.constantize
            render json: table.all, status: :ok
        else
            table = {"Response": "Table does not exist"}
            render json: table, status: :not_found
        end
    end

  end
end

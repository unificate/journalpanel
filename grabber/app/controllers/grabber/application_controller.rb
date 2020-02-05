module Grabber
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    def index
        schemas = ActiveRecord::Base.connection.tables
        unpacked_schemas = Array.new
        str = "{"
        first = 0
        ActiveRecord::Base.connection.tables.each do |table_name|
            if first == 0
                first = 1
            else
                str += ", "
            end
            str += "#{table_name}: {"
            innerfirst = 0
            ActiveRecord::Base.connection.columns(table_name).each do |c|
                if innerfirst == 0
                    innerfirst = 1
                else
                    str += ", "
                end
                str += "#{c.name}:#{c.type} #{c.limit}"
                unpacked_schemas.push(str)
            end
            str += "}"
        end
        str += "}"
        render json: {status: 'SUCCESS', message:'Loaded schemas', data:str}, status: :ok
    end
  end
end

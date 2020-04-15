class TablesController < ApplicationController

  # GET /microservice/:microservice_id/tables --- display all tables in a microservice
  def index
    unless user_signed_in?
      redirect_to '/'
    end
    @schema = nil
    @table_names = nil
    @microservice = Microservice.find(params[:microservice_id])
    @schema = micro_get_tables(params[:microservice_id])
    unless @schema == nil
      @table_names = @schema.keys.select do |el|
        @schema[el] != nil
      end
    end
  end

  # GET /microservice/:microservice_id/tables/:id --- display all rows in a table
  def show
    @service = params[:microservice_id]
    @tname = params[:id]
    @records = micro_get_rows(@service, @tname)
  end
end

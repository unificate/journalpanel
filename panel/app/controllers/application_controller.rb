class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :password, :role])
  end
  protected
  def micro_get_row(microservice_id, table_id, row_id)
        microservice = Microservice.find(microservice_id)
        adr = microservice.address
        conn = Faraday.new
        if adr != nil and adr != ""
            unless adr.include? 'http'
                adr = 'http://'+adr
            end
            adr = adr+'/'+table_id+'/'+row_id
            begin
                response = conn.get(adr).body
            rescue Faraday::ConnectionFailed => e 
                response = "{}" 
            end
            data = JSON.parse(response).with_indifferent_access
            return data
        end
        return nil
    end
    protected
    def micro_get_rows(microservice_id, table_name)
        microservice = Microservice.find(microservice_id)
        adr = microservice.address
        conn = Faraday.new
        if adr != nil and adr != ""
            unless adr.include? 'http'
                adr = 'http://'+adr
            end
            adr = adr+'/'+table_name
            begin
                response = conn.get(adr).body
            rescue Faraday::ConnectionFailed => e 
                response = "{}" 
            end
            return ((JSON.parse(response)))
        end
        return nil
    end
    protected
    def micro_get_table(microservice_id, table_name)
        microservice = Microservice.find(microservice_id)
        adr = microservice.address
        conn = Faraday.new
        if adr != nil and adr != ""
            unless adr.include? 'http'
                adr = 'http://'+adr
            end
            begin
                response = conn.get(adr).body
            rescue Faraday::ConnectionFailed => e 
                response = "{}" 
            end
            return ((JSON.parse(response).with_indifferent_access)[table_name])
        end
        return nil
    end
    protected
    def micro_get_tables(microservice_id)
        microservice = Microservice.find(microservice_id)
        adr = microservice.address
        conn = Faraday.new
        if adr != nil and adr != ""
            unless adr.include? 'http'
                adr = 'http://'+adr
            end
            begin
                response = conn.get(adr).body
            rescue Faraday::ConnectionFailed => e 
                response = "{}" 
            end
            return (JSON.parse(response).with_indifferent_access)
        end
        return nil
    end
end

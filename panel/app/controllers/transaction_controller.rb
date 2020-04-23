class TransactionController < ApplicationController
	def index
		if user_signed_in? and current_user.role == "Admin" or (user_signed_in? and current_user.role == "Release Manager") or (user_signed_in? and current_user.role == "Product Owner")
		  @changes = Change.all


		else render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
		end
	end

    def create
        puts params[:changes]
        params[:changes].split("/").each do |change_id|
            row = Change.find(change_id).row_entry
            puts row
            puts row.microservice_id
            puts change_id
            puts ""
        end
        @changes = Change.all
        render "index"
    end
end

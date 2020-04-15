class TransactionController < ApplicationController
	def index
		if user_signed_in? and current_user.role == "Admin" or (user_signed_in? and current_user.role == "Release Manager") or (user_signed_in? and current_user.role == "Product Owner")
		  @changes = Change.all


		else render(:file => File.join(Rails.root, 'errors/403.html'), :status => 403, :layout => false)
		end

	end
end

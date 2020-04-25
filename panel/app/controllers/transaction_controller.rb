class TransactionController < ApplicationController
    def index
       if user_signed_in? and current_user.role == "Admin" or (user_signed_in? and current_user.role == "Release Manager") or (user_signed_in? and current_user.role == "Product Owner")
	  @list = Transaction.all
          @changes = Change.all
	  @changeRequests
	  @result = Array.new()
	  counter = 0
	  @list.each do |trans|
            if (TransactionEntry.where(transaction_id: trans.id) != nil)
		    @changeRequests = (TransactionEntry.where(transaction_id: trans.id))
		    @changeRequests.each do |t|
		    	@result.push(t)
		    end
	    end
          end


       else render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
      end
    end

    def create
        puts params[:changes]
	rowList = params[:changes].split("/")

	@transaction = Change.find(rowList)
	result1 = Transaction.create!(user_id: current_user.id, description: "description goes here")
	@primaryKeyTransactionTable = result1.id #@transaction[0].id #needs to be transaction_id not Change's id 
	puts "DEBUG1"
	puts @primaryKeyTransactionTable
	puts "DEBUG 2"
	@transaction.each do |change_id|
	    puts change_id.id
	    result2 = result1.transaction_entries.create!(change_id: change_id.id)
		end
		send_transaction(result1.id)

        @changes = Change.all
        render "index"
    end
end

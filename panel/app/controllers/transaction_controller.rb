class TransactionController < ApplicationController
    def index
       if checkRole() >= 1
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
        else
            render403()
      end
    end

    def create
        if checkRole() >= 2
            puts params[:changes]
        	rowList = params[:changes].split("/")
        	@transaction = Change.find(rowList)
        	result = Transaction.create!(user_id: current_user.id, description: "description goes here")
        	@primaryKeyTransactionTable = result.id #@transaction[0].id #needs to be transaction_id not Change's id
        	puts "DEBUG1"
        	puts @primaryKeyTransactionTable
        	puts "DEBUG 2"
        	@transaction.each do |change_id|
        	    puts change_id.id
        	    result = TransactionEntry.create!(change_id: change_id.id, transaction_id: @primaryKeyTransactionTable)
            end
            redirect_to url_for(controller: "transaction", action: :index)
        end
    end
end

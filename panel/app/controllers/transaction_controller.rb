class TransactionController < ApplicationController
    def index
       if checkRole() >= 1
    	  @list = Transaction.all
          @changes = Change.all
    	  @changeRequests
    	  @result = Array.new()
    	  counter = 0
		  @list.each do |trans|
				@changeRequests = trans.transaction_entries
                if (@changeRequests != nil)
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
        	@primaryKeyTransactionTable = result.id
        	puts @primaryKeyTransactionTable
        	@transaction.each do |change_id|
        	    puts change_id.id
        	    result = TransactionEntry.create!(change_id: change_id.id, transaction_id: @primaryKeyTransactionTable)
            end
            redirect_to url_for(controller: "transaction", action: :index)
        end
    end

    def show
	    if checkRole() >=2
	        @bundledChanges = Array.new()
	        query = TransactionEntry.where(transaction_id: params[:id])
	        @tid = query[0].transaction_id
	        query.each do |t|
                    @bundledChanges.push(t.change)
	        end
	    else
                render403()
	    end
    end

    def submitTransaction
	    if checkRole() >= 3
	       puts "DEBUG"
	       puts params[:id]
	       send_transaction(params[:id])
	       redirect_to('/transaction')
	    else render403()
	    end
    end
    def delete
	    if checkRole() >= 3
		    puts "DEBUG"
		    puts "deleting the transaction!"
		    delete_transaction(params[:id])
		    redirect_to('/transaction')
	    else render403()
	    end
    end
end

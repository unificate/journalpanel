class TransactionController < ApplicationController
    def index
	   if checkRole() >= 1
          tr = Transaction.all
		  @list = Array.new()
		  @executedlist = Array.new()
          @changes = Change.all
    	  @changeRequests
    	  @result = Array.new()
    	  @executedresult = Array.new()
    	  counter = 0
		  tr.each do |trans|
				@changeRequests = trans.transaction_entries
				@executedChanges = trans.executed_transaction_entries
				if (@changeRequests != nil && @changeRequests.any?)
					@list.push(trans)
        		    @changeRequests.each do |t|
        		    	@result.push(t)
    		        end
				elsif @executedChanges != nil && @executedChanges.any?
					@executedlist.push(trans)
					@executedChanges.each do |e|
						@executedresult.push(e)
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
			@executedChanges = Array.new()
			transaction = Transaction.find(params[:id])
			query = transaction.transaction_entries
			executed = transaction.executed_transaction_entries
	        @tid = transaction.id
	        query.each do |t|
                @bundledChanges.push(t.change)
			end
			executed.each do |e|
				@executedChanges.push(e.executed_at)
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

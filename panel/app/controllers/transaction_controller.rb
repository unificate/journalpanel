class TransactionController < ApplicationController
    def index
       if checkRole() >= 1
    	  @list = Transaction.all
          @changes = Change.all
    	  @changeRequests
    	  @result = Array.new()
          @users = Array.new()
    	  counter = 0
    	  @list.each do |trans|
                if (TransactionEntry.where(transaction_id: trans.id) != nil)
        		    @changeRequests = (TransactionEntry.where(transaction_id: trans.id))
        		    @changeRequests.each do |t|
        		    	@result.push(t)
                        @users.push((User.find(Transaction.find(t.transaction_id).user_id)).username)
    		        end
    	       end
            end
        else
            render403()
      end
    end

    def create
      unless params[:changes]  # ignore request if no changes were selected
        redirect_to url_for(controller: "changes", action: :index)
        return
      end
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
            @metadata = Array.new()
	        query = TransactionEntry.where(transaction_id: params[:id])
	        @tid = query[0].transaction_id
	        query.each do |t|
                    @bundledChanges.push(Change.find(t.change_id))
                    row_entry = t.change.row_entry
                    @metadata.push([row_entry.microservice.name, row_entry.Table_Name])
	        end
	    else
                render403()
	    end
    end

    def push
	    if checkRole() >= 3
	       puts "DEBUG"
	       puts params[:id]
	       send_transaction(params[:id])
	       redirect_to('/transaction')
	    else render403()
	    end
    end

    def destroy
	    if checkRole() >= 3
        @transaction = Transaction.find(params[:id])
        @transaction.destroy
		    redirect_to('/transaction')
	    else render403()
	    end
    end
end

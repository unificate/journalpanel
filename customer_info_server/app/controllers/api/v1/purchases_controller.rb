module Api
    module V1
        class PurchasesController< ApplicationController
            def index
                purchases = Purchase.order('created_at DESC')
                render json: {status: 'SUCCESS', message:'Purchases', data: purchases}, status: :ok
            end

            def create
                purchase =  Purchase.new(purchase_params)
                if purchase.save
                    render json: {status:'SUCCESS', message:'Saved new Purchase', data:purchase}, status: :ok
                else
                    render json: {status:'FAILURE', message:'Failed to save new purchase', data:purchase},status: :unprocessable_entity
                end
            end

            def show
                purchase = Purchase.find(params[:customer])
                render json:{status: 'SUCCESS', message:"Found purchase",data:purchase},status: :ok 
            end

            def purchase_params
                params.permit(:customer, :item)
            end


        end
    end
end


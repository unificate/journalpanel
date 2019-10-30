module Api
    module V1
        class ItemsController< ApplicationController
            def index
                items = Item.order('name DESC')
                render json: {status: 'SUCCESS', message:'Customers listed', data: items}, status: :ok
            end

            def create
                item =  Item.new(item_params)
                if item.save
                    render json: {status:'SUCCESS', message:'Saved new item', data:item}, status: :ok
                else
                    render json: {status:'FAILURE', message:'Failed to save new item', data:item},status: :unprocessable_entity
                end
            end

            def show
                item = Item.find(params[:id])
                render json:{status: 'SUCCESS', message:"Found item",data:item},status: :ok 
            end

            def item_params
                params.permit(:name)
            end


        end
    end
end


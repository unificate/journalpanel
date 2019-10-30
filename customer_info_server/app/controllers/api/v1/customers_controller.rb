module Api
    module V1
        class CustomersController < ApplicationController
            def index
                customers = Customer.order('last DESC')
                render json: {status: 'SUCCESS', message:'Customers listed', data: customers}, status: :ok
            end

            def create
                customer =  Customer.new(customer_params)
                if customer.save
                    render json: {status:'SUCCESS', message:'Saved new Customer', data:customer}, status: :ok
                else
                    render json: {status:'FAILURE', message:'Failed to save new customer', data:customer},status: :unprocessable_entity
                end
            end

            def show
                customer = Customer.find(params[:id])
                render json:{status: 'SUCCESS', message:"Found customer",data:customer},status: :ok 
            end

            def customer_params
                params.permit(:first, :last, :email)
            end

            
        end
    end
end

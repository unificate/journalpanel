module Api
    module V1
        class MessagesController < ApplicationController
            skip_before_action :verify_authenticity_token
            def index
                messages = Message.order('title DESC');
                render json: {status: 'SUCCESS', message:'Loaded messages', data:messages}, status: :ok
            end

            def show
                message = nil
                if params[:id] == "messageOfTheDay"
                    messages = Message.order('created_at DESC')
                    message = messages[0]
                else
                    message = Message.find(params[:id])
                end
                render json: {status: 'SUCCESS', message:'Loaded message', data:message}, status: :ok
            end

            def create
                message = Message.new(message_params)    
                if message.save
                    render json: {status: 'SUCCESS', message:'Saved Message', data:message}, status: :ok
                else
                    messages = Message.order('created_at DESC')
                    message = messages[0]
                    render json: {status: 'ERROR', message:'Not saved', data:params, messageOfTheDay:message}, status: :unprocessable_entity
                end
            end

            def destroy
                message = Message.find(params[:id])
                message.destroy
                render json: {status: 'SUCCESS', message:'Message Destroyed', data:message}, status: :ok
            end

            def update
                message = Message.find(params[:id])
                if message.update_attributes(message_params)
                    render json: {status: 'SUCCESS', message:'Updated Message', data:message}, status: :ok
                else
                    render json: {status: 'ERROR', message:'Not saved', data:message}, status: :unprocessable_entity
                end
            end

            private
            def message_params
                params.permit(:title, :body)
            end
        end
    end

end

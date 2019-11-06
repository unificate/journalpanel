module Api
    module V1
        class ContactsController < ApplicationController
            def index
                contacts = Contact.order('id ASC');
                render json: {status: 'SUCCESS', message:'Loaded contacts', data:contacts}, status: :ok
            end

            def show
                contact = Contact.find(params[:id])
                render json: {status: 'SUCCESS', message:'Loaded contact', data:contact}, status: :ok
            end

            def create
                contact = Contact.new(contact_params)
                if contact.save
                    render json: {status: 'SUCCESS', message:'Saved contact', data:contact}, status: :ok
                else
                    render json: {status: 'ERROR', message:'Contact was unable to be saved', data:contact.errors}, status: :unprocessable_entity
                end
            end

            def destroy
                contact = Contact.find(params[:id])
                contact.destroy
                render json: {status: 'SUCCESS', message:'Deleted contact', data:contact}, status: :ok
            end

            def update
                contact = Contact.find(params[:id])
                if contact.update_attributes(contact_params)
                    render json: {status: 'SUCCESS', message:'Updated contact', data:contact}, status: :ok
                else
                    render json: {status: 'ERROR', message:'Unable to update contact', data:contact.errors}, status: :unprocessable_entity
                end
            end

            private

            def contact_params
                params.permit(:name, :phone_number, :company, :address)
            end
        end
    end
end

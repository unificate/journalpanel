# README

API creation documentation

to create a stripped down application just for api's:
    rails new my_api --api

first create the database: 
    rake db:create

then generate the models for your database tables:
    rails g "TableName" fieldName1:type, fieldName2:type, ...
    
next, add validation code in app/models/modelname for each model added
    i.e. inside of the class: validates fieldName: presence: true,length: 1..100

Create the controller for each model for which you want an API:
    create two new directories api/v1/ Then make a new file "pluralmodelname_controller.rb"
    for each model and make a class which extends applicationController: 

        module Api
            module V1
                class PluralModelNameController < ApplicationController
                    def index
                    end
                    def create
                    end
                    def destroy
                    end
                    ....
                end
            end
        end


after that, add the new models to the routes.rb file located at config/routes.rb
Make sure to nest it in the correct namespace(pretty sure this is based on the modules above.)
    i.e.
    namespace 'api' do
        namespace 'v1' do 
            resources :pluralModelName
        end
    end
    NOTE: the name after the colon should be the plural of the model name(I think 
          rails just tacks on an 's' to any model name). 


In the command line, you should now be able to type 'rails routes' and have the routes to your models appear.
You can then create a method for each rout within your Controller classes to determine how the API will respond
to each route.


OH make sure to run rails db:migrate RAILS_ENV=development 

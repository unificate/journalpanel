require 'rails_helper'

describe "GET" do
  # create test data for each request
  before(:each) do
    Contact.create({name: "Sally Sparrow",
                    phone_number: "(555) 555-5555",
                    company: "Angel Co.",
                    address: "123 Main St."})

    Contact.create({name: "John Smith",
                    phone_number: "(333) 333-3333",
                    company: "Acme",
                    address: "456 River Dr."})
  end

  describe "/micromanage", :type => :request do
    before do
      # make the request
      get '/micromanage'
    end

    it 'returns all tables' do
      # there should be one table, Contacts
      expect(JSON.parse(response.body).size).to eq(1)
    end

    it 'returns status :success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe "/micromanage/:table", :type => :request do
    before do
      get '/micromanage/contacts'
    end

    it 'returns all rows' do
      # there should be two entries, created above
      expect(JSON.parse(response.body).size).to eq(2)
    end

    it 'returns status :success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe "micromanage/:table/:row", :type => :request do
    before do
      get '/micromanage/contacts/1'
    end

    it 'returns the correct row', :type => :request do
      expect(JSON.parse(response.body)).to eq(Contact.find(1).as_json)
    end

    it 'returns status :success' do
      expect(response).to have_http_status(:success)
    end
  end
end

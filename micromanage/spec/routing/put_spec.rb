require 'rails_helper'

describe "PUT /micromanage/:table/:row", :type => :request do
  # create test data for the request
  before do
    Contact.create({name: "Sally Sparrow",
                    phone_number: "(555) 555-5555",
                    company: "Angel Co.",
                    address: "123 Main St."})

    Contact.create({name: "John Smith",
                    phone_number: "(333) 333-3333",
                    company: "Acme",
                    address: "456 River Dr."})
    # make the request
    put '/micromanage/contacts/2', params: '{"name":"Mike Johnson"}'
  end

  it 'edits the given row' do
    expect(Contact.pluck(:name)[1]).to eq("Mike Johnson")
  end

  it 'returns status :success' do
    expect(response).to have_http_status(:success)
  end
end

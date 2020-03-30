require 'rails_helper'

describe "POST /micromanage/:table", type: :request do
  new_entry = '{"name":"Mike Johnson", "phone_number":"(777) 777-7777", "company":"Tester", "address":"111 River Road"}'

  before do
    # create test data for the request
    Contact.create({name: "Sally Sparrow",
                    phone_number: "(555) 555-5555",
                    company: "Angel Co.",
                    address: "123 Main St."})

    Contact.create({name: "John Smith",
                    phone_number: "(333) 333-3333",
                    company: "Acme",
                    address: "456 River Dr."})
    # make the request
    post '/micromanage/contacts', params: new_entry
  end

  it 'adds a new row to table' do
    expect(Contact.count).to eq(3)
  end

  it 'creates the correct entry' do
    expect(Contact.find(3).as_json).to include(JSON.parse(new_entry))
  end

  it 'returns status :success' do
    expect(response).to have_http_status(:success)
  end
end

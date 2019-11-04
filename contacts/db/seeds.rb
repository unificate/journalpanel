# Use faker gem to fill with fake data

10.times do
    Contact.create({
        name: Faker::Name.name,
        phone_number: Faker::PhoneNumber.cell_phone,
        company: Faker::Company.name,
        address: Faker::Address.full_address
    })
end

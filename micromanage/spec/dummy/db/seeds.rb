# Use faker gem to fill with fake data

#20.times do
#    Contact.create({
#        name: Faker::Name.name,
#        phone_number: Faker::PhoneNumber.cell_phone,
#        company: Faker::Company.name,
#        address: Faker::Address.full_address
#    })
#end

Contact.create({name: "Sally Sparrow",
                phone_number: "(555) 555-5555",
                company: "Angel Co.",
                address: "123 Main St."})

Contact.create({name: "John Smith",
                phone_number: "(333) 333-3333",
                company: "Acme",
                address: "456 River Dr."})

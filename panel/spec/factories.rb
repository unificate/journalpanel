FactoryBot.define do
  factory :user do
    username { 'tester' }
    password { 'tester' }
    role {'admin'}
  end
end

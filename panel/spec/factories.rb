FactoryBot.define do
  factory :user do
    username { 'tester' }
    password { 'tester' }
  end
  factory :group do
    username {'tester'}
    memberOf {'admin'}
  end
end

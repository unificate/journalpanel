FactoryBot.define do
  factory :admin, class: "user" do
    username { 'tester' }
    password { 'tester' }
    role {'Admin'}

  end
  factory :developer, class: "user" do
	  username {'Developer'}
	  password {'s3cure!'}
	  role {'Developer'}
  end
  factory :release_manager, class: "user" do
	  username {'release_manager'}
	  password {'123456'}
	  role {'Release Manager'}
  end
  factory :product_owner, class: "user" do
	  username {'b.smith'}
	  password {'sup3rS3cur3'}
	  role {'Product Owner'}
  end
end

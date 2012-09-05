FactoryGirl.define do
	factory :user do
		sequence(:email) { |n| "person_#{n}@example.com" }
		password              "foobar"
		password_confirmation "foobar"
	end

	factory :script do
		sequence(:title) { |n| "Script #{n}" }
		user
	end
end
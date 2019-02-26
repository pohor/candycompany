FactoryBot.define do
  factory :user do
    sequence(:firstname) { |n| "#{n}test" }
    lastname { 'testtest' }
    description { 'testtesttesttest' }
    admin { true }
    email { "#{firstname}@example.com" }
    password { 'f4k3p455w0rd' }
  end
end

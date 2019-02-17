FactoryBot.define do
  factory :user do
    firstname { 'test' }
    lastname { 'testtest' }
    description { 'testtesttesttest' }
    admin { true }
    email { 'test@example.com' }
    password { 'f4k3p455w0rd' }
  end
end

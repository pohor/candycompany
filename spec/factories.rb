FactoryBot.define do
  factory :user do
    sequence(:firstname) { |n| "#{n}test" }
    lastname { 'testtest' }
    description { 'testtesttesttest' }
    admin { true }
    email { "#{firstname}@example.com" }
    password { 'f4k3p455w0rd' }
  end

  factory :post do
    title { "Test Post" }
    content  { "Testowy Content" }
    time  { rand(10..100) }
    skills { 1 }
    user_id { FactoryBot.create(:user).id }
    category_ids { [Category.last.id] }
    ingredient_ids { [ Ingredient.last.id ] }
    post_cover { File.open(File.join(Rails.root,"spec/fixtures/post_cover.png")) }
  end

end

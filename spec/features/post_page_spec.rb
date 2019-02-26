require 'rails_helper'

feature 'post page' do
  scenario 'post page' do
    post = FactoryBot.create(:post)
    visit("/posts/#{post.id}")

    expect(page).to have_content('Testowy Content')
  end
end

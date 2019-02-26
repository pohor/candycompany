require 'rails_helper'
require_relative '../factories'

feature 'post page' do
  scenario 'post page' do
    post = FactoryBot.build(:post)
    visit("/posts/#{post.id}")

    expect(page).to have_content('Testowy Content')
  end
end

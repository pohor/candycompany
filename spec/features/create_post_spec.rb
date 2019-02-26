require 'rails_helper'
require_relative '../support/new_post_form'

RSpec.feature "create new post", :type => :feature do
  let(:new_post_form) { NewPostForm.new }

  scenario 'unable to view admin page when not logged in' do
    new_post_form.visit_admin_page

    expect(page).to have_content('Nie możesz tego wyświetlić')
  end

  scenario 'create new post when not logged in' do
    new_post_form.visit_admin_page.new_post

    expect(page).to have_content('Aby kontynuować musisz się zalogować')
    end

  scenario 'unable create new post when logged in as admin with invalid data' do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    new_post_form.visit_admin_page.new_post.fill_with_null.submit

    expect(page).to have_content('prohibited this from being saved')
    Warden.test_reset!
  end

  scenario 'succesfully create new post when logged in as admin with valid data' do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    new_post_form.visit_admin_page.new_post.fill_in_with_all_params(title: 'Testowy Post', content: 'Testowy Content', time: '100').submit

    expect(page).to have_content('Udało Ci się dodać nowy post.')
    Warden.test_reset!
  end


end

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

end

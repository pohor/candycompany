require 'rails_helper'

RSpec.feature "create new post", :type => :feature do
  scenario 'unable to view admin page when not logged in' do
    visit('/admin')

    expect(page).to have_content('Nie możesz tego wyświetlić')
  end

  scenario 'create new post when not logged in' do
    visit('/admin')
    click_on('New Post')

    expect(page).to have_content('Aby kontynuować musisz się zalogować')
    end

end

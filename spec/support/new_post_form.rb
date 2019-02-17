class NewPostForm
  include Capybara::DSL

  def visit_admin_page
    visit('/admin')
    self
  end

  def new_post
    click_on('New Post')
    self
  end

end

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

  def fill_in_with_all_params( params = {} )
    fill_in('post[title]', with: params.fetch(:title, 'Testowy Post'))
    fill_in('post[content]', with: params.fetch(:content, 'Testowy Content'))
    fill_in('post[time]', with: params.fetch(:time, '100'))
    choose('łatwy')
    attach_file Rails.root.join('spec/fixtures/post_cover.png')
    self
  end

  def fill_with_null
    self
  end

  def submit
    click_on('Utwórz Post')
    self
  end

end

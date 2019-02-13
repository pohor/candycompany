require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
      @base_title = "CandyCompany"
    end

  test "should get root" do
   get root_url
   assert_response :success
  end

  test "should get home" do
    get home_url
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get omnie" do
    get omnie_url
    assert_response :success
    assert_select "title", "O mnie | #{@base_title}"
  end

  test "should get kontakt" do
    get kontakt_url
    assert_response :success
    assert_select "title", "Kontakt | #{@base_title}"
  end

  test "should get admin" do
    get admin_url
    assert_response :success
    assert_select "title", "Admin | #{@base_title}"
  end

end

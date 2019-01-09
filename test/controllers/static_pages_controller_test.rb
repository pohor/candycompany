require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get warsztaty" do
    get static_pages_warsztaty_url
    assert_response :success
  end

  test "should get omnie" do
    get static_pages_omnie_url
    assert_response :success
  end

  test "should get kontakt" do
    get static_pages_kontakt_url
    assert_response :success
  end

  test "should get wspolpraca" do
    get static_pages_wspolpraca_url
    assert_response :success
  end

end

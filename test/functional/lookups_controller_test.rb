require 'test_helper'

class LookupsControllerTest < ActionController::TestCase
  test "should get lookup_form" do
    get :lookup_form
    assert_response :success
  end

  test "should get search" do
    get :search
    assert_response :success
  end

end

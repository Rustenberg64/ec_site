require 'test_helper'

class TestControllerTest < ActionDispatch::IntegrationTest
  # deviseのテスト用メソッドをインクルード
  include Devise::Test::IntegrationHelpers

  def setup
    @customer = customers(:alice)
    @other = customers(:bob)
    # # ログインするとき
    # sign_in(@user)
    # # ログアウトするとき
    # sign_out
  end

  test "login path" do
    get new_customer_session_path
    assert_response :ok
  end

  # test "valid login" do
  #   post new_customer_session_path, 
  #   params: {session: { email:  @customer.email, 
  #     encrypted_password: 'password'} }
  #   assert_response :success
  # end

  test "logout path" do
    delete destroy_customer_session_path
    assert_response :see_other
  end

  test "signin_path" do
    get new_customer_registration_path
    assert_response :ok
  end

  test "edit_path when logged in" do
    sign_in(@customer)
    get edit_customer_registration_path
    assert_response :ok
  end

  test "edit_path when not logged in" do
    get edit_customer_registration_path
    assert_response :found
    assert_redirected_to new_customer_session_path
  end

end
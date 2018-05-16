require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "Invalid user information" do
    get new_user_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "",
                                         email: "user@invaid.com",
                                         password: "foo",
                                         password_confirmation: "bar"}}
    end
    assert_template 'users/new'
  end
end

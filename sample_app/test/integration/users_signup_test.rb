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

  test "user information should accept valid info" do
    get sign_up_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name: "jbaik",
                                         email: "pppp@gmail.com",
                                         password: "pglossy",
                                         password_confirmation: "pglossy"}}
      end
      follow_redirect!
      assert_template 'users/show'
    end

end

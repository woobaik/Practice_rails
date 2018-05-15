require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: "Example User", email: "user@email.com")
  end


  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "    "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "name shouldn't be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email shouldn't be too long" do
    @user.email = "a" * 251 + "@gmail.com"
    assert_not @user.valid?
  end

  test "email should be accept valid address" do
    valid_addresses = %w[
                         user@example.com
                         User@foo.CoM
                         FIRst.last@gmail.CoM
                         alice_bob@baz.cn
                         ]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid."
    end
  end

  test "invalid email should not be accepted " do
    invalid_emails = %w(gom,gole@comcist,con @comcist.com foo@bar+baz.com)
    invalid_emails.each do |invalid_email|
      @user.email = invalid_email
      assert_not @user.valid?, "#{invalid_email} is accepted"
    end
  end

  test "email should be unique" do
    dup_user = @user.dup
    @user.save
    assert_not dup_user.valid?
  end

end

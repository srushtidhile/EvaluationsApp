require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(fname: 'Natalie', lname: 'Chen', email: 'chen.8290@osu.edu', password: 'test123')
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "fname should be present" do
    @user.fname = " "
    assert_not @user.valid?
  end

  test "lname should be present" do
    @user.lname = " "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

end

require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get home' do
    user = User.create!(fname: 'Patrick', lname: 'Sheeran', email: 'ptsheeran123@gmail.com', password: 'letmein')
    get root_path(as: user)
    assert_response :success
    assert_select 'title', 'Home | Project 6'
  end

  test 'should get help' do
    # get static_pages_help_url
    user = User.create!(fname: 'Patrick', lname: 'Sheeran', email: 'ptsheeran123@gmail.com', password: 'letmein')
    get help_path(as: user)
    assert_response :success
    assert_select 'title', 'Help | Project 6'
  end

  test 'should get about' do
    # get static_pages_about_url
    user = User.create!(fname: 'Patrick', lname: 'Sheeran', email: 'ptsheeran123@gmail.com', password: 'letmein')
    get about_path(as: user)
    assert_response :success
    assert_select 'title', 'About | Project 6'
  end

  test 'should get contact' do
    # get static_pages_contact_url
    user = User.create!(fname: 'Patrick', lname: 'Sheeran', email: 'ptsheeran123@gmail.com', password: 'letmein')
    get contact_path(as: user)
    assert_response :success
    assert_select 'title', 'Contact | Project 6'
  end
end

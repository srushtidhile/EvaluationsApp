require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test 'layout links' do
    user = User.create!(fname: 'Patrick', lname: 'Sheeran', email: 'ptsheeran123@gmail.com', password: 'letmein')
    get root_path(as: user)
    assert_template 'static_pages/home'
    assert_select 'a[href=?]', home_path
    assert_select 'a[href=?]', help_path
    assert_select 'a[href=?]', about_path
  end
end

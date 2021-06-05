require 'test_helper'

class LogControllerTest < ActionDispatch::IntegrationTest

  test 'should show log' do
    user = User.create!(fname: 'Patrick', lname: 'Sheeran', email: 'ptsheeran123@gmail.com', password: 'letmein', admin: true)
    get log_url(as: user)
    assert_response :success
  end

end

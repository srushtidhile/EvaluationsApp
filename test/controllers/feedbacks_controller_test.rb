require 'test_helper'

class FeedbacksControllerTest < ActionDispatch::IntegrationTest

  test "should get feedback index" do
    user = User.create!(fname: 'Patrick', lname: 'Sheeran', email: 'ptsheeran123@gmail.com', password: 'letmein')
    get feedbacks_url(as: user)
    assert_response :success
  end

  test 'new feedback method' do
    user = User.create!(fname: 'Patrick', lname: 'Sheeran', email: 'ptsheeran123@gmail.com', password: 'letmein')
    get new_feedback_url(as: user)
    assert_response :success
  end

  # test "should create feedback" do

  #   assert_difference('Feedback.count') do
  #     user = User.create!(fname: 'Patrick', lname: 'Sheeran', email: 'ptsheeran123@gmail.com', password: 'letmein')
  #     # @presentation = get presentations_url(1, as: user)
  #     # @student = students(:one)

  #     cookies[:id] = 'one'
  #     post feedbacks_url(as: user), params: { feedback: { grade: '1', comment: 'Good' } } 
  #   end
  #   assert_redirected_to feedback_path(Feedback.last)
  # end

end

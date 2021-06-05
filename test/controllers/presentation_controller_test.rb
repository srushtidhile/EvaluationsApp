require 'test_helper'

class PresentationControllerTest < ActionDispatch::IntegrationTest

  test "should get presentation index" do
    user = User.create!(fname: 'Patrick', lname: 'Sheeran', email: 'ptsheeran123@gmail.com', password: 'letmein')
    get presentations_url(as: user)
    assert_response :success
  end

  test 'should show one presentation' do
    user = User.create!(fname: 'Patrick', lname: 'Sheeran', email: 'ptsheeran123@gmail.com', password: 'letmein')
    presentation = presentations(:one)
    get presentations_url(presentation, as: user)
    assert_response :success
  end

  test 'new presentation method' do
    user = User.create!(fname: 'Patrick', lname: 'Sheeran', email: 'ptsheeran123@gmail.com', password: 'letmein', admin: true)
    get new_presentation_url(as: user)
    assert_response :success
  end

  test "should create presentation" do
    assert_difference('Presentation.count') do
      user = User.create!(fname: 'Patrick', lname: 'Sheeran', email: 'ptsheeran123@gmail.com', password: 'letmein')
      post presentations_url(as: user), params: { presentation: { name: 'Presentation'} }
    end
    assert_redirected_to presentation_path(Presentation.last)
  end

  # test "should update presentation" do
  #   user = User.create!(fname: 'Patrick', lname: 'Sheeran', email: 'ptsheeran123@gmail.com', password: 'letmein')
  #   presentation = presentations(:one)
  #   presentation = get presentations_url(presentation, as: user)
  #   patch presentations_url(presentation, as: user), params: { presentation: { name: "updated" } }
  #   assert_redirected_to presentation_path(presentation)
  #   # Reload association to fetch updated data and assert that title is updated.
  #   presentation.reload
  #   assert_equal "updated", presentation.name
  # end

  # test "should destroy presentation" do
  #   presentation = presentations(:one)
  #   assert_difference('Presentation.count', -1) do
  #     delete presentations_url(presentation)
  #   end
  #   assert_redirected_to presentation_path
  # end

  # test 'get feedback method' do
  #   user = User.create!(fname: 'Patrick', lname: 'Sheeran', email: 'ptsheeran123@gmail.com', password: 'letmein', admin: true)
  #   presentation = presentations(:one)
  #   get presentation_feedback_url(presentation, as: user)
  #   assert_response :success
  # end

end

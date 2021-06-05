require 'test_helper'

class FeedbackTest < ActiveSupport::TestCase

  def setup
    @presentation = Presentation.new(name: 'Presentation')
    @student = Student.new(fname: 'Natalie', lname: 'Chen', email: 'chen.8290@osu.edu')
    @feedback = Feedback.new(presentation: @presentation, student: @student, grade: '1', comment: 'Good')
  end

  test "grade should be present" do
    @feedback.grade = " "
    assert_not @feedback.valid?
  end

end

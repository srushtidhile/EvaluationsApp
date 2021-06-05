require 'test_helper'

class PresentationTest < ActiveSupport::TestCase

  def setup
    @presentation = Presentation.new(name: 'Presentation')
  end

  # test "presentation name should be present" do
  #   @presentation.name = " "
  #   assert_not @presentation.valid?
  # end

  test "presentation name should be unique" do
    duplicate_presentation = @presentation.dup
    @presentation.save
    assert_not duplicate_presentation.valid?
  end

end

# static pages controller
class StaticPagesController < ApplicationController
  # go to home page
  def home
    @presentations = Presentation.all
  end

  def help; end

  def about; end

  def contact; end

  def view_profile; end
end

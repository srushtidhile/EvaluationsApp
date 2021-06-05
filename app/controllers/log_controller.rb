# log controller
class LogController < ApplicationController
  # show log of students who haven't submitted feedback for some presentations
  def show
    # don't allow non admins to view this page
    redirect_to(root_path) unless current_user.admin
    # loop through all the students and select all the students that have at least 1 presentation that they are not
    # assigned to for which they have not submitted feedback
    @students = Student.all.select { |s| s.feedbacks.length <= Presentation.all.length - s.presentations.length }
  end
end

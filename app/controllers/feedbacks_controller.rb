# feedbacks controller
class FeedbacksController < ApplicationController
  before_action :set_feedback, only: %i[show edit update destroy]

  # GET /feedbacks/new
  # get page to create a new feedback
  def new
    @feedback = Feedback.new
  end

  # POST /feedbacks
  # POST /feedbacks.json
  # create a new feedback
  def create
    # make sure only students not assigned to this presentation can access this page
    student = Student.find_by(email: current_user.email)
    redirect_to(presentations_path) and return if Presentation.find(cookies[:id]).students.include?(student)

    # create new feedback with the comment and grade based off what user entered in the create new feedback form
    @feedback = Feedback.new(feedback_params)
    # assign the feedback to its given presentation based on the cookie stored in the create feedback page
    @feedback.presentation = Presentation.find(cookies[:id])
    # assign the current student to the feedback's student
    @feedback.student = Student.find_by_email(current_user.email)

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to '/presentations'}
        format.json { render :show, status: :created, location: @feedback }
      else
        format.html { redirect_to(feedbacks_path + '/new/' + cookies[:id].to_s) }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedbacks/1
  # DELETE /feedbacks/1.json
  # delete a feedback
  def destroy
    # only admins can delete feedback
    redirect_to(root_path) unless current_user.admin
    @feedback.destroy
    respond_to do |format|
      format.html { redirect_to feedbacks_path }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_feedback
    @feedback = Feedback.find(params[:id])
  end

  # Only allow comment and grade parameters for feedback.
  def feedback_params
    params.require(:feedback).permit(:comment, :grade)
  end
end

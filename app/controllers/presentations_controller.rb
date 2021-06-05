# presentations controller
class PresentationsController < ApplicationController
  before_action :set_presentation, only: %i[show edit update destroy]

  # GET /presentations
  # GET /presentations.json
  # view all presentations
  def index
    @presentations = Presentation.all
  end

  # GET /presentations/1
  # GET /presentations/1.json
  # show a specific presentation
  def show
  end

  # GET /presentations/new
  # get the page to create a new presentation
  def new
    redirect_to(presentations_path) unless current_user.admin
    @presentation = Presentation.new
  end

  # GET /presentations/1/edit
  # get the page to edit a presentation
  def edit
  end

  # POST /presentations
  # POST /presentations.json
  # create a new presentation
  def create
    # only admins can create presentations
    redirect_to(root_path) unless current_user.admin

    @presentation = Presentation.new(name: presentation_params[:name])

    # for each key value pair from the from that allowed you to select students for a presentation
    presentation_params.each do |_key, value|
      # if blank student was not selected and the student exists and them to the presentation's students
      if value != '' && Student.exists?(value)
        s = Student.find(value)
        @presentation.students << s
      end
    end

    respond_to do |format|
      if @presentation.save
        format.html { redirect_to @presentation }
        format.json { render :show, status: :created, location: @presentation }
      else
        format.html { render :new }
        format.json { render json: @presentation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /presentations/1
  # PATCH/PUT /presentations/1.json
  # edit a presentation
  def update
    # make sure only admins and students who are on this presentation can edit it
    student = Student.find_by(email: current_user.email)
    presentation = Presentation.find(params[:id])
    redirect_to(root_path) and return unless current_user.admin || presentation.students.include?(student)

    respond_to do |format|
      if @presentation.update(name: presentation_params[:name])
        format.html { redirect_to @presentation}
        format.json { render :show, status: :ok, location: @presentation }
      else
        format.html { render :edit }
        format.json { render json: @presentation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presentations/1
  # DELETE /presentations/1.json
  # delete a presentation
  def destroy
    redirect_to(presentations_path) unless current_user.admin
    # destory all feedbacks that were created for the presentation
    @presentation.feedbacks.each do |feedback|
      Feedback.find(feedback.id).destroy
    end

    # destory the presentation
    @presentation.destroy
    respond_to do |format|
      format.html { redirect_to presentations_path}
      format.json { head :no_content }
    end
  end

  # GET /presentations/1/feedback
  def feedback
    # make sure only admins and students who are on this presentation can view feedback
    if Student.exists?(email: current_user.email) || current_user.admin
      student = Student.find_by(email: current_user.email)
      valid = Presentation.find(params[:id]).students.include?(student)
      redirect_to(presentations_path) unless valid || current_user.admin
    else
      redirect_to(presentations_path)
    end

    # presentation the user wishes to view feedback for
    @presentation = Presentation.find(params[:id])

    # all feedbacks that belong to the specified presentation
    @feedbacks = Feedback.all.select { |f| f.presentation == @presentation }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_presentation
    @presentation = Presentation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def presentation_params
    params.require(:presentation).permit(:name, :a, :b, :c, :d, :e)
  end
end

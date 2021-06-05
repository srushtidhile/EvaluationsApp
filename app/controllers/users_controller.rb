# users controller
class UsersController < Clearance::UsersController
  private

  # Only allow fname, lname, email, and password params.
  def user_params
    params.require(:user).permit(:fname, :lname, :email, :password)
  end
end

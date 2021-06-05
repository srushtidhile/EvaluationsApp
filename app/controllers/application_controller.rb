# application controller
class ApplicationController < ActionController::Base
  include Clearance::Controller
  # dont allow user to access any page that isn't sign_in or sign_up before they login
  before_action :require_login
end

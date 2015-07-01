class AdminController < ApplicationController
  before_filter :sign_in_check
  def index
  end

  def rollno
  end

  def createuser
    RollWorker.perform_async(params[:start_number],params[:end_number])
    redirect_to @workstatuses
  end
  private
  def sign_in_check
    if user_signed_in? and current_user.has_role? "admin"
    else
        redirect_to root_path
    end
  end
end

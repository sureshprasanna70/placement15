class AdminController < ApplicationController
  before_filter :sign_in_check
  def index
  end

  def rollno
  end

  def createuser
    puts "controller"
    puts params[:start_number]
    puts params[:end_number]
    RollWorker.perform_async(params[:start_number],params[:end_number])
  end
  private
  def sign_in_check
    if not user_signed_in?
      if not current_user.has_role?"admin"
        redirect_to root_path
      end
    else
      redirect_to new_user_session_path
    end
  end
end

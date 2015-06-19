class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def download
    if user_signed_in?
      user_pic = User.find(params[:id])
      send_file user_pic.pic.path
    end
  end
end

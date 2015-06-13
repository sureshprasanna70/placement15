class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def download
      excelsheet = User.find(params[:id])
      send_file excelsheet.pic.path
  end
end

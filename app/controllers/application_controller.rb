class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :disable_json  
  def download
    if user_signed_in?
      user_pic = User.find(params[:id])
      send_file user_pic.pic.path
    end

  end
  def exceldownload
    send_file Rails.root.to_path+"/data/excelsheet/"+params[:filename]+"."+params[:extension]
  end
  def barcode
    send_file Rails.root.to_path+"/data/barcode/"+params[:filename]+"."+params[:extension]
  end

  def disable_json
    if request.format =~ /json/
      puts "json request"
      redirect_to root_path
    end
  end
  def set_time_zone
    Time.zone = current_user.time_zone
  end
end

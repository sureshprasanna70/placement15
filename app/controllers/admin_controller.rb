class AdminController < ApplicationController
  before_filter :sign_in_check
  def index
  end

  def rollno
  end

  def createuser
    RollWorker.perform_async(params[:start_number],params[:end_number])
    redirect_to workstatuses_path
  end
  def excelsheet
  end
  def userexcel
    file=params[:file].original_filename
    directory = Rails.root.+"data/excelsheet"
    path = File.join(directory,file)
    puts path
    File.open(path, "wb") { |f| f.write(params[:file].read) }
    ExcelWorker.perform_async(path)
    redirect_to root_path
  end
  def loneuser
    puts params[:start_number]
    user=User.new
    user.email=""
    user.password="cuicuser"
    user.registerno=params[:start_number]
    user.password_confirmation="cuicuser"
    if user.save
      flash[:notice]="User created successfully"
    else
      flash[:alert]=build_error_message(user.errors)
      redirect_to admin_path
    end
  end
  def build_error_message(discussion_errors)
    error_string="<b>Errors prevented from saving</b><ul>"
    discussion_errors.each do |message,error|
      error_string+="<li>"+message.to_s.titlecase+" "+error+"</li>"
    end
    return error_string+"</ul>"
  end

  private
  def sign_in_check
    if user_signed_in? and current_user.has_role? "admin"
    else
      redirect_to root_path
    end
  end
end

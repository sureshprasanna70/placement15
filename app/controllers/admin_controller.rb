class AdminController < ApplicationController
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
end

class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_filter :sign_in_check
  before_filter :edit_check,only:[:update,:edit,:destroy,:new]
  # GET /projects
  # GET /projects.json
  def index
    @projects = current_user.project
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.user_id=current_user.id
    respond_to do |format|
      if @project.save
        format.html { redirect_to resume_path, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
    if not @project.user_id==current_user.id
      redirect_to root_path
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:title, :desc, :technology,:user_id)
  end
  def sign_in_check
    if not user_signed_in?
      redirect_to new_user_session_path
    end
  end
  def edit_check
    if not current_user.can_edit?
      respond_to do |format|
        @error_message="Add and Edit disabled"
        format.js{render 'layouts/edit_disable',notice:'Edit disabled'}
        format.html{redirect_to resume_path,alert:'Delete disabled'}
      end
    end

  end

end

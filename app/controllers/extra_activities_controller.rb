class ExtraActivitiesController < ApplicationController
  before_action :set_extra_activity, only: [:show, :edit, :update, :destroy]
  before_filter :sign_in_check
  # GET /extra_activities
  # GET /extra_activities.json
  def index
    @extra_activities = current_user.extra_activity
  end

  # GET /extra_activities/1
  # GET /extra_activities/1.json
  def show
  end

  # GET /extra_activities/new
  def new
    @extra_activity = ExtraActivity.new
  end

  # GET /extra_activities/1/edit
  def edit
  end

  # POST /extra_activities
  # POST /extra_activities.json
  def create
    @extra_activity = ExtraActivity.new(extra_activity_params)
    @extra_activity.user_id=current_user.id
    respond_to do |format|
      if @extra_activity.save
        format.html { redirect_to resume_path, notice: 'Extra activity was successfully created.' }
        format.json { render :show, status: :created, location: @extra_activity }
      else
        format.html { render :new }
        format.json { render json: @extra_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /extra_activities/1
  # PATCH/PUT /extra_activities/1.json
  def update
    respond_to do |format|
      if @extra_activity.update(extra_activity_params)
        format.html { redirect_to resume_path, notice: 'Extra activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @extra_activity }
      else
        format.html { render :edit }
        format.json { render json: @extra_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /extra_activities/1
  # DELETE /extra_activities/1.json
  def destroy
    @extra_activity.destroy
    respond_to do |format|
      format.html { redirect_to extra_activities_url, notice: 'Extra activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_extra_activity
      @extra_activity = ExtraActivity.find(params[:id])
      if not @extra_activity.user_id==current_user.id
        redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def extra_activity_params
      params.require(:extra_activity).permit(:area_of_interest, :extra_curricular, :hobby, :responsibilty,:user_id)
    end
    def sign_in_check
      if not user_signed_in?
        redirect_to new_user_session_path
      end
    end
end

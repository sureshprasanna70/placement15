class WorkstatusesController < ApplicationController
  before_action :set_workstatus, only: [:show, :edit, :update, :destroy]

  # GET /workstatuses
  # GET /workstatuses.json
  def index
    @workstatuses = Workstatus.all
  end

  # GET /workstatuses/1
  # GET /workstatuses/1.json
  def show
  end

  # GET /workstatuses/new
  def new
    @workstatus = Workstatus.new
  end

  # GET /workstatuses/1/edit
  def edit
  end

  # POST /workstatuses
  # POST /workstatuses.json
  def create
    @workstatus = Workstatus.new(workstatus_params)

    respond_to do |format|
      if @workstatus.save
        format.html { redirect_to @workstatus, notice: 'Workstatus was successfully created.' }
        format.json { render :show, status: :created, location: @workstatus }
      else
        format.html { render :new }
        format.json { render json: @workstatus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workstatuses/1
  # PATCH/PUT /workstatuses/1.json
  def update
    respond_to do |format|
      if @workstatus.update(workstatus_params)
        format.html { redirect_to @workstatus, notice: 'Workstatus was successfully updated.' }
        format.json { render :show, status: :ok, location: @workstatus }
      else
        format.html { render :edit }
        format.json { render json: @workstatus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workstatuses/1
  # DELETE /workstatuses/1.json
  def destroy
    @workstatus.destroy
    respond_to do |format|
      format.html { redirect_to workstatuses_url, notice: 'Workstatus was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workstatus
      @workstatus = Workstatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workstatus_params
      params.require(:workstatus).permit(:numrange, :workstatus)
    end
end

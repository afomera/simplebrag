class FocusAreasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_focus_area, only: %i[ show edit update destroy ]

  # GET /focus_areas or /focus_areas.json
  def index
    @focus_areas = FocusArea.all
  end

  # GET /focus_areas/1 or /focus_areas/1.json
  def show
  end

  # GET /focus_areas/new
  def new
    @focus_area = FocusArea.new
  end

  # GET /focus_areas/1/edit
  def edit
  end

  # POST /focus_areas or /focus_areas.json
  def create
    @focus_area = FocusArea.new(focus_area_params)

    respond_to do |format|
      if @focus_area.save
        format.html { redirect_to focus_area_url(@focus_area), notice: "Focus area was successfully created." }
        format.json { render :show, status: :created, location: @focus_area }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @focus_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /focus_areas/1 or /focus_areas/1.json
  def update
    respond_to do |format|
      if @focus_area.update(focus_area_params)
        format.html { redirect_to focus_area_url(@focus_area), notice: "Focus area was successfully updated." }
        format.json { render :show, status: :ok, location: @focus_area }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @focus_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /focus_areas/1 or /focus_areas/1.json
  def destroy
    @focus_area.destroy

    respond_to do |format|
      format.html { redirect_to focus_areas_url, notice: "Focus area was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_focus_area
      @focus_area = FocusArea.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def focus_area_params
      params.require(:focus_area).permit(:user_id, :name, :color)
    end
end

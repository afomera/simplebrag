class AccomplishmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_accomplishment, only: %i[ show edit update destroy ]

  # GET /accomplishments or /accomplishments.json
  def index
    @accomplishments = Accomplishment.all
  end

  # GET /accomplishments/1 or /accomplishments/1.json
  def show
  end

  # GET /accomplishments/new
  def new
    @accomplishment = Accomplishment.new
  end

  # GET /accomplishments/1/edit
  def edit
  end

  # POST /accomplishments or /accomplishments.json
  def create
    @accomplishment = Accomplishment.new(accomplishment_params)

    respond_to do |format|
      if @accomplishment.save
        format.html { redirect_to accomplishment_url(@accomplishment), notice: "Accomplishment was successfully created." }
        format.json { render :show, status: :created, location: @accomplishment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @accomplishment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accomplishments/1 or /accomplishments/1.json
  def update
    respond_to do |format|
      if @accomplishment.update(accomplishment_params)
        format.html { redirect_to accomplishment_url(@accomplishment), notice: "Accomplishment was successfully updated." }
        format.json { render :show, status: :ok, location: @accomplishment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @accomplishment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accomplishments/1 or /accomplishments/1.json
  def destroy
    @accomplishment.destroy

    respond_to do |format|
      format.html { redirect_to accomplishments_url, notice: "Accomplishment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accomplishment
      @accomplishment = Accomplishment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def accomplishment_params
      params.require(:accomplishment).permit(:name, :description, :completed_at, :focus_area_id)
    end
end

class WarchestsController < ApplicationController
  before_action :set_warchest, only: %i[ show edit update destroy ]

  # GET /warchests or /warchests.json
  def index
    @warchests = Warchest.all
  end

  # GET /warchests/1 or /warchests/1.json
  def show
  end

  # GET /warchests/new
  def new
    @warchest = Warchest.new
  end

  # GET /warchests/1/edit
  def edit
  end

  # POST /warchests or /warchests.json
  def create
    @warchest = Warchest.new(warchest_params)

    respond_to do |format|
      if @warchest.save
        format.html { redirect_to warchest_url(@warchest), notice: "Warchest was successfully created." }
        format.json { render :show, status: :created, location: @warchest }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @warchest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /warchests/1 or /warchests/1.json
  def update
    respond_to do |format|
      if @warchest.update(warchest_params)
        format.html { redirect_to warchest_url(@warchest), notice: "Warchest was successfully updated." }
        format.json { render :show, status: :ok, location: @warchest }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @warchest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /warchests/1 or /warchests/1.json
  def destroy
    @warchest.destroy

    respond_to do |format|
      format.html { redirect_to warchests_url, notice: "Warchest was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_warchest
      @warchest = Warchest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def warchest_params
      params.fetch(:warchest, {})
    end
end

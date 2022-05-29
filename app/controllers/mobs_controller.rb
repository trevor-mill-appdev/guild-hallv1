class MobsController < ApplicationController
  before_action :set_mob, only: %i[ show edit update destroy ]

  # GET /mobs or /mobs.json
  def index
    @mobs = Mob.all
  end

  # GET /mobs/1 or /mobs/1.json
  def show
  end

  # GET /mobs/new
  def new
    @mob = Mob.new
  end

  # GET /mobs/1/edit
  def edit
  end

  # POST /mobs or /mobs.json
  def create
    @mob = Mob.new(mob_params)

    respond_to do |format|
      if @mob.save
        format.html { redirect_to mob_url(@mob), notice: "Mob was successfully created." }
        format.json { render :show, status: :created, location: @mob }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mob.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mobs/1 or /mobs/1.json
  def update
    respond_to do |format|
      if @mob.update(mob_params)
        format.html { redirect_to mob_url(@mob), notice: "Mob was successfully updated." }
        format.json { render :show, status: :ok, location: @mob }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mob.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mobs/1 or /mobs/1.json
  def destroy
    @mob.destroy

    respond_to do |format|
      format.html { redirect_to mobs_url, notice: "Mob was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mob
      @mob = Mob.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mob_params
      params.require(:mob).permit(:owner_id, :serial, :image_url)
    end
end

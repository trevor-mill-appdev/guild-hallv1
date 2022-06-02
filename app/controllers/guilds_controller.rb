class GuildsController < ApplicationController
  before_action :set_guild, only: %i[ show edit update destroy ]

  # GET /guilds or /guilds.json
  def index
    @guilds = Guild.all
  end

  # GET /guilds/1 or /guilds/1.json
  def show

    # aggregate member stashes to render partials on guild page
    materials = Material.all
    members = User.where(:guild_id => @guild.id).all
    quantities = Array.new

    materials.each do |material|
      mat_stash = Array.new
      @material = material
      members.each do |member|
        matching_stash = Stash.where(:material_id => @material.id).where(:owner_id => member.id).first

        mat_stash << matching_stash
      end
      quantities << mat_stash
    end

    index = 0

    chests = Warchest.where(:guild_id => @guild.id)
    chests.each do |chest|
      c = Warchest.where(:id => chest.id).first
      c.destroy
    end
    
    materials.each do |material|
      Warchest.create(
        guild_id: @guild.id,
        material_id: material.id,
        quantity: quantities[index]
      )
      index += 1
    end
  end

  # bulletin page
  def bulletin
    @guild = Guild.where(:id => current_user.guild.id).first
  end

  # proposals
  def props
    @guild = Guild.where(:id => current_user.guild.id).first
  end

  # GET /guilds/new
  def new
    @guild = Guild.new
  end

  # GET /guilds/1/edit
  def edit
    authorize @guild
  end

  # POST /guilds or /guilds.json
  def create
    @guild = Guild.new(guild_params)

    respond_to do |format|
      if @guild.save
        format.html { redirect_to guild_url(@guild), notice: "Guild was successfully created." }
        format.json { render :show, status: :created, location: @guild }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @guild.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guilds/1 or /guilds/1.json
  def update
    authorize @guild

    respond_to do |format|
      if @guild.update(guild_params)
        format.html { redirect_to guild_url(@guild), notice: "Guild was successfully updated." }
        format.json { render :show, status: :ok, location: @guild }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @guild.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guilds/1 or /guilds/1.json
  def destroy

    @guild.destroy

    respond_to do |format|
      format.html { redirect_to guilds_url, notice: "Guild was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guild
      @guild = Guild.where(:id => current_user.guild.id).first
    end

    # Only allow a list of trusted parameters through.
    def guild_params
      params.require(:guild).permit(:references, :prop_threshold, :private)
    end
end

class GuildPolicy
  attr_reader :user, :guild

  def initialize(user, guild)
    @user = user
    @guild = guild
  end

  def show?
    user.guild_id == guild.id ||
      !guild.private?
    
  end

  def edit?
    user == guild.owner
  end

  def update?
    user == guild.owner
  end

end
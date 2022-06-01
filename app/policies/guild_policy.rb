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
end
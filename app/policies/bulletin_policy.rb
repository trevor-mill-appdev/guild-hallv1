class BulletinPolicy
  attr_reader :user, :bulletin

  def initialize(user, bulletin)
    @user = user
    @bulletin = bulletin
  end

  def show?
    user.guild_id == bulletin.guild_id ||
      !bulletin.guild.private? ||
      user.id == bulletin.author_id
  end

  def edit?
    user.id == bulletin.author_id
  end

  def update?
    user.id == bulletin.author_id
  end

  def destroy?
    user.id == bulletin.author_id
  end


end
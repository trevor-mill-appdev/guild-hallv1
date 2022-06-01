class VotePolicy
  attr_reader :user, :vote

  def initialize(user, vote)
    @user = user
    @vote = vote
  end

  def show?
    user.id == vote.voter_id ||
      !vote.proposal.guild.private? ||
      user.guild_id == vote.proposal.guild_id
  end

  def edit?
    user.id == vote.voter_id
  end

  def update?
    user.id == vote.voter_id
  end

  def destroy?
    user.id == vote.voter_id
  end


end
class ProposalPolicy
  attr_reader :user, :proposal

  def initialize(user, proposal)
    @user = user
    @proposal = proposal
  end

  def show?
    user.guild_id == proposal.guild_id ||
      !proposal.guild.private? ||
      user.id == proposal.proposer_id
  end

  def edit?
    user.id == proposal.proposer_id
  end

  def update?
    user.id == bulletin.proposer_id
  end

  def destroy?
    user.id == bulletin.proposer_id
  end


end
class UsersController < ApplicationController
  def show
  end

  def loot
  end

  def inbox
    @needs_vote = Array.new

    proposals = current_user.guild.proposals.where(:status => "pending").all

    proposals.each do |proposal|
      has_voted = current_user.votes.where(:proposal_id => proposal.id).first

      if !has_voted
        @needs_vote << proposal    
      end

    end
  end

  def guild
  end

end
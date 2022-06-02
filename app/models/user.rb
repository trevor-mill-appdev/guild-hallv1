class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :stashes, foreign_key: :owner_id
  has_many :bulletins, foreign_key: :author_id, dependent: :nullify 
  has_one :guild, foreign_key: :admin_id
  has_many :raiders, foreign_key: :owner_id, dependent: :destroy
  has_many :proposals, foreign_key: :proposer_id, dependent: :nullify
  has_many :votes, foreign_key: :voter_id, dependent: :nullify 
  has_many :mobs, foreign_key: :owner_id, dependent: :destroy 

  # belongs_to :guild, foreign_key: :guild_id, counter_cache: true

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  def stashes
    my_id = self.id

    matching_stashes = Stash.where(:owner_id => my_id).all

    return matching_stashes
  end

  def pending_proposals
    needs_vote = Array.new

    proposals = self.guild.proposals.where(:status => "pending").all #change current_user to self

    proposals.each do |proposal|
      has_voted = self.votes.where(:proposal_id => proposal.id).first

      if !has_voted
        needs_vote << proposal    
      end

    end
    return needs_vote
  end

  def resolved_proposals
    old_props = Array.new

    denied = self.guild.proposals.where(:status => "denied").all.order(:created_at => :desc)
    passed = self.guild.proposals.where(:status => "passed").all.order(:created_at => :desc)

    denied.each do |denied_prop|
      old_props << denied_prop
    end

    passed.each do |passed_prop|
      old_props << passed_prop
    end



    return old_props
  end
  
end

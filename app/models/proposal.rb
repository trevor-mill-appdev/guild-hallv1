class Proposal < ApplicationRecord

  validates :status, inclusion: { in: %w(pending denied passed)}

  belongs_to :proposer, required: true, class_name: "User", foreign_key: :proposer_id
  has_one :guild, foreign_key: :guild_id
  has_many :votes
end

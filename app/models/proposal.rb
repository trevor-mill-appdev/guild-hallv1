class Proposal < ApplicationRecord

  validates :status, inclusion: { in: %w(pending denied passed)}

  belongs_to :proposer, required: true, class_name: "User", foreign_key: :proposer_id
  belongs_to :guild, required: true
  has_many :votes
end

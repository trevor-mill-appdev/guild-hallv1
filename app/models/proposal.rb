class Proposal < ApplicationRecord
  belongs_to :proposer, class_name: "User"
  belongs_to :guild
end

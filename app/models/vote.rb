class Vote < ApplicationRecord
  belongs_to :voter, required: true, class_name: "User", foreign_key: :voter_id
  belongs_to :proposal, required: true, counter_cache: true
end

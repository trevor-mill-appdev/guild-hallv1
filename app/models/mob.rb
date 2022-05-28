class Mob < ApplicationRecord
  belongs_to :owner, required: true, class_name: "User", foreign_key: :owner_id, counter_cache: true
end

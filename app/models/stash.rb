class Stash < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: :owner_id, required: true
  has_many :materials
end

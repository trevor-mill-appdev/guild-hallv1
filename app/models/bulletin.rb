class Bulletin < ApplicationRecord

  validates :serial, presence: true, uniqueness: true
  
  belongs_to :guild, counter_cache: true
  belongs_to :author, class_name: "User", foreign_key: :author_id, required: true

  
end

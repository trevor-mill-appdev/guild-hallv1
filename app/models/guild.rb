class Guild < ApplicationRecord
  # validates :admin_id, uniqueness: true

  
  belongs_to :owner, required: true, class_name: "User", foreign_key: :admin_id
  has_many :bulletins, foreign_key: :guild_id, dependent: :nullify
  has_many :members, class_name: "User", foreign_key: :guild_id, dependent: :nullify
  has_many :proposals, foreign_key: :guild_id, dependent: :destroy

  
end

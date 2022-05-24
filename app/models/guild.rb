class Guild < ApplicationRecord
  belongs_to :admin, class_name: "User"

  belongs_to :owner, required: true, class_name: "User", foreign_key: :admin_id
  has_many :bulletins, foreign_key: :guild_id, dependent: :nullify
  has_many :users, foreign_key: :guild_id, dependent: :nullify
  has_many :proposals, foreign_key: :guild_id, dependent: :destroy
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :stashes
  has_many :bulletins, { foreign_key: :author_id, dependent: :nullify }
  has_many :guilds, { foreign_key: :admin_id }
  has_many :raiders, { foreign_key: :owner_id, dependent: :destroy }
  has_many :proposals, { foreign_key: :proposer_id, dependent: :nullify }
  has_many :votes, { foreign_key: :voter_id, dependent: :nullify }
  has_many :mobs, { foreign_key: :owner_id, dependent: :destroy }

  belongs_to :guild, { foreign_key: :guild_id, counter_cache: true }
  
end

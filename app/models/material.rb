class Material < ApplicationRecord
  validates :token_address, uniqueness: true

  has_many :stashes

  
end

class Warchest < ApplicationRecord
  belongs_to :guild  
  has_one :material
  
end

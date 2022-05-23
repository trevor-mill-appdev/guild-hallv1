class Stash < ApplicationRecord
  belongs_to :owner, class_name: "User"
  belongs_to :material, class_name: "Material"
end

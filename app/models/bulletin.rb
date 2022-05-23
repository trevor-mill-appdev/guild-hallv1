class Bulletin < ApplicationRecord
  belongs_to :guild
  belongs_to :author, class_name: "User"
end

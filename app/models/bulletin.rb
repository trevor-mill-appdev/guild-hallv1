class Bulletin < ApplicationRecord

  belongs_to :guild
  belongs_to :author, class_name: "User", foreign_key: :author_id, required: true

  
end

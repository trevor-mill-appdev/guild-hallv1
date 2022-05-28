class Raider < ApplicationRecord
  belongs_to :owner, class_name: "User", counter_cache: true
end

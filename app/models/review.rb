class Review < ApplicationRecord
  belongs_to :user
  belongs_to :dojo_space
end

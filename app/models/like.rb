class Like < ApplicationRecord
  belongs_to :wine
  belongs_to :user
  validates_uniqueness_of :wine_id, scope: :user_id
end

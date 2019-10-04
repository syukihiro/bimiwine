class Wine < ApplicationRecord
  has_many :wines_images, dependent: :destroy
  has_many :wines_features_tags, dependent: :destroy
  has_many :features, through: :wines_features_tags
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  accepts_nested_attributes_for :wines_images, update_only: true
  accepts_nested_attributes_for :wines_features_tags, update_only: true
end
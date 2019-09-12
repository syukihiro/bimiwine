class Feature < ApplicationRecord
  has_many :wines_features_tags
  has_many :wines, through: :wines_features_tags
end

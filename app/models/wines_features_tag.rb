class WinesFeaturesTag < ApplicationRecord
  belongs_to :wine, optional: true
  belongs_to :feature, optional: true

  enum features_id: { フルーティー:1, エレガント:2, フルボディ:3, ライトボディ:4, 樽の香り:5, 飲みやすい:6, 美味しい:7 }
end
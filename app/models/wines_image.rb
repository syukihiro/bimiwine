class WinesImage < ApplicationRecord
  belongs_to :wine
  mount_uploader :images, ImageUploader
end
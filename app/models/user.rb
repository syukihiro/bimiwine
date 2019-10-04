class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :wines
         has_many :likes, dependent: :destroy
         has_many :liked_wines, through: :likes, source: :post
         validates :nickname, presence: true
         validates :phone_number, presence: true
  def already_liked?(wine)
    self.likes.exists?(wine_id: wine.id)
  end
end

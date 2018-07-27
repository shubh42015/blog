class Post < ApplicationRecord
  validates :title, presence: true 
  validates :content, presence: true
 
  belongs_to :blog
  has_many :comments
  has_one_attached :avatar
end

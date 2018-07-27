class Blog < ApplicationRecord
  validates :blog_name,  presence: true
  belongs_to :user
  has_many :posts, dependent: :destroy 
  scope :published, -> { 
  where(:published => true)
}
end

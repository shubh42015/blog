class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  # validates :name, presence: true
  has_one :address, dependent: :destroy 
  has_one_attached :avatar
  accepts_nested_attributes_for :address
  has_many :blogs, dependent: :destroy 
  has_many :comments
end

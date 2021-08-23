class User < ApplicationRecord
  has_many :notes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_one :admin
  has_many :basic
  has_one :profile, dependent: :destroy

  accepts_nested_attributes_for :profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :lockable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
 

end

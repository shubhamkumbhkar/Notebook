class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :dp


  validates :dob, presence: true
  validates :address, presence: true
  validates :dp, presence: true
  

end

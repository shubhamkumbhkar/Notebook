class Comment < ApplicationRecord
  belongs_to :note
  belongs_to :user
  has_many :replies, dependent: :destroy

  validates :name, presence: true
  validates :body, presence: true
end

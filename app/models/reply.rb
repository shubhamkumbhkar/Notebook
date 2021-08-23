class Reply < ApplicationRecord
  belongs_to :comment
  belongs_to :user

  
  validates :name, presence: true
  validates :body, presence: true
end

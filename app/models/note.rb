class Note < ApplicationRecord
    has_many :comments, dependent: :destroy
    belongs_to :user

    validates :name, presence: true
    validates :body, presence: true

    #after_create :new_mail
    
    # private
    # def new_mail
    #     NoteMailer.with(user: self).new_post.deliver_now
    # end
end

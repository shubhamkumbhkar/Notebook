class NoteMailer < ApplicationMailer
    def new_post
        mail(to: 'shubhamkumbhkar70@gmail.com', subject: 'new post published')
    end
end

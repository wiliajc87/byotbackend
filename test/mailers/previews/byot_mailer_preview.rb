# Preview all emails at http://localhost:3000/rails/mailers/byot_mailer
class ByotMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    ByotMailer.sample_email(User.first)
  end
end

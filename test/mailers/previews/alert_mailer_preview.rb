# Preview all emails at http://localhost:3000/rails/mailers/alert_mailer
class AlertMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/alert_mailer/new_jobs_found
  def new_jobs_found
    AlertMailer.new_jobs_found
  end
end

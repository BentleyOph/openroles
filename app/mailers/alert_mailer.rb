class AlertMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def new_jobs_found
    @alert = params[:alert]
    @jobs = params[:jobs]

    mail(
      to: @alert.email,
      subject: "New Jobs Found for '#{@alert.query}'"
    )
  end
end
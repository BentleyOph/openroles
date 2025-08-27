class AlertsController < ApplicationController
  def create
    @alert = Alert.new(alert_params)

    if @alert.save
      # Redirect back to the search page with a success message
      redirect_to root_path(query: @alert.query), notice: "Success! We will notify you when new jobs are posted."
    else
      # If saving fails, redirect back with an error message
      redirect_to root_path(query: @alert.query), alert: "Could not create alert. Please try again."
    end
  end
  def unsubscribe
    # Use find_signed! to securely find the alert from the signed ID.
    # It will raise an error if the signature is invalid or expired.
    alert = Alert.find_signed!(params[:id], purpose: :unsubscribe)
    alert.destroy
    redirect_to root_path, notice: "You have been successfully unsubscribed."
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to root_path, alert: "That unsubscribe link is invalid or has expired."
  end
  
  private

  def alert_params
    params.require(:alert).permit(:query, :email)
  end
end
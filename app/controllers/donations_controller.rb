class DonationsController < ApplicationController
  
  def create
    Rails.logger.debug params.inspect
    donation = Donation.create(donation_params)
    Rails.logger.debug @donation            
    values = {
      business: Paypal::BUSINESS,
      cmd: "_xclick",
      upload: 1,
      return: Paypal::APP_HOST,
      invoice: donation[:id],
      amount: donation.amount,
      item_name: donation.organization,
      item_number: donation.organization['id'],
      quantity: '1' 
    }
    url = Paypal::PAYPAL_HOST + "/cgi-bin/webscr?" + values.to_query
    Rails.logger.debug "redirecting to paypal URL: " + url
    redirect_to(url)
  end
    
  private
  def donation_params
    params.require(:donation).permit(:amount, :user_id, :organization_id)
  end
  
end
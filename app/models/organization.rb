class Organization < ActiveRecord::Base   
    
  validates :name, :presence => true, :uniqueness => true, :allow_blank => false
  validates :address1, :zip, :city, :email, :tax_id, :site_url, :presence => true, :allow_blank => false

  validates :zip, zip_code: true     
  validates :email, email: true
  validates :site_url, url: true  
  validates :donation_url, url: true
   
end

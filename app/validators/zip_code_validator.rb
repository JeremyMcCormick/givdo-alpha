class ZipCodeValidator < ActiveModel::EachValidator
  
  include GoingPostal

  def validate_each(record, attribute, value)    
    if !GoingPostal.zipcode?(value, "US")
      record.errors[attribute] << (options[:message] || "is not a valid zip code")
    end
  end
  
end
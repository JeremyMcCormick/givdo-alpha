require 'uri'

class UrlValidator < ActiveModel::EachValidator

  def valid_url?(url)
    begin
      uri = URI.parse(url)
      uri.kind_of?(URI::HTTP)
    rescue URI::InvalidURIError
      false
    end
  end

  def validate_each(record, attribute, value)    
    if !valid_url?(value)
      record.errors[attribute] << (options[:message] || "is not a valid URL")
    end
  end
  
end
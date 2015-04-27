class Post < ActiveRecord::Base
  
  belongs_to :organization

  validates :title, :message, :video_url, :organization_id, :presence => true
  
  validates :video_url, url: true
end
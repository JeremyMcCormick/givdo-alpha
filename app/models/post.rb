class Post < ActiveRecord::Base
  
  
  private
  
    def post_params
      params.require(:post).permit(:title, :message, :video_url, :organization, :date)
    end
end

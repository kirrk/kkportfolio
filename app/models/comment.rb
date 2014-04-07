class Comment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :approved, :author_email, :author_url, :content, :referrer, :user_agent, :user_ip

  def logginapp?
    loggedinapp = true
  end
end

class Comment < ActiveRecord::Base
  attr_accessible :author, :approved, :author_email, :author_url, :content, :referrer, :user_agent, :user_ip
  belongs_to :commentable, polymorphic: true
  validates :content, presence: true
  validates :author_email, presence: true
  validates :author, presence: true

end

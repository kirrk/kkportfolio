class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  attr_accessible :body, :title, :image, :published
  validates :body, :presence => true
  validates :title, :presence => true
  mount_uploader :image, ImageUploader
  has_many :comments, as: :commentable

  def publish!
    self.published = true
    save!
  end

  def authored_by?(user)
    author == user
  end

def self.create_from_postmark(mitt)
    api_token = mitt.from #.split("@").first.split("+").last
     user = User.find_by_email(api_token)
     if user
       post = user.posts.new
       #binding.pry
       #post.message_id = mitt.message_id
       post.title      = mitt.subject
       post.body = if mitt.text_body.blank?
       mitt.html_body
       else
         mitt.text_body
       end
       # post.photo = mitt.attachments.first.read unless mitt.attachments.empty?
       post.save
     else
       return false
     end
   end

end

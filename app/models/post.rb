class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  attr_accessible :body, :title, :image, :published
  validates :body, :presence => true
  validates :title, :presence => true
  mount_uploader :image, ImageUploader
  has_many :comments, as: :commentable

  def publish!
    published = true
    save!
  end
end

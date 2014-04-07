class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  attr_accessible :body, :title, :published
  validates :body, :presence => true
  validates :title, :presence => true

  has_many :comments

  def publish!
    published = true
    save!
  end
end

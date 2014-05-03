class Project < ActiveRecord::Base
  attr_accessible :name, :technologies_used
  belongs_to :author, class_name: "User"
  validates :technologies_used, presence: true
  validates :name, length: {in: 4..255}
  has_many :comments, as: :commentable
end

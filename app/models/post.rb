class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  validates :title, presence: true, length: {maximum: Settings.post.maximum_title}
  validates :content, presence: true
  validates :user, presence: true
end

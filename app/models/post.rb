class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  validates :title, presence: true, length: {maximum: Settings.post.maximum_title}
  validates :content, presence: true
  validates :user, presence: true

  mount_uploader :picture, PictureUploader

  scope :sort_by_updated, ->{order updated_at: :desc}
  scope :feed_load, lambda{|x,y|
    where("user_id IN (?) OR user_id = ?", x, y)}

  def list_tags= names
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def list_tags
    self.tags.map(&:name).join(", ")
  end
end

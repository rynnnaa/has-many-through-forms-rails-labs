class User < ActiveRecord::Base
  has_many :comments
  has_many :posts, through: :comments
  accepts_nested_attributes_for :comments

  def comment_attributes=(comment_attributes)
    comment_attributes.values.each do |comment_attribute|
      comment = Comment.find_or_create_by(comment_attribute)
      self.comments << comment
    end
  end
end

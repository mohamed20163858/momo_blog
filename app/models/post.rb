class Post < ApplicationRecord
  has_many :comments
  has_many :likes 
  belongs_to :author, class_name: 'User'
  after_save :increment_posts_counter
  
  def get_last_five_comments 
    comments.last(5)
  end 

  def increment_posts_counter
    author.increment!(:posts_counter)
  end

end

class Category < ActiveRecord::Base
  # Remember to create a migration!
  has_many :posts

  def self.show_all
    Category.all
  end

  def self.get_posts(id)
    Category.find(id).posts
  end
end

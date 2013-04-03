class Post < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :category
  before_create :generate_key

  def self.show_info(id)
    Post.find(id)
  end

  def generate_key
    self.secure_key = SecureRandom.hex(4)
  end

  def edit_post(id)

  end
end

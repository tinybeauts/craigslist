require_relative "../../config/database"

class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |p|
      p.string :title, :body, :email
      p.integer :category_id
      p.integer :price
      p.timestamps
    end
  end
end

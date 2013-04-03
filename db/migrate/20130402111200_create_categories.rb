require_relative "../../config/database"
class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |c|
      c.string :name, :description
      c.timestamps
    end
  end
end

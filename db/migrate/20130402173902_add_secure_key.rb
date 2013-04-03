class AddSecureKey < ActiveRecord::Migration
  def change
    add_column :posts, :secure_key, :string
  end
end

class AddDetailsToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :content, :string

    add_reference :posts, :user, foreign_key: true
  end
end

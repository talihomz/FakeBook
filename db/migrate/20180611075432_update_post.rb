class UpdatePost < ActiveRecord::Migration[5.1]
  def change
    remove_reference :comments, :post
    remove_reference :likes, :post
    add_reference :comments, :post, foreign_key: true, on_delete: :cascade
    add_reference :likes, :post, foreign_key: true, on_delete: :cascade
  end
end

class RenamePostCounterToPostsCounter < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :post_counter, :posts_counter
  end
end

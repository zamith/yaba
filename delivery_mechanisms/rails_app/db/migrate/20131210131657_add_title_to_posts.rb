class AddTitleToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :title, :string
    change_column :posts, :body, :text
  end
end

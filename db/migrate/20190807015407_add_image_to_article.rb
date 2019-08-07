class AddImageToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :image, :text, after: :content
  end
end

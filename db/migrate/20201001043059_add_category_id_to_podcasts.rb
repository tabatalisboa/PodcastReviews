class AddCategoryIdToPodcasts < ActiveRecord::Migration[6.0]
  def change
    add_column :podcasts, :category_id, :integer
  end
end

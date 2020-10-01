class AddUserIdToPodcasts < ActiveRecord::Migration[6.0]
  def change
    add_column :podcasts, :user_id, :integer
  end
end

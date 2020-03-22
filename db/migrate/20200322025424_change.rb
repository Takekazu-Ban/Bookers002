class Change < ActiveRecord::Migration[5.2]
  def change
  	rename_column :books, :opinion, :body
  	rename_column :users, :image, :profile_image_id
  end
end

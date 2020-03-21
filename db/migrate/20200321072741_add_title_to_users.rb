class AddTitleToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :title, :text
    add_column :users, :opinion, :text
  end
end

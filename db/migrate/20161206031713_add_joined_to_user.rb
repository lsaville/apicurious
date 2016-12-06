class AddJoinedToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :joined, :string
  end
end

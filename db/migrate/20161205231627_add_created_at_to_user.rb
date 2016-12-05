class AddCreatedAtToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :joined_on, :string
    add_column :users, :location, :string
  end
end

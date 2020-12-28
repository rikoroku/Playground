class AddUserIdToLink < ActiveRecord::Migration[6.1]
  def self.up
    add_reference :links, :user
  end

  def self.down
    remove_column :links, :user_id
  end
end

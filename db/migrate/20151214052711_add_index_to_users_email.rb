class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
    add_index :users, :email, :unique => true #enforce uniqueness on DB level
  end
end

class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :topic
      t.text :content_md
      t.text :content_html
      t.timestamps
    end
  end
end

class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false, unique: true
      t.string :body, null: false
      t.string :url
      t.references :user, null: false
      t.integer :vote_count, default: 0

      t.timestamps null: false
    end
  end
end

class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.references :user, null: false
      t.references :post, null: false
      t.integer :vote_count, default: 0

      t.timestamps null: false
    end
  end
end

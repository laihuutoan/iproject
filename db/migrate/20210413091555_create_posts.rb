class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :state
      t.integer :created_id
      t.integer :updated_id

      t.timestamps
    end
  end
end

class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :short_description
      t.text :content
      t.string :state
      t.boolean :is_feature
      t.integer :created_by_id
      t.integer :updated_by_id
      t.integer :tags, array: true

      t.timestamps
    end
  end
end

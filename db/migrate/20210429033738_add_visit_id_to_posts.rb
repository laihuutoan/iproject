class AddVisitIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :ahoy_visit_id, :bigint
  end
end

class AddIndexToLike < ActiveRecord::Migration[7.0]
  def change
    add_index :likes, :likeable_id
  end
end

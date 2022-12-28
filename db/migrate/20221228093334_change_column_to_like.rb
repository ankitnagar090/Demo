class ChangeColumnToLike < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :user_id
    remove_column :likes, :likeable_id, :bigint
    remove_column :likes, :likeable_type, :string
  end
end

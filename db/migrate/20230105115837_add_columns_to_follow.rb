class AddColumnsToFollow < ActiveRecord::Migration[7.0]
  def change
    add_column :follows, :status, :boolean, :default => false
  end
end

class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.belongs_to :requester
      t.belongs_to :requested
      t.timestamps
    end
  end
end

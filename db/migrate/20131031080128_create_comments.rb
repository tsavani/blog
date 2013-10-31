class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :discription
      t.integer :post_master_id

      t.timestamps
    end
  end
end

class CreatePostMasters < ActiveRecord::Migration
  def change
    create_table :post_masters do |t|
      t.string :post_name
      t.string :discription
      t.integer :blog_master_id

      t.timestamps
    end
  end
end

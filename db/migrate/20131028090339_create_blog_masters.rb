class CreateBlogMasters < ActiveRecord::Migration
  def change
    create_table :blog_masters do |t|
      t.string :blog_name
      t.string :discription
      t.integer :user_id

      t.timestamps
    end
  end
end

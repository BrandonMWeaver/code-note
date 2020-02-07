class CreatePosts < ActiveRecord::Migration[6.0]

  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.text :description
      t.integer :user_id
      t.integer :language_id

      t.timestamps
    end
  end
  
end

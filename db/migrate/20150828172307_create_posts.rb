class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :nombre

      t.timestamps
    end
  end
end

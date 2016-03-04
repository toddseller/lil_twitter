class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.string :following_id
      t.string :twitter_id

      t.timestamps(null: false)
    end
  end
end

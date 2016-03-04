class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :description
      t.integer :user_id
      t.boolean :favorites, default: false

      t.timestamps(null: false)
    end
  end
end

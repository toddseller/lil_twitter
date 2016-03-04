class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :tweet_id
      t.integer :count

      t.references :tweet
      t.timestamps(null: false)
    end
  end
end

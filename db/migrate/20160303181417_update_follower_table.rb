class UpdateFollowerTable < ActiveRecord::Migration
  def change_table
    t.integer :following_id
    t.integer :twitter_id
  end
end

class CreateEvnetsShares < ActiveRecord::Migration
  def change
    create_table :evnets_shares do |t|
      t.decimal :share
      t.references :event
      t.references :friend

      t.timestamps
    end
    add_index :evnets_shares, :event_id
    add_index :evnets_shares, :friend_id
  end
end

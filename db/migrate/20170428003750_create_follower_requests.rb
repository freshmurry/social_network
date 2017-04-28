class CreateFollowerRequests < ActiveRecord::Migration
  def change
    create_table :follower_requests do |t|
      t.integer :sender_id
      t.integer :recipient_id

      t.timestamps

    end
  end
end

class CreateFriendships < ActiveRecord::Migration[7.0]
  def change
    create_table :friendships do |t|
      t.references :user, null: false, foregin_key: true 
      t.references :friend, references: :users, foregin_key: { to_table: :users}
      t.timestamps
    end
  end
end

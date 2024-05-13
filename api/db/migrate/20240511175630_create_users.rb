class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :uid, null: false
      t.integer :member_id
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :email, null: false

      t.timestamps
      t.datetime :discarded_at
    end
    add_index :users, :uid, unique: true
    add_index :users, :member_id, unique: true
    add_index :users, :email, unique: true
    add_index :users, :discarded_at
    add_index :users, [:email, :discarded_at], unique: true, name: 'unique_email_discarded_at'
  end
end

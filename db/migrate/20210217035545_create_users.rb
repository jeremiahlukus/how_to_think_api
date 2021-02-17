class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.integer  :sign_in_count, default: 0, null: false
      t.timestamps
    end
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end

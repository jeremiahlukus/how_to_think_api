class AddProfileToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :fname, :string
    add_column :users, :lname, :string
    add_column :users, :phone, :string
    add_column :users, :facebookUrl, :string
    add_column :users, :twitterUrl, :string
    add_column :users, :instagramUrl, :string
    add_column :users, :clubhouseUrl, :string
    add_column :users, :bio, :text
    add_column :users, :current_sign_in_at, :datetime
    add_column :users, :last_sign_in_at, :datetime
  end
end

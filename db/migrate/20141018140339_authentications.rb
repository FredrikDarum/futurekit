class Authentications < ActiveRecord::Migration
   def change
    create_table :authentications do |t|
      t.integer :user_id
      t.string :provider
      t.string :uid
      t.string :email
      t.timestamps
    end
  end
end



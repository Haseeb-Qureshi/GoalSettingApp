class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password_digest, null: false
      t.string :username, null: false
      t.string :session_token, index: true, null: false

      t.timestamps null: false
    end
  end
end

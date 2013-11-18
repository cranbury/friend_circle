class Sessions < ActiveRecord::Migration
  def change
    create table :sessions do |t|
      t.integer :user_id, null: false
      t.string :session_token, null: false

      t.timestamps
    end

    add_index :sessions, :user_id
    add_index :sessions, :session_token, unique: true
  end
end

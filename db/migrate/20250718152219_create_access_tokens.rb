class CreateAccessTokens < ActiveRecord::Migration[8.0]
  def change
    create_table :access_tokens do |t|
      t.references :user, null: false, foreign_key: true

      t.string     :jti,         null: false
      t.datetime   :expired_at,  null: false

      t.timestamps
    end
    
    add_index :access_tokens, :jti, unique: true
  end
end

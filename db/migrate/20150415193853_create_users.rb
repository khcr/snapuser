class CreateUsers < ActiveRecord::Migration[4.2]
  def change
    create_table :users do |t|

      t.string :name
      t.string :remember_token, index: true
      t.string :password_digest
      t.integer :level

      t.timestamps null: false
    end
  end
end

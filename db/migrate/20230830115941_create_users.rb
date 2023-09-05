class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email, null: false
      t.string :password_digest
      t.boolean :admin
      t.boolean :status

      t.timestamps
    end
  end
end
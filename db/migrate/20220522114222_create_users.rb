class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.string :image_name
      t.string :password_digest
      t.string :profile

      t.timestamps
    end
  end
end

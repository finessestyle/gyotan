class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :image_name
      t.string :password_digest
      t.string :profile
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end

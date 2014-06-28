class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :address
      t.string :employee_uid
      t.string :password_digest
      t.boolean :admin
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      t.datetime :photo_updated_at
      t.string :role_name
      t.integer :tab_id
      t.string :username
      t.datetime :logout_at

      t.timestamps
    end
  end
end

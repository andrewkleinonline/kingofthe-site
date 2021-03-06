class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :facebook_user_id

      t.boolean :king, default: false

      t.timestamps
    end
  end
end

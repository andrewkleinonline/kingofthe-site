class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.belongs_to :response
      t.belongs_to :user

      t.timestamps
    end
  end
end

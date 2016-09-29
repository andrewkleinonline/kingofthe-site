class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.belongs_to :prompt
      t.belongs_to :user

      t.string :content

      t.timestamps
    end
  end
end

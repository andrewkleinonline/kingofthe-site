class CreatePrompts < ActiveRecord::Migration[5.0]
  def change
    create_table :prompts do |t|
      t.belongs_to :king

      t.string :remaining_votes
      t.string :content

      t.boolean :current, default: false

      t.timestamps
    end
  end
end

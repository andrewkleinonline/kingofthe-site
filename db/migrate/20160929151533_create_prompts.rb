class CreatePrompts < ActiveRecord::Migration[5.0]
  def change
    create_table :prompts do |t|
      t.belongs_to :king

      t.boolean :current, default: false
      t.string :content

      t.timestamps
    end
  end
end

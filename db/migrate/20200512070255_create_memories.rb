class CreateMemories < ActiveRecord::Migration[6.0]
  def change
    create_table :memories do |t|
      t.references :obituary, null: false, foreign_key: true
      t.text :description
      t.date :date

      t.timestamps
    end
  end
end

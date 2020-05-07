class CreateObituaries < ActiveRecord::Migration[6.0]
  def change
    create_table :obituaries do |t|
      t.string :first_name
      t.string :last_name
      t.string :residence
      t.date :death_date
      t.date :birth_date
      t.string :cause_of_death
      t.string :final_resting_place
      t.string :relation
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

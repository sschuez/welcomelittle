class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end

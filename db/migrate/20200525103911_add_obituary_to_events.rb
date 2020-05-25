class AddObituaryToEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :obituary, null: false, foreign_key: true
  end
end

class AddCoordinatesToObituaries < ActiveRecord::Migration[6.0]
  def change
    add_column :obituaries, :latitude, :float
    add_column :obituaries, :longitude, :float
  end
end

class AddSlugToObituaries < ActiveRecord::Migration[6.0]
  def change
    add_column :obituaries, :slug, :string
    add_index :obituaries, :slug, unique: true
  end
end

class CreateInquiries < ActiveRecord::Migration[6.0]
  def change
    create_table :inquiries do |t|
      t.string :email
      t.string :newspaper
      t.string :other_newspaper
      t.date :desired_date

      t.timestamps
    end
  end
end

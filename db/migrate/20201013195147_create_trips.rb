class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :title
      t.string :description
      t.datetime :start_date
      t.references :user, null: false, foreign_key: true
      t.boolean :is_public

      t.timestamps
    end
  end
end

class CreateVisits < ActiveRecord::Migration[6.0]
  def change
    create_table :visits do |t|
      t.references :trip, null: false, foreign_key: true
      t.string :location_name
      t.string :description
      t.string :phone
      t.boolean :reservable
      t.string :email
      t.decimal :latitude, :precision => 10, :scale =>7
      t.decimal :longitude, :precision => 10, :scale => 7
      t.datetime :date_visited

      t.timestamps
    end
  end
end

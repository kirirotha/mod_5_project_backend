class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip
      t.decimal :home_latitude, :precision => 10, :scale =>7
      t.decimal :home_longitude, :precision => 10, :scale => 7

      t.timestamps
    end
  end
end

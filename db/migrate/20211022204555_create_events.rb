class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.string :description
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end

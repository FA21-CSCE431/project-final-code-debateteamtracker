class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :email
      t.string :name
      t.integer :points
      t.integer :priority

      t.timestamps
    end
  end
end

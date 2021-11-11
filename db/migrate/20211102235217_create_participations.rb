class CreateParticipations < ActiveRecord::Migration[6.1]
  def change
    create_table :participations do |t|
      t.integer :member_id, :null => false
      t.integer :points_event_id, :null => false
      
      t.timestamps
    end
  end
end

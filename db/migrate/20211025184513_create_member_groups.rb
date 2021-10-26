class CreateMemberGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :member_groups do |t|
      t.integer :member_id
      t.integer :group_id

      t.timestamps
    end
  end
end

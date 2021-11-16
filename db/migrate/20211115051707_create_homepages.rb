class CreateHomepages < ActiveRecord::Migration[6.1]
  def change
    create_table :homepages do |t|
      t.string :about
      t.string :aboutcontentone
      t.string :aboutcontenttwo
      t.string :emailone
      t.string :emailtwo
      t.string :emailthree
      t.string :emailfour
      t.string :emailfive
      t.string :contact
      t.string :contactcontent
      t.string :imageone
      t.string :imagetwo
      t.string :imagethree

      t.timestamps
    end
  end
end

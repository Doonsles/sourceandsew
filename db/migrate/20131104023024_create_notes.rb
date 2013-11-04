class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :factory_id
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end

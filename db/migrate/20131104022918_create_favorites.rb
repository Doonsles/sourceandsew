class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :factory_id
      t.integer :user_id

      t.timestamps
    end
  end
end

class CreateFactories < ActiveRecord::Migration
  def change
    create_table :factories do |t|
      t.string :phone
      t.text :description
      t.text :location

      t.timestamps
    end
  end
end

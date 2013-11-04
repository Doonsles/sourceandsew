class AddNametoFactory < ActiveRecord::Migration
  def change
    add_column :factories, :name, :string
  end
end

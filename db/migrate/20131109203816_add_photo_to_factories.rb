class AddPhotoToFactories < ActiveRecord::Migration
  def self.up
    change_table :factories do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :factories, :photo
  end
end

class AddEncryptedPasswordtoUser < ActiveRecord::Migration
  def change
    add_column :users, :encrypted_pass, :string
  end
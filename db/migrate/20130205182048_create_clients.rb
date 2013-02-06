class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :keyword
      t.timestamps
    end
    add_index :clients, :keyword, :unique => true

  end
end

class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :status
      t.string :content
      t.string :result
      t.belongs_to :client

      t.timestamps
    end
  end
end

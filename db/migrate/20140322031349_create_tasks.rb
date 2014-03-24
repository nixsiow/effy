class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
        t.string :description
        t.integer :user_id
        t.boolean :completed
        t.string :category
        t.timestamps
    end
  end
end

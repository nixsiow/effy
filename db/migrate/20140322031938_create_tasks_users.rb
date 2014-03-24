class CreateTasksUsers < ActiveRecord::Migration
  def change
    create_table :tasks_users do |t|
        t.integer :user_id
        t.integer :task_id
    end
  end
end

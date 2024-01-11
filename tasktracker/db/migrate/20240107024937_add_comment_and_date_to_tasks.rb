class AddCommentAndDateToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :comment, :string
    add_column :tasks, :date, :date
  end
end
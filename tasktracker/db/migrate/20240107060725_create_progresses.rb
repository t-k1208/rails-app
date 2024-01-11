class CreateProgresses < ActiveRecord::Migration[7.0]
  def change
    create_table :progresses do |t|
      t.references :task, null: false, foreign_key: true
      t.date :date
      t.integer :progress
      t.text :comment

      t.timestamps
    end
  end
end

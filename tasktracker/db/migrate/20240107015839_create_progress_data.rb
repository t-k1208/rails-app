class CreateProgressData < ActiveRecord::Migration[7.0]
  def change
    create_table :progress_data do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :date_time
      t.integer :progress
      t.text :comment

      t.timestamps
    end
  end
end

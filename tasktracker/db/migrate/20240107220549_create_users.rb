class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      # t.string :email
      t.string :handle_name

      t.timestamps
    end
  end
end
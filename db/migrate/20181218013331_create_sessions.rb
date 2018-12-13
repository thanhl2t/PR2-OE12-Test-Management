class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.string :exam_name
      t.integer :period_for
      t.string :supervisor
      t.datetime :create_at, null: false
      t.datetime :updated_at, null: false

      t.timestamps
    end
  end
end

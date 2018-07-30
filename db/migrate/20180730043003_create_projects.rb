class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :short_name
      t.date :start_date
      t.date :end_date
      t.string :description
      t.integer :leader_id

      t.timestamps
    end
  end
end

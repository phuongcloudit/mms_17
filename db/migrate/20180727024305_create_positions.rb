class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|
      t.string :name
      t.string :short_name
      t.string :description

      t.timestamps
    end
  end
end

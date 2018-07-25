class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.datetime :birthday
      t.string :avatar
      t.integer :team_id

      t.timestamps
    end
  end
end
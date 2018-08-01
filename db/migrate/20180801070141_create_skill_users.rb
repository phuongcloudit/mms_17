class CreateSkillUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :skill_users do |t|
      t.references :skill, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :level
      t.integer :experience_year

      t.timestamps
    end
  end
end

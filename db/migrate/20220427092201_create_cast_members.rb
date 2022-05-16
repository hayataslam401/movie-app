class CreateCastMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :cast_members do |t|
      t.string :name
      t.integer :role, default: 0
      t.belongs_to :movie, null:false, foreign_key: true
      t.timestamps
    end
  end
end

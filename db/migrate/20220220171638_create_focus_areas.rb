class CreateFocusAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :focus_areas do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name
      t.string :color

      t.timestamps
    end
  end
end

class CreateAccomplishments < ActiveRecord::Migration[7.0]
  def change
    create_table :accomplishments do |t|
      t.string :name
      t.datetime :completed_at
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

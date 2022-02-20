class AddFocusAreaToAccomplishments < ActiveRecord::Migration[7.0]
  def change
    add_reference :accomplishments, :focus_area, null: false, foreign_key: true
  end
end

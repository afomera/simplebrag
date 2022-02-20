class Accomplishment < ApplicationRecord
  belongs_to :user, default: -> { Current.user }
  belongs_to :focus_area, default: -> { Current.user.focus_areas.first }

  has_rich_text :description

  validates :name, presence: true
end
